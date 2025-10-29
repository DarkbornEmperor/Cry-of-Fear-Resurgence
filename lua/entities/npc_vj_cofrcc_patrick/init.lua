include("entities/npc_vj_cofr_psycho/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/psycho_patrick_hc.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Psycho_Init()
    self.SoundTbl_Alert =
    "vj_cofr/cofcc/patrick/patrick_scream.wav"

    self.SoundTbl_BeforeMeleeAttack =
    "vj_cofr/cofcc/patrick/patrick_attack.wav"

    self.SoundTbl_Pain =
    "vj_cofr/cofcc/patrick/patrick_scream.wav"

    self.SoundTbl_Death =
    "vj_cofr/cofcc/patrick/patrick_scream.wav"
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/