/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Screamer Soul"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "Projectiles"

if CLIENT then
	local Name = "Screamer Soul"
	local LangName = "obj_vj_cofr_soul"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_small.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 10 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_SHOCK -- Damage type
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
	timer.Simple(5, function() if IsValid(self) then self:Remove() end end)
	
	self.IdleEffect = ents.Create("env_sprite")
	self.IdleEffect:SetKeyValue("model","vj_cofr/sprites/soul_range.vmt")
	self.IdleEffect:SetKeyValue("rendercolor","255 255 255")
	self.IdleEffect:SetKeyValue("GlowProxySize","1.0")
	self.IdleEffect:SetKeyValue("HDRColorScale","1.0")
	self.IdleEffect:SetKeyValue("renderfx","0")
	self.IdleEffect:SetKeyValue("rendermode","2")
	self.IdleEffect:SetKeyValue("renderamt","255")
	self.IdleEffect:SetKeyValue("disablereceiveshadows","0")
	self.IdleEffect:SetKeyValue("mindxlevel","0")
	self.IdleEffect:SetKeyValue("maxdxlevel","0")
	self.IdleEffect:SetKeyValue("framerate","10.0")
	self.IdleEffect:SetKeyValue("spawnflags","0")
	self.IdleEffect:SetPos(self:GetPos())
	self.IdleEffect:Spawn()
	self.IdleEffect:SetParent(self)
	self:DeleteOnRemove(self.IdleEffect)	
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function ENT:DeathEffects(data,phys)
/*
	local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	effectdata:SetScale( 1 )
	ParticleEffect("vj_cofr_soul_splt", data.HitPos, Angle(0,0,0), nil)
*/
--end