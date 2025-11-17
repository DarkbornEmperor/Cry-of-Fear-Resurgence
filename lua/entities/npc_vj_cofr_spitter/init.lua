AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/spitter.mdl"
ENT.StartHealth = 140
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_spit"
ENT.RangeAttackProjectiles = "obj_vj_cofr_spit"
ENT.RangeAttackMaxDistance = 784
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 1
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "joint22",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Spitter_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cof/flygare/flygare_alert1.wav",
        "vj_cofr/cof/flygare/flygare_alert2.wav"
    }
    self.SoundTbl_BeforeRangeAttack = {
        "vj_cofr/cof/flygare/flygare_attack1.wav",
        "vj_cofr/cof/flygare/flygare_attack2.wav"
    }
    self.SoundTbl_Pain =
        "vj_cofr/cof/flygare/flygare_pain.wav"

    self.SoundTbl_Death =
        "vj_cofr/cof/flygare/flygare_death.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    /*if VJ_CVAR_AI_ENABLED then
        timer.Simple(0, function()
            self:PlayAnim(ACT_COWER, true, false)
            self:SetState(VJ_STATE_ONLY_ANIMATION_NOATTACK)
        end)
        timer.Simple(VJ.AnimDuration(self, ACT_COWER), function()
            if IsValid(self) then
                self:SetState()
            end
        end)
    end*/
    self:SetCollisionBounds(Vector(15, 15, 70), Vector(-15, -15, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Spitter_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "range" then
        self:ExecuteRangeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
    local projPos = projectile:GetPos()
    return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveOld", projPos, 1, 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
    return self:GetAttachment(self:LookupAttachment("mouth")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        self:DrawShadow(false)
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    corpseEnt:DrawShadow(false)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/