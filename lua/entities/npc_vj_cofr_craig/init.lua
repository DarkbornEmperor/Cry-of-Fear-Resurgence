AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/craig.mdl"} 
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3"} 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 70
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -80), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/craig/chainsawed.wav"
}		
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/sawrunner/chainsaw_attack_miss.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/craig/cof_gayviolin_s3.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
-- Custom
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Craig_CustomOnInitialize()
    self.SoundTbl_Breath = {
	"vj_cofr/cof/sawer/chainsaw_loop.wav"
}
    self.SoundTbl_Alert = {
	"vj_cofr/cof/craig/alert1.wav",
	"vj_cofr/cof/craig/alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/craig/attack1.wav",
	"vj_cofr/cof/craig/attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/craig/pain1.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/craig/death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(18, 18, 103), Vector(-18, -18, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 140))
    self:Craig_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack" then
		self:MeleeAttackCode()	
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
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
	if hitEnt.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
		self.MeleeAttackDamage = hitEnt:Health() + 10
	elseif hitEnt:IsPlayer() then
		self.MeleeAttackDamage = hitEnt:Health() + hitEnt:Armor() + 10
	else
		self.MeleeAttackDamage = 200
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.10)		
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