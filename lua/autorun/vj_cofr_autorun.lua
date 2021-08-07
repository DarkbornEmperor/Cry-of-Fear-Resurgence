/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Cry of Fear Resurgence"
local AddonName = "Cry of Fear Resurgence"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_cofr_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	-- Cry of Fear --
	local vCat = "CoF Resurgence" 
	VJ.AddCategoryInfo(vCat, {Icon = "vj_cofr/icons/cofr.png"})
	
	-- Enemies
	VJ.AddNPC("Slower 1","npc_vj_cofr_slower1",vCat)	
    VJ.AddNPC("Slower 3","npc_vj_cofr_slower3",vCat)
	VJ.AddNPC("Slower No","npc_vj_cofr_slowerno",vCat)
	VJ.AddNPC("Slower 10","npc_vj_cofr_slower10",vCat)
	VJ.AddNPC("Slower 10-2","npc_vj_cofr_slower102",vCat)
	VJ.AddNPC("Crawler","npc_vj_cofr_crawler",vCat)
	VJ.AddNPC("Croucher","npc_vj_cofr_croucher",vCat)
	VJ.AddNPC("Upper","npc_vj_cofr_upper",vCat)
	VJ.AddNPC("Baby","npc_vj_cofr_baby",vCat) 
	VJ.AddNPC("Children","npc_vj_cofr_children",vCat)
    VJ.AddNPC("Faster","npc_vj_cofr_faster",vCat)
	VJ.AddNPC("Faster (Male)","npc_vj_cofr_fastermale",vCat)
    VJ.AddNPC("Drowned","npc_vj_cofr_drowned",vCat)
	VJ.AddNPC("Crazyrunner","npc_vj_cofr_crazyrunner",vCat)
	VJ.AddNPC("Sewmo","npc_vj_cofr_sewmo",vCat)
	VJ.AddNPC("Citalopram","npc_vj_cofr_citalopram",vCat)
	VJ.AddNPC("Faceless","npc_vj_cofr_faceless",vCat)
    VJ.AddNPC("Faceless (Crawler)","npc_vj_cofr_faceless2",vCat)
    VJ.AddNPC("Faceless (Faced)","npc_vj_cofr_faced",vCat)
    VJ.AddNPC("Faceless (Twister)","npc_vj_cofr_twister",vCat)
    VJ.AddNPC("Faceless (Twister Valve)","npc_vj_cofr_twisterv",vCat)	
	VJ.AddNPC("Krypandenej","npc_vj_cofr_krypandenej",vCat)
    VJ.AddNPC("Suicider","npc_vj_cofr_suicider",vCat)
	VJ.AddNPC("Taller","npc_vj_cofr_taller",vCat)
    VJ.AddNPC("Psycho","npc_vj_cofr_psycho",vCat)	
	VJ.AddNPC("Stranger","npc_vj_cofr_stranger",vCat)
	VJ.AddNPC("Spitter","npc_vj_cofr_spitter",vCat)
	VJ.AddNPC("Hanger","npc_vj_cofr_hanger",vCat)
	VJ.AddNPC("Flygare","npc_vj_cofr_flygare",vCat)
	VJ.AddNPC("Dreamer (Runner)","npc_vj_cofr_dreamerrunner",vCat)
	
	-- Bosses --
    VJ.AddNPC("Sawer","npc_vj_cofr_sawer",vCat)	
	VJ.AddNPC("Sawrunner","npc_vj_cofr_sawrunner",vCat)
	VJ.AddNPC("Mace","npc_vj_cofr_mace",vCat)
	VJ.AddNPC("Carcass","npc_vj_cofr_carcass",vCat)
	VJ.AddNPC("Sawcrazy","npc_vj_cofr_sawcrazy",vCat)
    VJ.AddNPC("Craig","npc_vj_cofr_craig",vCat)
	VJ.AddNPC("Book Simon","npc_vj_cofr_simonbook",vCat)	
    VJ.AddNPC("Book Simon (Manhunt)","npc_vj_cofr_simonbookm",vCat)
	VJ.AddNPC("Doctor Purnell","npc_vj_cofr_purnell",vCat)
	VJ.AddNPC("Sick Simon (Suicider)","npc_vj_cofr_simonsicksui",vCat)	
    VJ.AddNPC("Sick Simon","npc_vj_cofr_simonsick",vCat)

	-- Misc/Hazards --
	VJ.AddNPC("Dreamer","npc_vj_cofr_dreamer",vCat)	
	VJ.AddNPC("Hangman","npc_vj_cofr_hangman",vCat)
	VJ.AddNPC("Watro","npc_vj_cofr_watro",vCat)
    VJ.AddNPC("Human Flower","npc_vj_cofr_humanflower",vCat) 	
    VJ.AddNPC("The Face","npc_vj_cofr_facehead",vCat)	

	-- Custom Campaigns --	
	
    -- Enemies --	
    VJ.AddNPC("Faster (Clown)","npc_vj_cofrc_fasterclown",vCat)		
    VJ.AddNPC("Psycho (Pumpkin)","npc_vj_cofrc_psychopumpkin",vCat)
    VJ.AddNPC("CrazyruMpel","npc_vj_cofrc_crazyrumpel",vCat)
    VJ.AddNPC("Baby (Swimmer)","npc_vj_cofrc_babyswimmer",vCat)	
    VJ.AddNPC("Faster (Female)","npc_vj_cofrc_fasterfemale",vCat)	
    VJ.AddNPC("Slower 3 (Dream)","npc_vj_cofrc_slower3dream",vCat)	

    -- Bosses --
	VJ.AddNPC("Duorunner","npc_vj_cofrc_duorunner",vCat)
    VJ.AddNPC("Mace (Lifeguard)","npc_vj_cofrc_maceswimmer",vCat)	
    VJ.AddNPC("Slower No (Boss)","npc_vj_cofrc_slowernoboss",vCat)

    -- CoF Random & Spawners --
	VJ.AddNPC("Random Monster","sent_vj_cofr_mon",vCat)	
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofr_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofr_mon_sinsp",vCat)
    VJ.AddNPC("Map Monster Spawner","sent_vj_cofr_mapspawner",vCat)	
	
	-- Afraid of Monsters --
	vCat = "CoF Resurgence: AoM"
	VJ.AddCategoryInfo(vCat, {Icon = "vj_cofr/icons/cofraom.png"})
	
    -- Enemies --	
    VJ.AddNPC("Twitcher","npc_vj_cofraom_twitcher",vCat)
	VJ.AddNPC("Twitcher (Dark Assistance)","npc_vj_cofraom_twitcher_da",vCat)
    VJ.AddNPC("Handcrab","npc_vj_cofraom_handcrab",vCat)
	VJ.AddNPC("Wheelchair Twitcher","npc_vj_cofraom_wheelchair",vCat)
    VJ.AddNPC("Spitter","npc_vj_cofraom_spitter",vCat)
    VJ.AddNPC("Face","npc_vj_cofraom_face",vCat)
    VJ.AddNPC("Hellhound","npc_vj_cofraom_hellhound",vCat)		
	VJ.AddNPC("Ghost","npc_vj_cofraom_ghost",vCat)
    VJ.AddNPC("Screamer","npc_vj_cofraom_screamer",vCat)
	--VJ.AddNPC("Devourer","npc_vj_cofraom_mouth",vCat)
	
	-- Bosses --
    VJ.AddNPC("The Addiction","npc_vj_cofraom_addiction",vCat)

    -- AoM Random & Spawners --
	VJ.AddNPC("Random Monster","sent_vj_cofraom_mon",vCat)	
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofraom_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofraom_mon_sinsp",vCat)
    VJ.AddNPC("Map Monster Spawner","sent_vj_cofraom_mapspawner",vCat)		

    -- Decals --
    game.AddDecal("VJ_COFR_Blood_Red",{"vj_cofr/decals/cof_blood01","vj_cofr/decals/cof_blood02","vj_cofr/decals/cof_blood03","vj_cofr/decals/cof_blood04","vj_cofr/decals/cof_blood05","vj_cofr/decals/cof_blood06","vj_cofr/decals/cof_blood07"})
    game.AddDecal("VJ_COFR_Blood_Red_Large",{"vj_cofr/decals/cof_bigblood01","vj_cofr/decals/cof_bigblood02"})
    game.AddDecal("VJ_COFR_Spit",{"vj_cofr/decals/cof_spit01","vj_cofr/decals/cof_spit02"})
	
    -- Particles --
    game.AddParticles("particles/vj_cofr_soul.pcf")
    game.AddParticles("particles/vj_cofr_soul_splat.pcf")
    game.AddParticles("particles/vj_cofr_face.pcf")
    game.AddParticles("particles/vj_cofr_spit.pcf")
	game.AddParticles("particles/vj_cofr_spit_gib.pcf")
    game.AddParticles("particles/vj_cofr_flare_sparks.pcf")
	game.AddParticles("particles/vj_cofr_flare_trail.pcf") 
    game.AddParticles("particles/vj_cofr_blood.pcf")
    PrecacheParticleSystem("vj_cofr_blood_red")
    PrecacheParticleSystem("vj_cofr_blood_red_large")
    PrecacheParticleSystem("vj_cofr_blood_boob_red")	
    PrecacheParticleSystem("vj_cofr_soul")
    PrecacheParticleSystem("vj_cofr_soul_splat")
    PrecacheParticleSystem("vj_cofr_face")
    PrecacheParticleSystem("vj_cofr_spit")
	PrecacheParticleSystem("vj_cofr_spit_gib")
    PrecacheParticleSystem("vj_cofr_flare_sparks")
	PrecacheParticleSystem("vj_cofr_flare_trail")	
	
	-- Precache Models --
	util.PrecacheModel("models/vj_cofr/cof/slower1.mdl")
	util.PrecacheModel("models/vj_cofr/cof/crawler.mdl")
	util.PrecacheModel("models/vj_cofr/cof/croucher.mdl")
	util.PrecacheModel("models/vj_cofr/cof/slower3.mdl")
	util.PrecacheModel("models/vj_cofr/cof/slowerno.mdl")
	util.PrecacheModel("models/vj_cofr/cof/slower10.mdl")
	util.PrecacheModel("models/vj_cofr/cof/slower102.mdl")	
	util.PrecacheModel("models/vj_cofr/cof/baby.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faster.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faster2.mdl")
	util.PrecacheModel("models/vj_cofr/cof/drowned.mdl")
	util.PrecacheModel("models/vj_cofr/cof/sewmo.mdl")
	util.PrecacheModel("models/vj_cofr/cof/crazyrunner.mdl")
	util.PrecacheModel("models/vj_cofr/cof/children.mdl")
	util.PrecacheModel("models/vj_cofr/cof/citalopram.mdl")
	util.PrecacheModel("models/vj_cofr/cof/krypandenej.mdl")
	util.PrecacheModel("models/vj_cofr/cof/children.mdl")	
	util.PrecacheModel("models/vj_cofr/cof/faceless.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faceless2.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faceless3.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faceless_twister.mdl")
	util.PrecacheModel("models/vj_cofr/cof/faceless_twisterv.mdl")
    util.PrecacheModel("models/vj_cofr/cof/upper.mdl")
    util.PrecacheModel("models/vj_cofr/cof/suicider.mdl")
    util.PrecacheModel("models/vj_cofr/cof/psycho.mdl")
    util.PrecacheModel("models/vj_cofr/cof/taller.mdl")
    util.PrecacheModel("models/vj_cofr/cof/stranger.mdl")
    util.PrecacheModel("models/vj_cofr/cof/spitter.mdl")
    util.PrecacheModel("models/vj_cofr/cof/hanger.mdl")
    util.PrecacheModel("models/vj_cofr/cof/hangman.mdl")
    util.PrecacheModel("models/vj_cofr/cof/flygare.mdl")
    util.PrecacheModel("models/vj_cofr/cof/dreamer.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/dreamerrunner.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sawer.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sawrunner.mdl")
    util.PrecacheModel("models/vj_cofr/cof/mace.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sawcrazy.mdl")
    util.PrecacheModel("models/vj_cofr/cof/carcass.mdl")
    util.PrecacheModel("models/vj_cofr/cof/craig.mdl")
    util.PrecacheModel("models/vj_cofr/cof/booksimon.mdl")
    util.PrecacheModel("models/vj_cofr/cof/booksimon_m.mdl")
    util.PrecacheModel("models/vj_cofr/cof/doctor.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sicksimon_sui.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/sicksimon.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/humanflower.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/watro.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/bullsquid.mdl")
    util.PrecacheModel("models/vj_cofr/aom/headcrab.mdl")
    util.PrecacheModel("models/vj_cofr/aom/controller.mdl")
	util.PrecacheModel("models/vj_cofr/aom/ghost.mdl")
	util.PrecacheModel("models/vj_cofr/aom/black_dog.mdl")
    util.PrecacheModel("models/vj_cofr/aom/agrunt.mdl")
    util.PrecacheModel("models/vj_cofr/aom/mouth_monster.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_monster.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/wheelchair_monster.mdl") 	
	util.PrecacheModel("models/vj_cofr/aom/zombie.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie2.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie3.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie4.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie5.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie2_1.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie2_2.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie2_3.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie2_4.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie2_5.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie3_1.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie3_2.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie3_3.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie3_4.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie3_5.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie4_1.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie4_2.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie4_3.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie4_4.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombie4_5.mdl")	
	util.PrecacheModel("models/vj_cofr/aom/zombie4_5.mdl")
    util.PrecacheModel("models/vj_cofr/custom/faster_clown.mdl")
    util.PrecacheModel("models/vj_cofr/custom/duorunner.mdl")
    util.PrecacheModel("models/vj_cofr/custom/psychopumpkin.mdl")
    util.PrecacheModel("models/vj_cofr/custom/slowerno_boss.mdl") 
    util.PrecacheModel("models/vj_cofr/custom/crazyrumpel.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/faster_female.mdl")
    util.PrecacheModel("models/vj_cofr/custom/baby_swimmer.mdl")
    util.PrecacheModel("models/vj_cofr/custom/baby_swimmer2.mdl")
    util.PrecacheModel("models/vj_cofr/custom/mace_swimmer.mdl") 
    util.PrecacheModel("models/vj_cofr/custom/slower3_dream.mdl")

	-- ConVars --
	local AddConvars = {}
	AddConvars["VJ_COFR_Boss_Music"] = 1
	AddConvars["VJ_COFR_Twitcher_Invisible"] = 1
	AddConvars["VJ_COFR_Addiction_SelfDamage"] = 1
	
    -- Map Spawner ConVars --
    --AddConvars["VJ_COFR_MapSpawner_Music"] = 1
	AddConvars["VJ_COFR_MapSpawner_Enabled"] = 1
	AddConvars["VJ_COFR_MapSpawner_Boss"] = 0
	AddConvars["VJ_COFR_MapSpawner_MaxMon"] = 80
	AddConvars["VJ_COFR_MapSpawner_HordeCount"] = 35
	AddConvars["VJ_COFR_MapSpawner_SpawnMax"] = 2000
	AddConvars["VJ_COFR_MapSpawner_SpawnMin"] = 650
	AddConvars["VJ_COFR_MapSpawner_HordeChance"] = 100
	AddConvars["VJ_COFR_MapSpawner_HordeCooldownMin"] = 120
	AddConvars["VJ_COFR_MapSpawner_HordeCooldownMax"] = 180
	AddConvars["VJ_COFR_MapSpawner_DelayMin"] = 0.85
	AddConvars["VJ_COFR_MapSpawner_DelayMax"] = 3
	
		for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
