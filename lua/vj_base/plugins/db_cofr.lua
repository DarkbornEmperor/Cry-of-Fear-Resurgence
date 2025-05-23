/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
    VJ.AddPlugin("Cry of Fear Resurgence", "NPC")

    -- Cry of Fear --
    local spawnCategory = "CoF Resurgence: CoF"
    VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_cofr/icons/cofr.png"})

    -- Enemies
    VJ.AddNPC("Baby","npc_vj_cofr_baby",spawnCategory)
    VJ.AddNPC("Children","npc_vj_cofr_children",spawnCategory)
    VJ.AddNPC("Children (Early)","npc_vj_cofr_children_early",spawnCategory)
    VJ.AddNPC("Citalopram","npc_vj_cofr_citalopram",spawnCategory)
    VJ.AddNPC("Crawler","npc_vj_cofr_crawler",spawnCategory)
    VJ.AddNPC("Crazyrunner","npc_vj_cofr_crazyrunner",spawnCategory)
    VJ.AddNPC("Croucher","npc_vj_cofr_croucher",spawnCategory)
    VJ.AddNPC("Dreamer (Runner)","npc_vj_cofr_dreamer_runner",spawnCategory)
    VJ.AddNPC("Drowned","npc_vj_cofr_drowned",spawnCategory)
    VJ.AddNPC("Faceless","npc_vj_cofr_faceless",spawnCategory)
    VJ.AddNPC("Faceless (Crawler)","npc_vj_cofr_faceless_crawler",spawnCategory)
    VJ.AddNPC("Faceless (Faced)","npc_vj_cofr_faceless_faced",spawnCategory)
    VJ.AddNPC("Faceless (Twister)","npc_vj_cofr_faceless_twister",spawnCategory)
    VJ.AddNPC("Faceless (Twister Valve)","npc_vj_cofr_faceless_twisterv",spawnCategory)
    VJ.AddNPC("Faster","npc_vj_cofr_faster",spawnCategory)
    VJ.AddNPC("Faster (Male)","npc_vj_cofr_faster_male",spawnCategory)
    VJ.AddNPC("Flygare","npc_vj_cofr_flygare",spawnCategory)
    VJ.AddNPC("Krypandenej","npc_vj_cofr_krypandenej",spawnCategory)
    VJ.AddNPC("Psycho","npc_vj_cofr_psycho",spawnCategory)
    VJ.AddNPC("Sewmo","npc_vj_cofr_sewmo",spawnCategory)
    VJ.AddNPC("Slower 1","npc_vj_cofr_slower1",spawnCategory)
    VJ.AddNPC("Slower 3","npc_vj_cofr_slower3",spawnCategory)
    VJ.AddNPC("Slower No","npc_vj_cofr_slowerno",spawnCategory)
    VJ.AddNPC("Slower 10","npc_vj_cofr_slower10",spawnCategory)
    VJ.AddNPC("Slower 10-2","npc_vj_cofr_slower102",spawnCategory)
    VJ.AddNPC("Spitter","npc_vj_cofr_spitter",spawnCategory)
    VJ.AddNPC("Stranger","npc_vj_cofr_stranger",spawnCategory)
    VJ.AddNPC("Suicider","npc_vj_cofr_suicider",spawnCategory)
    VJ.AddNPC("Taller","npc_vj_cofr_taller",spawnCategory)
    VJ.AddNPC("Upper","npc_vj_cofr_upper",spawnCategory)

    -- Bosses --
    VJ.AddNPC("Book Simon","npc_vj_cofr_simonbook",spawnCategory)
    VJ.AddNPC("Book Simon (Beta)","npc_vj_cofr_simonbook_beta",spawnCategory)
    VJ.AddNPC("Book Simon (Manhunt)","npc_vj_cofr_simonbook_mh",spawnCategory)
    VJ.AddNPC("Carcass","npc_vj_cofr_carcass",spawnCategory)
    VJ.AddNPC("Craig","npc_vj_cofr_craig",spawnCategory)
    VJ.AddNPC("Doctor Purnell","npc_vj_cofr_purnell",spawnCategory)
    VJ.AddNPC("Mace","npc_vj_cofr_mace",spawnCategory)
    VJ.AddNPC("Sawcrazy","npc_vj_cofr_sawcrazy",spawnCategory)
    VJ.AddNPC("Sawer","npc_vj_cofr_sawer",spawnCategory)
    VJ.AddNPC("Sawrunner","npc_vj_cofr_sawrunner",spawnCategory)
    VJ.AddNPC("Sick Simon","npc_vj_cofr_simonsick",spawnCategory)
    VJ.AddNPC("Sick Simon (Suicider)","npc_vj_cofr_simonsick_sui",spawnCategory)

    -- Friendlies --
    VJ.AddNPC("Doctor Purnell (Friendly)","npc_vj_cofr_purnell_fri",spawnCategory)
    VJ.AddNPC("Simon Henriksson","npc_vj_cofr_simon",spawnCategory)
    VJ.AddNPC("Simon Henriksson (Early)","npc_vj_cofr_simon_early",spawnCategory)
    VJ.AddNPC("Simon Henriksson (Beta)","npc_vj_cofr_simon_beta",spawnCategory)
    VJ.AddNPC("Simon Henriksson (Hoodless)","npc_vj_cofr_simon_hoodless",spawnCategory)
    //VJ.AddNPC("Simon Henriksson (Source)","npc_vj_cofr_simonsource",spawnCategory)
    VJ.AddNPC("Police Officer","npc_vj_cofr_police",spawnCategory)
    VJ.AddNPC("Sawrunner (Friendly)","npc_vj_cofr_sawrunner_fri",spawnCategory)

    -- Screamers/Hazards --
    VJ.AddNPC("Dreamer","npc_vj_cofr_dreamer",spawnCategory)
    VJ.AddNPC("Hanger","npc_vj_cofr_hanger",spawnCategory)
    VJ.AddNPC("Hangman","npc_vj_cofr_hangman",spawnCategory)
    VJ.AddNPC("Human Flower","npc_vj_cofr_humanflower",spawnCategory)
    VJ.AddNPC("The Face","npc_vj_cofr_facehead",spawnCategory)
    VJ.AddNPC("The Face (Jumpscare)","npc_vj_cofr_facehead_js",spawnCategory)
    VJ.AddNPC("Watro","npc_vj_cofr_watro",spawnCategory)

    -- Apparitions --
    VJ.AddNPC("Blacker","sent_vj_cofr_blacker",spawnCategory)
    VJ.AddNPC("Corpse","sent_vj_cofr_corpse",spawnCategory)
    VJ.AddNPC("Corpse (Hanging)","sent_vj_cofr_corpse_hanging",spawnCategory)
    VJ.AddNPC("Cutter","sent_vj_cofr_cutter",spawnCategory)
    VJ.AddNPC("Dead Victim","sent_vj_cofr_victim",spawnCategory)
    VJ.AddNPC("Dead Victim 2","sent_vj_cofr_victim2",spawnCategory)
    VJ.AddNPC("Ghost Corpse","sent_vj_cofr_ghostcorpse",spawnCategory)
    VJ.AddNPC("Ghost Woman","sent_vj_cofr_ghostwoman",spawnCategory)
    VJ.AddNPC("Hanged Body","sent_vj_cofr_hanged",spawnCategory)
    VJ.AddNPC("Police Officer (Dead)","sent_vj_cofr_police_dead",spawnCategory)
    VJ.AddNPC("Slower (Dead)","sent_vj_cofr_slower_dead",spawnCategory)

    -- CoF Random & Spawners --
    VJ.AddNPC("Monster Map Spawner","sent_vj_cofr_mapspawner",spawnCategory)
    VJ.AddNPC("Random Monster","sent_vj_cofr_mon",spawnCategory)
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofr_mon_sp",spawnCategory)
    VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofr_mon_sinsp",spawnCategory)

    -- Custom Campaigns -- All assets come from their respective Custom Campaigns: Halloween Collab, Lost Echo, Memories, Out of It, Recidivist & The Scrolls of Shaimoon
    local spawnCategory = "CoF Resurgence: Custom Campaigns"
    VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_cofr/icons/cofr.png"})

    -- Enemies --
    VJ.AddNPC("Baby (Out of It)","npc_vj_cofrc_baby_ooi",spawnCategory)
    VJ.AddNPC("CrazyruMpel","npc_vj_cofrc_crazyrumpel",spawnCategory)
    VJ.AddNPC("Crazyrunner (Mummy)","npc_vj_cofrc_crazyrunner_mummy",spawnCategory)
    VJ.AddNPC("Cutter","npc_vj_cofrc_cutter",spawnCategory)
    VJ.AddNPC("Faceless (Mummy)","npc_vj_cofrc_faceless_mummy",spawnCategory)
    VJ.AddNPC("Faceless (Mummy Crawler)","npc_vj_cofrc_faceless_mummycrawl",spawnCategory)
    VJ.AddNPC("Faceless (Stone)","npc_vj_cofrc_faceless_stone",spawnCategory)
    VJ.AddNPC("Faceless (Mummy Twister)","npc_vj_cofrc_faceless_mummytwister",spawnCategory)
    VJ.AddNPC("Faster (Clown)","npc_vj_cofrc_faster_clown",spawnCategory)
    VJ.AddNPC("Faster (Out of It)","npc_vj_cofrc_faster_ooi",spawnCategory)
    VJ.AddNPC("Generic Genome","npc_vj_cofrc_genome_generic",spawnCategory)
    VJ.AddNPC("Genome Soldier","npc_vj_cofrc_genome_soldier",spawnCategory)
    VJ.AddNPC("Mother","npc_vj_cofrc_mother",spawnCategory)
    VJ.AddNPC("Mother (Real)","npc_vj_cofrc_mother_real",spawnCategory)
    VJ.AddNPC("Patrick Bateman","npc_vj_cofrc_patrick",spawnCategory)
    VJ.AddNPC("Pedoslow","npc_vj_cofrc_pedoslow",spawnCategory)
    VJ.AddNPC("Psycho (Lost Echo)","npc_vj_cofrc_psycho_le",spawnCategory)
    VJ.AddNPC("Shaimoon (Gold)","npc_vj_cofrc_shaimoon_gold",spawnCategory)
    VJ.AddNPC("Sick Sophie","npc_vj_cofrc_sicksophie",spawnCategory)
    VJ.AddNPC("Skeleton","npc_vj_cofrc_skeleton",spawnCategory)
    VJ.AddNPC("Slower 3 (Out of It)","npc_vj_cofrc_slower3_ooi",spawnCategory)
    VJ.AddNPC("Slower 1 (Mummy)","npc_vj_cofrc_slower1_mummy",spawnCategory)

    -- Bosses --
    VJ.AddNPC("Blob","npc_vj_cofrc_blob",spawnCategory)
    VJ.AddNPC("Craigrunner","npc_vj_cofrc_craigrunner",spawnCategory)
    VJ.AddNPC("Dasubergator (Aquatic)","npc_vj_cofrc_dasubergator",spawnCategory)
    VJ.AddNPC("Dasubergator (Ground)","npc_vj_cofrc_dasubergator2",spawnCategory)
    VJ.AddNPC("Duorunner","npc_vj_cofrc_duorunner",spawnCategory)
    VJ.AddNPC("Faceless (Boss)","npc_vj_cofrc_faceless_boss",spawnCategory)
    VJ.AddNPC("Jeffrunner","npc_vj_cofrc_jeffrunner",spawnCategory)
    VJ.AddNPC("Mace (Out of It)","npc_vj_cofrc_mace_ooi",spawnCategory)
    VJ.AddNPC("Patrick Bateman (Boss)","npc_vj_cofrc_patrick_boss",spawnCategory)
    VJ.AddNPC("Pumpa","npc_vj_cofrc_pumpa",spawnCategory)
    VJ.AddNPC("Shaimoon","npc_vj_cofrc_shaimoon",spawnCategory)
    VJ.AddNPC("Sick Simon (Book)","npc_vj_cofrc_simonbook_sick",spawnCategory)
    VJ.AddNPC("Abomination","npc_vj_cofrc_abomination",spawnCategory)
    VJ.AddNPC("The Mummy","npc_vj_cofrc_mummy",spawnCategory)

    -- Friendlies --
    VJ.AddNPC("Robert","npc_vj_cofrc_robert",spawnCategory)
    VJ.AddNPC("Roderick Henriksson","npc_vj_cofrc_roderick",spawnCategory)

    -- Misc/Hazards --
    VJ.AddNPC("Meatman","npc_vj_cofrc_meatman",spawnCategory)
    VJ.AddNPC("The Face (Out of It)","npc_vj_cofrc_facehead_ooi",spawnCategory)

    -- Apparitions --
    VJ.AddNPC("Corpse","sent_vj_cofrc_corpse",spawnCategory)
    VJ.AddNPC("Meatman (Corpse)","sent_vj_cofrc_meatman_corpse",spawnCategory)

    -- Afraid of Monsters: Classic/Director's Cut/Dark Assistance --
    spawnCategory = "CoF Resurgence: AoM"
    VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_cofr/icons/cofraom.png"})

    -- Enemies --
    VJ.AddNPC("Face","npc_vj_cofraom_face",spawnCategory)
    VJ.AddNPC("Face (Classic)","npc_vj_cofraomc_face",spawnCategory)
    VJ.AddNPC("Ghost","npc_vj_cofraom_ghost",spawnCategory)
    VJ.AddNPC("Ghost (Classic)","npc_vj_cofraomc_ghost",spawnCategory)
    VJ.AddNPC("Handcrab","npc_vj_cofraom_handcrab",spawnCategory)
    VJ.AddNPC("Headcrab","npc_vj_cofraomc_headcrab",spawnCategory)
    VJ.AddNPC("Hellhound","npc_vj_cofraom_hellhound",spawnCategory)
    VJ.AddNPC("Hellhound (Classic)","npc_vj_cofraomc_hellhound",spawnCategory)
    VJ.AddNPC("Lurker","npc_vj_cofraomc_lurker",spawnCategory)
    VJ.AddNPC("Spitter","npc_vj_cofraom_spitter",spawnCategory)
    VJ.AddNPC("Spitter (Classic)","npc_vj_cofraomc_spitter",spawnCategory)
    VJ.AddNPC("Screamer","npc_vj_cofraom_screamer",spawnCategory)
    VJ.AddNPC("Screamer (Classic)","npc_vj_cofraomc_screamer",spawnCategory)
    VJ.AddNPC("Twitcher (Classic)","npc_vj_cofraomc_twitcher",spawnCategory)
    VJ.AddNPC("Twitcher 1","npc_vj_cofraom_twitcher1",spawnCategory)
    VJ.AddNPC("Twitcher 2","npc_vj_cofraom_twitcher2",spawnCategory)
    VJ.AddNPC("Twitcher 3","npc_vj_cofraom_twitcher3",spawnCategory)
    VJ.AddNPC("Twitcher 4","npc_vj_cofraom_twitcher4",spawnCategory)
    VJ.AddNPC("Twitcher (Dark Assistance)","npc_vj_cofraom_twitcher_da",spawnCategory)
    VJ.AddNPC("Wheelchair Twitcher","npc_vj_cofraom_wheelchair",spawnCategory)

    -- Bosses --
    VJ.AddNPC("The Addiction","npc_vj_cofraom_addiction",spawnCategory)

    -- Friendlies --
    VJ.AddNPC("Assistor","npc_vj_cofraom_assistor_da",spawnCategory)
    VJ.AddNPC("David Leatherhoff","npc_vj_cofraom_david",spawnCategory)
    VJ.AddNPC("David Leatherhoff (Classic)","npc_vj_cofraomc_david",spawnCategory)
    VJ.AddNPC("David Leatherhoff (Dead)","npc_vj_cofraom_david_dead",spawnCategory)
    VJ.AddNPC("David Leatherhoff (Dark Assistance)","npc_vj_cofraom_david_da",spawnCategory)
    VJ.AddNPC("David Leatherhoff (Early)","npc_vj_cofraomc_david_early",spawnCategory)
    VJ.AddNPC("David Leatherhoff (Old)","npc_vj_cofraomc_david_old",spawnCategory)
    //VJ.AddNPC("David Leatherhoff (Source)","npc_vj_cofraom_davidsource",spawnCategory)

    -- Misc/Hazards --
    VJ.AddNPC("Devourer","npc_vj_cofraom_devourer",spawnCategory,false,function(x) x.OnCeiling = true x.Offset = 0 end)
    VJ.AddNPC("Devourer (Classic)","npc_vj_cofraomc_devourer",spawnCategory,false,function(x) x.OnCeiling = true x.Offset = 0 end)

    -- Apparitions --
    VJ.AddNPC("Corpse","sent_vj_cofraom_corpse",spawnCategory)
    VJ.AddNPC("David (Hanging)","sent_vj_cofraom_davidhang",spawnCategory)
    VJ.AddNPC("David (Corpse)","sent_vj_cofraom_davidcorpse",spawnCategory)

    -- AoM:DC Random & Spawners --
    VJ.AddNPC("Monster Map Spawner","sent_vj_cofraom_mapspawner",spawnCategory)
    VJ.AddNPC("Random Monster","sent_vj_cofraom_mon",spawnCategory)
    VJ.AddNPC("Random Monster Spawner","sent_vj_cofraom_mon_sp",spawnCategory)
    VJ.AddNPC("Random Monster Spawner (Single)","sent_vj_cofraom_mon_sinsp",spawnCategory)

    -- AoM:DC Entities
    VJ.AddEntity("Pills","sent_vj_cofraom_pills","Darkborn",true,0,true,spawnCategory)
    VJ.AddEntity("Pills (Dark Assistance)","sent_vj_cofraom_pills_da","Darkborn",true,0,true,spawnCategory)

    -- Melee Weapon List
    VJ_COFR_MELEEWEAPONS_COF = {
        "weapon_vj_cofr_switchblade",
        "weapon_vj_cofr_nightstick",
        "weapon_vj_cofr_sledgehammer",
        "weapon_vj_cofr_branch",
        "weapon_vj_cofraom_axe",
        "weapon_vj_cofr_pickaxe",
        "weapon_vj_cofr_shovel",
        "weapon_vj_cofr_stone"
    }
    VJ_COFR_MELEEWEAPONS_AOMDC = {
        "weapon_vj_cofraom_knife",
        "weapon_vj_cofraom_hammer",
        "weapon_vj_cofraom_axe",
        "weapon_vj_cofraom_spear"
    }
    VJ_COFR_MELEEWEAPONS_AOMC = {
        "weapon_vj_cofraomc_knife",
    }

    -- Decals --
    game.AddDecal("VJ_COFR_Blood_Red",{"vj_cofr/decals/cof_blood01","vj_cofr/decals/cof_blood02","vj_cofr/decals/cof_blood03","vj_cofr/decals/cof_blood04","vj_cofr/decals/cof_blood05","vj_cofr/decals/cof_blood06","vj_cofr/decals/cof_blood07"})
    game.AddDecal("VJ_COFR_Blood_Red_Large",{"vj_cofr/decals/cof_bigblood01","vj_cofr/decals/cof_bigblood02"})
    game.AddDecal("VJ_COFR_Spit",{"vj_cofr/decals/cof_spit01","vj_cofr/decals/cof_spit02"})
    game.AddDecal("VJ_COFR_Scorch_Small", {"vj_cofr/decals/smscorch1", "vj_cofr/decals/smscorch2", "vj_cofr/decals/smscorch3"})
    game.AddDecal("VJ_COFR_Scorch", {"vj_cofr/decals/scorch1", "vj_cofr/decals/scorch2", "vj_cofr/decals/scorch3"})
    game.AddDecal("VJ_COFR_Impact", {"vj_cofr/decals/shot1", "vj_cofr/decals/shot2", "vj_cofr/decals/shot3", "vj_cofr/decals/shot4", "vj_cofr/decals/shot5"})

    -- Particles --
    VJ.AddParticle("particles/vj_cofr_blood.pcf", {
    "vj_cofr_blood_red",
    "vj_cofr_blood_red_large",
    "vj_cofr_blood_boob_red"
})
    VJ.AddParticle("particles/vj_cofr_flare_sparks.pcf", {
    "vj_cofr_flare_sparks"
})
    VJ.AddParticle("particles/vj_cofr_flare_trail.pcf", {
    "vj_cofr_flare_trail"
})
    VJ.AddParticle("particles/vj_cofr_weaponparticles.pcf", {
    "vj_cofr_muzzle"
})
    -- Precache Models -- No need for precache due to being GoldSrc and other bugs
    /*util.PrecacheModel("models/vj_cofr/cof/policedead.mdl")
    util.PrecacheModel("models/vj_cofr/cof/deadvictim.mdl")
    util.PrecacheModel("models/vj_cofr/cof/deadvictim2.mdl")
    util.PrecacheModel("models/vj_cofr/cof/cutters.mdl")
    util.PrecacheModel("models/vj_cofr/cof/slowerdead.mdl")
    util.PrecacheModel("models/vj_cofr/cof/blacker.mdl")
    util.PrecacheModel("models/vj_cofr/cof/ghostcorpse.mdl")
    util.PrecacheModel("models/vj_cofr/cof/ghostwoman.mdl")
    util.PrecacheModel("models/vj_cofr/cof/hangednerd.mdl")
    util.PrecacheModel("models/vj_cofr/cof/corpse.mdl")
    util.PrecacheModel("models/vj_cofr/cof/corpse_hanging.mdl")
    util.PrecacheModel("models/vj_cofr/cof/biden_box.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon_beta.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon_hoodless.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon_early.mdl")
    util.PrecacheModel("models/vj_cofr/cof/simon_source.mdl")
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
    util.PrecacheModel("models/vj_cofr/cof/children_early.mdl")
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
    util.PrecacheModel("models/vj_cofr/cof/doctor_friendly.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sicksimon_sui.mdl")
    util.PrecacheModel("models/vj_cofr/cof/sicksimon.mdl")
    util.PrecacheModel("models/vj_cofr/cof/humanflower.mdl")
    util.PrecacheModel("models/vj_cofr/cof/watro.mdl")
    util.PrecacheModel("models/vj_cofr/cof/facehead.mdl")
    util.PrecacheModel("models/vj_cofr/cof/facehead_js.mdl")
    util.PrecacheModel("models/vj_cofr/cof/police1.mdl")
    util.PrecacheModel("models/vj_cofr/cof/police2.mdl")
    util.PrecacheModel("models/vj_cofr/cof/police3.mdl")
    util.PrecacheModel("models/vj_cofr/cof/police4.mdl")
    util.PrecacheModel("models/vj_cofr/aom/corpse.mdl")
    util.PrecacheModel("models/vj_cofr/aom/corpse2.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_da.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_dead.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_hanging.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_corpse.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_source.mdl")
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
    util.PrecacheModel("models/vj_cofr/aom/classic/david.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/david_old.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/david_early.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/barnacle.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/bullsquid.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/headcrab.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/controller.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/ghost.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/houndeye.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/agrunt.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/icky.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie2.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie3.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie4.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie5.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie6.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie7.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie8.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie9.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie10.mdl")
    util.PrecacheModel("models/vj_cofr/aom/classic/zombie11.mdl")
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
    util.PrecacheModel("models/vj_cofr/custom/blob.mdl")
    util.PrecacheModel("models/vj_cofr/custom/tentacleboss.mdl")
    util.PrecacheModel("models/vj_cofr/custom/corpse2.mdl")
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
    util.PrecacheModel("models/vj_cofr/custom/robert.mdl")
    util.PrecacheModel("models/vj_cofr/custom/roderick.mdl")
    util.PrecacheModel("models/vj_cofr/custom/booksicksimon.mdl")
    util.PrecacheModel("models/vj_cofr/custom/genome_soldier1.mdl")
    util.PrecacheModel("models/vj_cofr/custom/generic_genole.mdl")
    util.PrecacheModel("models/vj_cofr/custom/slowermummy.mdl")
    util.PrecacheModel("models/vj_cofr/custom/pedoslow.mdl")
    util.PrecacheModel("models/vj_cofr/custom/monster_cutter.mdl")
    util.PrecacheModel("models/vj_cofr/custom/ooi_facehead.mdl")
    util.PrecacheModel("models/vj_cofr/custom/meatman.mdl")
    util.PrecacheModel("models/vj_cofr/custom/meatman_corpse.mdl")
    util.PrecacheModel("models/vj_cofr/custom/psycho_le.mdl")
    util.PrecacheModel("models/vj_cofr/custom/mother.mdl")
    util.PrecacheModel("models/vj_cofr/custom/realmother.mdl")
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
    util.PrecacheModel("models/vj_cofr/cof/w_syringe.mdl")
    util.PrecacheModel("models/vj_cofr/aom/w_medkit.mdl")
    util.PrecacheModel("models/vj_cofr/aom/pill_bottle.mdl")

    util.PrecacheModel("models/vj_cofr/cof/weapons/w_browning.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_famas.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_g43.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_m16.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_m76.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_mp5.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_p345.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_pt92.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_revolver.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_rifle.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_shotgun.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_tmp.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_vp70.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_ooi_ak47.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_e3cc3_pickaxe.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_sledgeshovel.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_stone.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_branch.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_nightstick.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_sledgehammer.mdl")
    util.PrecacheModel("models/vj_cofr/cof/weapons/w_switchblade.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_glock.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_kitchenknife.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_shotgun.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_beretta.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_deagle.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_l85.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_mp5k.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_p228.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_revolver.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_uzi.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_axe.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_hammer.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/w_spear.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_beretta.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_ak47.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_deagle.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_shotgun.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_knife.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/w_grenade.mdl")
    util.PrecacheModel("models/vj_cofr/aom/weapons/classic/grenade.mdl")*/

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
    VJ.AddConVar("VJ_COFR_Suicider_ExtraPistol", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_Suicider_NewSound", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_OldWepSounds", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_Human_Regen", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_Human_ReloadCover", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_Human_ReloadRun", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_Boss_Spawner", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_JoeBiden", 0, {FCVAR_ARCHIVE})
    VJ.AddClientConVar("VJ_COFR_SparkFX", 0, "Create GoldSrc-Style Sparks On Metal Surfaces")

    -- Map Spawner ConVars --
    VJ.AddClientConVar("VJ_COFR_MapSpawner_Music", 1, "Music For Map Spawner")
    VJ.AddClientConVar("VJ_COFR_MapSpawner_Ambience", 1, "Ambience For Map Spawner")
    VJ.AddClientConVar("VJ_COFR_MapSpawner_MusicVolume", 50, "Adjust Music Volume For Map Spawner")
    VJ.AddClientConVar("VJ_COFR_MapSpawner_AmbienceVolume", 30, "Adjust Ambience Volume For Map Spawner")
    VJ.AddConVar("VJ_COFR_MapSpawner_Enabled", 1, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_Boss", 0, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_MaxMon", 80, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_HordeCount", 35, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMax", 2000, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMin", 650, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_HordeChance", 100, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMin", 120, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMax", 180, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_DelayMin", 0.85, {FCVAR_ARCHIVE})
    VJ.AddConVar("VJ_COFR_MapSpawner_DelayMax", 3, {FCVAR_ARCHIVE})

-- Main Configure Menu --
      if CLIENT then
         hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_COFR", function()
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoFR - General", "CoFR - General", "", "", function(panel)
            local vj_cofrreset_cs = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_cofrreset_cs.Options["#vjbase.menu.general.reset.everything"] = {
                VJ_COFR_SparkFX = "0"
}
                panel:AddControl("ComboBox", vj_cofrreset_cs)
                panel:Help("Client-Side Options:")
                panel:CheckBox("Enable GoldSrc-Style Sparks On Metal Surfaces?","VJ_COFR_SparkFX")
                panel:ControlHelp("Applies ONLY to CoFR weapons!")
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
    return
end
            panel:Help("#vjbase.menu.general.admin.only")
            local vj_cofrreset = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_cofrreset.Options["#vjbase.menu.general.reset.everything"] = {
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
                VJ_COFR_Suicider_ExtraPistol = "0",
                VJ_COFR_Suicider_NewSound = "1",
                VJ_COFR_OldWepSounds = "0",
                VJ_COFR_Human_Regen = "0",
                VJ_COFR_Human_ReloadCover = "0",
                VJ_COFR_Human_ReloadRun = "1",
                VJ_COFR_Boss_Spawner = "0",
                VJ_COFR_JoeBiden = "0"
}
            panel:AddControl("ComboBox", vj_cofrreset)
            panel:ControlHelp("Note: Only future spawned SNPCs will be affected!")
            panel:Help("Options:")
            panel:CheckBox("Enable Boss Music?","VJ_COFR_Boss_Music")
            panel:CheckBox("Enable Hoodie Skins For Simon?","VJ_COFR_Simon_Costumes")
            panel:CheckBox("Enable Only Original Weapons For Book Simon?","VJ_COFR_BookSimon_Normal")
            panel:CheckBox("Enable Transparent/Invisible Twitchers?","VJ_COFR_Twitcher_Invisible")
            panel:CheckBox("Enable Random Sounds For Twitchers?","VJ_COFR_Twitcher_RandomSounds")
            panel:CheckBox("Enable Original Damage Method For The Addiction?","VJ_COFR_Addiction_SelfDamage")
            panel:CheckBox("Enable Original Damage Method For Mace?","VJ_COFR_Mace_Damage")
            panel:CheckBox("Enable Radius Damage For Sawcrazy?","VJ_COFR_Sawcrazy_RadiusDamage")
            panel:CheckBox("Enable The Face To Summon Faceless?","VJ_COFR_FaceHead_SummonFaceless")
            panel:CheckBox("Enable Head Gibbing For Slowers?","VJ_COFR_Slower_HeadGib")
            panel:CheckBox("Enable Suiciders Dropping Glocks/P345s On Death?","VJ_COFR_Suicider_DropGlock")
            panel:CheckBox("Enable SNPCs Dropping Items On Death?","VJ_COFR_DropAmmo")
            panel:CheckBox("Enable Instant Headshot Death For Suicider?","VJ_COFR_Suicider_Headshot")
            panel:CheckBox("Enable Ghost's Tinnitus Sound After Being Hit?","VJ_COFR_Ghost_SlowSound")
            panel:CheckBox("Enable Flashlight For Assistor & Police Officers?","VJ_COFR_Assistor_Flashlight")
            panel:CheckBox("Enable P345 For Suiciders?","VJ_COFR_Suicider_ExtraPistol")
            panel:CheckBox("Enable Updated Glock Sound For Suiciders & Book Simon?","VJ_COFR_Suicider_NewSound")
            panel:CheckBox("Enable Old Weapon Sounds?","VJ_COFR_OldWepSounds")
            panel:ControlHelp("Note: Be sure to only have one option enabled for Suicider & Book Simon weapon sounds.")
            panel:CheckBox("Enable Human SNPCs Having HP Regen?","VJ_COFR_Human_Regen")
            panel:CheckBox("Enable Human SNPCs Finding Cover To Reload?","VJ_COFR_Human_ReloadCover")
            panel:CheckBox("Enable SNPCs Moving While Reloading?","VJ_COFR_Human_ReloadRun")
            panel:CheckBox("Enable Bosses Spawning From Spawners?","VJ_COFR_Boss_Spawner")
            panel:CheckBox("Enable Joe Biden Mode For Carcass?","VJ_COFR_JoeBiden")
end)
-- Map Spawner Configure Menu --
         spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoFR - Map Spawner", "CoFR - Map Spawner", "", "", function(panel)
                panel:Help("Client-Side Options:")
                panel:CheckBox("Enable Music?","VJ_COFR_MapSpawner_Music")
                panel:CheckBox("Enable Ambience?","VJ_COFR_MapSpawner_Ambience")
                panel:NumSlider("Music Volume","VJ_COFR_MapSpawner_MusicVolume",10,100,2)
                panel:NumSlider("Ambience Volume","VJ_COFR_MapSpawner_AmbienceVolume",10,100,2)
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
    return
end
            panel:Help("Note: Only Admins can change these settings!")
            local vj_cofrreset_mapspawner = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
            vj_cofrreset_mapspawner.Options["#vjbase.menu.general.reset.everything"] = {
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
                VJ_COFR_MapSpawner_DelayMax = "3"
}
            panel:AddControl("ComboBox", vj_cofrreset_mapspawner)
            panel:Help("Options:")
            panel:CheckBox("Enable Map Spawner Processing?","VJ_COFR_MapSpawner_Enabled")
            panel:CheckBox("Enable Bosses?","VJ_COFR_MapSpawner_Boss")
            panel:NumSlider("Max Monsters","VJ_COFR_MapSpawner_MaxMon","5","400",2)
            panel:NumSlider("Min Distance They Can Spawn From Players","VJ_COFR_MapSpawner_SpawnMin","150","30000",2)
            panel:NumSlider("Max Distance They Can Spawn From Players","VJ_COFR_MapSpawner_SpawnMax","150","30000",2)
            panel:NumSlider("Min Time Between Spawns","VJ_COFR_MapSpawner_DelayMin",0.1,15,2)
            panel:NumSlider("Max Time Between Spawns","VJ_COFR_MapSpawner_DelayMax",0.2,15,2)
            panel:NumSlider("Max Monster Horde","VJ_COFR_MapSpawner_HordeCount",5,400,2)
            panel:NumSlider("Chance That A Horde Will Appear","VJ_COFR_MapSpawner_HordeChance",1,500,2)
            panel:NumSlider("Min Cooldown Time For Horde Spawns","VJ_COFR_MapSpawner_HordeCooldownMin",1,800,2)
            panel:NumSlider("Max Cooldown Time For Horde Spawns","VJ_COFR_MapSpawner_HordeCooldownMax",1,800,2)
        end)
    end)
