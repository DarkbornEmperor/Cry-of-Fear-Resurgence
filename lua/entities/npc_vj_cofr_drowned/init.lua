AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/drowned.mdl"} 
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red_large"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.ConstantlyFaceEnemy = true 
ENT.ConstantlyFaceEnemy_IfAttacking = true 
ENT.ConstantlyFaceEnemy_Postures = "Standing" 
ENT.ConstantlyFaceEnemyDistance = 600 
ENT.HasMeleeAttack = false 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14 
ENT.MeleeAttackDistance = 15 
ENT.MeleeAttackDamageDistance = 35
ENT.HasRangeAttack = true 
ENT.DisableDefaultRangeAttackCode = true 
ENT.AnimTbl_RangeAttack = {ACT_SIGNAL1} 
ENT.RangeDistance = 250 
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 10
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/crazylady/knife_hitbody1.wav",
"vj_cofr/cof/crazylady/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/crazylady/knife_swing.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/cof/crazylady/suicide_attempt.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Drowned_Baby = false
ENT.Drowned_DamageDistance = 500
ENT.Drowned_NextEnemyDamage = 0

util.AddNetworkString("vj_cofr_drowned_damage")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/crazylady/lady_alert10.wav",
	"vj_cofr/cof/crazylady/lady_alert20.wav",
	"vj_cofr/cof/crazylady/lady_alert30.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/crazylady/lady_pain1.wav",
	"vj_cofr/cof/crazylady/lady_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
     self:Drowned_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "attack_range" then
		self:RangeAttackCode()
end		
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_Damage()
	net.Start("vj_cofr_drowned_damage")
	net.WriteEntity(self)
	net.WriteEntity(self:GetEnemy())
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	if self.Dead == true or GetConVarNumber("vj_npc_norange") == 1 then return end
	if self:GetPos():Distance(self:GetEnemy():GetPos()) > self.Drowned_DamageDistance or !self:Visible(self:GetEnemy()) then return end
	if CurTime() > self.Drowned_NextEnemyDamage then
	timer.Simple(5,function() if IsValid(self) && self:GetEnemy() && self.Dead == false then
		self:GetEnemy():TakeDamage(200,self,self)
		if self:GetEnemy():IsPlayer() then self:Drowned_Damage() end
	    self.Drowned_NextEnemyDamage = CurTime() + 10
     end		
   end)		
 end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    if self.Dead == true or self:BusyWithActivity() then return end
	if self.Drowned_Baby == false && self.Dead == false && self:GetEnemy() != nil && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 100 then
		self.Drowned_Baby = true
		self.HasMeleeAttack = true
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,false,false)
		timer.Simple(0.3,function() if IsValid(self) then
			if self.HasSounds == true then VJ_EmitSound(self,"vj_cofr/cof/crazylady/baby_burst.wav") end end end)
			timer.Simple(0.1,function() if IsValid(self) then
			    ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("baby")).Pos,self:GetAngles())
				self:SetBodygroup(0,1) 
				self:DoChaseAnimation()
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/