end	
    -- Main Configure Menu --	
    if (CLIENT) then
        local function VJ_COFR_MAIN(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not nn Admin!"})
				Panel:ControlHelp("Note: Only Admins can change these settings!")
        return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins can change these settings!"})
			local vj_cofrreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_cofrreset.Options["#vjbase.menugeneral.default"] = { 
				VJ_COFR_Boss_Music = "1",
				VJ_COFR_Twitcher_Invisible = "1",
				VJ_COFR_Addiction_SelfDamage = "1",
}
            Panel:AddControl("ComboBox", vj_cofrreset)
            Panel:ControlHelp("NOTE: Only future spawned SNPCs will be affected!")
            Panel:AddControl("Checkbox", {Label ="Enable Boss Music?", Command ="VJ_COFR_Boss_Music"})
            Panel:AddControl("Checkbox", {Label ="Enable Transparent/Invisible Twitchers?", Command ="VJ_COFR_Twitcher_Invisible"})
            Panel:AddControl("Checkbox", {Label ="Enable Self-Damage for Addiction?", Command ="VJ_COFR_Addiction_SelfDamage"})
            Panel:AddPanel(typebox)

end
	 function VJ_ADDTOMENU_COFR(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","CoF Resurgence (Main)","CoF Resurgence (Main)","","", VJ_COFR_MAIN, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_COFR", VJ_ADDTOMENU_COFR )
		
    -- Map Spawner Configure Menu --
       local function VJ_COFR_MAPSPAWNER(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not nn Admin!"})
				Panel:ControlHelp("Note: Only Admins can change these settings!")
        return
	end
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins can change these settings!"})
			local vj_cofrreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_cofrreset_mapspawner.Options["#vjbase.menugeneral.default"] = { 
			    --VJ_COFR_MapSpawner_Music = "1",
				VJ_COFR_MapSpawner_Enabled = "1",
				VJ_COFR_MapSpawner_Boss = "0",
				VJ_COFR_MapSpawner_MaxMon = "80",	
				VJ_COFR_MapSpawner_HordeCount = "35",	
				VJ_COFR_MapSpawner_SpawnMax = "2000",	
				VJ_COFR_MapSpawner_SpawnMin = "650",	
				VJ_COFR_MapSpawner_HordeChance = "100",	
				VJ_COFR_MapSpawner_HordeCooldownMin = "120",	
				VJ_COFR_MapSpawner_HordeCooldownMax = "180",	
				VJ_COFR_MapSpawner_DelayMin = "0.85",
                VJ_COFR_MapSpawner_DelayMax = "3",				
}
            Panel:AddControl("ComboBox", vj_cofrreset_mapspawner)
            --Panel:AddControl("Checkbox", {Label ="Enable music?", Command ="VJ_COFR_MapSpawner_Music"})
            Panel:AddControl("Checkbox", {Label = "Enable Map Spawner processing?", Command = "VJ_COFR_MapSpawner_Enabled"})
            Panel:AddControl("Checkbox", {Label ="Enable bosses?", Command ="VJ_COFR_MapSpawner_Boss"})
            Panel:AddControl("Slider", { Label 	= "Max Monsters", Command = "VJ_COFR_MapSpawner_MaxMon", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Min Distance they can spawn from players", Command = "VJ_COFR_MapSpawner_SpawnMin", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Max Distance they can spawn from players", Command = "VJ_COFR_MapSpawner_SpawnMax", Type = "Float", Min = "150", Max = "30000"})
            Panel:AddControl("Slider", { Label 	= "Min time between spawns", Command = "VJ_COFR_MapSpawner_DelayMin", Type = "Float", Min = "0.1", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max time between spawns", Command = "VJ_COFR_MapSpawner_DelayMax", Type = "Float", Min = "0.2", Max = "15"})
            Panel:AddControl("Slider", { Label 	= "Max Monster horde", Command = "VJ_COFR_MapSpawner_HordeCount", Type = "Float", Min = "5", Max = "400"})
            Panel:AddControl("Slider", { Label 	= "Chance that a horde will appear", Command = "VJ_COFR_MapSpawner_HordeChance", Type = "Float", Min = "1", Max = "500"})
            Panel:AddControl("Slider", { Label 	= "Min cooldown time for horde spawns", Command = "VJ_COFR_MapSpawner_HordeCooldownMin", Type = "Float", Min = "1", Max = "800"})
            Panel:AddControl("Slider", { Label 	= "Max cooldown time for horde spawns", Command = "VJ_COFR_MapSpawner_HordeCooldownMax", Type = "Float", Min = "1", Max = "800"})
            Panel:AddPanel(typebox)
end
	function VJ_ADDTOMENU_COFR_MAPSPAWNER(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","CoF Resurgence (MapSp)","CoF Resurgence (MapSp)","","", VJ_COFR_MAPSPAWNER, {} )
end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_COFR_MAPSPAWNER", VJ_ADDTOMENU_COFR_MAPSPAWNER )
end	

	VJ_COFR_NODEPOS = {}
	hook.Add("EntityRemoved","VJ_COFR_AddNodes",function(ent)
		if ent:GetClass() == "info_node" then
			table.insert(VJ_COFR_NODEPOS,ent:GetPos())
	end
end)
	
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end