AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/stranger.mdl"
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.CanTurnWhileMoving = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackMaxDistance = 500
ENT.RangeAttackMinDistance = 0
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.NextRangeAttackTime = 0.5
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 300
ENT.LimitChaseDistance_Min = 0
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
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

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Stranger_HeartBeat =
    "vj_cofr/cof/stranger/st_hearbeat.wav"

util.AddNetworkString("VJ_COFR_Stranger_Damage")

local nwName = "VJ_COFR_Stranger_Controller"
util.AddNetworkString(nwName)

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 50
        self.StrangerDamage = 1
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 70
        self.StrangerDamage = 2
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.StartHealth = 90
        self.StrangerDamage = 5
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.StartHealth = 150
        self.StrangerDamage = 10
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_Init()
    self.SoundTbl_Breath =
        "vj_cofr/cof/stranger/st_voiceloop.wav"

    self.SoundTbl_Death =
        "vj_cofr/cof/stranger/st_death.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if math_random(1,2) == 1 then
        self.LimitChaseDistance = false
    end
    self:Stranger_Init()
    self:SetCollisionBounds(Vector(13, 13, 82), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "flicker_on" then
        self:SetRenderFX(kRenderFxFlickerFast)
        self:SetRenderMode(RENDERMODE_NORMAL)
        self:DrawShadow(False)
    elseif key == "flicker_off" then
        self:SetRenderFX(kRenderFxNone)
        self:SetRenderMode(RENDERMODE_NORMAL)
        self:DrawShadow(true)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
    end
    local ent, class, contEnt = self, self:GetClass(), self.VJ_TheControllerEntity
    net.Start(nwName)
        net.WriteBool(false)
        net.WriteEntity(ent)
        net.WriteString(class)
        net.WriteEntity(ply)
        net.WriteEntity(contEnt)
    net.Send(ply)
    function self.VJ_TheControllerEntity:OnStopControlling()
        net.Start(nwName)
            net.WriteBool(true)
            net.WriteEntity(ent)
            net.WriteString(class)
            net.WriteEntity(ply)
            net.WriteEntity(contEnt)
        net.Send(ply)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_Damage()
    net.Start("VJ_COFR_Stranger_Damage")
        net.WriteEntity(self)
        net.WriteEntity(self.EnemyData.Target)
    net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local cont = self.VJ_TheController
        if IsValid(cont) then
            for _, v in pairs(ents.FindInSphere(enemy:GetPos(), 10)) do
                if v != self && v != enemy && v.VJ_ID_Living then
                        enemy = v
                    break
                end
            end
        end
        local eneData = self.EnemyData
        if eneData.Distance > self.RangeAttackMaxDistance or !eneData.Visible or self:CheckRelationship(enemy) == D_LI or enemy.IsVJBaseBullseye then return true end
        if self.HasSounds then self.Stranger_HeartBeat = VJ.CreateSound(enemy, self.SoundTbl_Stranger_HeartBeat, self:GetSoundPitch(self.RangeAttackPitch)) end
        enemy:TakeDamage(self.StrangerDamage, self, self)
        VJ.DamageSpecialEnts(self, enemy, dmginfo)
        self:Stranger_Damage()
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    self:SetNW2Entity("Enemy", self.EnemyData.Target)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    local eneData = self.EnemyData
    local ene = eneData.Target
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    elseif status == "DeathAnim" then
        self.DeathAnimationTime = math_rand(0.75,1.25)
    elseif status == "Finish" && IsValid(ene) && ene:IsPlayer() && eneData.Distance < self.RangeAttackMaxDistance && eneData.Visible then
        net.Start("VJ_COFR_Stranger_ScreenEffect")
            net.WriteEntity(ene)
        net.Send(ene)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    local watLevel = self:WaterLevel()
    if watLevel > 0 && watLevel < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end