AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/bullsquid.mdl"} 
ENT.StartHealth = 250
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjseq_bite"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 25 
ENT.MeleeAttackDamageDistance = 50
ENT.HasMeleeAttackKnockBack = true
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = {"vjseq_range"}
ENT.RangeAttackEntityToSpawn = "obj_vj_cofraom_spit"
ENT.RangeDistance = 784 
ENT.RangeToMeleeDistance = 250
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 1
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_DIESIMPLE, ACT_DIEFORWARD}
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Spine1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}	
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/spitter/bc_bite1.wav",
"vj_cofr/aom/spitter/bc_bite2.wav",
"vj_cofr/aom/spitter/bc_bite3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/twitcher/claw_miss1.wav",
"vj_cofr/aom/twitcher/claw_miss2.wav"
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
function ENT:Spitter_CustomOnInitialize()
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/spitter/bc_attackgrowl.wav",
	"vj_cofr/aom/spitter/bc_attackgrowl2.wav",
	"vj_cofr/aom/spitter/bc_attackgrowl3.wav"
}
    self.SoundTbl_RangeAttack = {
    "vj_cofr/aom/spitter/bc_attack1.wav",
    "vj_cofr/aom/spitter/bc_attack2.wav",
    "vj_cofr/aom/spitter/bc_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/spitter/bc_pain1.wav",
	"vj_cofr/aom/spitter/bc_pain2.wav",
	"vj_cofr/aom/spitter/bc_pain3.wav",
	"vj_cofr/aom/spitter/bc_pain4.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/spitter/bc_die1.wav",
	"vj_cofr/aom/spitter/bc_die2.wav",
	"vj_cofr/aom/spitter/bc_die3.wav"
}
 if self:GetModel() == "models/vj_cofr/aom/bullsquidhd.mdl" then
      self.AnimTbl_MeleeAttack = {"vjseq_bite","vjseq_whip"}
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(20, 20, 44), Vector(-20, -20, 0))
    self:Spitter_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack_range" then
		self:RangeAttackCode()
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
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
	return self:GetForward()*55 + self:GetUp()*255
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
		return self:CalculateProjectile("Curve", projectile:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)
	if dmginfo:GetDamage() > 30 then
		self.FlinchChance = 8
		self.AnimTbl_Flinch = {ACT_BIG_FLINCH}
	else
		self.FlinchChance = 16
		self.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
	end
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
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/