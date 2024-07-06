include("entities/npc_vj_cofr_slower1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/slower3_dream.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/slower3/slower_alert10.wav",
    "vj_cofr/cof/slower3/slower_alert20.wav",
    "vj_cofr/cof/slower3/slower_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/slower3/slower_attack1.wav",
    "vj_cofr/cof/slower3/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/slower3/slower_pain1.wav",
    "vj_cofr/cof/slower3/slower_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/slower3/slower_pain1.wav",
    "vj_cofr/cof/slower3/slower_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert() return end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/