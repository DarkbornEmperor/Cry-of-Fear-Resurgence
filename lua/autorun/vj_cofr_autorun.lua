/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
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
	local vCat = "CoF Resurgence: CoF" 
	VJ.AddCategoryInfo(vCat, {Icon = "vj_cofr/icons/cofr.png"})
	
	-- Enemies
	VJ.AddNPC("Baby","npc_vj_cofr_baby",vCat)
	VJ.AddNPC("Children","npc_vj_cofr_children",vCat)
	VJ.AddNPC("Citalopram","npc_vj_cofr_citalopram",vCat)
	VJ.AddNPC("Crawler","npc_vj_cofr_crawler",vCat)
	VJ.AddNPC("Crazyrunner","npc_vj_cofr_crazyrunner",vCat)
	VJ.AddNPC("Croucher","npc_vj_cofr_croucher",vCat)
	VJ.AddNPC("Dreamer (Runner)","npc_vj_cofr_dreamer_runner",vCat)	
    VJ.AddNPC("Drowned","npc_vj_cofr_drowned",vCat)
	VJ.AddNPC("Faceless","npc_vj_cofr_faceless",vCat)
    VJ.AddNPC("Faceless (Crawler)","npc_vj_cofr_faceless_crawler",vCat)
    VJ.AddNPC("Faceless (Faced)","npc_vj_cofr_faceless_faced",vCat)
    VJ.AddNPC("Faceless (Twister)","npc_vj_cofr_faceless_twister",vCat)
    VJ.AddNPC("Faceless (Twister Valve)","npc_vj_cofr_faceless_twisterv",vCat)	
    VJ.AddNPC("Faster","npc_vj_cofr_faster",vCat)
	VJ.AddNPC("Faster (Male)","npc_vj_cofr_faster_male",vCat)
	VJ.AddNPC("Flygare","npc_vj_cofr_flygare",vCat)	
	VJ.AddNPC("Krypandenej","npc_vj_cofr_krypandenej",vCat)	
    VJ.AddNPC("Psycho","npc_vj_cofr_psycho",vCat)	
 	VJ.AddNPC("Sewmo","npc_vj_cofr_sewmo",vCat)	
	VJ.AddNPC("Slower 1","npc_vj_cofr_slower1",vCat)	
    VJ.AddNPC("Slower 3","npc_vj_cofr_slower3",vCat)
	VJ.AddNPC("Slower No","npc_vj_cofr_slowerno",vCat)
	VJ.AddNPC("Slower 10","npc_vj_cofr_slower10",vCat)
	VJ.AddNPC("Slower 10-2","npc_vj_cofr_slower102",vCat)
	VJ.AddNPC("Spitter","npc_vj_cofr_spitter",vCat)	
	VJ.AddNPC("Stranger","npc_vj_cofr_stranger",vCat)
    VJ.AddNPC("Suicider","npc_vj_cofr_suicider",vCat)
	VJ.AddNPC("Taller","npc_vj_cofr_taller",vCat)		
	VJ.AddNPC("Upper","npc_vj_cofr_upper",vCat)
	
	-- Bosses --
	VJ.AddNPC("Book Simon","npc_vj_cofr_simonbook",vCat)	
    VJ.AddNPC("Book Simon (Manhunt)","npc_vj_cofr_simonbook_mh",vCat)	
	VJ.AddNPC("Carcass","npc_vj_cofr_carcass",vCat)
    VJ.AddNPC("Craig","npc_vj_cofr_craig",vCat)
	VJ.AddNPC("Doctor Purnell","npc_vj_cofr_purnell",vCat)
	VJ.AddNPC("Mace","npc_vj_cofr_mace",vCat)
	VJ.AddNPC("Sawcrazy","npc_vj_cofr_sawcrazy",vCat)	
    VJ.AddNPC("Sawer","npc_vj_cofr_sawer",vCat)	
	VJ.AddNPC("Sawrunner","npc_vj_cofr_sawrunner",vCat)
    VJ.AddNPC("Sick Simon","npc_vj_cofr_simonsick",vCat)	
	VJ.AddNPC("Sick Simon (Suicider)","npc_vj_cofr_simonsick_sui",vCat)	
	
	-- Friendlies --
	VJ.AddNPC("Simon Henriksson","npc_vj_cofr_simon",vCat)
	VJ.AddNPC("Simon Henriksson (Beta)","npc_vj_cofr_simonbeta",vCat)
    VJ.AddNPC("Police Officer","npc_vj_cofr_police",vCat)
	VJ.AddNPC("Sawrunner (Friendly)","npc_vj_cofr_sawrunner_fri",vCat)	

	-- Misc/Hazards --
	VJ.AddNPC("Dreamer","npc_vj_cofr_dreamer",vCat)
	VJ.AddNPC("Hanger","npc_vj_cofr_hanger",vCat)	
	VJ.AddNPC("Hangman","npc_vj_cofr_hangman",vCat)
    VJ.AddNPC("Human Flower","npc_vj_cofr_humanflower",vCat) 		
    VJ.AddNPC("The Face","npc_vj_cofr_facehead",vCat)	
	VJ.AddNPC("Watro","npc_vj_cofr_watro",vCat)

    -- CoF Random & Spawners --
	VJ.AddNPC("Monster Map Spawner","sent_vj_cofr_mapspawner",vCat)	
	VJ.AddNPC("Random Monster","sent_vj_cofr_mon",vCat)	
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofr_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofr_mon_sinsp",vCat)

	-- Custom Campaigns --	
	local vCat = "CoF Resurgence: CC/Misc" 
	VJ.AddCategoryInfo(vCat, {Icon = "vj_cofr/icons/cofr.png"})
	
    -- Enemies --
    VJ.AddNPC("Baby (Out of It)","npc_vj_cofrc_baby_ooi",vCat)		
    VJ.AddNPC("CrazyruMpel","npc_vj_cofrc_crazyrumpel",vCat)
    VJ.AddNPC("Crazyrunner (Mummy)","npc_vj_cofrc_crazyrunner_mummy",vCat)	
    VJ.AddNPC("Cutter","npc_vj_cofrc_cutter",vCat)
    VJ.AddNPC("Faceless (Mummy)","npc_vj_cofrc_faceless_mummy",vCat)
    VJ.AddNPC("Faceless (Mummy Crawler)","npc_vj_cofrc_faceless_mummycrawl",vCat)
    VJ.AddNPC("Faceless (Stone)","npc_vj_cofrc_faceless_stone",vCat)
    VJ.AddNPC("Faceless (Mummy Twister)","npc_vj_cofrc_faceless_mummytwister",vCat)	
    VJ.AddNPC("Faster (Clown)","npc_vj_cofrc_faster_clown",vCat)
    VJ.AddNPC("Faster (Out of It)","npc_vj_cofrc_faster_ooi",vCat)
    VJ.AddNPC("Generic Genome","npc_vj_cofrc_genome_generic",vCat)	
    VJ.AddNPC("Genome Soldier","npc_vj_cofrc_genome_soldier",vCat)
    VJ.AddNPC("Mother","npc_vj_cofrc_mother",vCat)	
	VJ.AddNPC("Patrick Bateman","npc_vj_cofrc_patrick",vCat)
    VJ.AddNPC("Pedoslow","npc_vj_cofrc_pedoslow",vCat)
    VJ.AddNPC("Psycho (Lost Echo)","npc_vj_cofrc_psycho_le",vCat)
    VJ.AddNPC("Shaimoon (Gold)","npc_vj_cofrc_shaimoon_gold",vCat)	
    VJ.AddNPC("Sick Sophie","npc_vj_cofrc_sicksophie",vCat)		
    VJ.AddNPC("Slower 3 (Out of It)","npc_vj_cofrc_slower3_ooi",vCat)
    VJ.AddNPC("Slower 1 (Mummy)","npc_vj_cofrc_slower1_mummy",vCat)
	VJ.AddNPC("Zombie","npc_vj_cofrc_zombie",vCat)

    -- Bosses --
	VJ.AddNPC("Craigrunner","npc_vj_cofrc_craigrunner",vCat)	
	VJ.AddNPC("Dasubergator (Aquatic)","npc_vj_cofrc_dasubergator",vCat)
	VJ.AddNPC("Dasubergator (Ground)","npc_vj_cofrc_dasubergator2",vCat)		
	VJ.AddNPC("Duorunner","npc_vj_cofrc_duorunner",vCat)
	VJ.AddNPC("Faceless (Boss)","npc_vj_cofrc_faceless_boss",vCat)
	VJ.AddNPC("Jeffrunner","npc_vj_cofrc_jeffrunner",vCat)	
    VJ.AddNPC("Mace (Out of It)","npc_vj_cofrc_mace_ooi",vCat)	
	VJ.AddNPC("Patrick Bateman (Boss)","npc_vj_cofrc_patrick_boss",vCat)
    VJ.AddNPC("Psycho (Pumpkin)","npc_vj_cofrc_psycho_pumpkin",vCat)
    VJ.AddNPC("Shaimoon","npc_vj_cofrc_shaimoon",vCat)
	VJ.AddNPC("Sick Simon (Book)","npc_vj_cofrc_simonbook_sick",vCat)		
    VJ.AddNPC("Slower No (Boss)","npc_vj_cofrc_slowerno_boss",vCat)
    VJ.AddNPC("The Mummy","npc_vj_cofrc_mummy",vCat)

	-- Misc/Hazards --
	VJ.AddNPC("Meatman","npc_vj_cofrc_meatman",vCat)		
    VJ.AddNPC("The Face (Out of It)","npc_vj_cofrc_facehead_ooi",vCat)		
	
	-- Afraid of Monsters: Director's Cut --
	vCat = "CoF Resurgence: AoM:DC"
	VJ.AddCategoryInfo(vCat, {Icon = "vj_cofr/icons/cofraom.png"})
	
    -- Enemies --			
    VJ.AddNPC("Face","npc_vj_cofraom_face",vCat)
	VJ.AddNPC("Ghost","npc_vj_cofraom_ghost",vCat)
    VJ.AddNPC("Handcrab","npc_vj_cofraom_handcrab",vCat)	
    VJ.AddNPC("Hellhound","npc_vj_cofraom_hellhound",vCat)
    VJ.AddNPC("Spitter","npc_vj_cofraom_spitter",vCat)		
    VJ.AddNPC("Screamer","npc_vj_cofraom_screamer",vCat)	
    VJ.AddNPC("Twitcher 1","npc_vj_cofraom_twitcher1",vCat)
    VJ.AddNPC("Twitcher 2","npc_vj_cofraom_twitcher2",vCat)
    VJ.AddNPC("Twitcher 3","npc_vj_cofraom_twitcher3",vCat)
    VJ.AddNPC("Twitcher 4","npc_vj_cofraom_twitcher4",vCat)	
	VJ.AddNPC("Twitcher (Dark Assistance)","npc_vj_cofraom_twitcher_da",vCat)
	VJ.AddNPC("Wheelchair Twitcher","npc_vj_cofraom_wheelchair",vCat)
	
	-- Bosses --
    VJ.AddNPC("The Addiction","npc_vj_cofraom_addiction",vCat)
	
    -- Friendlies --
    VJ.AddNPC("David Leatherhoff","npc_vj_cofraom_david",vCat)
	VJ.AddNPC("David Leatherhoff (Dead)","npc_vj_cofraom_david_dead",vCat)
    VJ.AddNPC("David Leatherhoff (Dark Assistance)","npc_vj_cofraom_david_da",vCat)
    VJ.AddNPC("Assistor","npc_vj_cofraom_assistor_da",vCat)

	-- Misc/Hazards --
	VJ.AddNPC("Devourer","npc_vj_cofraom_devourer",vCat,false,function(x) x.OnCeiling = true x.Offset = 0 end)	
	
    -- AoM:DC Random & Spawners --
	VJ.AddNPC("Monster Map Spawner","sent_vj_cofraom_mapspawner",vCat)	
	VJ.AddNPC("Random Monster","sent_vj_cofraom_mon",vCat)	
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofraom_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofraom_mon_sinsp",vCat)
	
    -- AoM:DC Entities
    VJ.AddEntity("Pills","sent_vj_cofraom_pills","Darkborn",true,0,true,vCat)	
    VJ.AddEntity("Pills (Dark Assistance)","sent_vj_cofraom_pills_da","Darkborn",true,0,true,vCat)
	
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
    util.PrecacheModel("models/vj_cofr/cof/w_syringe.mdl")		
    util.PrecacheModel("models/vj_cofr/cof/simon.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon_beta.mdl")	
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
	util.PrecacheModel("models/vj_cofr/cof/hookedhead.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/craig.mdl")
    util.PrecacheModel("models/vj_cofr/cof/booksimon.mdl")
    util.PrecacheModel("models/vj_cofr/cof/booksimon_m.mdl")
    util.PrecacheModel("models/vj_cofr/cof/doctor.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sicksimon_sui.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/sicksimon.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/humanflower.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/watro.mdl")
    util.PrecacheModel("models/vj_cofr/cof/facehead.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/police1.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/police2.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/police3.mdl")
    util.PrecacheModel("models/vj_cofr/cof/police4.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_browning.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_famas.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_g43.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_m16.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_m76.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_mp5.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_p345.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_revolver.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_rifle.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_shotgun.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_tmp.mdl")	
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_vp70.mdl")		
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_ooi_ak47.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_e3cc3_pickaxe.mdl") 
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_sledgeshovel.mdl")		
    util.PrecacheModel("models/vj_cofr/aom/david.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_da.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/david_dead.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/cross.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/question.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/scream.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/two.mdl")		
    util.PrecacheModel("models/vj_cofr/aom/bullsquid.mdl")
    util.PrecacheModel("models/vj_cofr/aom/headcrab.mdl")
    util.PrecacheModel("models/vj_cofr/aom/controller.mdl")
	util.PrecacheModel("models/vj_cofr/aom/ghost.mdl")
	util.PrecacheModel("models/vj_cofr/aom/black_dog.mdl")
    util.PrecacheModel("models/vj_cofr/aom/agrunt.mdl")
    util.PrecacheModel("models/vj_cofr/aom/mouth_monster.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_monster.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/wheelchair_monster.mdl") 	
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_glock.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_kitchenknife.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_shotgun.mdl")
    util.PrecacheModel("models/vj_cofr/aom/w_medkit.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/pill_bottle.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_beretta.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_deagle.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_l85.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_mp5k.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_p228.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_revolver.mdl")	
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_uzi.mdl")		
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
    util.PrecacheModel("models/vj_cofr/custom/craigrunnner.mdl")
    util.PrecacheModel("models/vj_cofr/custom/jeffrunner.mdl") 
    util.PrecacheModel("models/vj_cofr/custom/saw_bateman.mdl")
    util.PrecacheModel("models/vj_cofr/custom/patrick.mdl")
    util.PrecacheModel("models/vj_cofr/custom/faceless_boss.mdl")
    util.PrecacheModel("models/vj_cofr/custom/bosssimon.mdl")
    util.PrecacheModel("models/vj_cofr/custom/booksicksimon.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/genome_soldier1.mdl")
    util.PrecacheModel("models/vj_cofr/custom/generic_genole.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/slowermummy.mdl")
    util.PrecacheModel("models/vj_cofr/custom/pedoslow.mdl")
    util.PrecacheModel("models/vj_cofr/custom/monster_cutter.mdl")
    util.PrecacheModel("models/vj_cofr/custom/ooi_facehead.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/meatman.mdl")
    util.PrecacheModel("models/vj_cofr/custom/psycho_le.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/mother.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/crazymummy.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/facelessmummy.mdl")
    util.PrecacheModel("models/vj_cofr/custom/facelessmummy2.mdl")
    util.PrecacheModel("models/vj_cofr/custom/facelessmummy3.mdl")
    util.PrecacheModel("models/vj_cofr/custom/facelessstone.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/shaimoon.mdl")
    util.PrecacheModel("models/vj_cofr/custom/shaimoon_gold.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/sicksophie.mdl")
    util.PrecacheModel("models/vj_cofr/custom/themummy.mdl")	
    util.PrecacheModel("models/vj_cofr/custom/twistermummy.mdl")
    util.PrecacheModel("models/vj_cofr/custom/zombie.mdl")
    util.PrecacheModel("models/vj_cofr/custom/dasubergator.mdl")
    util.PrecacheModel("models/vj_cofr/custom/dasubergator2.mdl")		
    util.PrecacheModel("models/cof/weapons/glock/w_glock.mdl")
    util.PrecacheModel("models/cof/ammo/clip.mdl")	

	-- ConVars --
	VJ.AddConVar("VJ_COFR_Boss_Music", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Simon_Costumes", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_BookSimon_Normal", 1, {FCVAR_ARCHIVE})	
	VJ.AddConVar("VJ_COFR_Twitcher_Invisible", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Twitcher_RandomSounds", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Addiction_SelfDamage", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Mace_Damage", 1, {FCVAR_ARCHIVE})	
	VJ.AddConVar("VJ_COFR_Sawcrazy_RadiusDamage", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_FaceHead_SummonFaceless", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Slower_HeadGib", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Suicider_DropGlock", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_DropAmmo", 0, {FCVAR_ARCHIVE})	
	VJ.AddConVar("VJ_COFR_Suicider_Headshot", 1, {FCVAR_ARCHIVE})	
	VJ.AddConVar("VJ_COFR_Ghost_SlowSound", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Assistor_Flashlight", 0, {FCVAR_ARCHIVE}) 
	VJ.AddConVar("VJ_COFR_Stranger_ScreenEffect", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_Suicider_ExtraPistol", 0, {FCVAR_ARCHIVE})	
	
    -- Map Spawner ConVars --
    VJ.AddClientConVar("VJ_COFR_MapSpawner_Music", 1)
	VJ.AddClientConVar("VJ_COFR_MapSpawner_MusicVolume",50)
	VJ.AddConVar("VJ_COFR_MapSpawner_Enabled", 1, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_MapSpawner_Boss", 0, {FCVAR_ARCHIVE})
	VJ.AddConVar("VJ_COFR_MapSpawner_MaxMon", 80)
	VJ.AddConVar("VJ_COFR_MapSpawner_HordeCount", 35)
	VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMax", 2000)
	VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMin", 650)
	VJ.AddConVar("VJ_COFR_MapSpawner_HordeChance", 100)
	VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMin", 120)
	VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMax", 180)
	VJ.AddConVar("VJ_COFR_MapSpawner_DelayMin", 0.85)
	VJ.AddConVar("VJ_COFR_MapSpawner_DelayMax", 3)
	
-- Main Configure Menu --	
      if CLIENT then
         hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_COFR", function()
		 spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoF Resurgence (Main)", "CoF Resurgence (Main)", "", "", function(Panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins can change these settings!"})
			local vj_cofrreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_cofrreset.Options["#vjbase.menugeneral.default"] = { 
				VJ_COFR_Boss_Music = "1",
				VJ_COFR_Simon_Costumes = "0",
				VJ_COFR_BookSimon_Normal = "1",
				VJ_COFR_Twitcher_Invisible = "1",
				VJ_COFR_Twitcher_RandomSounds = "0",
				VJ_COFR_Addiction_SelfDamage = "1",
				VJ_COFR_Mace_Damage = "1",				
				VJ_COFR_Sawcrazy_RadiusDamage = "1",
				VJ_COFR_FaceHead_SummonFaceless = "1",
				VJ_COFR_Slower_HeadGib = "1",
				VJ_COFR_Suicider_DropGlock = "0",
				VJ_COFR_DropAmmo = "0",				
				VJ_COFR_Suicider_Headshot = "1",
				VJ_COFR_Ghost_SlowSound = "1",
                VJ_COFR_Assistor_Flashlight = "0",
                VJ_COFR_Stranger_ScreenEffect = "1",
                VJ_COFR_Suicider_ExtraPistol = "0",				
}
            Panel:AddControl("ComboBox", vj_cofrreset)
            Panel:ControlHelp("NOTE: Only future spawned SNPCs will be affected!")
			Panel:AddControl( "Label", {Text = "Options:"})
            Panel:AddControl("Checkbox", {Label ="Enable boss music?", Command ="VJ_COFR_Boss_Music"})
			Panel:AddControl("Checkbox", {Label ="Enable costumes for Simon?", Command ="VJ_COFR_Simon_Costumes"})
			Panel:AddControl("Checkbox", {Label ="Enable only normal weapons for Book Simon?", Command ="VJ_COFR_BookSimon_Normal"})			
            Panel:AddControl("Checkbox", {Label ="Enable transparent/invisible Twitchers?", Command ="VJ_COFR_Twitcher_Invisible"})
			Panel:AddControl("Checkbox", {Label ="Enable random sounds for Twitchers?", Command ="VJ_COFR_Twitcher_RandomSounds"})
            Panel:AddControl("Checkbox", {Label ="Enable self-damage for Addiction?", Command ="VJ_COFR_Addiction_SelfDamage"})
            Panel:AddControl("Checkbox", {Label ="Enable original damage method for Mace?", Command ="VJ_COFR_Mace_Damage"})			
			Panel:AddControl("Checkbox", {Label ="Enable radius damage for Sawcrazy?", Command ="VJ_COFR_Sawcrazy_RadiusDamage"})
			Panel:AddControl("Checkbox", {Label ="Enable The Face to summon Faceless?", Command ="VJ_COFR_FaceHead_SummonFaceless"})
            Panel:AddControl("Checkbox", {Label ="Enable head gibbing for Slowers?", Command ="VJ_COFR_Slower_HeadGib"})
            Panel:AddControl("Checkbox", {Label ="Enable Suiciders dropping Glocks on death?", Command ="VJ_COFR_Suicider_DropGlock"})
            Panel:AddControl("Checkbox", {Label ="Enable SNPCs dropping ammo on death?", Command ="VJ_COFR_DropAmmo"})			
            Panel:AddControl("Checkbox", {Label ="Enable instant headshot for Suicider?", Command ="VJ_COFR_Suicider_Headshot"})			
            Panel:AddControl("Checkbox", {Label ="Enable Ghost's special sound after being hit?", Command ="VJ_COFR_Ghost_SlowSound"})	
            Panel:AddControl("Checkbox", {Label ="Enable flashlight for Assistor & Police Officers?", Command ="VJ_COFR_Assistor_Flashlight"})	
            Panel:AddControl("Checkbox", {Label ="Enable screen effect for Strangers?", Command ="VJ_COFR_Stranger_ScreenEffect"})	
            Panel:AddControl("Checkbox", {Label ="Enable P345 for Suiciders?", Command ="VJ_COFR_Suicider_ExtraPistol"})				
            Panel:AddPanel(typebox)
end)	
-- Map Spawner Configure Menu --
		 spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoF Resurgence (Map Spawner)", "CoF Resurgence (Map Spawner)", "", "", function(Panel)
			    Panel:AddControl("Checkbox", {Label ="Enable music?", Command ="VJ_COFR_MapSpawner_Music"})	
				Panel:AddControl("Slider", { Label 	= "Music Volume", Command = "VJ_COFR_MapSpawner_MusicVolume", Type = "Float", Min = "10", Max = "100"})				
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				Panel:AddControl("Label", {Text = "#vjbase.menu.general.admin.not"})
				Panel:AddControl( "Label", {Text = "#vjbase.menu.general.admin.only"})
    return
end
			Panel:AddControl( "Label", {Text = "Note: Only Admins can change these settings!"})
			local vj_cofrreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
			vj_cofrreset_mapspawner.Options["#vjbase.menugeneral.default"] = { 
			    VJ_COFR_MapSpawner_Music = "1",
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
			Panel:AddControl( "Label", {Text = "Options:"})
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
        end)
    end)
