/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type           = "anim"
ENT.Base           = "obj_vj_projectile_base"
ENT.PrintName      = "Spit"
ENT.Author         = "Darkborn"
ENT.Contact        = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information    = "Projectile, usually used for NPCs & Weapons"
ENT.Category       = "Projectiles"

ENT.VJTag_ID_Danger = true

if CLIENT then
    local Name = "Spit"
    local LangName = "obj_vj_cofraom_spit"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_small.mdl"}
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 70
ENT.RadiusDamage = 15
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_ACID
ENT.SoundTbl_Idle = {"vj_cofr/aom/spitter/bc_acid1.wav","vj_cofr/aom/spitter/bc_acid2.wav"}
ENT.SoundTbl_OnCollide = {"vj_cofr/aom/spitter/bc_spithit1.wav","vj_cofr/aom/spitter/bc_spithit2.wav","vj_cofr/aom/spitter/bc_spithit3.wav"}
ENT.DecalTbl_DeathDecals = {"VJ_COFR_Spit"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:EnableGravity(true)
    phys:EnableDrag(false)
    phys:SetBuoyancyRatio(0)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetNoDraw(true)
    self.Scale = math.Rand(0.5,1.15)
    local idleSprite = ents.Create("env_sprite")
    idleSprite:SetKeyValue("model","vj_cofr/sprites/spit_white.vmt")
    idleSprite:SetKeyValue("rendercolor","255 255 255")
    idleSprite:SetKeyValue("GlowProxySize","1.0")
    idleSprite:SetKeyValue("HDRColorScale","1.0")
    idleSprite:SetKeyValue("renderfx","0")
    idleSprite:SetKeyValue("rendermode","2")
    idleSprite:SetKeyValue("renderamt","255")
    idleSprite:SetKeyValue("disablereceiveshadows","0")
    idleSprite:SetKeyValue("mindxlevel","0")
    idleSprite:SetKeyValue("maxdxlevel","0")
    //idleSprite:SetKeyValue("framerate","40.0")
    idleSprite:SetKeyValue("spawnflags","0")
    idleSprite:SetKeyValue("scale",tostring(self.Scale))
    idleSprite:SetPos(self:GetPos())
    idleSprite:Spawn()
    idleSprite:SetParent(self)
    self:DeleteOnRemove(idleSprite)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
    local spr = ents.Create("env_sprite")
    spr:SetKeyValue("model","vj_cofr/sprites/spitsplat_white.vmt")
    spr:SetKeyValue("GlowProxySize","1.0")
    spr:SetKeyValue("HDRColorScale","1.0")
    spr:SetKeyValue("renderfx","0")
    spr:SetKeyValue("rendermode","2")
    spr:SetKeyValue("renderamt","255")
    spr:SetKeyValue("disablereceiveshadows","0")
    spr:SetKeyValue("mindxlevel","0")
    spr:SetKeyValue("maxdxlevel","0")
    //spr:SetKeyValue("framerate","15.0")
    spr:SetKeyValue("spawnflags","0")
    spr:SetKeyValue("scale",tostring(self.Scale *0.3))
    spr:SetPos(data.HitPos)
    spr:Spawn()
    spr:Fire("Kill","",0.3)
    timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
end