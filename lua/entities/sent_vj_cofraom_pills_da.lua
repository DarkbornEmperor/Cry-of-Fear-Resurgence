/*--------------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()
if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end

ENT.Base 			= "base_gmodentity"
ENT.Type 			= "anim"
ENT.PrintName 		= "Pills (Dark Assistance)"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Provides health."
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "CoF Resurgence: AoM:DC"

ENT.Spawnable = true
ENT.AdminOnly = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

function ENT:Initialize()
	self:SetModel("models/vj_cofr/aom/pill_bottle.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	//self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetUseType(SIMPLE_USE)
	
	local phys = self:GetPhysicsObject()
	if phys and IsValid(phys) then
		phys:Wake()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*
function ENT:PhysicsCollide(data, physobj)
  if (data.Speed <= 200 and data.DeltaTime > 0.3) then
	self:EmitSound("vj_cofr/aom/pills/pills_drop.wav")
end
end
*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(ply, caller)
    //ply:PickupObject(self)	
	local hp,maxhp = ply:Health(),ply:GetMaxHealth()
	if hp >= maxhp then return end
	if ply:IsPlayer() then
		ply:EmitSound(Sound("vj_cofr/aom/pills/pills_use.wav"), 70, 100)
		ply:SetHealth(math.min(hp + 15, maxhp))		
		//ply:PrintMessage(HUD_PRINTTALK, "Don't Do Drugs, Kids.")
		self:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo)
	self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end