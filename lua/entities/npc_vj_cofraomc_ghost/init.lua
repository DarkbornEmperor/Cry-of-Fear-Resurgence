include("entities/npc_vj_cofraom_ghost/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/ghost.mdl"
ENT.StartHealth = 300
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackBleedEnemy = false
ENT.MeleeAttackPlayerSpeed = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_zapattack1"
ENT.RangeAttackMaxDistance = 1020
ENT.RangeAttackMinDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 3
ENT.LimitChaseDistance = "OnlyRange"
ENT.LimitChaseDistance_Max = "UseRangeDistance"
ENT.LimitChaseDistance_Min = "UseRangeDistance"
ENT.RangeAttackPitch = VJ.SET(130, 160)
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeRangeAttack =
    "vj_cofr/aom/ghost/classic/zap4.wav"

ENT.SoundTbl_RangeAttack =
    "vj_cofr/aom/ghost/classic/hw_shoot1.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 65), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Ghost_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "range" then
        self:ExecuteRangeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math.random(3,4) .. ".wav", 75, 100)
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
function ENT:OnMeleeAttackExecute(status,ent,isProp) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Ghost_DoElecEffect(startPos, hitPos, hitNormal, attachment, timeDecrease)
    local elec = EffectData()
    elec:SetStart(startPos)
    elec:SetOrigin(hitPos)
    elec:SetNormal(hitNormal)
    elec:SetEntity(self)
    elec:SetAttachment(attachment)
    elec:SetScale(2.2 - timeDecrease)
    util.Effect("VJ_COFR_Electric_Charge", elec)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status, enemy)
    if status == "PostInit" then
        -- Slowly fade the pitch to be higher like the original game
        if self.CurrentSpeechSound then
            self.CurrentSpeechSound:ChangePitch(90 + 90, 1.2)
        end

        local myPos = self:GetPos()
        local myForward = self:GetForward()
        local myRight = self:GetRight()
        local myUp = self:GetUp()

        -- Tsakh --------------------------
        local tsakhSpawn = myPos + myUp * 45 + myRight * 20
        local tsakhLocations = {
            myPos + myRight * math.Rand(150,500) + myUp * -200,
            myPos + myRight * math.Rand(150,500) + myUp * -200 + myForward*-math.Rand(150,500),
            myPos + myRight * math.Rand(150,500) + myUp * -200 + myForward*math.Rand(150,500),
            myPos + myRight * math.Rand(1,150) + myUp * 200 + myForward*math.Rand(-100,100),
        }
        for i = 1, 4 do
            local randTime = math.Rand(0,0.6)
            timer.Simple(randTime, function()
                if IsValid(self) then
                    local tr = util.TraceLine({
                        start = tsakhSpawn,
                        endpos = tsakhLocations[i],
                        filter = self
                    })
                    if tr.Hit then self:Ghost_DoElecEffect(tr.StartPos, tr.HitPos, tr.HitNormal, 1, randTime) end
                end
            end)
        end
        -- Ach --------------------------
        local achSpawn = myPos + myUp * 45 + myRight * -20
        local achLocations = {
            myPos + myRight * -math.Rand(150,500) + myUp * -200,
            myPos + myRight * -math.Rand(150,500) + myUp * -200 + myForward*-math.Rand(150,500),
            myPos + myRight * -math.Rand(150,500) + myUp * -200 + myForward*math.Rand(150,500),
            myPos + myRight * -math.Rand(1,150) + myUp * 200 + myForward*math.Rand(-100,100),
        }
        for i = 1, 4 do
            local randTime = math.Rand(0,0.6)
            timer.Simple(randTime, function()
                if IsValid(self) then
                    local tr = util.TraceLine({
                        start = achSpawn,
                        endpos = achLocations[i],
                        filter = self
                    })
                    if tr.Hit then self:Ghost_DoElecEffect(tr.StartPos, tr.HitPos, tr.HitNormal, 2, randTime) end
                end
            end)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local startPos = self:GetPos() + self:GetUp() * 45 + self:GetForward() * 40
        local tr = util.TraceLine({
            start = startPos,
            endpos = self:GetAimPosition(enemy, startPos, 0),
            filter = self
        })
        local hitPos = tr.HitPos

        -- Fire 2 electric beams at the enemy
        local elec = EffectData()
        elec:SetStart(startPos)
        elec:SetOrigin(hitPos)
        elec:SetEntity(self)
        elec:SetAttachment(1)
        util.Effect("VJ_COFR_Electric", elec)
        elec:SetAttachment(2)
        util.Effect("VJ_COFR_Electric", elec)

        VJ.ApplyRadiusDamage(self, self, hitPos, 30, 20, DMG_SHOCK, true, false, {Force = 90})

        VJ.EmitSound(self, "vj_cofr/aom/ghost/classic/electro4.wav", self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch))
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "DeathAnim" then
        if hitgroup == HITGROUP_HEAD then
            self.AnimTbl_Death = ACT_DIE_HEADSHOT
        else
            self.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIESIMPLE}
        end
    end
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
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math.random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/