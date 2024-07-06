/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base            = "prop_vj_animatable"
ENT.Type            = "anim"
ENT.PrintName       = "Corpse"
ENT.Author          = "Darkborn"
ENT.Contact         = "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose         = "Used to make simple props and animate them, since prop_dynamic doesn't work properly in Garry's Mod."
ENT.Instructions    = "Don't change anything."
ENT.Category        = "Cry of Fear Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local models = {
   "models/vj_cofr/aom/corpse.mdl",
   "models/vj_cofr/aom/corpse2.mdl"
}

function ENT:Initialize()
    self:SetModel(VJ.PICK(models))
    self:SetCollisionBounds(Vector(13, 13, 72), Vector(-13, -13, 0))
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_BBOX)
    self:ResetSequence("idle")
end