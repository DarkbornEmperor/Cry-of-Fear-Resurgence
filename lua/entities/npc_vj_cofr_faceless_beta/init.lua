include("entities/npc_vj_cofr_faceless/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/faceless_beta.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faceless_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cof/slower/slower_alert10.wav",
        "vj_cofr/cof/slower/slower_alert20.wav",
        "vj_cofr/cof/slower/slower_alert30.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/cof/slower/slower_attack1.wav",
        "vj_cofr/cof/slower/slower_attack2.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/