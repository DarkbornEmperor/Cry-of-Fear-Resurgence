/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Monster"
ENT.Author 			= "Darkborn"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Purpose 		= "Spawn it and fight with it!"
ENT.Instructions 	= "Click on the spawnicon to spawn it."
ENT.Category		= "Cry of Fear Resurgence"

ENT.Spawnable		= false
ENT.AdminSpawnable	= false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {
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
    "npc_vj_cofrc_crazyrumpel:60",	
    "npc_vj_cofrc_faster_clown:60",
    "npc_vj_cofrc_psycho_pumpkin:60",
	"npc_vj_cofrc_baby_swimmer:60",
	"npc_vj_cofrc_faster_ooi:60",
	"npc_vj_cofrc_slower3_dream:60",
	"npc_vj_cofrc_slowerno_boss:60",
	"npc_vj_cofrc_faceless_boss:60",
	"npc_vj_cofrc_patrick:60",
	"npc_vj_cofrc_genome_soldier:60",
	"npc_vj_cofrc_genome_generic:60",
	"npc_vj_cofrc_pedoslow:60",
	"npc_vj_cofrc_slower_mummy:60",
	"npc_vj_cofrc_mother:60",
	"npc_vj_cofrc_psycho_le:60",
	"npc_vj_cofrc_faceless_mummy:60",
	"npc_vj_cofrc_faceless_mummycrawl:60",
	"npc_vj_cofrc_faceless_stone:60",
	"npc_vj_cofrc_faceless_mummytwister:60",
	"npc_vj_cofrc_shaimoon_gold:60",
	"npc_vj_cofrc_sicksophie:60",
	"npc_vj_cofrc_zombie:60",
    "npc_vj_cofrc_crazyrunner_mummy:60"	
}},
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/