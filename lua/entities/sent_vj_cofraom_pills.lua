/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base            = "base_anim"
ENT.Type            = "anim"
ENT.PrintName       = "Pills"
ENT.Author          = "Darkborn"
ENT.Contact         = "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose         = "Provides health."
ENT.Instructions    = "Don't change anything."
ENT.Category        = "CoF Resurgence: AoM"

ENT.Spawnable = true
ENT.AdminOnly = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

function ENT:Initialize()
    self:SetModel("models/vj_cofr/aom/w_medkit.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()
    if phys && IsValid(phys) then
        phys:Wake()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data,physobj)
    local l = self:GetVelocity():Length()
    if l >= 25 then
        self:EmitSound("vj_cofr/aom/pills/pills_drop.wav",75,100,math.Clamp(data.Speed / 100,.25,1))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(ply,caller)
    if IsValid(ply) && ply:IsPlayer() then
       ply:PickupObject(self)
       self:EmitSound("vj_cofr/aom/pills/pills_pickup.wav",75,100)
end
    local hp,maxhp = ply:Health(),ply:GetMaxHealth()
    if hp >= maxhp then return end
    if ply:IsPlayer() then
        ply:EmitSound(Sound("vj_cofr/aom/pills/pills_use.wav"),75,100)
        ply:SetHealth(math.min(hp + 15, maxhp))
        //ply:PrintMessage(HUD_PRINTTALK, "Don't Do Drugs, Kids.")
        self:Remove()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo)
    self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end