AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/lurker.mdl"
ENT.HullType = HULL_LARGE
ENT.TurningUseAllAxis = true
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 80
ENT.Aquatic_SwimmingSpeed_Alerted = 500
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_bite_l", "vjseq_bite_r"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 120
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_HOVER, ACT_DIEVIOLENT, ACT_DIESIMPLE}
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(12, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/aom/lurker/ichy_bite1.wav",
    "vj_cofr/aom/lurker/ichy_bite2.wav"
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
ENT.Icky_BlinkingT = 0

local math_rand = math.Rand
local math_clamp = math.Clamp
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 500
        self.MeleeAttackDamage = 20
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 600
        self.MeleeAttackDamage = 35
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 or GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Difficult & Nightmare
        self.StartHealth = 1000
        self.MeleeAttackDamage = 50
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Lurker_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/aom/lurker/ichy_alert1.wav",
        "vj_cofr/aom/lurker/ichy_alert3.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/aom/lurker/ichy_attack1.wav",
        "vj_cofr/aom/lurker/ichy_attack2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/lurker/ichy_die1.wav",
        "vj_cofr/aom/lurker/ichy_die2.wav",
        "vj_cofr/aom/lurker/ichy_die3.wav",
        "vj_cofr/aom/lurker/ichy_die4.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(40, 40, 60), Vector(-40, -40, 0))
    self:SetSurroundingBounds(Vector(200, 200, 90), Vector(-200, -200, 0))
    self:Lurker_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
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
function ENT:OnThink()
    -- Blinking system
    if !self.Dead && CurTime() > self.Icky_BlinkingT then
        self:SetSkin(4)
        timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(3) end end)
        timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(2) end end)
        timer.Simple(0.4, function() if IsValid(self) then self:SetSkin(3) end end)
        timer.Simple(0.5, function()
            if IsValid(self) then
                if IsValid(self:GetEnemy()) then
                    self:SetSkin(0)
                else
                    self:SetSkin(1)
                end
            end
        end)
        self.Icky_BlinkingT = CurTime() + math_rand(2,3.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt)
    -- Increase its health when it deals damage (Up to 2x its max health)
    -- If the enemy is less health than its melee attack, then use the enemy's health as the addition
    if status == "PreDamage" then
        self:SetHealth(math_clamp(self:Health() + ((self.MeleeAttackDamage > hitEnt:Health() and hitEnt:Health()) or self.MeleeAttackDamage), self:Health(), self:GetMaxHealth() * 2))
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
    corpseEnt:SetSkin(2)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/