end
	VJ_COFR_NODEPOS = {}
	hook.Add("EntityRemoved","VJ_COFR_AddNodes",function(ent)
		if ent:GetClass() == "info_node" then
			table.insert(VJ_COFR_NODEPOS,ent:GetPos())
	end
end)

function VJ_COFR_DeathCode(ent)
    ent.Dead = true
    ent.Bleeds = false
    ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
    ent:SetSolid(SOLID_NONE)
    ent:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse.
 if GetConVarNumber("VJ_COFR_DropAmmo") == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end
 ent.DropCoFAmmo = {"weapon_cof_syringe","ent_cof_glock_ammo","ent_cof_g43_ammo","ent_cof_m16_ammo","ent_cof_p345_ammo","ent_cof_revolver_ammo","ent_cof_rifle_ammo","ent_cof_shotgun_ammo","ent_cof_tmp_ammo","ent_cof_vp70_ammo"}
	local pickedAmmoType = VJ_PICK(ent.DropCoFAmmo)
 if pickedAmmoType != false then	   
	local AmmoDrop = ents.Create(pickedAmmoType)	   
	   AmmoDrop:SetPos(ent:GetPos() + ent:OBBCenter())
	   AmmoDrop:SetLocalAngles(ent:GetAngles())	   
	   AmmoDrop:Spawn()
	   AmmoDrop:Activate()	   
		local phys = AmmoDrop:GetPhysicsObject()
			if IsValid(phys) then
				local dmgForce = (ent.SavedDmgInfo.force / 40)
				if ent.DeathAnimationCodeRan then
					dmgForce = ent:GetMoveVelocity() == defPos
end
				phys:SetMass(1)
				phys:ApplyForceCenter(dmgForce)
		end		
	end		
end
	
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