/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Spit"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Projectiles"

ENT.VJ_ID_Danger = true

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofr_spit", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_base/projectiles/spit_acid_small.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 70
ENT.RadiusDamage = 15
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_ACID
ENT.SoundTbl_OnCollide = "vj_cofr/cof/flygare/flygare_acid_hit.wav"
ENT.CollisionDecal = "VJ_COFR_Blood_Red_Large"

local math_rand = math.Rand
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true)
    self.Scale = math_rand(0.5,1.15)
    local spitSpr = ents.Create("env_sprite")
    spitSpr:SetKeyValue("model", "vj_cofr/sprites/spit.vmt")
    spitSpr:SetKeyValue("rendercolor", "130 19 10")
    spitSpr:SetKeyValue("GlowProxySize", "1.0")
    spitSpr:SetKeyValue("HDRColorScale", "1.0")
    spitSpr:SetKeyValue("renderfx", "0")
    spitSpr:SetKeyValue("rendermode", "2")
    spitSpr:SetKeyValue("renderamt", "255")
    spitSpr:SetKeyValue("disablereceiveshadows", "0")
    spitSpr:SetKeyValue("mindxlevel", "0")
    spitSpr:SetKeyValue("maxdxlevel", "0")
    spitSpr:SetKeyValue("framerate", "15.0")
    spitSpr:SetKeyValue("spawnflags", "0")
    spitSpr:SetKeyValue("scale", tostring(self.Scale))
    spitSpr:SetPos(self:GetPos())
    spitSpr:Spawn()
    spitSpr:SetParent(self)
    self:DeleteOnRemove(spitSpr)
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
    spr:SetPos(data.HitPos)
    spr:Spawn()
    spr:Fire("Kill", "", 0.3)
    timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
end