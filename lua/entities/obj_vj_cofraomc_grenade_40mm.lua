/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "40mm Grenade"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

ENT.VJTag_ID_Danger = true

if CLIENT then
    local Name = "40mm Grenade"
    local LangName = "obj_vj_cofraomc_grenade_40mm"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_cofr/aom/weapons/classic/grenade.mdl"
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 150
ENT.RadiusDamage = 80
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_BLAST
ENT.RadiusDamageForce = 90
ENT.DecalTbl_DeathDecals = {"VJ_COFR_Scorch"}
ENT.SoundTbl_OnRemove = {"vj_cofr/aom/weapons/grenade/explode3.wav","vj_cofr/aom/weapons/grenade/explode4.wav","vj_cofr/aom/weapons/grenade/explode5.wav"}
ENT.OnRemoveSoundLevel = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:SetMass(1)
    phys:EnableGravity(true)
    phys:EnableDrag(false)
    phys:SetBuoyancyRatio(0)
    phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data, phys)
    local selfPos = self:GetPos()

    local spr = ents.Create("env_sprite")
    spr:SetKeyValue("model","vj_cofr/sprites/zerogxplode.vmt")
    spr:SetKeyValue("GlowProxySize","2.0")
    spr:SetKeyValue("HDRColorScale","1.0")
    spr:SetKeyValue("renderfx","14")
    spr:SetKeyValue("rendermode","5")
    spr:SetKeyValue("renderamt","255")
    spr:SetKeyValue("disablereceiveshadows","0")
    spr:SetKeyValue("mindxlevel","0")
    spr:SetKeyValue("maxdxlevel","0")
    spr:SetKeyValue("framerate","15.0")
    spr:SetKeyValue("spawnflags","0")
    spr:SetKeyValue("scale","4")
    spr:SetPos(self:GetPos() + Vector(0,0,90))
    spr:Spawn()
    spr:Fire("Kill","",0.9)
    //timer.Simple(0.9,function() if IsValid(spr) then spr:Remove() end end)

    VJ.EmitSound(self, "vj_cofr/aom/weapons/grenade/debris"..math.random(1,3)..".wav", 80, 100)
    VJ.EmitSound(self, "vj_cofr/aom/weapons/grenade/explode"..math.random(3,5).."_dist.wav", 140, 100)
    local expLight = ents.Create("light_dynamic")
    expLight:SetKeyValue("brightness", "4")
    expLight:SetKeyValue("distance", "300")
    expLight:SetLocalPos(selfPos)
    expLight:SetLocalAngles(self:GetAngles())
    expLight:Fire("Color", "255 150 0")
    //expLight:SetParent(self)
    expLight:Spawn()
    expLight:Activate()
    expLight:Fire("TurnOn", "", 0)
    expLight:Fire("Kill","",0.08)
    util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
end