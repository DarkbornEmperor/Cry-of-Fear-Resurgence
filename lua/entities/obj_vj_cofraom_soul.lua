/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
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

ENT.VJTag_ID_Danger = true

if CLIENT then
    local Name = "Soul"
    local LangName = "obj_vj_cofr_soul"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_small.mdl"}
ENT.DoesDirectDamage = true
ENT.DirectDamage = 10
ENT.DirectDamageType = DMG_SHOCK
ENT.HasOnCollideSounds = false
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:SetMass(1)
    phys:SetBuoyancyRatio(0)
    phys:EnableDrag(false)
    phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetNoDraw(true)
    self.StartSoul1 = ents.Create("env_sprite")
    self.StartSoul1:SetKeyValue("model","vj_cofr/sprites/soul_range.vmt")
    //self.StartSoul1:SetKeyValue("rendercolor","255 128 0")
    self.StartSoul1:SetKeyValue("GlowProxySize","2.0")
    self.StartSoul1:SetKeyValue("HDRColorScale","1.0")
    self.StartSoul1:SetKeyValue("renderfx","14")
    self.StartSoul1:SetKeyValue("rendermode","3")
    self.StartSoul1:SetKeyValue("renderamt","255")
    self.StartSoul1:SetKeyValue("disablereceiveshadows","0")
    self.StartSoul1:SetKeyValue("mindxlevel","0")
    self.StartSoul1:SetKeyValue("maxdxlevel","0")
    self.StartSoul1:SetKeyValue("framerate","10.0")
    self.StartSoul1:SetKeyValue("spawnflags","0")
    self.StartSoul1:SetKeyValue("scale","1")
    self.StartSoul1:SetPos(self:GetPos())
    self.StartSoul1:Spawn()
    self.StartSoul1:SetParent(self)
    self:DeleteOnRemove(self.StartSoul1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
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