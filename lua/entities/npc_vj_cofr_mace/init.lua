AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/mace.mdl"
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = "DamageTypes"
ENT.FlinchDamageTypes = {DMG_BLAST, DMG_SHOCK}
ENT.FlinchChance = 2
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -70),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra =
    "vj_cofr/cof/sewer/mace_hitflesh.wav"

ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/sewer/mace_swing.wav"

ENT.SoundTbl_SoundTrack =
    "vj_cofr/cof/sewer/sewer_boss.mp3"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 80
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 130
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.StartHealth = 180
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.StartHealth = 180
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Mace_Init()
    self.SoundTbl_Alert =
        "vj_cofr/cof/sewer/mace_scream.wav"

    /*self.SoundTbl_BeforeMeleeAttack = {
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
    }*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 0 then
        self.CanFlinch = true
        self.FlinchChance = 14
    end
    self:SetCollisionBounds(Vector(20, 20, 92), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(80, 80, 120), Vector(-80, -80, 0))
    self:Mace_Init()
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
function ENT:OnMeleeAttackExecute(status, ent, isProp)
    if status == "PreDamage" then
        if ent.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
            self.MeleeAttackDamage = ent:Health() + 10
        elseif ent:IsPlayer() then
            self.MeleeAttackDamage = ent:Health() + ent:Armor() + 10
        else
            self.MeleeAttackDamage = 200
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" && GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 0 then
        dmginfo:ScaleDamage(0.2)
    end
    if status == "PreDamage" && GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 1 then
        if dmginfo:IsDamageType(DMG_SHOCK) or dmginfo:IsExplosionDamage() then
            dmginfo:ScaleDamage(0.2)
        else
            dmginfo:SetDamage(0)
        end
    end
    if status == "Init" && !dmginfo:IsDamageType(DMG_SHOCK) && !dmginfo:IsExplosionDamage() && GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 1 then
        self:SpawnBloodParticles(dmginfo, hitgroup)
        self:SpawnBloodDecals(dmginfo, hitgroup)
        self:PlaySoundSystem("Impact", self.SoundTbl_Impact)
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