/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = false
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
    "npc_vj_cofr_fastermale:15",
    "npc_vj_cofr_drowned:15",
    "npc_vj_cofr_crazyrunner:10",	
    "npc_vj_cofr_sewmo:20",
    "npc_vj_cofr_citalopram:10",
    "npc_vj_cofr_faceless:10",	
    "npc_vj_cofr_faceless2:15",
    "npc_vj_cofr_faced:20",
    "npc_vj_cofr_twister:20",	
    "npc_vj_cofr_twisterv:20",
    "npc_vj_cofr_krypandenej:15",
    "npc_vj_cofr_suicider:15",	
    "npc_vj_cofr_taller:60",
    "npc_vj_cofr_psycho:20",
    "npc_vj_cofr_stranger:20",
    "npc_vj_cofr_flygare:20",
    "npc_vj_cofr_dreamerrunner:10",
    "npc_vj_cofrc_crazyrumpel:60",	
    "npc_vj_cofrc_fasterclown:60",
    "npc_vj_cofrc_psychopumpkin:60",
	"npc_vj_cofrc_babyswimmer:60",
	"npc_vj_cofrc_fasterooi:60",
	"npc_vj_cofrc_slower3dream:60"	
}},
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/