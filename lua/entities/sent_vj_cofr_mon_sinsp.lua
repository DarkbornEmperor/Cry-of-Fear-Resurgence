/*--------------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Monster Spawner (Single)"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Cry of Fear Resurgence"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3:5",
	"npc_vj_cofr_slowerno:60",
	"npc_vj_cofr_slower10:5",
	"npc_vj_cofr_crawler:10",
	"npc_vj_cofr_croucher:5",
	"npc_vj_cofr_upper:60",
	"npc_vj_cofr_baby:10",
	"npc_vj_cofr_children:10",
	"npc_vj_cofr_children_early:10",
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
    "npc_vj_cofr_faceless_twisterv:20",
    "npc_vj_cofr_krypandenej:15",
    "npc_vj_cofr_suicider:15",	
    "npc_vj_cofr_taller:60",
    "npc_vj_cofr_psycho:20",
    "npc_vj_cofr_stranger:20",
    "npc_vj_cofr_flygare:20",
    "npc_vj_cofr_dreamer_runner:10",
    "npc_vj_cofrc_crazyrumpel:60",	
    "npc_vj_cofrc_faster_clown:60",
	"npc_vj_cofrc_baby_ooi:60",
	"npc_vj_cofrc_faster_ooi:60",
	"npc_vj_cofrc_slower3_ooi:60",
	"npc_vj_cofrc_patrick:60",
	"npc_vj_cofrc_genome_soldier:60",
	"npc_vj_cofrc_genome_generic:60",
	"npc_vj_cofrc_pedoslow:60",
	"npc_vj_cofrc_slower1_mummy:60",
	"npc_vj_cofrc_cutter:60",
	"npc_vj_cofrc_psycho_le:60",
	"npc_vj_cofrc_faceless_mummy:60",
	"npc_vj_cofrc_faceless_mummycrawl:60",
	"npc_vj_cofrc_faceless_stone:60",
	"npc_vj_cofrc_faceless_mummytwister:60",
	"npc_vj_cofrc_shaimoon_gold:60",
	"npc_vj_cofrc_sicksophie:60",
	"npc_vj_cofrc_skeleton:60",
    "npc_vj_cofrc_crazyrunner_mummy:60"
}
ENT.EntitiesToSpawn = {
	{SpawnPosition = {vForward=20, vRight=0, vUp=0}, Entities = entsList},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
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
    "npc_vj_cofr_faceless_twisterv:20",
    "npc_vj_cofr_krypandenej:15",
    "npc_vj_cofr_suicider:15",	
    "npc_vj_cofr_taller:60",
    "npc_vj_cofr_psycho:20",
    "npc_vj_cofr_stranger:20",
    "npc_vj_cofr_flygare:20",
    "npc_vj_cofr_dreamer_runner:10",
    "npc_vj_cofr_simonbook:60",
    "npc_vj_cofr_simonbook_mh:60",
    "npc_vj_cofr_carcass:60",
    "npc_vj_cofr_craig:60",
    "npc_vj_cofr_purnell:60",
    "npc_vj_cofr_mace:60",
    "npc_vj_cofr_sawcrazy:60",
    "npc_vj_cofr_sawer:60",
    "npc_vj_cofr_sawrunner:60",
    "npc_vj_cofrc_crazyrumpel:60",	
    "npc_vj_cofrc_faster_clown:60",
    "npc_vj_cofrc_pumpa:60",
	"npc_vj_cofrc_baby_ooi:60",
	"npc_vj_cofrc_faster_ooi:60",
	"npc_vj_cofrc_slower3_ooi:60",
	"npc_vj_cofrc_abomination:60",
	"npc_vj_cofrc_faceless_boss:60",
	"npc_vj_cofrc_patrick:60",
	"npc_vj_cofrc_genome_soldier:60",
	"npc_vj_cofrc_genome_generic:60",
	"npc_vj_cofrc_pedoslow:60",
	"npc_vj_cofrc_slower1_mummy:60",
	"npc_vj_cofrc_cutter:60",
	"npc_vj_cofrc_mother:60",
	"npc_vj_cofrc_mother_real:60",
	"npc_vj_cofrc_psycho_le:60",
	"npc_vj_cofrc_faceless_mummy:60",
	"npc_vj_cofrc_faceless_mummycrawl:60",
	"npc_vj_cofrc_faceless_stone:60",
	"npc_vj_cofrc_faceless_mummytwister:60",
	"npc_vj_cofrc_shaimoon_gold:60",
	"npc_vj_cofrc_sicksophie:60",
	"npc_vj_cofrc_skeleton:60",
    "npc_vj_cofrc_crazyrunner_mummy:60",
    "npc_vj_cofrc_craigrunner:60",
    "npc_vj_cofrc_dasubergator2:60",
    "npc_vj_cofrc_duorunner:60",	
    "npc_vj_cofrc_jeffrunner:60",
    "npc_vj_cofrc_mace_ooi:60",
    "npc_vj_cofrc_patrick_boss:60",
    "npc_vj_cofrc_shaimoon:60",
    "npc_vj_cofr_simonsick_sui:60",
    "npc_vj_cofrc_mummy:60"
}
self.EntitiesToSpawn = {
	{SpawnPosition = {vForward=20, vRight=0, vUp=0}, Entities = entsList},
}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/