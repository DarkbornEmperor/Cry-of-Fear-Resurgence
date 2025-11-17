include("entities/npc_vj_cofr_hanger/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/hanger_beta.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hanger_Init()
    self.SoundTbl_Death = {
        "vj_cofr/cof/hanger_beta/hangerscream1.wav",
        "vj_cofr/cof/hanger_beta/hangerscream2.wav",
        "vj_cofr/cof/hanger_beta/hangerscream3.wav"
    }
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/