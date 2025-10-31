AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/stranger.mdl"
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackMaxDistance = 500
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.NextRangeAttackTime = 0.5
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 300
ENT.LimitChaseDistance_Min = 1
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

-- Custom
ENT.Stranger_DamageDistance = 500
ENT.Stranger_NextEnemyDamageT = 0

util.AddNetworkString("VJ_COFR_Stranger_Damage")

local nwName = "VJ_COFR_Stranger_Controller"
util.AddNetworkString(nwName)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_Init()
    self.SoundTbl_Breath =
    "vj_cofr/cof/stranger/st_voiceloop.wav"

    self.SoundTbl_Death =
    "vj_cofr/cof/stranger/st_death.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 if math.random(1,3) == 1 then
    self.LimitChaseDistance = false
end
    self:SetCollisionBounds(Vector(13, 13, 82), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Stranger_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "flicker_on" then
        self:SetRenderFX(kRenderFxFlickerFast)
        self:SetRenderMode(RENDERMODE_NORMAL)
    elseif key == "flicker_off" then
        self:SetRenderFX(kRenderFxNone)
        self:SetRenderMode(RENDERMODE_NORMAL)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
    local opt1, opt2, opt3 = self, self:GetClass(), self.VJ_TheControllerEntity
        net.Start(nwName)
        net.WriteBool(false)
        net.WriteEntity(opt1)
        net.WriteString(opt2)
        net.WriteEntity(ply)
        net.WriteEntity(opt3)
        net.Send(ply)
    function self.VJ_TheControllerEntity:OnStopControlling()
        net.Start(nwName)
        net.WriteBool(true)
        net.WriteEntity(opt1)
        net.WriteString(opt2)
        net.WriteEntity(ply)
        net.WriteEntity(opt3)
        net.Send(ply)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_Damage()
    net.Start("VJ_COFR_Stranger_Damage")
    net.WriteEntity(self)
    net.WriteEntity(self:GetEnemy())
    net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status,enemy,projectile)
    if status == "Init" then
    local ent = self:GetEnemy()
    local cont = self.VJ_TheController
    if IsValid(cont) then
        for _,v in pairs(ents.FindInSphere(ent:GetPos(),10)) do
            if v != self && v != ent && v.VJ_ID_Living then
                ent = v
            break
        end
    end
end
 if self.EnemyData.Distance > self.Stranger_DamageDistance or !IsValid(ent) or !self:Visible(ent) then return true end
 if CurTime() > self.Stranger_NextEnemyDamageT then
 if self.HasSounds then self.Stranger_HeartBeat = VJ.CreateSound(ent, self.SoundTbl_Stranger_HeartBeat, self:GetSoundPitch(self.RangeAttackPitch)) end
    ent:TakeDamage(10,self,self)
    self:Stranger_Damage()
    self.Stranger_NextEnemyDamageT = CurTime() + self.NextRangeAttackTime
end
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    self:SetNW2Entity("Enemy",self:GetEnemy())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Finish" && IsValid(self:GetEnemy()) && self:GetEnemy():IsPlayer() && self:GetPos():Distance(self:GetEnemy():GetPos()) < self.Stranger_DamageDistance then
    net.Start("VJ_COFR_Stranger_ScreenEffect")
    net.WriteEntity(self:GetEnemy())
    net.Send(self:GetEnemy())
    VJ.STOPSOUND(self.Stranger_HeartBeat)
end
    if status == "Init" then
        self.DeathAnimationTime = math.Rand(0.75,1.25)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/