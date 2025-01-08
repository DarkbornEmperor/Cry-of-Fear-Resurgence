/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Soul"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

ENT.VJ_ID_Danger = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofraom_soul", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_base/projectiles/spit_acid_small.mdl"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 10
ENT.DirectDamageType = DMG_SHOCK
ENT.HasOnCollideSounds = false
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true)
    local soulSpr = ents.Create("env_sprite")
    soulSpr:SetKeyValue("model","vj_cofr/sprites/soul_range.vmt")
    soulSpr:SetKeyValue("rendercolor","255 255 255")
    soulSpr:SetKeyValue("GlowProxySize","2.0")
    soulSpr:SetKeyValue("HDRColorScale","1.0")
    soulSpr:SetKeyValue("renderfx","14")
    soulSpr:SetKeyValue("rendermode","3")
    soulSpr:SetKeyValue("renderamt","255")
    soulSpr:SetKeyValue("disablereceiveshadows","0")
    soulSpr:SetKeyValue("mindxlevel","0")
    soulSpr:SetKeyValue("maxdxlevel","0")
    soulSpr:SetKeyValue("framerate","10.0")
    soulSpr:SetKeyValue("spawnflags","0")
    soulSpr:SetKeyValue("scale","1")
    soulSpr:SetPos(self:GetPos())
    soulSpr:Spawn()
    soulSpr:SetParent(self)
    self:DeleteOnRemove(soulSpr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if IsValid(self.Track_Enemy) then -- Homing Behavior
        self.DirectDamage = 25
        local pos = self.Track_Enemy:GetPos() + self.Track_Enemy:OBBCenter()
        if self:VisibleVec(pos) or self.Track_Position == defVec then
            self.Track_Position = pos
end
        local phys = self:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self.Track_Position, 700))
        end
    end
end