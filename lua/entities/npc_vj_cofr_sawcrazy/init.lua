AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sawcrazy.mdl"
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.CanTurnWhileMoving = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 75
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra =
    "vj_cofr/cof/sawrunner/chainsaw_attack_hit.wav"

ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/sawrunner/chainsaw_attack_miss.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Sawcrazy_NextRadiusDamageT = 0

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sawcrazy_Init()
    self.SoundTbl_Breath =
        "vj_cofr/cof/sawcrazy/dblsawloop.wav"

    self.SoundTbl_Alert =
        "vj_cofr/cof/sawcrazy/random2.wav"

    self.SoundTbl_BeforeMeleeAttack =
        "vj_cofr/cof/sawcrazy/random1.wav"

    self.SoundTbl_Death =
        "vj_cofr/cof/sawcrazy/death.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if GetConVar("VJ_COFR_Sawcrazy_RadiusDamage"):GetInt() == 1 then
        self.VJ_ID_Danger = true
    end
    self:SetCollisionBounds(Vector(15, 15, 85), Vector(-15, -15, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Sawcrazy_Init()
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
function ENT:OnThinkActive()
    if self.Dead or GetConVar("VJ_COFR_Sawcrazy_RadiusDamage"):GetInt() == 0 then return end
    if self.Sawcrazy_NextRadiusDamageT < CurTime() then
        for _, v in ipairs(ents.FindInSphere(self:GetPos(), 60)) do
            if v != self && IsValid(v) && self:Visible(v) && (v.VJ_ID_Living or v.VJ_ID_Destructible or v.VJ_ID_Attackable) then
                if v.IsVJBaseSNPC_Human then v:TakeDamage(v:Health(), self, self) elseif v:IsPlayer() then v:TakeDamage(v:Health() + v:Armor(), self, self) else v:TakeDamage(200, self, self) end
                self.Sawcrazy_NextRadiusDamageT = CurTime() + 0.5
            end
        end
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
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.2)
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