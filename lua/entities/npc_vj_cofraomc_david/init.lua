include("entities/npc_vj_cofraom_david/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/david.mdl"
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/pill_bottle.mdl"
-- Custom
ENT.Human_Type = 3
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootSteps = {
   [MAT_ANTLION] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_BLOODYFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_CONCRETE] = {
        "vj_cofr/aom/david/footsteps_classic/pl_step1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_step2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_step3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_step4.wav"
    },
    [MAT_DIRT] = {
        "vj_cofr/aom/david/footsteps_classic/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt4.wav"
    },
    [MAT_FLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
    },
    [MAT_GRATE] = {
        "vj_cofr/aom/david/footsteps_classic/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal4.wav"
    },
    [MAT_ALIENFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
    },
    [74] = { -- Snow
        "vj_cofr/aom/david/footsteps_classic/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt4.wav"
    },
    [MAT_PLASTIC] = {
        "vj_cofr/aom/david/footsteps_classic/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile5.wav"
    },
    [MAT_METAL] = {
        "vj_cofr/aom/david/footsteps_classic/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_metal4.wav"
    },
    [MAT_SAND] = {
        "vj_cofr/aom/david/footsteps_classic/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt4.wav"
    },
    [MAT_FOLIAGE] = {
        "vj_cofr/aom/david/footsteps_classic/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt4.wav"
    },
    [MAT_COMPUTER] = {
        "vj_cofr/aom/david/footsteps_classic/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile5.wav"
    },
    [MAT_SLOSH] = {
        "vj_cofr/aom/david/footsteps/pl_slosh1.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh2.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh3.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh4.wav"
    },
    [MAT_TILE] = {
        "vj_cofr/aom/david/footsteps_classic/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_tile5.wav"
    },
    [85] = { -- Grass
        "vj_cofr/aom/david/footsteps_classic/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_dirt4.wav"
    },
    [MAT_VENT] = {
        "vj_cofr/aom/david/footsteps_classic/pl_duct1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_duct2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_duct3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_duct4.wav"
    },
    [MAT_WOOD] = {
        "vj_cofr/aom/david/footsteps_classic/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate4.wav"
    },
    [MAT_GLASS] = {
        "vj_cofr/aom/david/footsteps_classic/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps_classic/pl_grate4.wav"
    }
}
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/