/*--------------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Soul"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Projectiles"

ENT.VJ_ID_Danger = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofraom_soul", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_base/projectiles/spit_acid_small.mdl"
ENT.DoesDirectDamage = true
ENT.DirectDamageType = DMG_SHOCK
ENT.HasOnCollideSounds = false
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.DirectDamage = 3
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.DirectDamage = 4
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 or GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Difficult & Nightmare
        self.DirectDamage = 30
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true)
    local soulSpr = ents.Create("env_sprite")
    soulSpr:SetKeyValue("model", "vj_cofr/sprites/soul_range.vmt")
    soulSpr:SetKeyValue("rendercolor", "255 255 255")
    soulSpr:SetKeyValue("GlowProxySize", "1.0")
    soulSpr:SetKeyValue("HDRColorScale", "1.0")
    soulSpr:SetKeyValue("renderfx", "14")
    soulSpr:SetKeyValue("rendermode", "3")
    soulSpr:SetKeyValue("renderamt", "255")
    soulSpr:SetKeyValue("disablereceiveshadows", "0")
    soulSpr:SetKeyValue("mindxlevel", "0")
    soulSpr:SetKeyValue("maxdxlevel", "0")
    soulSpr:SetKeyValue("framerate", "15.0")
    soulSpr:SetKeyValue("spawnflags", "0")
    soulSpr:SetKeyValue("scale", "1")
    soulSpr:SetPos(self:GetPos())
    soulSpr:Spawn()
    soulSpr:SetParent(self)
    self.GlowSprite = soulSpr
    self:DeleteOnRemove(soulSpr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    local trackedEnt = self.Track_Enemy
    -- Homing Behavior
    if IsValid(trackedEnt) then
            self.DirectDamage = 25
        if IsValid(self.GlowSprite) then
            self.GlowSprite:SetKeyValue("scale", "1.5")
        end
        local pos = trackedEnt:GetPos() + trackedEnt:OBBCenter()
        if self:VisibleVec(pos) or self.Track_Position == defVec then
            self.Track_Position = pos
        end
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocity(VJ.CalculateTrajectory(self, trackedEnt, "Line", self:GetPos(), self.Track_Position, 700))
        end
    end
end