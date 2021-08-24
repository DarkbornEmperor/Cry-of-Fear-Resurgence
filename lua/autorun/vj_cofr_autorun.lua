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
	VJ.AddNPC("Simon Henriksson","npc_vj_cofrc_simon",vCat)	

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
    VJ.AddNPC("Baby (Swimmer)","npc_vj_cofrc_baby_swimmer",vCat)		
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
    VJ.AddNPC("Slower 3 (Dream)","npc_vj_cofrc_slower3_dream",vCat)
    VJ.AddNPC("Slower (Mummy)","npc_vj_cofrc_slower_mummy",vCat)
	VJ.AddNPC("Zombie","npc_vj_cofrc_zombie",vCat)

    -- Bosses --
	VJ.AddNPC("Craigrunner","npc_vj_cofrc_craigrunner",vCat)	
	VJ.AddNPC("Dasubergator (Aquatic)","npc_vj_cofrc_dasubergator",vCat)
	VJ.AddNPC("Dasubergator (Ground)","npc_vj_cofrc_dasubergator2",vCat)		
	VJ.AddNPC("Duorunner","npc_vj_cofrc_duorunner",vCat)
	VJ.AddNPC("Faceless (Boss)","npc_vj_cofrc_faceless_boss",vCat)
	VJ.AddNPC("Jeffrunner","npc_vj_cofrc_jeffrunner",vCat)	
    VJ.AddNPC("Mace (Lifeguard)","npc_vj_cofrc_mace_swimmer",vCat)	
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
	VJ.AddNPC("Devourer","npc_vj_cofraom_devourer",vCat,false,function(x) x.OnCeiling = true x.Offset = 0 end)	
    VJ.AddNPC("Face","npc_vj_cofraom_face",vCat)
	VJ.AddNPC("Ghost","npc_vj_cofraom_ghost",vCat)
    VJ.AddNPC("Handcrab","npc_vj_cofraom_handcrab",vCat)	
    VJ.AddNPC("Hellhound","npc_vj_cofraom_hellhound",vCat)
    VJ.AddNPC("Spitter","npc_vj_cofraom_spitter",vCat)		
    VJ.AddNPC("Screamer","npc_vj_cofraom_screamer",vCat)	
    VJ.AddNPC("Twitcher","npc_vj_cofraom_twitcher",vCat)
	VJ.AddNPC("Twitcher (Dark Assistance)","npc_vj_cofraom_twitcher_da",vCat)
	VJ.AddNPC("Wheelchair Twitcher","npc_vj_cofraom_wheelchair",vCat)
	
	-- Bosses --
    VJ.AddNPC("The Addiction","npc_vj_cofraom_addiction",vCat)
	
    -- Friendlies --
    VJ.AddNPC_HUMAN("David Leatherhoff","npc_vj_cofraom_david",{"weapon_vj_cofraom_glock"},vCat)
    VJ.AddNPC_HUMAN("David Leatherhoff (Dark Assistance)","npc_vj_cofraom_david_da",{"weapon_vj_cofraom_glock"},vCat)
    VJ.AddNPC_HUMAN("Assistor","npc_vj_cofraom_assistor_da",{"weapon_vj_cofraom_glock"},vCat)
	
    -- AoM:DC Random & Spawners --
	VJ.AddNPC("Monster Map Spawner","sent_vj_cofraom_mapspawner",vCat)	
	VJ.AddNPC("Random Monster","sent_vj_cofraom_mon",vCat)	
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofraom_mon_sp",vCat)
	VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofraom_mon_sinsp",vCat)
	
    -- AoM:DC Weapons --
	VJ.AddNPCWeapon("VJ_COFRAOM_Shotgun", "weapon_vj_cofraom_shotgun") 
	VJ.AddNPCWeapon("VJ_COFRAOM_Knife", "weapon_vj_cofraom_knife") 
	VJ.AddNPCWeapon("VJ_COFRAOM_Glock", "weapon_vj_cofraom_glock") 
	
    -- AoM:DC Entities
    VJ.AddEntity("Pills","sent_vj_cofraom_pills","Darkborn",true,0,true,vCat)	
	
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
    util.PrecacheModel("models/vj_cofr/aom/david.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_da.mdl")
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
    util.PrecacheModel("models/vj_cofr/aom/w_glock.mdl")
    util.PrecacheModel("models/vj_cofr/aom/w_kitchenknife.mdl") 
    util.PrecacheModel("models/vj_cofr/aom/w_shotgun.mdl") 	
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
	local AddConvars = {}
	AddConvars["VJ_COFR_Boss_Music"] = 1
	AddConvars["VJ_COFR_Twitcher_Invisible"] = 1
	AddConvars["VJ_COFR_Addiction_SelfDamage"] = 1
	AddConvars["VJ_COFR_Sawcrazy_RadiusDamage"] = 0
	AddConvars["VJ_COFR_FaceHead_SummonFaceless"] = 1
	AddConvars["VJ_COFR_Slower_HeadGib"] = 1
	AddConvars["VJ_COFR_Suicider_DropGlock"] = 0
	AddConvars["VJ_COFR_Suicider_Headshot"] = 1 	
	AddConvars["VJ_COFR_Ghost_SlowSound"] = 0
	AddConvars["VJ_COFR_Assistor_Flashlight"] = 0 	
	
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
				VJ_COFR_Sawcrazy_RadiusDamage = "0",
				VJ_COFR_FaceHead_SummonFaceless = "1",
				VJ_COFR_Slower_HeadGib = "1",
				VJ_COFR_Suicider_DropGlock = "0",
				VJ_COFR_Suicider_Headshot = "1",
				VJ_COFR_Ghost_SlowSound = "0",
                VJ_COFR_Assistor_Flashlight = "0",				
}
            Panel:AddControl("ComboBox", vj_cofrreset)
            Panel:ControlHelp("NOTE: Only future spawned SNPCs will be affected!")
            Panel:AddControl("Checkbox", {Label ="Enable boss nusic?", Command ="VJ_COFR_Boss_Music"})
            Panel:AddControl("Checkbox", {Label ="Enable transparent/invisible Twitchers?", Command ="VJ_COFR_Twitcher_Invisible"})
            Panel:AddControl("Checkbox", {Label ="Enable self-damage for Addiction?", Command ="VJ_COFR_Addiction_SelfDamage"})
			Panel:AddControl("Checkbox", {Label ="Enable radius damage for Sawcrazy?", Command ="VJ_COFR_Sawcrazy_RadiusDamage"})
			Panel:AddControl("Checkbox", {Label ="Enable The Face to summon Faceless?", Command ="VJ_COFR_FaceHead_SummonFaceless"})
            Panel:AddControl("Checkbox", {Label ="Enable head gibbing for Slowers & Suiciders?", Command ="VJ_COFR_Slower_HeadGib"})
            Panel:AddControl("Checkbox", {Label ="Enable Suiciders dropping Glocks & ammo on death?", Command ="VJ_COFR_Suicider_DropGlock"})
            Panel:AddControl("Checkbox", {Label ="Enable instant headshot for Suicider?", Command ="VJ_COFR_Suicider_Headshot"})			
            Panel:AddControl("Checkbox", {Label ="Enable Ghost's special sound after being hit?", Command ="VJ_COFR_Ghost_SlowSound"})	
            Panel:AddControl("Checkbox", {Label ="Enable flashlight for Assistor?", Command ="VJ_COFR_Assistor_Flashlight"})				
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