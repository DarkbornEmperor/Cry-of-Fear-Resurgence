include("entities/npc_vj_cofraom_hellhound/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/houndeye.mdl"
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false //2.35
ENT.NextMeleeAttackTime = 2
-- Custom
ENT.Hellhound_BlinkingT = 0
ENT.Hellhound_NextSleepT = 0
ENT.Hellhound_Sleeping = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
     self.Hellhound_NextSleepT = CurTime() + math.Rand(0,15)
     self:SetCollisionBounds(Vector(20, 20, 40), Vector(-20, -20, 0))
     self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
     self:Hellhound_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defIdle = {ACT_IDLE,ACT_IDLE,ACT_IDLE,ACT_IDLE,ACT_IDLE_PACKAGE}
--
function ENT:TranslateActivity(act)
 if act == ACT_IDLE then
 -- Sleeping
 if self.Hellhound_Sleeping then
    return ACT_CROUCHIDLE
 -- Barking
 elseif IsValid(self:GetEnemy()) && !self.VJ_IsBeingControlled then
    return ACT_IDLE_ANGRY
end
 -- Default idle
    return self:ResolveAnimation(defIdle)
 -- Limp Walking
 elseif act == ACT_WALK && (self:GetMaxHealth() * 0.35) > self:Health() then
    return ACT_WALK_HURT
end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    -- Blinking
    if !self.Dead && CurTime() > self.Hellhound_BlinkingT && !self.Hellhound_Sleeping then
        self:SetSkin(1)
        timer.Simple(0.1, function() if IsValid(self) then self:SetSkin(2) end end)
        timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(1) end end)
        timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(0) end end)
        self.Hellhound_BlinkingT = CurTime() + math.Rand(2,3.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    if self.VJ_IsBeingControlled then return end
    -- Sleep system
    if !self.Alerted && !IsValid(self:GetEnemy()) && !self:IsMoving() && CurTime() > self.Hellhound_NextSleepT && !self.Hellhound_Sleeping && !self:IsBusy() then
        local sleepTime = math.Rand(15,30) -- How long it should sleep
        self.Hellhound_Sleeping = true
        self:PlayAnim(ACT_CROUCH, true, false, false)
        self:SetState(VJ_STATE_ONLY_ANIMATION, sleepTime)
        timer.Simple(7, function() if IsValid(self) && self.Hellhound_Sleeping == true then self:SetSkin(2) end end) -- Close eyes
        timer.Simple(sleepTime, function() -- Reset after sleepTime expires
            if IsValid(self) && self.Hellhound_Sleeping == true then
                self.Hellhound_Sleeping = false
                self:PlayAnim(ACT_STAND, true, false, false)
                self.Hellhound_NextSleepT = CurTime() + math.Rand(15, 45)
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local alertAnims = {"vjseq_madidle1","vjseq_madidle2","vjseq_madidle3"}
--
function ENT:OnAlert(ent)
    if self.Hellhound_Sleeping then -- Wake up if sleeping and play a special alert animation
        if self:GetState() == VJ_STATE_ONLY_ANIMATION then self:SetState() end
        self.Hellhound_Sleeping = false
        self:PlayAnim(ACT_HOP, true, false, false)
        self.Hellhound_NextSleepT = CurTime() + 20
    elseif math.random(1,2) == 1 then -- Random alert animation
        self:PlayAnim(alertAnims, true, false, true)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnResetEnemy()
    self.Hellhound_NextSleepT = CurTime() + math.Rand(15,45)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetSkin(2)
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