end
    VJ_COFR_NODEPOS = {}
    hook.Add("EntityRemoved","VJ_COFR_AddNodes",function(ent)
        if ent:GetClass() == "info_node" then
            table.insert(VJ_COFR_NODEPOS,ent:GetPos())
    end
end)

 if SERVER then
    util.AddNetworkString("VJ_COFR_Drowned_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Stranger_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Ghost_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Addiction_ScreenEffect")
end

 if CLIENT then
    net.Receive("VJ_COFR_Drowned_ScreenEffect",function()
    local ply = net.ReadEntity()
    local hookName = "VJ_COFR_Drowned_ScreenEffect" .. ply:EntIndex()
    local colorRed = Color(127, 0, 0, 255)

    ply.VJ_COFR_Drowned_ScreenEffect_Time = CurTime() +0.1

    hook.Add("RenderScreenspaceEffects",hookName,function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Drowned_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects",hookName)
    return
end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 1, 0)
    end)
end)
    net.Receive("VJ_COFR_Stranger_ScreenEffect",function()
    local ply = net.ReadEntity()
    local hookName = "VJ_COFR_Stranger_ScreenEffect" .. ply:EntIndex()
    local colorBlack = Color(0, 0, 0, 255)

    ply.VJ_COFR_Stranger_ScreenEffect_Time = CurTime() +0.1

    hook.Add("RenderScreenspaceEffects",hookName,function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Stranger_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects",hookName)
    return
end
            ply:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
    end)
end)
    net.Receive("VJ_COFR_Ghost_ScreenEffect",function()
    local ply = net.ReadEntity()
    local hookName = "VJ_COFR_Ghost_ScreenEffect" .. ply:EntIndex()
    local colorRed = Color(255, 0, 0, 255)

    ply.VJ_COFR_Ghost_ScreenEffect_Time = CurTime() +0.1

    hook.Add("RenderScreenspaceEffects",hookName,function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Ghost_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects",hookName)
    return
end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 12, 0)
    end)
