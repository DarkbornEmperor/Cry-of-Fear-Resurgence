include("entities/npc_vj_cofr_faceless/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/facelessmummy2.mdl"
ENT.CanFlinch = 0
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, 5),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faceless_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/faceless/faceless_alert10.wav",
    "vj_cofr/cof/faceless/faceless_alert20.wav",
    "vj_cofr/cof/faceless/faceless_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/faceless/faceless_attack1.wav",
    "vj_cofr/cof/faceless/faceless_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/faceless/faceless_pain1.wav",
    "vj_cofr/cof/faceless/faceless_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/faceless/faceless_pain1.wav",
    "vj_cofr/cof/faceless/faceless_pain2.wav"
}
    self:SetCollisionBounds(Vector(13, 13, 15), Vector(-13, -13, 0))
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/