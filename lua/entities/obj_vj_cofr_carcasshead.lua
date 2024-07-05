/*--------------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Hooked Head"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectile, usually used for NPCs & Weapons"
ENT.Category		= "Projectiles"

ENT.VJTag_ID_Danger = true

if CLIENT then
	local Name = "Hooked Head"
	local LangName = "obj_vj_cofr_carcasshead"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/vj_cofr/cof/hookedhead.mdl"}
ENT.DoesDirectDamage = true
ENT.DirectDamage = 15
ENT.DirectDamageType = DMG_SLASH
ENT.CollideCodeWithoutRemoving = false
ENT.SoundTbl_OnCollide = {"vj_cofr/cof/roofboss/rb_headhit.wav"}
ENT.DecalTbl_DeathDecals = {"VJ_COFR_Blood_Red_Large"}
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
function ENT:CustomOnInitialize()
    VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_headshoot.wav", 75, 100)
	timer.Simple(10, function() if IsValid(self) then self:Remove() VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_headdeath.wav", 75, 100) self:DeathEffects() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	local phys = self:GetPhysicsObject()
	local trackedEnt = self.Track_Enemy
	-- Homing Behavior
	if IsValid(trackedEnt) then
		local pos = trackedEnt:GetPos() + trackedEnt:OBBCenter()
		if self:VisibleVec(pos) or self.Track_Position == defVec then
			self.Track_Position = pos
end
		if IsValid(phys) then
			phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self.Track_Position + trackedEnt:GetUp()*math.random(-50,50) + trackedEnt:GetRight()*math.random(-50,50), self.Head_ChaseSpeed))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
end
	-- Not tracking, go in straight line
	else
		if IsValid(phys) then
			phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self:GetPos() + self:GetForward()*math.random(-80, 80)+ self:GetRight()*math.random(-80, 80) + self:GetUp()*math.random(-80, 80), self.Head_ChaseSpeed / 2))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage(dmginfo) 
	VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_headdeath.wav", 75, 100)
    self:DeathEffects()
	self:Remove()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects(data,phys)
	self.Scale = math.Rand(0.5,1.15)
	local spr = ents.Create("env_sprite")
	spr:SetKeyValue("model","vj_cofr/sprites/spitsplat_red.vmt")
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
	spr:SetPos(self:GetPos())
	spr:Spawn()
	spr:Fire("Kill","",0.3)
	timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
end