include("entities/npc_vj_cofr_faster/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/faster_ooi.mdl"
     -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/faceless/fist_strike1.wav",
    "vj_cofr/cof/faceless/fist_strike2.wav",
    "vj_cofr/cof/faceless/fist_strike3.wav",
    "vj_cofr/cof/faceless/fist_strike1.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/faceless/fist_miss1.wav",
    "vj_cofr/cof/faceless/fist_miss2.wav"
}