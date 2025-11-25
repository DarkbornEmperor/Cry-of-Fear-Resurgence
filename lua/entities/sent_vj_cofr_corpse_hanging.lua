/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base = "prop_vj_animatable"
ENT.Type = "anim"
ENT.PrintName = "Corpse (Hanging)"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Cry of Fear Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local math_random = math.random

function ENT:Initialize()
    self:SetModel("models/vj_cofr/cof/corpse_hanging.mdl")
    self:SetCollisionBounds(Vector(13, 13, 72), Vector(-13, -13, 0))
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    local anim = math_random(1,2)
    if anim == 1 then
        self:ResetSequence("idle1")
    elseif anim == 2 then
        self:ResetSequence("idle2")
    end
end