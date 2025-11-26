AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/drowned.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14
ENT.MeleeAttackDistance = 25
ENT.MeleeAttackDamageDistance = 50
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_point"
ENT.RangeAttackMaxDistance = 500
ENT.RangeAttackMinDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 15
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 500
ENT.LimitChaseDistance_Min = 200
ENT.DamageResponse = "OnlySearch"
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
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/drowned/knife_hitbody1.wav",
    "vj_cofr/cof/drowned/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/drowned/knife_swing.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Drowned_Suicide =
    "vj_cofr/cof/drowned/suicide_attempt.wav"

-- Custom
ENT.Drowned_Baby = false
ENT.Drowned_DamageDistance = 500
ENT.Drowned_NextEnemyDamageT = 0

util.AddNetworkString("VJ_COFR_Drowned_Damage")

local nwName = "VJ_COFR_Drowned_Controller"
util.AddNetworkString(nwName)

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cof/drowned/lady_alert10.wav",
        "vj_cofr/cof/drowned/lady_alert20.wav",
        "vj_cofr/cof/drowned/lady_alert30.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/cof/drowned/lady_attack1.wav",
        "vj_cofr/cof/drowned/lady_attack2.wav"
    }
    self.SoundTbl_BeforeRangeAttack = {
        "vj_cofr/cof/drowned/lady_attack1.wav",
        "vj_cofr/cof/drowned/lady_attack2.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/cof/drowned/lady_pain1.wav",
        "vj_cofr/cof/drowned/lady_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/cof/drowned/lady_pain1.wav",
        "vj_cofr/cof/drowned/lady_pain2.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if math_random(1,2) == 1 then
        self.LimitChaseDistance = false
    end
    self:SetCollisionBounds(Vector(13, 13, 78), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Drowned_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "range" then
        self:ExecuteRangeAttack()
    elseif key == "baby_appear" then
        if self:GetClass() == "npc_vj_cofrce_drowned" then VJ.EmitSound(self, "vj_cofr/cofce/drowned/baby_burst.wav", 75, 100) else VJ.EmitSound(self, "vj_cofr/cof/drowned/baby_burst.wav", 75, 100) end
        ParticleEffect("vj_cofr_blood_red_large", self:GetAttachment(self:LookupAttachment("baby")).Pos, self:GetAngles())
        self:SetBodygroup(0,1)
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop".. math_random(3,4) .. ".wav", 75, 100)
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
    ply:ChatPrint("JUMP: Baby Burst")
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
function ENT:Drowned_Damage()
    net.Start("VJ_COFR_Drowned_Damage")
    net.WriteEntity(self)
    net.WriteEntity(self:GetEnemy())
    net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local cont = self.VJ_TheController
        if IsValid(cont) then
            for _,v in pairs(ents.FindInSphere(enemy:GetPos(), 10)) do
                if v != self && v != enemy && v.VJ_ID_Living then
                    enemy = v
                    break
                end
            end
        end
        if self.EnemyData.Distance > self.Drowned_DamageDistance or !IsValid(enemy) or !self:Visible(enemy) or enemy.IsVJBaseBullseye then return true end
        if !enemy.Drowned_SuicideAttempt && CurTime() > self.Drowned_NextEnemyDamageT then
            enemy.Drowned_SuicideAttempt = true
            timer.Create("VJ_COFR_Survive" .. enemy:EntIndex(), SoundDuration("vj_cofr/cof/drowned/suicide_attempt.wav"), 1, function()
                if IsValid(enemy) && (enemy:IsPlayer() && enemy:Alive()) or (enemy.VJ_ID_Living && enemy:Health() >= 0) && enemy.Drowned_SuicideAttempt then
                    enemy.Drowned_SuicideAttempt = false
                    if enemy:IsPlayer() then
                        net.Start("VJ_COFR_Survive_ScreenEffect")
                        net.WriteEntity(enemy)
                        net.Send(enemy)
                    end
                end
            end)
            if self.HasSounds then self.Drowned_Suicide = VJ.CreateSound(enemy, self.SoundTbl_Drowned_Suicide, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch)) end
            if enemy.Human_Type == 1 then enemy:PlaySoundSystem("Pain", enemy.SoundTbl_SuicidePanic) end
            if enemy:IsPlayer() then
                net.Start("VJ_COFR_Drowned_ScreenEffect")
                net.WriteEntity(enemy)
                net.Send(enemy)
            end
            hook.Add("Think", "VJ_COFR_SuicideCheck" .. enemy:EntIndex(), function()
                if (enemy:IsPlayer() && !enemy:Alive()) or (enemy.VJ_ID_Living && enemy:Health() <= 0) or enemy.Dead or !IsValid(enemy) or self.Dead or !IsValid(self) && enemy.Drowned_SuicideAttempt then hook.Remove("Think", "VJ_COFR_SuicideCheck" .. enemy:EntIndex()) enemy.Drowned_SuicideAttempt = false timer.Remove("VJ_COFR_Suicide" .. enemy:EntIndex()) timer.Remove("VJ_COFR_Survive" .. enemy:EntIndex()) self.Drowned_NextEnemyDamageT = CurTime() + 0 end
            end)
            timer.Create("VJ_COFR_Suicide" .. enemy:EntIndex(), SoundDuration("vj_cofr/cof/drowned/suicide_attempt.wav"), 1, function()
                if IsValid(self) && IsValid(enemy) && enemy:Visible(self) && !self.Dead then
                    if self.HasSounds then VJ.EmitSound(enemy, "vj_cofr/fx/gibbed.wav", 75, 100) end
                    if enemy.IsVJBaseSNPC_Human then enemy:TakeDamage(enemy:Health(), self, self) elseif enemy:IsPlayer() then enemy:TakeDamage(enemy:Health() + enemy:Armor(), self, self) else enemy:TakeDamage(200, self, self) end
                    self:Drowned_Damage()
                    self.Drowned_NextEnemyDamageT = CurTime() + 5
                end
            end)
        end
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    if !IsValid(self:GetEnemy()) or self.Dead or self.Drowned_Baby then return end
    if !self.Drowned_Baby && self.EnemyData.Distance < 70 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self.Drowned_Baby = true
        self.HasMeleeAttack = true
        self:PlayAnim(ACT_SIGNAL2,true,false,false)
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
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Drowned_Suicide)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/