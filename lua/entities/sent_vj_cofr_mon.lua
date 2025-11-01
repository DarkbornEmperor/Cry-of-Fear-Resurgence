/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base = "obj_vj_spawner_base"
ENT.Type = "anim"
ENT.PrintName = "Random Monster Spawner"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Category = "Cry of Fear Resurgence"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
local entsList = {
    "npc_vj_cofr_slower1",
    "npc_vj_cofr_slower3:5",
    "npc_vj_cofr_slowerno:60",
    "npc_vj_cofr_slowerten:5",
    "npc_vj_cofr_slower1_beta:1",
    "npc_vj_cofr_slower3_beta:5",
    "npc_vj_cofr_crawler:10",
    "npc_vj_cofr_croucher:5",
    "npc_vj_cofr_upper:60",
    "npc_vj_cofr_baby:10",
    "npc_vj_cofr_children:10",
    "npc_vj_cofr_children_early:10",
    "npc_vj_cofr_children_beta:10",
    "npc_vj_cofr_faster:15",
    "npc_vj_cofr_faster_male:15",
    "npc_vj_cofr_drowned:15",
    "npc_vj_cofr_crazyrunner:10",
    "npc_vj_cofr_sewmo:20",
    "npc_vj_cofr_citalopram:10",
    "npc_vj_cofr_faceless:10",
    "npc_vj_cofr_faceless_crawler:15",
    "npc_vj_cofr_faceless_faced:20",
    "npc_vj_cofr_faceless_twister:20",
    "npc_vj_cofr_faceless_twistervalve:20",
    "npc_vj_cofr_faceless_beta:10",
    "npc_vj_cofr_faceless_crawler_beta:15",
    "npc_vj_cofr_krypandenej:15",
    "npc_vj_cofr_suicider:15",
    "npc_vj_cofr_taller:60",
    "npc_vj_cofr_psycho:20",
    "npc_vj_cofr_stranger:20",
    "npc_vj_cofr_flygare:20",
    "npc_vj_cofr_dreamer_runner:10",
    "npc_vj_cofrcc_crazyrumpel:60",
    "npc_vj_cofrcc_faster_clown:60",
    "npc_vj_cofrcc_baby_ooi:60",
    "npc_vj_cofrcc_faster_ooi:60",
    "npc_vj_cofrcc_slower3_ooi:60",
    "npc_vj_cofrcc_patrick:60",
    "npc_vj_cofrcc_genome_soldier:60",
    "npc_vj_cofrcc_genome_giant:60",
    "npc_vj_cofrcc_pedoslow:60",
    "npc_vj_cofrcc_slower1_mummy:60",
    "npc_vj_cofrcc_cutter:60",
    "npc_vj_cofrcc_psycho_le:60",
    "npc_vj_cofrcc_faceless_mummy:60",
    "npc_vj_cofrcc_faceless_mummycrawl:60",
    "npc_vj_cofrcc_faceless_statue:60",
    "npc_vj_cofrcc_faceless_mummytwister:60",
    "npc_vj_cofrcc_shaimoon_statue:60",
    "npc_vj_cofrcc_sicksophie:60",
    "npc_vj_cofrcc_skeleton:60",
    "npc_vj_cofrcc_crazyrunner_mummy:60"
}
ENT.EntitiesToSpawn = {
    {SpawnPosition = Vector(0, 0, 0), Entities = entsList},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 if GetConVar("VJ_COFR_Boss_Spawner"):GetInt() == 0 then return end
    entsList = {
    "npc_vj_cofr_slower1",
    "npc_vj_cofr_slower3:5",
    "npc_vj_cofr_slowerno:60",
    "npc_vj_cofr_slower10:5",
    "npc_vj_cofr_crawler:10",
    "npc_vj_cofr_croucher:5",
    "npc_vj_cofr_upper:60",
    "npc_vj_cofr_baby:10",
    "npc_vj_cofr_children:10",
    "npc_vj_cofr_faster:15",
    "npc_vj_cofr_faster_male:15",
    "npc_vj_cofr_drowned:15",
    "npc_vj_cofr_crazyrunner:10",
    "npc_vj_cofr_sewmo:20",
    "npc_vj_cofr_citalopram:10",
    "npc_vj_cofr_faceless:10",
    "npc_vj_cofr_faceless_crawler:15",
    "npc_vj_cofr_faceless_faced:20",
    "npc_vj_cofr_faceless_twister:20",
    "npc_vj_cofr_faceless_twistervalve:20",
    "npc_vj_cofr_krypandenej:15",
    "npc_vj_cofr_suicider:15",
    "npc_vj_cofr_taller:60",
    "npc_vj_cofr_psycho:20",
    "npc_vj_cofr_stranger:20",
    "npc_vj_cofr_flygare:20",
    "npc_vj_cofr_dreamer_runner:10",
    "npc_vj_cofr_simonbook:60",
    "npc_vj_cofr_simonbook_mh:60",
    "npc_vj_cofr_simonbook_beta:60",
    "npc_vj_cofr_carcass:60",
    "npc_vj_cofr_craig:60",
    "npc_vj_cofr_purnell:60",
    "npc_vj_cofr_mace:60",
    "npc_vj_cofr_sawcrazy:60",
    "npc_vj_cofr_sawer:60",
    "npc_vj_cofr_sawrunner:60",
    "npc_vj_cofrcc_crazyrumpel:60",
    "npc_vj_cofrcc_faster_clown:60",
    "npc_vj_cofrcc_pumpa:60",
    "npc_vj_cofrcc_baby_ooi:60",
    "npc_vj_cofrcc_faster_ooi:60",
    "npc_vj_cofrcc_slower3_ooi:60",
    "npc_vj_cofrcc_abomination:60",
    "npc_vj_cofrcc_faceless_boss:60",
    "npc_vj_cofrcc_patrick:60",
    "npc_vj_cofrcc_genome_soldier:60",
    "npc_vj_cofrcc_genome_giant:60",
    "npc_vj_cofrcc_pedoslow:60",
    "npc_vj_cofrcc_slower1_mummy:60",
    "npc_vj_cofrcc_cutter:60",
    "npc_vj_cofrcc_mother:60",
    "npc_vj_cofrcc_mother_real:60",
    "npc_vj_cofrcc_psycho_le:60",
    "npc_vj_cofrcc_faceless_mummy:60",
    "npc_vj_cofrcc_faceless_mummycrawl:60",
    "npc_vj_cofrcc_faceless_stone:60",
    "npc_vj_cofrcc_faceless_mummytwister:60",
    "npc_vj_cofrcc_shaimoon_statue:60",
    "npc_vj_cofrcc_sicksophie:60",
    "npc_vj_cofrcc_skeleton:60",
    "npc_vj_cofrcc_crazyrunner_mummy:60",
    "npc_vj_cofrcc_craigrunner:60",
    "npc_vj_cofrcc_crocodile:60",
    "npc_vj_cofrcc_duorunner:60",
    "npc_vj_cofrcc_jeffrunner:60",
    "npc_vj_cofrcc_mace_ooi:60",
    "npc_vj_cofrcc_patrick_boss:60",
    "npc_vj_cofrcc_shaimoon:60",
    "npc_vj_cofr_simonsick_suicider:60",
    "npc_vj_cofrcc_mummy:60"
}
self.EntitiesToSpawn = {
    {SpawnPosition = Vector(0, 0, 0), Entities = entsList},
}
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/