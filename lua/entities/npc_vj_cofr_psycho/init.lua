AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/psycho.mdl"
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 45
ENT.MeleeAttackDamageDistance = 60
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
"vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra =
"vj_cofr/aom/weapons/axe/Axe_hitbody.wav"

ENT.SoundTbl_MeleeAttackMiss =
"vj_cofr/aom/weapons/axe/Axe_swing.wav"

ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Psycho_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/faceless/faceless_alert10.wav",
    "vj_cofr/cof/faceless/faceless_alert20.wav",
    "vj_cofr/cof/faceless/faceless_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/faceless/faceless_attack1.wav",
    "vj_cofr/cof/faceless/faceless_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/faceless/faceless_pain1.wav",
    "vj_cofr/cof/faceless/faceless_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/faceless/faceless_pain1.wav",
    "vj_cofr/cof/faceless/faceless_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 if self:GetModel() == "models/vj_cofr/custom/patrick.mdl" or self:GetModel() == "models/vj_cofr/custom/psychopumpkin.mdl" or self:GetModel() == "models/vj_cofr/custom/psycho_le.mdl" then
    self.AnimTbl_MeleeAttack = {"vjseq_attack1_1","vjseq_attack1_2","vjseq_attack1_3"}
end
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-70, -70, 0), Vector(70, 70, 90))
    self:Psycho_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
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
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/