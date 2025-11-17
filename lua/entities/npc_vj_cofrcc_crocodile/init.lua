AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/crocodile.mdl"
ENT.StartHealth = 1000
ENT.HullType = HULL_LARGE
ENT.Aquatic_AnimTbl_Calm = "Run_1"
ENT.Aquatic_AnimTbl_Alerted = "Run_2"
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_biteattack_1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 120
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.AlertSoundPitch = VJ.SET(80,80)
ENT.BeforeMeleeAttackSoundPitch = VJ.SET(80,80)
ENT.PainSoundPitch = VJ.SET(80,80)
ENT.DeathSoundPitch = VJ.SET(80,80)
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
    "vj_cofr/cof/taller/taller_stamp.wav"

ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/taller/taller_swing.wav"

ENT.SoundTbl_SoundTrack =
    "vj_cofr/cof/craig/cof_gayviolin_s3.mp3"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Crocodile_MoveTypeSwim = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Gator_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cof/slower/slower_alert10.wav",
        "vj_cofr/cof/slower/slower_alert20.wav",
        "vj_cofr/cof/slower/slower_alert30.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/cof/slower/slower_attack1.wav",
        "vj_cofr/cof/slower/slower_attack2.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(35, 35, 70), Vector(-35, -35, 0))
    self:SetSurroundingBounds(Vector(-100, -100, 0), Vector(100, 100, 90))
    self:Gator_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math.random(3,4) .. ".wav", 75, 100)
        if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
            VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
            /*local effectdata = EffectData()
            effectdata:SetOrigin(self:GetPos())
            effectdata:SetScale(10)
            util.Effect("watersplash", effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if act == ACT_IDLE && self.Crocodile_MoveTypeSwim then
        return ACT_RUN
    elseif act == ACT_RUN && !self.Crocodile_MoveTypeSwim then
        return ACT_WALK_AGITATED
    end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if self:WaterLevel() < 2 then
        if self.Crocodile_MoveTypeSwim then
            self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
            self.Crocodile_MoveTypeSwim = false
        end
    elseif !self.Crocodile_MoveTypeSwim then
        self:DoChangeMovementType(VJ_MOVETYPE_AQUATIC)
        self.Crocodile_MoveTypeSwim = true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/slower/scream1.wav")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_NONE)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math.random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/