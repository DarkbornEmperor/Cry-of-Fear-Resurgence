/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Hooked Head"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Projectiles"

ENT.VJ_ID_Danger = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofr_carcasshead", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_cofr/cof/hookedhead.mdl"
ENT.DoesDirectDamage = true
ENT.DirectDamageType = DMG_SLASH
ENT.SoundTbl_OnCollide = "vj_cofr/cof/carcass/rb_headhit.wav"
ENT.CollisionDecal = "VJ_COFR_Blood_Red_Large"
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
ENT.Head_ChaseSpeed = 500

local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:InitPhys(phys)
    phys:Wake()
    phys:SetMass(1)
    phys:SetBuoyancyRatio(0)
    phys:EnableDrag(false)
    phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.DirectDamage = 4
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.DirectDamage = 6
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.DirectDamage = 10
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.DirectDamage = 15
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self.Scale = math_rand(0.5,1.15)
    VJ.EmitSound(self, "vj_cofr/cof/carcass/rb_headshoot.wav", 75, 100)
    timer.Simple(10, function() if IsValid(self) then self:Remove() VJ.EmitSound(self, "vj_cofr/cof/carcass/rb_headdeath.wav", 75, 100) self:OnDestroy() end end)
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
            phys:SetVelocity(VJ.CalculateTrajectory(self, trackedEnt, "Line", self:GetPos(), self.Track_Position + VectorRand(-50,50), self.Head_ChaseSpeed))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
        end
        -- Not tracking, go in straight line
    else
        if IsValid(phys) then
            phys:SetVelocity(VJ.CalculateTrajectory(self, NULL, "Line", self:GetPos(), self.Track_Position + VectorRand(-80,80), self.Head_ChaseSpeed / 2))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo)
    VJ.EmitSound(self, "vj_cofr/cof/carcass/rb_headdeath.wav", 75, 100)
    self:OnDestroy()
    self:Remove()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDestroy(data, phys)
    local spr = ents.Create("env_sprite")
    spr:SetKeyValue("model", "vj_cofr/sprites/spitsplat.vmt")
    spr:SetKeyValue("rendercolor", "130 19 10")
    spr:SetKeyValue("GlowProxySize", "1.0")
    spr:SetKeyValue("HDRColorScale", "1.0")
    spr:SetKeyValue("renderfx", "0")
    spr:SetKeyValue("rendermode", "2")
    spr:SetKeyValue("renderamt", "255")
    spr:SetKeyValue("disablereceiveshadows", "0")
    spr:SetKeyValue("mindxlevel", "0")
    spr:SetKeyValue("maxdxlevel", "0")
    spr:SetKeyValue("framerate", "15.0")
    spr:SetKeyValue("spawnflags", "0")
    spr:SetKeyValue("scale", tostring(self.Scale * 0.3))
    spr:SetPos(self:GetPos())
    spr:Spawn()
    spr:Fire("Kill", "", 0.3)
    timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
end