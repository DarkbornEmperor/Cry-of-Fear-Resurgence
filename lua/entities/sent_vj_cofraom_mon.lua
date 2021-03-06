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
	"npc_vj_cofraom_twitcher1",
	"npc_vj_cofraom_twitcher2",
	"npc_vj_cofraom_twitcher3",
	"npc_vj_cofraom_twitcher4",	
	"npc_vj_cofraom_twitcher_da",
	"npc_vj_cofraom_handcrab:5",
	"npc_vj_cofraom_wheelchair:10",
	"npc_vj_cofraom_spitter:15",
	"npc_vj_cofraom_face:25",
	"npc_vj_cofraom_hellhound:10",
	"npc_vj_cofraom_ghost:20",
	"npc_vj_cofraom_screamer:25"
	
}},
}
/*-----------------------------------------------
	*** Copyright (c) 2012-2017 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/