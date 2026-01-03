AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/handcrab.mdl"
ENT.HullType = HULL_TINY
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {"vjseq_jump", "vjseq_jump_variation1", "vjseq_jump_variation2"}
ENT.LeapAttackMaxDistance = 256
ENT.LeapAttackMinDistance = 1
ENT.LeapAttackDamageDistance = 50
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.TimeUntilLeapAttackVelocity = 0.4
ENT.NextLeapAttackTime = 1
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1, 1.2, 1.4}
ENT.NextAnyAttackTime_Leap = 3
ENT.LeapAttackStopOnHit = true
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 200
ENT.LimitChaseDistance_Min = 0
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.FlinchChance = 3
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(45, 20, -15),
    FirstP_Bone = "Bip01 Pelvis",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_LeapAttackDamage  =
    "vj_cofr/aom/handcrab/hc_headbite.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Handcrab_Type = 0
    -- 0 = Director's Cut
    -- 1 = Classic aka Headcrab
    -- 2 = Remod
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 25
        self.LeapAttackDamage = 4
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 35
        self.LeapAttackDamage = 8
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 or GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Difficult & Nightmare
        self.StartHealth = 50
        self.LeapAttackDamage = 16
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Handcrab_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/aom/handcrab/hc_alert1.wav",
        "vj_cofr/aom/handcrab/hc_alert2.wav"
    }
    self.SoundTbl_LeapAttackJump  = {
        "vj_cofr/aom/handcrab/hc_attack1.wav",
        "vj_cofr/aom/handcrab/hc_attack2.wav",
        "vj_cofr/aom/handcrab/hc_attack3.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/aom/handcrab/hc_pain1.wav",
        "vj_cofr/aom/handcrab/hc_pain2.wav",
        "vj_cofr/aom/handcrab/hc_pain3.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/handcrab/hc_die1.wav",
        "vj_cofr/aom/handcrab/hc_die2.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self:GetModel() == "models/vj_cofr/aom/handcrab.mdl" then // Already the default
        self.Handcrab_Type = 0
    elseif self:GetModel() == "models/vj_cofr/aom/classic/headcrab.mdl" then
        self.Handcrab_Type = 1
    elseif self:GetModel() == "models/vj_cofr/aomr/handcrab.mdl" then
        self.Handcrab_Type = 2
    end
    self:SetCollisionBounds(Vector(10, 10, 18), Vector(-10, -10, 0))
    self:SetSurroundingBounds(Vector(30, 30, 30), Vector(-30, -30, 0))
    self:Handcrab_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
        self.VJCE_NPC.EnemyDetection = true
        self.VJCE_NPC.JumpParams.Enabled = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if self.VJ_IsBeingControlled then return end
    if math.random(1,2) == 1 then
        self:PlayAnim("angry", true, false, true)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status, enemy)
    if status == "Jump" then
        return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 80 - self:GetUp() * 30
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
    if status == "Init" then
        return !self:IsOnGround() -- If it's not on ground, then don't play flinch so it won't cut off leap attacks mid air
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/