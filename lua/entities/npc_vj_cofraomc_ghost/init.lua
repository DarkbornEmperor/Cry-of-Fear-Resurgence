include("entities/npc_vj_cofraom_ghost/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/ghost.mdl"
ENT.StartHealth = 300
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
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

local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp) return end
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
            myPos + myRight * math_rand(150,500) + myUp * -200,
            myPos + myRight * math_rand(150,500) + myUp * -200 + myForward * -math_rand(150,500),
            myPos + myRight * math_rand(150,500) + myUp * -200 + myForward * math_rand(150,500),
            myPos + myRight * math_rand(1,150) + myUp * 200 + myForward * math_rand(-100,100),
        }
        for i = 1, 4 do
            local randTime = math_rand(0,0.6)
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
            myPos + myRight * -math_rand(150,500) + myUp * -200,
            myPos + myRight * -math_rand(150,500) + myUp * -200 + myForward * -math_rand(150,500),
            myPos + myRight * -math_rand(150,500) + myUp * -200 + myForward * math_rand(150,500),
            myPos + myRight * -math_rand(1,150) + myUp * 200 + myForward * math_rand(-100,100),
        }
        for i = 1, 4 do
            local randTime = math_rand(0,0.6)
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

        VJ.ApplyRadiusDamage(self, self, hitPos, 30, self.GhostDamage, DMG_SHOCK, true, false, {Force = 90})

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
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/