end)
    net.Receive("VJ_COFR_Addiction_ScreenEffect",function()
    local ply = net.ReadEntity()
    local hookName = "VJ_COFR_Addiction_ScreenEffect" .. ply:EntIndex()
    local colorRed = Color(127, 0, 0, 255)

    ply.VJ_COFR_Stranger_ScreenEffect_Time = CurTime() +0.1

    hook.Add("RenderScreenspaceEffects",hookName,function()
        if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Stranger_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects",hookName)
    return
end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 0.25, 0)
        end)
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local excludedMats = {
    [MAT_ANTLION] = true,
    [MAT_ALIENFLESH] = true,
    [MAT_BLOODYFLESH] = true,
    [MAT_FLESH] = true,
}
function VJ.COFR_Effect_Impact(tr)
    if !excludedMats[tr.MatType] then
        local effectData = EffectData()
        effectData:SetEntity(tr.Entity)
        effectData:SetStart(tr.StartPos)
        effectData:SetOrigin(tr.HitPos)
        effectData:SetNormal(tr.HitNormal)
        effectData:SetHitBox(tr.HitBox)
        effectData:SetSurfaceProp(tr.SurfaceProps)
        effectData:SetFlags(1)
        util.Effect("Impact_GMOD", effectData)
        util.Decal("VJ_COFR_Impact", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_COFR_DeathCode(ent)
    ent.HasBloodPool = false
    ent:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
    if GetConVar("VJ_COFR_DropAmmo"):GetInt() == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end
        ent.DropCoFAmmo = {"weapon_cof_syringe","ent_cof_glock_ammo","ent_cof_g43_ammo","ent_cof_m16_ammo","ent_cof_p345_ammo","ent_cof_revolver_ammo","ent_cof_rifle_ammo","ent_cof_shotgun_ammo","ent_cof_tmp_ammo","ent_cof_vp70_ammo"}
    local pickedAmmoType = VJ.PICK(ent.DropCoFAmmo)
    if pickedAmmoType != false then
    local AmmoDrop = ents.Create(pickedAmmoType)
        AmmoDrop:SetPos(ent:GetPos() + ent:OBBCenter())
        AmmoDrop:SetLocalAngles(ent:GetAngles())
        AmmoDrop:Spawn()
        AmmoDrop:Activate()
    local phys = AmmoDrop:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetMass(1)
        phys:ApplyForceCenter(Vector(0,0,0))
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_COFR_ApplyCorpse(ent,corpse)
 if !VJ_CVAR_AI_ENABLED then corpse:Remove() end
    //VJ_COFR_ExtraCorpseOptions(corpse)
    corpse:ResetSequence(ent:GetSequence())
    corpse:SetCycle(1)
    corpse:SetCollisionBounds(Vector(1, 1, 1), Vector(-1, -1, 0))
    corpse:SetSolid(SOLID_NONE)
end