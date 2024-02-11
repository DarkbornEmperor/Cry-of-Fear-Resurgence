/*--------------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "base_entity"
ENT.Type 			= "ai"
ENT.PrintName 		= "Tentacle"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Used to make simple props and animate them, since prop_dynamic doesn't work properly in Garry's Mod."
ENT.Instructions 	= "Don't change anything."
ENT.Category		= "Cry of Fear Resurgence"

ENT.Spawnable = true
ENT.AdminOnly = false

function ENT:Draw() self:DrawModel() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DrawTranslucent() self:Draw() end
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	local Name = "Tentacle"
	local LangName = "sent_vj_cofrc_tentacle"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
---------------------------------------------------------------------------------------------------------------------------------------------
if (!SERVER) then return end

ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"} -- NPCs with the same class with be allied to each other
ENT.Assignee = NULL -- Is another entity the owner of this tentacle?

local sdHit = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
local sdBreak = {
"vj_cofr/fx/bodysplat.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
  if !IsValid(self.Assignee) then
	self:SetPos(self:GetPos() + self:GetUp()*-40)
end	
	self:SetModel("models/vj_cofr/custom/tentacleboss.mdl")
    //self:SetCollisionBounds(Vector(10, 10, 165), Vector(-10, -10, 0))
	self:SetSurroundingBounds(Vector(-30, -30, 0), Vector(30, 30, 200))
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_BBOX)
	self:SetMaxHealth(50)
	self:SetHealth(50)
	self:ResetSequence("idle")
	self.Tentacle_NextDamageT = CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
  if CurTime() > self.Tentacle_NextDamageT then
	VJ.ApplyRadiusDamage(self, self, self:GetPos(), 50, 10, DMG_NEVERGIB, true, true)
	self.Tentacle_NextDamageT = CurTime() + 1
end	
	self:NextThink(CurTime())
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:OnTakeDamage(dmginfo)
	self:SetHealth(self:Health() - dmginfo:GetDamage())
	self:EmitSound(VJ.PICK(sdHit), 70)
	if self:Health() <= 0 then -- If health is now less than 0 then despawn
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorRed)
		effectData:SetScale(25)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(15)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
		
	    self.Scale = math.Rand(1,1.25)
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
	    spr:SetPos(self:GetPos() + self:OBBCenter())
	    spr:Spawn()
	    spr:Fire("Kill","",0.3)
	    timer.Simple(0.3, function() if IsValid(spr) then spr:Remove() end end)
		
	    //ParticleEffect("vj_cofr_blood_red_large",self:GetPos()+self:OBBCenter(),self:GetAngles())
	    self:EmitSound(VJ.PICK(sdBreak), 70)
	    self:Remove()
	end
end