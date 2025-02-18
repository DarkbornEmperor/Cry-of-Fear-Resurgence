/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base = "prop_vj_animatable"
ENT.Type = "anim"
ENT.PrintName = "Police Officer (Dead)"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Cry of Fear Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

function ENT:Initialize()
    self:SetModel("models/vj_cofr/cof/policedead.mdl")
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:SetBodygroup(0,math.random(0,1))
    local anim = math.random(1,2)
    if anim == 1 then
        self:ResetSequence("e5idle1")
        self:SetCollisionBounds(Vector(13, 13, 15), Vector(-13, -13, 0))
    elseif anim == 2 then
        self:ResetSequence("e5idle2")
        self:SetCollisionBounds(Vector(13, 13, 35), Vector(-13, -13, 0))
    end
end