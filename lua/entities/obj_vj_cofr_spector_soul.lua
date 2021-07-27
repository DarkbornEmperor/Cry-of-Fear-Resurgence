/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Spector Soul"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Projectiles for my addons"
ENT.Category		= "Projectiles"

if CLIENT then
	local Name = "Spector Soul"
	local LangName = "obj_vj_cofr_spector_soul"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/spitball_small.mdl"} -- The models it should spawn with | Picks a random one from the table
ENT.MoveCollideType = MOVECOLLIDE_FLY_SLIDE -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = 6 -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_SLASH -- Damage type
ENT.CollideCodeWithoutRemoving = true -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.
ENT.SoundTbl_Idle = {"vj_cofr/aom/hornet/ag_buzz1.wav","vj_cofr/aom/hornet/ag_buzz2.wav","vj_cofr/aom/hornet/ag_buzz3.wav"}
ENT.SoundTbl_OnCollide = {"vj_cofr/aom/hornet/ag_hornethit1.wav","vj_cofr/aom/hornet/ag_hornethit2.wav","vj_cofr/aom/hornet/ag_hornethit3.wav"}

ENT.IdleSoundPitch = VJ_Set(100, 100)

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
	self.IdleEffect:SetKeyValue("model","vj_cofr/sprites/aom_soul.vmt")
	self.IdleEffect:SetKeyValue("rendercolor","255 255 255")
	self.IdleEffect:SetKeyValue("GlowProxySize","1.0")
	self.IdleEffect:SetKeyValue("HDRColorScale","1.0")
	self.IdleEffect:SetKeyValue("renderfx","0")
	self.IdleEffect:SetKeyValue("rendermode","2")
	self.IdleEffect:SetKeyValue("renderamt","255")
	self.IdleEffect:SetKeyValue("disablereceiveshadows","0")
	self.IdleEffect:SetKeyValue("mindxlevel","0")
	self.IdleEffect:SetKeyValue("maxdxlevel","0")
	self.IdleEffect:SetKeyValue("framerate","40.0")
	self.IdleEffect:SetKeyValue("spawnflags","0")
	self.IdleEffect:SetKeyValue("scale",tostring(self.Scale))
	self.IdleEffect:SetPos(self:GetPos())
	self.IdleEffect:Spawn()
	self.IdleEffect:SetParent(self)
	self:DeleteOnRemove(self.IdleEffect)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if IsValid(self.Track_Enemy) then -- Homing Behavior
		local pos = self.Track_Enemy:GetPos() + self.Track_Enemy:OBBCenter()
		if self:VisibleVec(pos) or self.Track_Position == defVec then
			self.Track_Position = pos
		end
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self.Track_Position + self.Track_Enemy:GetUp()*math.random(-50,50) + self.Track_Enemy:GetRight()*math.random(-50,50), 600))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
		end
	else
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self:GetPos() + self:GetForward()*math.random(-80, 80)+ self:GetRight()*math.random(-80, 80) + self:GetUp()*math.random(-80, 80), 300))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPhysicsCollide(data, phys)
	local lastVel = math.max(data.OurOldVelocity:Length(), data.Speed) -- Get the last velocity and speed
	local newVel = phys:GetVelocity():GetNormal()
	lastVel = math.max(newVel:Length(), lastVel)
	phys:SetVelocity(newVel * lastVel * 0.3)
	self:SetAngles(self:GetVelocity():GetNormal():Angle())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage(data, phys, hitEnt)
	if data.HitEntity:IsNPC() or data.HitEntity:IsPlayer() then
		self:SetDeathVariablesTrue(data, phys)
		self:Remove()
	end
end