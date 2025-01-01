include("entities/npc_vj_cofraom_ghost/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/islave.mdl"
ENT.StartHealth = 300
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.NextMeleeAttackTime = 0
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.MeleeAttackBleedEnemy = false
ENT.SlowPlayerOnMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_zapattack1"
ENT.RangeDistance = 1020
ENT.RangeToMeleeDistance = 100
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 3
ENT.DisableDefaultRangeAttackCode = true
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_Type = "OnlyRange"
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_BeforeRangeAttack = {
"vj_cofr/aom/ghost/classic/zap4.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/aom/ghost/classic/hw_shoot1.wav"
}

ENT.RangeAttackPitch = VJ.SET(130, 160)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit() return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 65), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Ghost_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "attack" then
        self:MeleeAttackCode()
    elseif key == "attack_range" then
        self:RangeAttackCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
        /*local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        effectdata:SetScale(10)
        util.Effect("watersplash",effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Ghost_DoElecEffect(sp, hp, hn, a, t)
    local elec = EffectData()
    elec:SetStart(sp)
    elec:SetOrigin(hp)
    elec:SetNormal(hn)
    elec:SetEntity(self)
    elec:SetAttachment(a)
    elec:SetScale(2.2 - t)
    util.Effect("VJ_COFR_Electric_Charge", elec)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_AfterStartTimer()
    if self.CurrentBeforeRangeAttackSound then self.CurrentBeforeRangeAttackSound:ChangePitch(90 + 90, 1.2) end
    local myPos = self:GetPos()
    -- Tsakh --------------------------
    local tsakhSpawn = myPos + self:GetUp()*45 + self:GetRight()*20
    local tsakhLocations = {
        myPos + self:GetRight()*math.Rand(150, 500) + self:GetUp()*-200,
        myPos + self:GetRight()*math.Rand(150, 500) + self:GetUp()*-200 + self:GetForward()*-math.Rand(150, 500),
        myPos + self:GetRight()*math.Rand(150, 500) + self:GetUp()*-200 + self:GetForward()*math.Rand(150, 500),
        myPos + self:GetRight()*math.Rand(1, 150) + self:GetUp()*200 + self:GetForward()*math.Rand(-100, 100),
    }
    for i = 1, 4 do
        local randt = math.Rand(0, 0.6)
        timer.Simple(randt,function()
            if IsValid(self) then
                local tr = util.TraceLine({
                    start = tsakhSpawn,
                    endpos = tsakhLocations[i],
                    filter = self
                })
                if tr.Hit == true then self:Ghost_DoElecEffect(tr.StartPos, tr.HitPos, tr.HitNormal, 1, randt) end
            end
        end)
    end
    -- Ach --------------------------
    local achSpawn = myPos + self:GetUp()*45 + self:GetRight()*-20
    local achLocations = {
        myPos + self:GetRight()*-math.Rand(150, 500) + self:GetUp()*-200,
        myPos + self:GetRight()*-math.Rand(150, 500) + self:GetUp()*-200 + self:GetForward()*-math.Rand(150, 500),
        myPos + self:GetRight()*-math.Rand(150, 500) + self:GetUp()*-200 + self:GetForward()*math.Rand(150, 500),
        myPos + self:GetRight()*-math.Rand(1, 150) + self:GetUp()*200 + self:GetForward()*math.Rand(-100, 100),
    }
    for i = 1, 4 do
        local randt = math.Rand(0, 0.6)
        timer.Simple(randt,function()
            if IsValid(self) then
                local tr = util.TraceLine({
                    start = achSpawn,
                    endpos = achLocations[i],
                    filter = self
                })
                if tr.Hit == true then self:Ghost_DoElecEffect(tr.StartPos, tr.HitPos, tr.HitNormal, 1, randt) end
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
    local startpos = self:GetPos() + self:GetUp()*45 + self:GetForward()*40
    local tr = util.TraceLine({
        start = startpos,
        endpos = self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(),
        filter = self
    })
    local hitpos = tr.HitPos

    local elec = EffectData()
    elec:SetStart(startpos)
    elec:SetOrigin(hitpos)
    elec:SetEntity(self)
    elec:SetAttachment(1)
    util.Effect("VJ_COFR_Electric",elec)

    elec = EffectData()
    elec:SetStart(startpos)
    elec:SetOrigin(hitpos)
    elec:SetEntity(self)
    elec:SetAttachment(2)
    util.Effect("VJ_COFR_Electric",elec)

    VJ.ApplyRadiusDamage(self, self, hitpos, 30, 20, DMG_SHOCK, true, false, {Force=90})

    VJ.EmitSound(self, "vj_cofr/aom/ghost/classic/electro4.wav", self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = ACT_DIE_HEADSHOT
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
    end
end
    if status == "Initial" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/