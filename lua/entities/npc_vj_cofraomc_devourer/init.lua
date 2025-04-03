include("entities/npc_vj_cofraom_devourer/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/barnacle.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_Init()
    self.SoundTbl_Death = {
    "vj_cofr/aom/devourer/classic/bcl_die1.wav",
    "vj_cofr/aom/devourer/classic/bcl_die3.wav"
}
    self.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/aom/devourer/classic/bcl_chew1.wav",
    "vj_cofr/aom/devourer/classic/bcl_chew2.wav",
    "vj_cofr/aom/devourer/classic/bcl_chew3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(18,18,0),Vector(-18,-18,-50))
    self:SetSurroundingBounds(Vector(-60, -60, -60), Vector(60, 60, 40))
    self:Devourer_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local velInitial = Vector(0, 0, 2)
--
function ENT:Devourer_CalculateTongue()
 local myPos = self:GetPos()
 local myUpPos = self:GetUp()
 local tr = util.TraceLine({
    start = myPos,
    endpos = myPos + myUpPos * -self.Devourer_LastHeight,
    filter = self
})
 local trHitEnt = tr.Entity
 local trHitPos = tr.HitPos
 local height = myPos:Distance(trHitPos)
 -- Increase the height by 10 every tick | minimum = 0, maximum = 1024
 self.Devourer_LastHeight = math.Clamp(height + 10, 0, 1024)

 if IsValid(trHitEnt) && (trHitEnt:IsNPC() or trHitEnt:IsPlayer()) && self:CheckRelationship(trHitEnt) == D_HT && trHitEnt.VJ_ID_Boss != true then
 -- If the grabbed enemy is a new enemy then reset the enemy values
 if self.Devourer_CurEnt != trHitEnt then
    self:Devourer_ResetEnt()
    self.Devourer_CurEntMoveType = trHitEnt:GetMoveType()
end
 self.Devourer_CurEnt = trHitEnt
 trHitEnt:AddEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
 if trHitEnt:IsNPC() then
    trHitEnt:StopMoving()
    trHitEnt:SetVelocity(velInitial)
    trHitEnt:SetMoveType(MOVETYPE_FLY)
 elseif trHitEnt:IsPlayer() then
    trHitEnt:SetMoveType(MOVETYPE_NONE)
    //trHitEnt:AddFlags(FL_ATCONTROLS)
end
    trHitEnt:SetGroundEntity(NULL)
    -- Make it pull the enemy up
    if height >= 50 then
        trHitEnt:SetPos(Vector(trHitPos.x, trHitPos.y, (trHitEnt:GetPos() + trHitEnt:GetUp() * 5).z)) -- Set the position for the enemy
    if CurTime() > self.Devourer_NextPullSoundT then -- Play the pulling sound
        VJ.EmitSound(self, "vj_cofr/aom/devourer/classic/bcl_alert2.wav")
        self.Devourer_NextPullSoundT = CurTime() + 2.7950113378685 // Magic number is the sound duration of "bcl_alert2.wav"
    end
end
    self:SetPoseParameter("tongue_height", myPos:Distance(trHitPos + myUpPos * 125))
    return true
 else
    self:Devourer_ResetEnt()
end
    self:SetPoseParameter("tongue_height", myPos:Distance(trHitPos + myUpPos * 193))
    return false
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/