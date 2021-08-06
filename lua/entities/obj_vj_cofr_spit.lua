/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Spit"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "Projectiles"

if CLIENT then
	local Name = "Spit"
	local LangName = "obj_vj_cofr_spit"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_medium.mdl"}
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 45
ENT.RadiusDamage = 15
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_ACID
ENT.SoundTbl_OnCollide = {"vj_cofr/cof/flygare/flygare_acid_hit.wav"}
ENT.DecalTbl_DeathDecals = {"VJ_COFR_Blood_Red_Large"}
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

	self.IdleEffect = ents.Create("env_sprite")
	self.IdleEffect:SetKeyValue("model","vj_cofr/sprites/mommaspit_red.vmt")
	self.IdleEffect:SetKeyValue("rendercolor","255 255 255")
	self.IdleEffect:SetKeyValue("GlowProxySize","1.0")
	self.IdleEffect:SetKeyValue("HDRColorScale","1.0")
	self.IdleEffect:SetKeyValue("renderfx","0")
	self.IdleEffect:SetKeyValue("rendermode","2")
	self.IdleEffect:SetKeyValue("renderamt","255")
	self.IdleEffect:SetKeyValue("disablereceiveshadows","0")
	self.IdleEffect:SetKeyValue("mindxlevel","0")
	self.IdleEffect:SetKeyValue("maxdxlevel","0")
	self.IdleEffect:SetKeyValue("framerate","30.0")
	self.IdleEffect:SetKeyValue("spawnflags","0")
	self.IdleEffect:SetKeyValue("scale",tostring(self.Scale))
	self.IdleEffect:SetPos(self:GetPos())
	self.IdleEffect:Spawn()
	self.IdleEffect:SetParent(self)
	self:DeleteOnRemove(self.IdleEffect)	
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	self.DeathEffect = ents.Create("env_sprite")
	self.DeathEffect:SetKeyValue("model","vj_cofr/sprites/spitsplat_red.vmt")
	self.DeathEffect:SetKeyValue("rendercolor","255 255 255")
	self.DeathEffect:SetKeyValue("GlowProxySize","1.0")
	self.DeathEffect:SetKeyValue("HDRColorScale","1.0")
	self.DeathEffect:SetKeyValue("renderfx","0")
	self.DeathEffect:SetKeyValue("rendermode","2")
	self.DeathEffect:SetKeyValue("renderamt","255")
	self.DeathEffect:SetKeyValue("disablereceiveshadows","0")
	self.DeathEffect:SetKeyValue("mindxlevel","0")
	self.DeathEffect:SetKeyValue("maxdxlevel","0")
	self.DeathEffect:SetKeyValue("framerate","40.0")
	self.DeathEffect:SetKeyValue("spawnflags","0")
	self.DeathEffect:SetKeyValue("scale","0.3")
	self.DeathEffect:SetPos(self:GetPos())
	self.DeathEffect:Spawn()
	self.DeathEffect:SetParent(self)
	self:DeleteOnRemove(self.DeathEffect)
end