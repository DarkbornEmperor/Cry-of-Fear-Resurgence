AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/mouth_monster.mdl"} 
ENT.SightDistance = 1024 
ENT.SightAngle = 180 
ENT.StartHealth = 30
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CanTurnWhileStationary = false 
ENT.HullType = HULL_SMALL_CENTERED
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.CallForHelp = false
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.NextAnyAttackTime_Melee = 1
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 180 
ENT.MeleeAttackDamageAngleRadius = 180
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.CanFlinch = 1 
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE} 
ENT.DeathAnimationTime = 20 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	FirstP_Bone = "bone01", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, -44), -- The offset for the controller when the camera is in first person
	FirstP_ShrinkBone = false, -- Should the bone shrink? Useful if the bone is obscuring the player's view
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/barnacle/bcl_chew1.wav",
"vj_cofr/aom/barnacle/bcl_chew2.wav",
"vj_cofr/aom/barnacle/bcl_chew3.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}	
-- Custom
ENT.Devourer_LastHeight = 180
ENT.Devourer_CurEnt = NULL
ENT.Devourer_CurEntMoveType = MOVETYPE_WALK
ENT.Devourer_Status = 0
ENT.Devourer_NextPullSoundT = 0
ENT.Devourer_NextDamageT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_CustomOnInitialize()
    self.SoundTbl_Death = {
	"vj_cofr/aom/barnacle/bcl_die1.wav",
	"vj_cofr/aom/barnacle/bcl_die3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(25,25,0),Vector(-25,-25,40))		
     self:Devourer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_CalculateTongue()
	//print(self.Devourer_LastHeight)
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() + self:GetUp()*-self.Devourer_LastHeight,
		filter = self
	})
	local trent = tr.Entity
	local trpos = tr.HitPos
	local height = self:GetPos():Distance(trpos)
	-- Increase the height by 10 every tick | minimum = 0, maximum = 1024
	self.Devourer_LastHeight = math.Clamp(height + 10, 0, 1024)

	if IsValid(trent) && (trent:IsNPC() or trent:IsPlayer()) && self:DoRelationshipCheck(trent) == true && trent.VJ_IsHugeMonster != true then
		-- If the grabbed enemy is a new enemy then reset the enemy values
		if self.Devourer_CurEnt != trent then
			self:Devourer_ResetEnt()
			self.Devourer_CurEntMoveType = trent:GetMoveType()
		end
		self.Devourer_CurEnt = trent
		trent:AddEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
		if CurTime() > self.Devourer_NextDamageT then
		if trent:IsNPC() then
		    trent:TakeDamage(10,self,self)
			trent:StopMoving()
			trent:SetVelocity(Vector(0,0,2))
			trent:SetMoveType(MOVETYPE_FLY)
		elseif trent:IsPlayer() then
		    trent:TakeDamage(10,self,self)
			trent:SetMoveType(MOVETYPE_NONE)
			//trent:AddFlags(FL_ATCONTROLS)
		end	
		self.Devourer_NextDamageT = CurTime() + 0.5
	end
		trent:SetGroundEntity(NULL)
		if height >= 50 then
			local setpos = trent:GetPos() + trent:GetUp()*10
			setpos.x = trpos.x
			setpos.y = trpos.y
			trent:SetPos(setpos) -- Set the position for the enemy
			-- Play the pulling sound
			if CurTime() > self.Devourer_NextPullSoundT then
				VJ_EmitSound(self, "vj_cofr/aom/barnacle/bcl_alert2.wav")
				self.Devourer_NextPullSoundT = CurTime() + SoundDuration("vj_cofr/aom/barnacle/bcl_alert2.wav")
			end
		end
		self:SetPoseParameter("tongue_height", self:GetPos():Distance(self:GetUp()*125))
		return true
	else
		self:Devourer_ResetEnt()
	end
	self:SetPoseParameter("tongue_height", self:GetPos():Distance(trpos + self:GetUp()*193))
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_ResetEnt()
	if !IsValid(self.Devourer_CurEnt) then return end
	self.Devourer_CurEnt:RemoveEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
	//self.Devourer_CurEnt:RemoveFlags(FL_ATCONTROLS)
	self.Devourer_CurEnt:SetMoveType(self.Devourer_CurEntMoveType) -- Reset the enemy's move type
	self.Devourer_CurEnt = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.Dead == true then return end
	local calc = self:Devourer_CalculateTongue()
	if calc == true && self.Devourer_Status != 1 then
		self.Devourer_Status = 1
		self.NextIdleStandTime = 0
		self.AnimTbl_IdleStand = {ACT_BARNACLE_PULL}
	elseif calc == false && self.Devourer_Status != 0 then
		self.Devourer_Status = 0
		self.NextIdleStandTime = 0
		self.AnimTbl_IdleStand = {ACT_IDLE}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetNearestPointToEntityPosition()
	return self:GetPos() + self:GetUp()*-100 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetMeleeAttackDamagePosition()
	return self:GetPos() + self:GetUp()*-100 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:Devourer_ResetEnt()
	self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)
	self:SetPos(self:GetPos() + self:GetUp()*-4)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo, hitgroup, corpseEnt)
	corpseEnt:DrawShadow(false)
	corpseEnt:ResetSequence("Death")
	corpseEnt:SetCycle(1)
	corpseEnt:SetPoseParameter("tongue_height", 1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	self:Devourer_ResetEnt()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/