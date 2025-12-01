AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupMap = {
    {HitGroup = HITGROUP_LEFTARM, Animation = ACT_FLINCH_LEFTARM},
    {HitGroup = HITGROUP_RIGHTARM, Animation = ACT_FLINCH_RIGHTARM},
    {HitGroup = HITGROUP_LEFTLEG, Animation = ACT_FLINCH_LEFTLEG},
    {HitGroup = HITGROUP_RIGHTLEG, Animation = ACT_FLINCH_RIGHTLEG}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
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
    "vj_cofr/aom/twitcher/claw_strike1.wav",
    "vj_cofr/aom/twitcher/claw_strike2.wav",
    "vj_cofr/aom/twitcher/claw_strike3.wav"
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
-- Custom
ENT.Twitcher_Invisible = false
ENT.Twitcher_Transparent = false
ENT.Twitcher_Type = 0
    -- 0 = Director's Cut Twitcher 1
    -- 1 = Director's Cut Twitcher 2
    -- 2 = Director's Cut Twitcher 3
    -- 3 = Director's Cut Twitcher 4
    -- 4 = Classic
    -- 5 = Dark Assistance
    -- 6 = Remod Twitcher 1
    -- 7 = Remod Twitcher 2
    -- 8 = Remod Twitcher 3
    -- 9 = Remod Twitcher 4

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
    if self.SetStats then self:SetStats() end
    if self:GetClass() == "npc_vj_cofraom_twitcher1" then
        self.Twitcher_Type = 0
        self.Model = {
            "models/vj_cofr/aom/twitcher1_barney.mdl",
            "models/vj_cofr/aom/twitcher1_csdamage.mdl",
            "models/vj_cofr/aom/twitcher1_doctor.mdl",
            "models/vj_cofr/aom/twitcher1_girl.mdl",
            "models/vj_cofr/aom/twitcher1_headless.mdl",
            "models/vj_cofr/aom/twitcher1_headless2.mdl",
            "models/vj_cofr/aom/twitcher1_normal.mdl",
            "models/vj_cofr/aom/twitcher1_patient.mdl",
            "models/vj_cofr/aom/twitcher1_reofficer.mdl",
            "models/vj_cofr/aom/twitcher1_zomb.mdl",
            "models/vj_cofr/aom/twitcher1_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraom_twitcher2" then
        self.Twitcher_Type = 1
        self.Model = {
            "models/vj_cofr/aom/twitcher2_barney.mdl",
            "models/vj_cofr/aom/twitcher2_csdamage.mdl",
            "models/vj_cofr/aom/twitcher2_doctor.mdl",
            "models/vj_cofr/aom/twitcher2_girl.mdl",
            "models/vj_cofr/aom/twitcher2_headless.mdl",
            "models/vj_cofr/aom/twitcher2_headless2.mdl",
            "models/vj_cofr/aom/twitcher2_normal.mdl",
            "models/vj_cofr/aom/twitcher2_patient.mdl",
            "models/vj_cofr/aom/twitcher2_reofficer.mdl",
            "models/vj_cofr/aom/twitcher2_zomb.mdl",
            "models/vj_cofr/aom/twitcher2_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraom_twitcher3" then
        self.Twitcher_Type = 2
        self.Model = {
            "models/vj_cofr/aom/twitcher3_barney.mdl",
            "models/vj_cofr/aom/twitcher3_csdamage.mdl",
            "models/vj_cofr/aom/twitcher3_doctor.mdl",
            "models/vj_cofr/aom/twitcher3_girl.mdl",
            "models/vj_cofr/aom/twitcher3_headless.mdl",
            "models/vj_cofr/aom/twitcher3_headless2.mdl",
            "models/vj_cofr/aom/twitcher3_normal.mdl",
            "models/vj_cofr/aom/twitcher3_patient.mdl",
            "models/vj_cofr/aom/twitcher3_reofficer.mdl",
            "models/vj_cofr/aom/twitcher3_zomb.mdl",
            "models/vj_cofr/aom/twitcher3_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraom_twitcher4" then
        self.Twitcher_Type = 3
        self.Model = {
            "models/vj_cofr/aom/twitcher4_barney.mdl",
            "models/vj_cofr/aom/twitcher4_csdamage.mdl",
            "models/vj_cofr/aom/twitcher4_doctor.mdl",
            "models/vj_cofr/aom/twitcher4_girl.mdl",
            "models/vj_cofr/aom/twitcher4_headless.mdl",
            "models/vj_cofr/aom/twitcher4_headless2.mdl",
            "models/vj_cofr/aom/twitcher4_normal.mdl",
            "models/vj_cofr/aom/twitcher4_patient.mdl",
            "models/vj_cofr/aom/twitcher4_reofficer.mdl",
            "models/vj_cofr/aom/twitcher4_zomb.mdl",
            "models/vj_cofr/aom/twitcher4_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraomc_twitcher" then
        self.Twitcher_Type = 4
        self.Model = {
            "models/vj_cofr/aom/classic/twitcher_barney.mdl",
            "models/vj_cofr/aom/classic/twitcher_csdamage.mdl",
            "models/vj_cofr/aom/classic/twitcher_doctor.mdl",
            "models/vj_cofr/aom/classic/twitcher_girl.mdl",
            "models/vj_cofr/aom/classic/twitcher_headless.mdl",
            "models/vj_cofr/aom/classic/twitcher_headless2.mdl",
            "models/vj_cofr/aom/classic/twitcher_normal.mdl",
            "models/vj_cofr/aom/classic/twitcher_patient.mdl",
            "models/vj_cofr/aom/classic/twitcher_reofficer.mdl",
            "models/vj_cofr/aom/classic/twitcher_zomb.mdl",
            "models/vj_cofr/aom/classic/twitcher_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraomda_twitcher" then
        self.Twitcher_Type = 5
        self.Model =
            "models/vj_cofr/aom/da/twitcher.mdl"

    elseif self:GetClass() == "npc_vj_cofraomr_twitcher1" then
        self.Twitcher_Type = 6
        self.Model = {
            "models/vj_cofr/aomr/twitcher1_barney.mdl",
            "models/vj_cofr/aomr/twitcher1_csdamage.mdl",
            "models/vj_cofr/aomr/twitcher1_doctor.mdl",
            "models/vj_cofr/aomr/twitcher1_girl.mdl",
            "models/vj_cofr/aomr/twitcher1_headless.mdl",
            "models/vj_cofr/aomr/twitcher1_headless2.mdl",
            "models/vj_cofr/aomr/twitcher1_normal.mdl",
            "models/vj_cofr/aomr/twitcher1_patient.mdl",
            "models/vj_cofr/aomr/twitcher1_reofficer.mdl",
            "models/vj_cofr/aomr/twitcher1_zomb.mdl",
            "models/vj_cofr/aomr/twitcher1_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraomr_twitcher2" then
        self.Twitcher_Type = 7
        self.Model = {
            "models/vj_cofr/aomr/twitcher2_barney.mdl",
            "models/vj_cofr/aomr/twitcher2_csdamage.mdl",
            "models/vj_cofr/aomr/twitcher2_doctor.mdl",
            "models/vj_cofr/aomr/twitcher2_girl.mdl",
            "models/vj_cofr/aomr/twitcher2_headless.mdl",
            "models/vj_cofr/aomr/twitcher2_headless2.mdl",
            "models/vj_cofr/aomr/twitcher2_normal.mdl",
            //"models/vj_cofr/aomr/twitcher2_patient.mdl",
            "models/vj_cofr/aomr/twitcher2_reofficer.mdl",
            "models/vj_cofr/aomr/twitcher2_zomb.mdl",
            "models/vj_cofr/aomr/twitcher2_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraomr_twitcher3" then
        self.Twitcher_Type = 8
        self.Model = {
            "models/vj_cofr/aomr/twitcher3_barney.mdl",
            "models/vj_cofr/aomr/twitcher3_csdamage.mdl",
            "models/vj_cofr/aomr/twitcher3_doctor.mdl",
            "models/vj_cofr/aomr/twitcher3_girl.mdl",
            "models/vj_cofr/aomr/twitcher3_headless.mdl",
            "models/vj_cofr/aomr/twitcher3_headless2.mdl",
            "models/vj_cofr/aomr/twitcher3_normal.mdl",
            "models/vj_cofr/aomr/twitcher3_patient.mdl",
            "models/vj_cofr/aomr/twitcher3_reofficer.mdl",
            "models/vj_cofr/aomr/twitcher3_zomb.mdl",
            "models/vj_cofr/aomr/twitcher3_zombie2.mdl"
        }
    elseif self:GetClass() == "npc_vj_cofraomr_twitcher4" then
        self.Twitcher_Type = 9
        self.Model = {
            "models/vj_cofr/aomr/twitcher4_barney.mdl",
            "models/vj_cofr/aomr/twitcher4_csdamage.mdl",
            "models/vj_cofr/aomr/twitcher4_doctor.mdl",
            "models/vj_cofr/aomr/twitcher4_girl.mdl",
            "models/vj_cofr/aomr/twitcher4_headless.mdl",
            "models/vj_cofr/aomr/twitcher4_headless2.mdl",
            "models/vj_cofr/aomr/twitcher4_normal.mdl",
            "models/vj_cofr/aomr/twitcher4_patient.mdl",
            "models/vj_cofr/aomr/twitcher4_reofficer.mdl",
            "models/vj_cofr/aomr/twitcher4_zomb.mdl",
            "models/vj_cofr/aomr/twitcher4_zombie2.mdl"
        }
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetStats()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 70
        self.MeleeAttackDamage = 5
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 90
        self.MeleeAttackDamage = 10
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 or GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Difficult & Nightmare
        self.StartHealth = 160
        self.MeleeAttackDamage = 20
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Twitcher_Init()
    if self.Twitcher_Type == 0 or self.Twitcher_Type == 1 or self.Twitcher_Type == 6 or self.Twitcher_Type == 7 then
        self.AnimTbl_MeleeAttack = {"vjseq_attack0", "vjseq_attack1", "vjseq_attack2", "vjseq_attack22", "vjseq_attack3", "vjseq_attack32", "vjseq_attack45"}

    elseif self.Twitcher_Type == 2 or self.Twitcher_Type == 8 then
        self.AnimTbl_MeleeAttack = {"vjseq_attack1", "vjseq_attack2", "vjseq_attack3"}

    elseif self.Twitcher_Type == 3 or self.Twitcher_Type == 9 then
        self.AnimTbl_MeleeAttack = "vjseq_attack0"

    elseif self.Twitcher_Type == 4 then
        self.AnimTbl_MeleeAttack = {"vjseq_attack1", "vjseq_attack2"}

    elseif self.Twitcher_Type == 5 then
        self.AnimTbl_MeleeAttack = {"vjseq_attack1", "vjseq_attack2", "vjseq_attack3", "vjseq_attack4", "vjseq_attack5"}
    end
    if self:GetModel() == "models/vj_cofr/aom/twitcher2_girl.mdl" or self:GetModel() == "models/vj_cofr/aomr/twitcher2_girl.mdl" then
        self:DrawShadow(false)
    end
    if GetConVar("VJ_COFR_Twitcher_Invisible"):GetInt() == 1 then
        if math_random(1,10) == 1 then
            self.Twitcher_Invisible = true
            self:SetNoDraw(true)

        elseif math_random(1,10) == 1 then
            self.Twitcher_Transparent = true
            self:SetSkin(1) -- For the Remod twitcher#_zomb & twitcher#_headless models to avoid transparency issues
            self:SetRenderFX(kRenderFxDistort)
            self:SetRenderMode(RENDERMODE_TRANSADD)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TwitcherSounds()
    self.SoundTbl_Pain = {
        "vj_cofr/aom/twitcher/zo_pain1.wav",
        "vj_cofr/aom/twitcher/zo_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/twitcher/zo_pain1.wav",
        "vj_cofr/aom/twitcher/zo_pain2.wav"
    }
    if GetConVar("VJ_COFR_Twitcher_RandomSounds"):GetInt() == 0 then
        if self.Twitcher_Type == 0 or self.Twitcher_Type == 2 or self.Twitcher_Type == 6 or self.Twitcher_Type == 8 then
            self.SoundTbl_Alert = {
                "vj_cofr/aom/twitcher/zo_alert10.wav",
                "vj_cofr/aom/twitcher/zo_alert20.wav",
                "vj_cofr/aom/twitcher/zo_alert30.wav"
            }
            self.SoundTbl_BeforeMeleeAttack = {
                "vj_cofr/aom/twitcher/zo_attack1.wav",
                "vj_cofr/aom/twitcher/zo_attack2.wav"
            }
        elseif self.Twitcher_Type == 1 or self.Twitcher_Type == 3 or self.Twitcher_Type == 7 or self.Twitcher_Type == 9 then
            self.SoundTbl_Alert = {
                "vj_cofr/aom/twitcher2/zo_alert10.wav",
                "vj_cofr/aom/twitcher2/zo_alert20.wav",
                "vj_cofr/aom/twitcher2/zo_alert30.wav"
            }
            self.SoundTbl_BeforeMeleeAttack = {
                "vj_cofr/aom/twitcher2/zo_attack1.wav",
                "vj_cofr/aom/twitcher2/zo_attack2.wav"
            }
        end
    end
    if GetConVar("VJ_COFR_Twitcher_RandomSounds"):GetInt() == 1 then
        local twitcherSounds = math_random(1,2)
        if twitcherSounds == 1 then
            self.SoundTbl_Alert = {
                "vj_cofr/aom/twitcher/zo_alert10.wav",
                "vj_cofr/aom/twitcher/zo_alert20.wav",
                "vj_cofr/aom/twitcher/zo_alert30.wav"
            }
            self.SoundTbl_BeforeMeleeAttack = {
                "vj_cofr/aom/twitcher/zo_attack1.wav",
                "vj_cofr/aom/twitcher/zo_attack2.wav"
            }
        elseif twitcherSounds == 2 then
            self.SoundTbl_Alert = {
                "vj_cofr/aom/twitcher2/zo_alert10.wav",
                "vj_cofr/aom/twitcher2/zo_alert20.wav",
                "vj_cofr/aom/twitcher2/zo_alert30.wav"
            }
            self.SoundTbl_BeforeMeleeAttack = {
                "vj_cofr/aom/twitcher2/zo_attack1.wav",
                "vj_cofr/aom/twitcher2/zo_attack2.wav"
            }
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self.Twitcher_Type == 5 then self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0)) end
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Twitcher_Init()
    self:TwitcherSounds()
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
    if math_random(1,3) == 1 && self.Twitcher_Invisible then
        self:PlaySoundSystem("Alert", "vj_cofr/aom/twitcher/skuggfa.wav")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    -- Remove decals for Transparent & Invisible Twitchers
    if self.Twitcher_Invisible or self.Twitcher_Transparent then
        self:RemoveAllDecals()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
    if status == "Init" then
        if dmginfo:GetDamage() > 30 then
            self.AnimTbl_Flinch = ACT_BIG_FLINCH
        else
            self.AnimTbl_Flinch = ACT_SMALL_FLINCH
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "DeathAnim" then
        if hitgroup == HITGROUP_HEAD then
            self.AnimTbl_Death = ACT_DIE_HEADSHOT
        else
            self.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIESIMPLE, ACT_DIE_GUTSHOT}
        end
    end
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    if self:GetModel() == "models/vj_cofr/aom/twitcher2_girl.mdl" or self:GetModel() == "models/vj_cofr/aomr/twitcher2_girl.mdl" then
        corpseEnt:DrawShadow(false)
    elseif self.Twitcher_Invisible then
        corpseEnt:SetNoDraw(true)
    elseif self.Twitcher_Transparent then
        corpseEnt:SetRenderFX(kRenderFxDistort)
        corpseEnt:SetRenderMode(RENDERMODE_TRANSADD)
    end
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/