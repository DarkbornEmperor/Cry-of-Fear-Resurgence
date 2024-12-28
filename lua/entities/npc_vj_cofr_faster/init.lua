AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/faster.mdl"
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack5"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/faster/faster_step.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faster/faster_hit1.wav",
"vj_cofr/cof/faster/faster_hit2.wav",
"vj_cofr/cof/faster/faster_hit3.wav",
"vj_cofr/cof/faster/faster_hit4.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faster/faster_miss.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Faster_Type = 0
    -- 0 = Female
    -- 1 = Male
    -- 2 = Out of It
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faster_Init()
if self.Faster_Type == 1 then
   self.AlertSoundPitch = VJ.SET(80, 80)
   self.BeforeMeleeAttackSoundPitch = VJ.SET(80, 80)
   self.PainSoundPitch = VJ.SET(80, 80)
   self.DeathSoundPitch = VJ.SET(80, 80)
end
    self.SoundTbl_Alert = {
    "vj_cofr/cof/faster/faster_alert1.wav",
    "vj_cofr/cof/faster/faster_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/faster/faster_attack.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/faster/faster_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/faster/faster_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self:GetModel() == "models/vj_cofr/cof/faster.mdl" or self:GetModel() == "models/vj_cofr/custom/hh/faster_hh.mdl" then // Already the default
        self.Faster_Type = 0
    elseif self:GetModel() == "models/vj_cofr/cof/faster2.mdl" or self:GetModel() == "models/vj_cofr/custom/faster.mdl" or self:GetModel() == "models/vj_cofr/custom/faster2.mdl" then
        self.Faster_Type = 1
        self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack4","vjseq_attack5"}
    elseif self:GetModel() == "models/vj_cofr/custom/faster_ooi.mdl" then
        self.Faster_Type = 2
end
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Faster_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "attack" then
        self:MeleeAttackCode()
    elseif key == "suicide" then
        VJ.EmitSound(self, "vj_cofr/cof/faster/faster_suicide.wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
    elseif key == "death_metal" then
        VJ.EmitSound(self, "vj_cofr/cof/faster/faster_metalfall.wav", 75, 100)
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
function ENT:OnAlert(ent)
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/faster/faster_special.wav")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:OnDamaged(dmginfo,hitgroup,status)
 -- Make a metal ricochet effect
 if status == "PreDamage" && (hitgroup == 8 or self.Faster_Type == 1 && hitgroup == HITGROUP_HEAD) then
    if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end
    dmginfo:SetDamage(0)
    if dmginfo:GetDamagePosition() != vec then
        local rico = EffectData()
        rico:SetOrigin(dmginfo:GetDamagePosition())
        rico:SetScale(4) -- Size
        rico:SetMagnitude(2) -- Effect type | 1 = Animated | 2 = Basic
        util.Effect("VJ_COFR_Rico", rico)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Initial" then
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
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/