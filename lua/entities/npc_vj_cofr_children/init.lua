AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/children.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_MEDIUM
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 12
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100

ENT.HideOnUnknownDamage = false
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupPlayDefault = true
ENT.FlinchHitGroupMap = {
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}},
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/children/plasticstep1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/children/child_slice.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/children/child_slash.wav"
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
function ENT:Children_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/children/child_alert10.wav",
    "vj_cofr/cof/children/child_alert20.wav",
    "vj_cofr/cof/children/child_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/children/child_attack1.wav",
    "vj_cofr/cof/children/child_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/children/child_pain1.wav",
    "vj_cofr/cof/children/child_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/children/child_pain1.wav",
    "vj_cofr/cof/children/child_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(13, 13, 60), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Children_Init()
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
function ENT:OnFlinch(dmginfo,hitgroup,status)
 if status == "Init" then
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = ACT_DIE_HEADSHOT
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
    end
end
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