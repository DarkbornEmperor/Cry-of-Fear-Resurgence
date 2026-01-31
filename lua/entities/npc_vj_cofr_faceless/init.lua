AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/faceless.mdl"
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.CanTurnWhileMoving = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupMap = {
    {HitGroup = HITGROUP_LEFTLEG, Animation = ACT_FLINCH_LEFTLEG},
    {HitGroup = HITGROUP_RIGHTLEG, Animation = ACT_FLINCH_RIGHTLEG}
}
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

ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/faceless/fist_strike1.wav",
    "vj_cofr/cof/faceless/fist_strike2.wav",
    "vj_cofr/cof/faceless/fist_strike3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/faceless/fist_miss1.wav",
    "vj_cofr/cof/faceless/fist_miss2.wav"
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
ENT.Faceless_Type = 0
    -- 0 = Normal Faceless
    -- 1 = Faceless Crawler
    -- 2 = Faced Faceless
    -- 3 = Twister
    -- 4 = Twister Valve
    -- 5 = Custom

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 20
        self.MeleeAttackDamage = 2
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 40
        self.MeleeAttackDamage = 6
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.StartHealth = 80
        self.MeleeAttackDamage = 15
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.StartHealth = 100
        self.MeleeAttackDamage = 25
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faceless_Init()
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
    if self:GetModel() == "models/vj_cofr/cof/faceless.mdl" or self:GetModel() == "models/vj_cofr/cofcc/faceless_tsos.mdl" or self:GetModel() == "models/vj_cofr/cofcc/faceless3_tsos.mdl" then // Already the default
        self.Faceless_Type = 0
    elseif self:GetModel() == "models/vj_cofr/cof/faceless_crawler.mdl" or self:GetModel() == "models/vj_cofr/cofcc/faceless_crawler_tsos.mdl" or self:GetModel() == "models/vj_cofr/cofce/faceless_crawler.mdl" then
        self.Faceless_Type = 1
    elseif self:GetModel() == "models/vj_cofr/cof/faceless_faced.mdl" or self:GetModel() == "models/vj_cofr/cofcc/faceless_faced_tsos.mdl" or self:GetModel() == "models/vj_cofr/cofce/faceless_faced.mdl" then
        self.Faceless_Type = 2
    elseif self:GetModel() == "models/vj_cofr/cof/faceless_twister.mdl" or self:GetModel() == "models/vj_cofr/cofcc/faceless_twister_tsos.mdl" then
        self.Faceless_Type = 3
    elseif self:GetModel() == "models/vj_cofr/cof/faceless_twister_valve.mdl" then
        self.Faceless_Type = 4
    elseif self:GetModel() == "models/vj_cofr/cofcc/faceless_reci.mdl" or self:GetModel() == "models/vj_cofr/cofce/faceless_claw.mdl" then
        self.Faceless_Type = 5
        self.AnimTbl_MeleeAttack = "vjseq_attack2"
    end
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Faceless_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math_random(3,4) .. ".wav", 75, 100)
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
    if math_random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/faceless/psyksjuk.wav")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
    -- Make a metal ricochet effect
    if status == "PreDamage" && self.Faceless_Type == 4 && hitgroup == HITGROUP_HEAD then
        if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self, "vj_cofr/cof/faster/faster_headhit" .. math_random(1,4) .. ".wav", 75, 100) end
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
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/