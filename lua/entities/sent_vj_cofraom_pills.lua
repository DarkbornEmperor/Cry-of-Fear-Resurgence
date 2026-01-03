/*--------------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Pills"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "CoF Resurgence: AoM"

ENT.Spawnable = true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local math_clamp = math.Clamp

function ENT:Initialize()
    self:SetModel("models/vj_cofr/aom/weapons/w_pills.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()
    if phys && IsValid(phys) then
        phys:Wake()
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.HPAmount = 40
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.HPAmount = 30
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.HPAmount = 20
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.HPAmount = 15
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data, physobj)
    local l = self:GetVelocity():Length()
    if l >= 25 then
        self:EmitSound("vj_cofr/aom/weapons/pills/pills_drop.wav", 75, 100, math_clamp(data.Speed / 100, .25, 1))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Use(activator, caller)
    local hp, maxhp = activator:Health(), activator:GetMaxHealth()
    if IsValid(activator) && activator:IsPlayer() && hp >= maxhp then
        activator:PickupObject(self)
        self:EmitSound("vj_cofr/aom/weapons/pills/pills_pickup.wav", 75, 100)
    end
    if hp >= maxhp then return end
    if activator:IsPlayer() then
        activator:EmitSound(Sound("vj_cofr/aom/weapons/pills/pills_use.wav"), 75, 100)
        activator:SetHealth(math.min(hp + self.HPAmount, maxhp))
        //activator:PrintMessage(HUD_PRINTTALK, "Don't Do Drugs, Kids.")
        self:Remove()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo)
    self:GetPhysicsObject():AddVelocity(dmginfo:GetDamageForce() * 0.1)
end