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
    //self:GetPoseParameters(true) -- tongue_height 0 / 1024
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/