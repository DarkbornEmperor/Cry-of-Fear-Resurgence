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
ENT.Purpose = "Spawn it and fight with it!"
ENT.Instructions = "Click on the spawnicon to spawn it."
ENT.Category = "Cry of Fear Resurgence"

ENT.Spawnable = false
ENT.AdminSpawnable = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
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
    "npc_vj_cofraom_screamer:25",
    "npc_vj_cofraomc_twitcher",
    "npc_vj_cofraomc_headcrab:5",
    "npc_vj_cofraomc_hellhound:10",
    "npc_vj_cofraomc_spitter:15",
    "npc_vj_cofraomc_ghost:20",
    "npc_vj_cofraomc_face:25",
    "npc_vj_cofraomc_screamer:25"
}
ENT.EntitiesToSpawn = {
    {SpawnPosition = Vector(0, 0, 0), Entities = entsList},
    {SpawnPosition = Vector(50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(50, -50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, -50, 0), Entities = entsList},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 if GetConVar("VJ_COFR_Boss_Spawner"):GetInt() == 0 then return end
    entsList = {
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
    "npc_vj_cofraom_screamer:25",
    "npc_vj_cofraomc_twitcher",
    "npc_vj_cofraomc_headcrab:5",
    "npc_vj_cofraomc_hellhound:10",
    "npc_vj_cofraomc_spitter:15",
    "npc_vj_cofraomc_ghost:20",
    "npc_vj_cofraomc_face:25",
    "npc_vj_cofraomc_screamer:25",
    "npc_vj_cofraom_addiction:60"
}
self.EntitiesToSpawn = {
    {SpawnPosition = Vector(0, 0, 0), Entities = entsList},
    {SpawnPosition = Vector(50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(50, -50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, 50, 0), Entities = entsList},
    {SpawnPosition = Vector(-50, -50, 0), Entities = entsList},
}
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/