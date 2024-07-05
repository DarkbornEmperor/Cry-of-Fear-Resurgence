AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/taller.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.VJ_IsHugeMonster = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 55 
ENT.MeleeAttackDamageDistance = 85
ENT.MeleeAttackDamageType = DMG_CRUSH
ENT.SlowPlayerOnMeleeAttack = false
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 0.001
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 0.001 
ENT.SlowPlayerOnMeleeAttackTime = 4
ENT.HasMeleeAttackSlowPlayerSound = false 
ENT.HasMeleeAttackKnockBack = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(10, 25, -120), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/taller/taller_step.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Taller_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/taller/taller_alert.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/taller/taller_pain.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/taller/taller_die.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(30, 30, 167), Vector(-30, -30, 0))
	self:SetSurroundingBounds(Vector(-90, -90, 0), Vector(90, 90, 200))
    self:Taller_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
        util.ScreenShake(self:GetPos(),10,100,0.4,300)
	elseif key == "attack" then
		self:MeleeAttackCode()		
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end
	if key == "attack" && self:GetSequence() == self:LookupSequence("stamp") then
        util.ScreenShake(self:GetPos(),10,100,0.4,300)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
	    /*local effectdata = EffectData()
	    effectdata:SetOrigin(self:GetPos())
	    effectdata:SetScale(10)
	    util.Effect("watersplash",effectdata)*/
	    end
    end			
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
    local attack = math.random(1,2)
	if attack == 1 then
		self.AnimTbl_MeleeAttack = "vjseq_attack"
		self.MeleeAttackDamage = 60
		self.SlowPlayerOnMeleeAttack = true
		self.HasMeleeAttackKnockBack = true
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/taller/taller_swing.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/taller/taller_player_punch.wav"
}
	elseif attack == 2 then
		self.AnimTbl_MeleeAttack = "vjseq_stamp"
		self.MeleeAttackDamage = 200 
		self.SlowPlayerOnMeleeAttack = false
		self.HasMeleeAttackKnockBack = false
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/taller/taller_wall_punch.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/taller/taller_stamp.wav"
}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
 if self:GetSequence() == self:LookupSequence("stamp") then
	if hitEnt.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
		self.MeleeAttackDamage = hitEnt:Health() + 10
	elseif hitEnt:IsPlayer() then
		self.MeleeAttackDamage = hitEnt:Health() + hitEnt:Armor() + 10
	else
		self.MeleeAttackDamage = 200
	end
end
	 if self:GetSequence() == self:LookupSequence("attack") && (hitEnt.IsVJBaseSNPC && hitEnt.MovementType == VJ_MOVETYPE_GROUND && !hitEnt.VJ_IsHugeMonster && !hitEnt.IsVJBaseSNPC_Tank) then	
		hitEnt:StopMoving()
        hitEnt:SetState(VJ_STATE_ONLY_ANIMATION)		   
	    timer.Simple(4,function() if IsValid(hitEnt) then
        hitEnt:SetState()
		end
    end)	
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*150 + self:GetUp()*250
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/