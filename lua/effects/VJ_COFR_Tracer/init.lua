/*--------------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
-- Based off of the GMod lasertracer
EFFECT.MainMat = Material("vj_cofr/tracer_middle")

local math_random = math.random
local math_rand = math.Rand
local math_min = math.min
local math_clamp = math.Clamp
local math_sin = math.sin
local math_pi = math.pi

function EFFECT:Init(data)
    self.StartPos = data:GetStart()
    self.EndPos = data:GetOrigin()
    local ent = data:GetEntity()
    local att = data:GetAttachment()
    local locPly = LocalPlayer()

    if (IsValid( ent ) && att > 0) then
        if (ent.Owner == locPly && locPly:GetViewModel() != locPly) then ent = ent.Owner:GetViewModel() end
        att = ent:GetAttachment(att)
        if (att) then
            self.StartPos = att.Pos
        end
    end

    self.Dir = self.EndPos - self.StartPos
    self:SetRenderBoundsWS(self.StartPos, self.EndPos)
    self.TracerTime = math_min(1, self.StartPos:Distance(self.EndPos) / 10000) -- Calculate death time
    self.Length = 0.1

    -- Die when it reaches its target
    self.DieTime = CurTime() + self.TracerTime
end
---------------------------------------------------------------------------------------------------------------------------------------------
local metalMat = {[MAT_VENT] = true, [MAT_METAL] = true, [MAT_GRATE] = true, [MAT_GLASS] = true, [MAT_COMPUTER] = true}
local vecDef = Vector(0, 0, 0)
--
function EFFECT:Think()
    -- When it hits
    if CurTime() > self.DieTime then
        local tr = util.TraceLine({
            start = self.StartPos,
            endpos = self.EndPos
        })
        if tr.Hit && metalMat[tr.MatType] then
            sound.Play("vj_cofr/fx/ric" .. math_random(1, 5) .. ".wav", self.EndPos, 80, 100)
            local Emitter = ParticleEmitter(self.EndPos)
            if GetConVar("VJ_COFR_SparkFX"):GetInt() == 1 then
                for _ = 1, math_random(5,15) do
                    local particle = Emitter:Add("vj_cofr/tracer_middle", self.EndPos)
                    particle:SetVelocity(VectorRand() * math_rand(100,350))
                    particle:SetDieTime(math_rand(0.1,1))
                    particle:SetStartAlpha(200)
                    particle:SetEndAlpha(0)
                    particle:SetStartSize(1)
                    particle:SetEndSize(3)
                    particle:SetRoll(math_random(0,360))
                    particle:SetGravity(Vector(math_random(-300,300), math_random(-300,300), math_random(-300,-700)))
                    particle:SetCollide(true)
                    particle:SetBounce(0.9)
                    particle:SetAirResistance(120)
                    particle:SetStartLength(0)
                    particle:SetEndLength(0.1)
                    particle:SetVelocityScale(true)
                    particle:SetCollide(true)
                    particle:SetColor(255, 231, 166)
                end
            end
            local fx = Emitter:Add("vj_cofr/rico1", self.EndPos)
            fx:SetVelocity(vecDef)
            fx:SetAirResistance(160)
            fx:SetDieTime(0.15)
            fx:SetStartAlpha(255)
            fx:SetEndAlpha(0)
            fx:SetStartSize(math_random(4,6))
            fx:SetEndSize(5)
            fx:SetRoll(math_rand(180,360))
            fx:SetRollDelta(math_rand(-1,1))
            fx:SetColor(255, 255, 255)
        end
        return false
    end
    return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBeam = Color(255, 255, 255, 25)
--
function EFFECT:Render()
    local fDelta = (self.DieTime - CurTime()) / self.TracerTime
    fDelta = math_clamp(fDelta, 0, 1) ^ 0.5
    render.SetMaterial(self.MainMat)
    local sinWave = math_sin(fDelta * math_pi)
    render.DrawBeam(self.EndPos - self.Dir * (fDelta - sinWave * self.Length), self.EndPos - self.Dir * (fDelta + sinWave * self.Length), 1 + sinWave * 3, 1, 0, colorBeam)
end
/*--------------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
