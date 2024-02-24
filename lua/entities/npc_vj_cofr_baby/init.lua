AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/baby.mdl"} 
ENT.StartHealth = 50
ENT.HullType = HULL_MEDIUM
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjseq_attack"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
/*
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/baby/b_attack1.wav",
"vj_cofr/cof/baby/b_attack2.wav"
}
*/
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}	
-- Custom
ENT.Baby_DeathFromMeleeAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Baby_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/baby/b_alert1.wav",
	"vj_cofr/cof/baby/b_alert2.wav",
	"vj_cofr/cof/baby/b_alert3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/baby/b_pain1.wav",
	"vj_cofr/cof/baby/b_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/baby/b_death1.wav",
	"vj_cofr/cof/baby/b_death2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(13, 13, 50), Vector(-13, -13, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Baby_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack" then
		self:MeleeAttackCode()
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
		VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)
		self:SetBodygroup(0,1)
	if self.HasGibDeathParticles then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		effectData:SetColor(colorRed)
		effectData:SetScale(25)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(5)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
end	
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
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
function ENT:CustomOnMeleeAttack_BeforeChecks()
 if self.Dead then return end
	self:SetGroundEntity(NULL)
	self.Baby_DeathFromMeleeAttack = true
	self:TakeDamage(self:GetMaxHealth(),self,self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if !self.Baby_DeathFromMeleeAttack then
		self.AnimTbl_Death = {ACT_DIESIMPLE}
    elseif self.Baby_DeathFromMeleeAttack then
		self.AnimTbl_Death = {ACT_SIGNAL1}
    end	
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