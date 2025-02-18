/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Joe Biden Box"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

ENT.VJ_ID_Danger = true

ENT.AutomaticFrameAdvance = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofr_biden", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_cofr/cof/biden_box.mdl"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 15
ENT.DirectDamageType = DMG_SLASH
ENT.SoundTbl_OnCollide = "vj_cofr/cof/roofboss/milkme.wav"
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
ENT.Head_ChaseSpeed = 500
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:SetMass(1)
    phys:SetBuoyancyRatio(0)
    phys:EnableDrag(false)
    phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:ResetSequence("idle")
    timer.Simple(10, function() if IsValid(self) then self:Remove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    local phys = self:GetPhysicsObject()
    local trackedEnt = self.Track_Enemy
    -- Homing Behavior
    if IsValid(trackedEnt) && trackedEnt:Alive() then
        local pos = trackedEnt:GetPos() + trackedEnt:OBBCenter()
        if self:VisibleVec(pos) or self.Track_Position == defVec then
            self.Track_Position = pos
        end
        if IsValid(phys) then
            phys:SetVelocity(VJ.CalculateTrajectory(self, trackedEnt, "Line", self:GetPos(), self.Track_Position + VectorRand(-50, 50), self.Head_ChaseSpeed))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
        end
    -- Not tracking, go in straight line
    else
        if IsValid(phys) then
            phys:SetVelocity(VJ.CalculateTrajectory(self, NULL, "Line", self:GetPos(), self.Track_Position + VectorRand(-80, 80), self.Head_ChaseSpeed / 2))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo)
    self:Remove()
end