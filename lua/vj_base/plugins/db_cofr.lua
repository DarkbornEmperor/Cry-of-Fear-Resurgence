/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
VJ.AddPlugin("Cry of Fear Resurgence", "NPC")

-- Cry of Fear --
local spawnCategory = "CoF Resurgence"
VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_cofr/icons/cofr.png"})

-- Random & Spawners --
VJ.AddNPC("Monster Map Spawner", "sent_vj_cofr_mapspawner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Random Monster", "sent_vj_cofr_mon", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Random Monster Spawner", "sent_vj_cofr_mon_sp", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Random Monster Spawner (Single)", "sent_vj_cofr_mon_sinsp", spawnCategory, {SubCategory = subCategory})

-- Enemies
local subCategory = "Cry of Fear"
VJ.AddNPC("Baby", "npc_vj_cofr_baby", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Children", "npc_vj_cofr_children", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Children (Beta)", "npc_vj_cofr_children_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Children (Early)", "npc_vj_cofr_children_early", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Citalopram", "npc_vj_cofr_citalopram", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Crawler", "npc_vj_cofr_crawler", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Crazyrunner", "npc_vj_cofr_crazyrunner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Croucher", "npc_vj_cofr_croucher", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Dreamer (Runner)", "npc_vj_cofr_dreamer_runner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Drowned", "npc_vj_cofr_drowned", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless", "npc_vj_cofr_faceless", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Crawler)", "npc_vj_cofr_faceless_crawler", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Crawler) (Beta)", "npc_vj_cofr_faceless_crawler_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Beta)", "npc_vj_cofr_faceless_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Faced)", "npc_vj_cofr_faceless_faced", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Twister)", "npc_vj_cofr_faceless_twister", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Twister Valve)", "npc_vj_cofr_faceless_twistervalve", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faster", "npc_vj_cofr_faster", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faster (Male)", "npc_vj_cofr_faster_male", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Flygare", "npc_vj_cofr_flygare", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Krypandenej", "npc_vj_cofr_krypandenej", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Psycho", "npc_vj_cofr_psycho", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sewmo", "npc_vj_cofr_sewmo", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 1", "npc_vj_cofr_slower1", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 1 (Beta)", "npc_vj_cofr_slower1_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 3", "npc_vj_cofr_slower3", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 3 (Beta)", "npc_vj_cofr_slower3_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower No", "npc_vj_cofr_slowerno", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower Ten", "npc_vj_cofr_slowerten", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower Ten-2", "npc_vj_cofr_slowerten2", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Spitter", "npc_vj_cofr_spitter", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Stranger", "npc_vj_cofr_stranger", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Suicider", "npc_vj_cofr_suicider", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Taller", "npc_vj_cofr_taller", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Upper", "npc_vj_cofr_upper", spawnCategory, {SubCategory = subCategory})

-- Bosses --
VJ.AddNPC("Book Simon", "npc_vj_cofr_simonbook", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Book Simon (Beta)", "npc_vj_cofr_simonbook_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Book Simon (Manhunt)", "npc_vj_cofr_simonbook_mh", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Book Simon (Manhunt) (Beta)", "npc_vj_cofr_simonbook_mh_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Carcass", "npc_vj_cofr_carcass", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Craig", "npc_vj_cofr_craig", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Doctor Purnell", "npc_vj_cofr_purnell", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Mace", "npc_vj_cofr_mace", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sawcrazy", "npc_vj_cofr_sawcrazy", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sawer", "npc_vj_cofr_sawer", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sawrunner", "npc_vj_cofr_sawrunner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sick Simon", "npc_vj_cofr_simonsick", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sick Simon (Suicider)", "npc_vj_cofr_simonsick_suicider", spawnCategory, {SubCategory = subCategory})

-- Friendlies --
VJ.AddNPC("Doctor Purnell (Friendly)", "npc_vj_cofr_purnell_fri", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Simon Henriksson", "npc_vj_cofr_simon", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Simon Henriksson (Early)", "npc_vj_cofr_simon_early", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Simon Henriksson (Beta)", "npc_vj_cofr_simon_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Simon Henriksson (Hoodless)", "npc_vj_cofr_simon_hoodless", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Police Officer", "npc_vj_cofr_police", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sawrunner (Friendly)", "npc_vj_cofr_sawrunner_fri", spawnCategory, {SubCategory = subCategory})

-- Screamers/Hazards --
VJ.AddNPC("Dreamer", "npc_vj_cofr_dreamer", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hanger", "npc_vj_cofr_hanger", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hanger (Beta)", "npc_vj_cofr_hanger_beta", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hangman", "npc_vj_cofr_hangman", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Human Flower", "npc_vj_cofr_humanflower", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("The Face", "npc_vj_cofr_facehead", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("The Face (Jumpscare)", "npc_vj_cofr_facehead_jumpscare", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Watro", "npc_vj_cofr_watro", spawnCategory, {SubCategory = subCategory})

-- Apparitions/Scenery --
VJ.AddNPC("Blacker", "sent_vj_cofr_blacker", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Corpse", "sent_vj_cofr_corpse", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Corpse (Hanging)", "sent_vj_cofr_corpse_hanging", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Cutter", "sent_vj_cofr_cutter", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Dead Victim", "sent_vj_cofr_deadvictim", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Dead Victim (Headless)", "sent_vj_cofr_deadvictim_headless", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Ghost", "sent_vj_cofr_ghost", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Drowned (Apparition)", "sent_vj_cofr_drowned_apparition", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hanger (Dead)", "sent_vj_cofr_hanger_dead", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Police Officer (Dead)", "sent_vj_cofr_police_dead", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower (Dead)", "sent_vj_cofr_slower_dead", spawnCategory, {SubCategory = subCategory})

-- Cry of Fear Custom Campaigns -- All assets come from their respective Custom Campaigns: Halloween Collab, Lost Echo, Memories, Out of It, Recidivist & The Scrolls of Shaimoon
-- Enemies --
subCategory = "Cry of Fear: Custom Campaigns"
VJ.AddNPC("Baby (Out of It)", "npc_vj_cofrcc_baby_ooi", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("CrazyruMpel", "npc_vj_cofrcc_crazyrumpel", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Crazyrunner (Mummy)", "npc_vj_cofrcc_crazyrunner_mummy", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Cutter", "npc_vj_cofrcc_cutter", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Mummy)", "npc_vj_cofrcc_faceless_mummy", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Mummy Crawler)", "npc_vj_cofrcc_faceless_mummycrawl", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Statue)", "npc_vj_cofrcc_faceless_statue", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Mummy Twister)", "npc_vj_cofrcc_faceless_mummytwister", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faster (Clown)", "npc_vj_cofrcc_faster_clown", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faster (Out of It)", "npc_vj_cofrcc_faster_ooi", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Genome Giant", "npc_vj_cofrcc_genome_giant", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Genome Soldier", "npc_vj_cofrcc_genome_soldier", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Mother", "npc_vj_cofrcc_mother", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Mother (Real)", "npc_vj_cofrcc_mother_real", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Patrick Bateman", "npc_vj_cofrcc_patrick", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Pedoslow", "npc_vj_cofrcc_pedoslow", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Psycho (Lost Echo)", "npc_vj_cofrcc_psycho_le", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Shaimoon (Statue)", "npc_vj_cofrcc_shaimoon_statue", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sick Sophie", "npc_vj_cofrcc_sicksophie", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Skeleton", "npc_vj_cofrcc_skeleton", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 3 (Out of It)", "npc_vj_cofrcc_slower3_ooi", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Slower 1 (Mummy)", "npc_vj_cofrcc_slower1_mummy", spawnCategory, {SubCategory = subCategory})

-- Bosses --
VJ.AddNPC("Blob", "npc_vj_cofrcc_blob", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Craigrunner", "npc_vj_cofrcc_craigrunner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Crocodile", "npc_vj_cofrcc_crocodile", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Duorunner", "npc_vj_cofrcc_duorunner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Faceless (Boss)", "npc_vj_cofrcc_faceless_boss", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Jeffrunner", "npc_vj_cofrcc_jeffrunner", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Mace (Out of It)", "npc_vj_cofrcc_mace_ooi", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Patrick Bateman (Boss)", "npc_vj_cofrcc_patrick_boss", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Pumpa", "npc_vj_cofrcc_pumpa", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Shaimoon", "npc_vj_cofrcc_shaimoon", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sick Simon (Book)", "npc_vj_cofrcc_simonsick_book", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Abomination", "npc_vj_cofrcc_abomination", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("The Mummy", "npc_vj_cofrcc_mummy", spawnCategory, {SubCategory = subCategory})

-- Friendlies --
VJ.AddNPC("Robert", "npc_vj_cofrcc_robert", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Roderick Henriksson", "npc_vj_cofrcc_roderick", spawnCategory, {SubCategory = subCategory})

-- Misc/Hazards --
VJ.AddNPC("Meatman", "npc_vj_cofrcc_meatman", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("The Face (Out of It)", "npc_vj_cofrcc_facehead_ooi", spawnCategory, {SubCategory = subCategory})

-- Apparitions --
VJ.AddNPC("Corpse", "sent_vj_cofrcc_corpse", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Meatman (Dead)", "sent_vj_cofrcc_meatman_dead", spawnCategory, {SubCategory = subCategory})

-- Afraid of Monsters --
spawnCategory = "CoF Resurgence: AoM"
VJ.AddCategoryInfo(spawnCategory, {Icon = "vj_cofr/icons/cofraom.png"})

-- Apparitions --
VJ.AddNPC("David (Corpse) (Grey)", "sent_vj_cofraom_david_corpse_grey", spawnCategory)

-- Random & Spawners --
VJ.AddNPC("Monster Map Spawner", "sent_vj_cofraom_mapspawner", spawnCategory)
VJ.AddNPC("Random Monster", "sent_vj_cofraom_mon", spawnCategory)
VJ.AddNPC("Random Monster Spawner", "sent_vj_cofraom_mon_sp", spawnCategory)
VJ.AddNPC("Random Monster Spawner (Single)", "sent_vj_cofraom_mon_sinsp", spawnCategory)

-- Enemies --
subCategory = "Afraid of Monsters: Director's Cut"
VJ.AddNPC("Face", "npc_vj_cofraom_face", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Ghost", "npc_vj_cofraom_ghost", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Handcrab", "npc_vj_cofraom_handcrab", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Headcrab", "npc_vj_cofraomc_headcrab", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hellhound", "npc_vj_cofraom_hellhound", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Spitter", "npc_vj_cofraom_spitter", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Screamer", "npc_vj_cofraom_screamer", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Twitcher 1", "npc_vj_cofraom_twitcher1", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Twitcher 2", "npc_vj_cofraom_twitcher2", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Twitcher 3", "npc_vj_cofraom_twitcher3", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Twitcher 4", "npc_vj_cofraom_twitcher4", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Wheelchair Twitcher", "npc_vj_cofraom_wheelchair", spawnCategory, {SubCategory = subCategory})

-- Bosses --
VJ.AddNPC("The Addiction", "npc_vj_cofraom_addiction", spawnCategory, {SubCategory = subCategory})

-- Misc/Hazards --
VJ.AddNPC("Devourer", "npc_vj_cofraom_devourer", spawnCategory, {SubCategory = subCategory, OnCeiling = true, Offset = 0})

-- Friendlies --
VJ.AddNPC("David Leatherhoff", "npc_vj_cofraom_david", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("David Leatherhoff (Dead)", "npc_vj_cofraom_david_dead", spawnCategory, {SubCategory = subCategory})

-- Apparitions --
VJ.AddNPC("David (Hanging)", "sent_vj_cofraom_david_hanging", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Sick Corpse", "sent_vj_cofraom_sickcorpse", spawnCategory, {SubCategory = subCategory})

-- Enemies --
subCategory = "Afraid of Monsters: Classic"
VJ.AddNPC("Face (Classic)", "npc_vj_cofraomc_face", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Ghost (Classic)", "npc_vj_cofraomc_ghost", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Headcrab", "npc_vj_cofraomc_headcrab", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Hellhound (Classic)", "npc_vj_cofraomc_hellhound", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Lurker", "npc_vj_cofraomc_lurker", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Spitter (Classic)", "npc_vj_cofraomc_spitter", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Screamer (Classic)", "npc_vj_cofraomc_screamer", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("Twitcher (Classic)", "npc_vj_cofraomc_twitcher", spawnCategory, {SubCategory = subCategory})

-- Misc/Hazards --
VJ.AddNPC("Devourer (Classic)", "npc_vj_cofraomc_devourer", spawnCategory, {SubCategory = subCategory, OnCeiling = true, Offset = 0})

-- Friendlies --
VJ.AddNPC("David Leatherhoff (Classic)", "npc_vj_cofraomc_david", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("David Leatherhoff (Dead) (Classic)", "npc_vj_cofraomc_david_dead", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("David Leatherhoff (Early)", "npc_vj_cofraomc_david_early", spawnCategory, {SubCategory = subCategory})

-- Apparitions --
VJ.AddNPC("David (Corpse) (Classic)", "sent_vj_cofraomc_david_corpse", spawnCategory, {SubCategory = subCategory})

-- Enemies --
subCategory = "Afraid of Monsters: Dark Assistance"
VJ.AddNPC("Twitcher (Dark Assistance)", "npc_vj_cofraomda_twitcher", spawnCategory, {SubCategory = subCategory})

-- Bosses --
VJ.AddNPC("The Addiction (Dark Assistance)", "npc_vj_cofraomda_addiction", spawnCategory, {SubCategory = subCategory})

-- Friendlies --
VJ.AddNPC("Assistor", "npc_vj_cofraomda_assistor", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("David Leatherhoff (Dark Assistance)", "npc_vj_cofraomda_david", spawnCategory, {SubCategory = subCategory})
VJ.AddNPC("David Leatherhoff (Dead) (Dark Assistance)", "npc_vj_cofraomda_david_dead", spawnCategory, {SubCategory = subCategory})

-- Apparitions --
VJ.AddNPC("David (Hanging) (Dark Assistance)", "sent_vj_cofraomda_david_hanging", spawnCategory, {SubCategory = subCategory})

-- Entities --
VJ.AddEntity("Pills", "sent_vj_cofraom_pills", spawnCategory)
VJ.AddEntity("Pills (Dark Assistance)", "sent_vj_cofraom_pills_da", spawnCategory)

-- Decals --
game.AddDecal("VJ_COFR_Blood_Red", {"vj_cofr/decals/cof_blood01", "vj_cofr/decals/cof_blood02", "vj_cofr/decals/cof_blood03", "vj_cofr/decals/cof_blood04", "vj_cofr/decals/cof_blood05", "vj_cofr/decals/cof_blood06", "vj_cofr/decals/cof_blood07"})
game.AddDecal("VJ_COFR_Blood_Red_Large", {"vj_cofr/decals/cof_bigblood01", "vj_cofr/decals/cof_bigblood02"})
game.AddDecal("VJ_COFR_Spit", {"vj_cofr/decals/cof_spit01", "vj_cofr/decals/cof_spit02"})
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

-- Add to paint tool
list.Add("PaintMaterials", "VJ_COFR_Blood_Red")
list.Add("PaintMaterials", "VJ_COFR_Blood_Red_Large")
list.Add("PaintMaterials", "VJ_COFR_Spit")
list.Add("PaintMaterials", "VJ_COFR_Scorch_Small")
list.Add("PaintMaterials", "VJ_COFR_Scorch")
list.Add("PaintMaterials", "VJ_COFR_Impact")

-- Weapon Sounds
local SNDLVL_GUNFIRE = 140
local PITCH_RANDOM = {90,110}

-- Cry of Fear --
sound.Add({
    name = "VJ.CoFR_Browning.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/browning/browning_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Browning_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/browning/old/browning_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_FAMAS.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/famas/famas_shoot.wav"
})
sound.Add({
    name = "VJ.CoFR_FAMAS.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/famas/famas_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_FAMAS_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/famas/old/famas_shoot.wav"
})
sound.Add({
    name = "VJ.CoFR_FAMAS_Old.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/famas/old/famas_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_G43.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/g43/g43_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Glock.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/glock/glock_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Glock_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/glock/old/glock_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Glock_Suicider.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/suicider/suicider_glock_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_M16.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/m16/m16_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_M16_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/m16/old/m16_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_M76.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/m76/m76_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_MP5.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/mp5/mp5_shoot_end.wav"
})
sound.Add({
    name = "VJ.CoFR_MP5.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/mp5/mp5_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_MP5_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/mp5/old/mp5_shoot_end.wav"
})
sound.Add({
    name = "VJ.CoFR_MP5_Old.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/mp5/old/mp5_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_P345.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/p345/p345_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_P345_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/p345/old/p345_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_PT92.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/pt92/shoot.wav"
})
sound.Add({
    name = "VJ.CoFR_Revolver.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/revolver/revolver_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Revolver_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/revolver/old/revolver_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Rifle.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/rifle/rifle_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Rifle_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/rifle/old/rifle_fire.wav"
})
sound.Add({
    name = "VJ.CoFR_Shotgun.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/shotgun/shoot.wav"
})
sound.Add({
    name = "VJ.CoFR_Shotgun_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/shotgun/old/shoot.wav"
})
sound.Add({
    name = "VJ.CoFR_TMP.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/tmp/tmp_shoot_end.wav"
})
sound.Add({
    name = "VJ.CoFR_TMP.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/tmp/tmp_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_TMP_Old.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/tmp/old/tmp_shoot_end.wav"
})
sound.Add({
    name = "VJ.CoFR_TMP_Old.Loop",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/tmp/old/tmp_shoot_loop.wav"
})
sound.Add({
    name = "VJ.CoFR_VP70.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cof/weapons/vp70/vp70_fire.wav"
})
-- Cry of Fear Custom Campaigns --
sound.Add({
    name = "VJ.CoFRCC_AK47.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/cofcc/weapons/ak47/shoot.wav"
})
-- Afraid of Monsters --
sound.Add({
    name = "VJ.CoFRAoM_AK47.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound = {
        "^vj_cofr/aom/weapons/ak47/hks1.wav",
        "^vj_cofr/aom/weapons/ak47/hks2.wav",
        "^vj_cofr/aom/weapons/ak47/hks3.wav"
    }
})
sound.Add({
    name = "VJ.CoFRAoM_Beretta.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/beretta/ber_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Beretta_Classic.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/beretta/classic/pl_gun3.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Deagle.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/deagle/deagle_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Deagle_Classic.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound = {
        "^vj_cofr/aom/weapons/deagle/classic/357_shot1.wav",
        "^vj_cofr/aom/weapons/deagle/classic/357_shot2.wav"
    }
})
sound.Add({
    name = "VJ.CoFRAoM_Glock.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/glock/glock_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_L85A1.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/l85/gm_expell.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_MP5K.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/mp5k/mp5k_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_P228.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/p228/p228_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Revolver.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/revolver/revolver_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Shotgun.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/shotgun/shotgun_fire.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Shotgun_Classic.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/shotgun/classic/sbarrel1.wav"
})
sound.Add({
    name = "VJ.CoFRAoM_Uzi.Single",
    channel = CHAN_WEAPON,
    volume = 1.0,
    level = SNDLVL_GUNFIRE,
    pitch = PITCH_RANDOM,
    sound =
        "^vj_cofr/aom/weapons/uzi/uzi_fire.wav"
})

-- ConVars --
VJ.AddConVar("VJ_COFR_Difficulty", 2, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Boss_Music", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_CoFvsAoM", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Simon_Costumes", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_BookSimon_Normal", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Twitcher_Invisible", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Twitcher_RandomSounds", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Addiction_SelfDamage", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Mace_Damage", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Sawcrazy_RadiusDamage", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_FaceHead_SummonFaceless", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Slower_HeadGib", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Suicider_DropGlock", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_DropAmmo", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Suicider_Ammo", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Suicider_Headshot", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Ghost_SlowSound", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Flashlight", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Suicider_ExtraPistol", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Suicider_NewSound", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_OldWepSounds", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_MeleeWep", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_WepSwitch", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_Regen", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_ReloadCover", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_ReloadRun", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Human_OriginalWepDamage", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_Boss_Spawner", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_JoeBiden", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddClientConVar("VJ_COFR_SparkFX", 0, "Create GoldSrc-Style Sparks On Metal Surfaces")

-- Map Spawner ConVars --
VJ.AddClientConVar("VJ_COFR_MapSpawner_Music", 1, "Music For Map Spawner")
VJ.AddClientConVar("VJ_COFR_MapSpawner_Ambience", 1, "Ambience For Map Spawner")
VJ.AddClientConVar("VJ_COFR_MapSpawner_MusicVolume", 50, "Adjust Music Volume For Map Spawner")
VJ.AddClientConVar("VJ_COFR_MapSpawner_AmbienceVolume", 30, "Adjust Ambience Volume For Map Spawner")
VJ.AddConVar("VJ_COFR_MapSpawner_Enabled", 1, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_Boss", 0, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_MaxMon", 80, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_HordeCount", 35, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMax", 2000, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_SpawnMin", 650, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_HordeChance", 100, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMin", 120, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_HordeCooldownMax", 180, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_DelayMin", 0.85, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))
VJ.AddConVar("VJ_COFR_MapSpawner_DelayMax", 3, bit.bor(FCVAR_ARCHIVE, FCVAR_NOTIFY))

-- Main Configure Menu --
if CLIENT then
    hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_COFR", function()
        spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoFR - General", "CoFR - General", "", "", function(panel)
            panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "VJ_COFR_SparkFX 0"})
            panel:Help("Client-Side Options:")
            panel:CheckBox("Enable GoldSrc-Style Sparks On Metal Surfaces?", "VJ_COFR_SparkFX")
            panel:ControlHelp("Applies ONLY to CoFR weapons!")
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
                return
            end
            panel:Help("#vjbase.menu.general.admin.only")
            panel:Help("#vjbase.menu.general.npc.note.future")
            panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "VJ_COFR_Difficulty 2\nVJ_COFR_Boss_Music 1\nVJ_COFR_CoFvsAoM 0\nVJ_COFR_Simon_Costumes 0\nVJ_COFR_BookSimon_Normal 1\nVJ_COFR_Twitcher_Invisible 1\nVJ_COFR_Twitcher_RandomSounds 0\nVJ_COFR_Addiction_SelfDamage 1\nVJ_COFR_Mace_Damage 1\nVJ_COFR_Sawcrazy_RadiusDamage 1\nVJ_COFR_FaceHead_SummonFaceless 1\nVJ_COFR_Slower_HeadGib 1\nVJ_COFR_Suicider_Ammo 1\nVJ_COFR_Suicider_DropGlock 0\nVJ_COFR_DropAmmo 0\nVJ_COFR_Suicider_Headshot 1\nVJ_COFR_Ghost_SlowSound 1\nVJ_COFR_Flashlight 0\nVJ_COFR_Suicider_ExtraPistol 0\nVJ_COFR_Suicider_NewSound 1\nVJ_COFR_OldWepSounds 0\nVJ_COFR_Human_MeleeWep 1\nVJ_COFR_Human_WepSwitch 1\nVJ_COFR_Human_Regen 0\nVJ_COFR_Human_ReloadCover 0\nVJ_COFR_Human_ReloadRun 1\nVJ_COFR_Human_OriginalWepDamage 1\nVJ_COFR_Boss_Spawner 0\nVJ_COFR_JoeBiden 0"})

            local difList_Text = vgui.Create("DLabel", panel)
            difList_Text:SetText("#vjbase.menu.npc.settings.gen.difficulty.header")
            difList_Text:SetDark(true)
            local difList = vgui.Create("CtrlListBox", panel)
            difList:SetHeight(25)
            difList:Dock(TOP)
            difList:SetSortItems(false)
            difList:AddOption("Easy", {VJ_COFR_Difficulty = "1"})
            difList:AddOption("Medium", {VJ_COFR_Difficulty = "2"})
            difList:AddOption("Difficult", {VJ_COFR_Difficulty = "3"})
            difList:AddOption("Nightmare", {VJ_COFR_Difficulty = "4"})
            panel:AddItem(difList_Text, difList)

            panel:Help("Server-Side Options:")
            panel:CheckBox("Enable Boss Music?", "VJ_COFR_Boss_Music")
            panel:CheckBox("Enable AoM & CoF Enemies Being Hostile To Each Other?", "VJ_COFR_CoFvsAoM")
            panel:CheckBox("Enable Hoodie Skins For Simon?", "VJ_COFR_Simon_Costumes")
            panel:CheckBox("Enable Only Original Weapons For Book Simon?", "VJ_COFR_BookSimon_Normal")
            panel:CheckBox("Enable Transparent/Invisible Twitchers?", "VJ_COFR_Twitcher_Invisible")
            panel:CheckBox("Enable Random Sounds For Twitchers?", "VJ_COFR_Twitcher_RandomSounds")
            panel:CheckBox("Enable Original Damage Method For The Addiction?", "VJ_COFR_Addiction_SelfDamage")
            panel:CheckBox("Enable Original Damage Method For Mace?", "VJ_COFR_Mace_Damage")
            panel:CheckBox("Enable Radius Damage For Sawcrazy?", "VJ_COFR_Sawcrazy_RadiusDamage")
            panel:CheckBox("Enable The Face Summoning Faceless?", "VJ_COFR_FaceHead_SummonFaceless")
            panel:CheckBox("Enable Head Gibbing For Slowers?", "VJ_COFR_Slower_HeadGib")
            panel:CheckBox("Enable Suiciders Running Out Of Ammo?", "VJ_COFR_Suicider_Ammo")
            panel:CheckBox("Enable Suiciders Dropping Glocks/P345s On Death?", "VJ_COFR_Suicider_DropGlock")
            panel:ControlHelp("Note: Requires CoF Weapon Pack.")
            panel:CheckBox("Enable NPCs Dropping Items On Death?", "VJ_COFR_DropAmmo")
            panel:ControlHelp("Note: Requires CoF Weapon Pack.")
            panel:CheckBox("Enable Instant Headshot Death For Suicider?", "VJ_COFR_Suicider_Headshot")
            panel:CheckBox("Enable Ghost's Tinnitus Sound After Being Hit?", "VJ_COFR_Ghost_SlowSound")
            panel:CheckBox("Enable Flashlight For Assistor & Police Officers?", "VJ_COFR_Flashlight")
            panel:CheckBox("Enable P345 For Suiciders?", "VJ_COFR_Suicider_ExtraPistol")
            panel:CheckBox("Enable Updated Glock Sound For Suiciders & Book Simon?", "VJ_COFR_Suicider_NewSound")
            panel:ControlHelp("Note: Be sure to only have one option enabled for Suicider & Book Simon weapon sounds.")
            panel:CheckBox("Enable Old Weapon Sounds?", "VJ_COFR_OldWepSounds")
            panel:ControlHelp("Note: Be sure to only have one option enabled for Suicider & Book Simon weapon sounds.")
            panel:CheckBox("Enable Human NPCs Spawning With Melee Weapons?", "VJ_COFR_Human_MeleeWep")
            panel:CheckBox("Enable Human NPCs Switching Weapons?", "VJ_COFR_Human_WepSwitch")
            panel:CheckBox("Enable Human NPCs Having HP Regen?", "VJ_COFR_Human_Regen")
            panel:CheckBox("Enable Human NPCs Finding Cover To Reload?", "VJ_COFR_Human_ReloadCover")
            panel:CheckBox("Enable Human NPCs Moving While Reloading?", "VJ_COFR_Human_ReloadRun")
            panel:CheckBox("Enable Original Weapon Damage For Certain Weapons?", "VJ_COFR_Human_OriginalWepDamage")
            panel:ControlHelp("Ex: AoM Deagle & Revolver")
            panel:CheckBox("Enable Bosses Spawning From Spawners?", "VJ_COFR_Boss_Spawner")
            panel:CheckBox("Enable Joe Biden Mode For Carcass?", "VJ_COFR_JoeBiden")
        end)
        -- Map Spawner Configure Menu --
        spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "CoFR - Map Spawner", "CoFR - Map Spawner", "", "", function(panel)
            panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "VJ_COFR_MapSpawner_Music 1\nVJ_COFR_MapSpawner_Ambience 1\nVJ_COFR_MapSpawner_MusicVolume 50\nVJ_COFR_MapSpawner_AmbienceVolume 50"})
            panel:Help("Client-Side Options:")
            panel:CheckBox("Enable Music?", "VJ_COFR_MapSpawner_Music")
            panel:CheckBox("Enable Ambience?", "VJ_COFR_MapSpawner_Ambience")
            panel:NumSlider("Music Volume", "VJ_COFR_MapSpawner_MusicVolume", 10, 100, 2)
            panel:NumSlider("Ambience Volume", "VJ_COFR_MapSpawner_AmbienceVolume", 10, 100, 2)
            if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
                panel:Help("#vjbase.menu.general.admin.not")
                panel:Help("#vjbase.menu.general.admin.only")
                return
            end
            panel:Help("#vjbase.menu.general.admin.only")
            panel:Help("#vjbase.menu.general.npc.note.future")
            panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "VJ_COFR_MapSpawner_Enabled 1\nVJ_COFR_MapSpawner_Boss 0\nVJ_COFR_MapSpawner_MaxMon 80\nVJ_COFR_MapSpawner_HordeCount 35\nVJ_COFR_MapSpawner_SpawnMax 2000\nVJ_COFR_MapSpawner_SpawnMin 650\nVJ_COFR_MapSpawner_HordeChance 100\nVJ_COFR_MapSpawner_HordeCooldownMin 120\nVJ_COFR_MapSpawner_HordeCooldownMax 180\nVJ_COFR_MapSpawner_DelayMin 0.85\nVJ_COFR_MapSpawner_DelayMax 3"})
            panel:Help("Server-Side Options:")
            panel:CheckBox("Enable Map Spawner Processing?", "VJ_COFR_MapSpawner_Enabled")
            panel:CheckBox("Enable Bosses?", "VJ_COFR_MapSpawner_Boss")
            panel:NumSlider("Max Monsters", "VJ_COFR_MapSpawner_MaxMon", "5", "400", 2)
            panel:NumSlider("Min Distance They Can Spawn From Players", "VJ_COFR_MapSpawner_SpawnMin", "150", "30000", 2)
            panel:NumSlider("Max Distance They Can Spawn From Players", "VJ_COFR_MapSpawner_SpawnMax", "150", "30000", 2)
            panel:NumSlider("Min Time Between Spawns", "VJ_COFR_MapSpawner_DelayMin", 0.1, 15, 2)
            panel:NumSlider("Max Time Between Spawns", "VJ_COFR_MapSpawner_DelayMax", 0.2, 15, 2)
            panel:NumSlider("Max Monster Horde", "VJ_COFR_MapSpawner_HordeCount", 5, 400, 2)
            panel:NumSlider("Chance That A Horde Will Appear", "VJ_COFR_MapSpawner_HordeChance", 1, 500, 2)
            panel:NumSlider("Min Cooldown Time For Horde Spawns", "VJ_COFR_MapSpawner_HordeCooldownMin", 1, 800, 2)
            panel:NumSlider("Max Cooldown Time For Horde Spawns", "VJ_COFR_MapSpawner_HordeCooldownMax", 1, 800, 2)
        end)
    end)
end

VJ_COFR_NODEPOS = {}
local table_insert = table.insert
hook.Add("EntityRemoved", "VJ_COFR_AddNodes", function(ent)
    if ent:GetClass() == "info_node" then
        table_insert(VJ_COFR_NODEPOS, ent:GetPos())
    end
end)

if SERVER then
    util.AddNetworkString("VJ_COFR_Drowned_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Survive_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Stranger_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Ghost_ScreenEffect")
    util.AddNetworkString("VJ_COFR_Addiction_ScreenEffect")
    util.AddNetworkString("VJ_COFR_ControlSpawnedNPC")

    hook.Add("PlayerSpawnedNPC", "VJ_COFR_ControlSpawnedNPC", function(ply, npc)
        timer.Simple(0.01, function()
            if IsValid(npc) && IsValid(ply) then
                if ply.VJ_COFR_SpawnedNPCClass then
                    if IsValid(npc) && npc:GetClass() == ply.VJ_COFR_SpawnedNPCClass then
                        ply.VJ_COFR_SpawnedNPCClass = nil
                        local controllerOBJ = ents.Create("obj_vj_controller")
                        controllerOBJ.VJCE_Player = ply
                        controllerOBJ:SetControlledNPC(npc)
                        controllerOBJ:Spawn()
                        controllerOBJ:StartControlling()
                    end
                end
            end
        end)
    end)
    net.Receive("VJ_COFR_ControlSpawnedNPC", function(len, ply)
        local npcClass = net.ReadString()
        local ply = net.ReadEntity()
        ply.VJ_COFR_SpawnedNPCClass = npcClass
        //print(ply,"Added NPC class", npcClass)
    end)
end

if CLIENT then
    net.Receive("VJ_COFR_Drowned_ScreenEffect", function()
        local ply = net.ReadEntity()
        local hookName = "VJ_COFR_Drowned_ScreenEffect" .. ply:EntIndex()
        local colorRed = Color(127, 0, 0, 155)

        ply.VJ_COFR_Drowned_ScreenEffect_Time = CurTime() + 0.1

        hook.Add("RenderScreenspaceEffects", hookName, function()
            if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Drowned_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                return
            end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 0.1, 0)
        end)
    end)
    net.Receive("VJ_COFR_Survive_ScreenEffect", function()
        local ply = net.ReadEntity()
        local hookName = "VJ_COFR_Survive_ScreenEffect" .. ply:EntIndex()
        local colorWhite = Color(200, 200, 200, 100)

        ply.VJ_COFR_Drowned_ScreenEffect_Time = CurTime() + 0.1

        hook.Add("RenderScreenspaceEffects", hookName, function()
            if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Drowned_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                return
            end
            ply:ScreenFade(SCREENFADE.IN, colorWhite, 0.1, 0)
        end)
    end)
    net.Receive("VJ_COFR_Stranger_ScreenEffect", function()
        local ply = net.ReadEntity()
        local hookName = "VJ_COFR_Stranger_ScreenEffect" .. ply:EntIndex()
        local colorBlack = Color(0, 0, 0, 155)

        ply.VJ_COFR_Stranger_ScreenEffect_Time = CurTime() + 0.1

        hook.Add("RenderScreenspaceEffects", hookName, function()
            if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Stranger_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                return
            end
            ply:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
        end)
    end)
    net.Receive("VJ_COFR_Ghost_ScreenEffect", function()
        local ply = net.ReadEntity()
        local hookName = "VJ_COFR_Ghost_ScreenEffect" .. ply:EntIndex()
        local colorRed = Color(255, 0, 0, 155)

        ply.VJ_COFR_Ghost_ScreenEffect_Time = CurTime() + 0.1

        hook.Add("RenderScreenspaceEffects", hookName, function()
            if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Ghost_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                return
            end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 12, 0)
        end)
    end)
    net.Receive("VJ_COFR_Addiction_ScreenEffect", function()
        local ply = net.ReadEntity()
        local hookName = "VJ_COFR_Addiction_ScreenEffect" .. ply:EntIndex()
        local colorRed = Color(127, 0, 0, 155)

        ply.VJ_COFR_Stranger_ScreenEffect_Time = CurTime() + 0.1

        hook.Add("RenderScreenspaceEffects", hookName, function()
            if !IsValid(ply) or IsValid(ply) && (CurTime() > ply.VJ_COFR_Stranger_ScreenEffect_Time) then
                hook.Remove("RenderScreenspaceEffects", hookName)
                return
            end
            ply:ScreenFade(SCREENFADE.IN, colorRed, 0.25, 0)
        end)
    end)
    hook.Add("SpawnmenuIconMenuOpen", "VJ_COFR_SpawnIconOptions", function(menu, icon, contentType)
        if contentType == "npc" then
            local npcName = icon:GetSpawnName()
            local NPCinfo = scripted_ents.Get(npcName)
            if NPCinfo && (NPCinfo.IsVJBaseSNPC && NPCinfo.VJ_COFR_NPC) then
                menu:AddSpacer()
                menu:AddOption("Spawn as NPC", function()
                    icon:DoClick()
                    local ply = LocalPlayer()
                    net.Start("VJ_COFR_ControlSpawnedNPC")
                        net.WriteString(npcName)
                        net.WriteEntity(ply)
                    net.SendToServer()
                end):SetIcon("icon16/heart.png")
            end
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local excludedMats = {
    [MAT_ANTLION] = true,
    [MAT_ALIENFLESH] = true,
    [MAT_BLOODYFLESH] = true,
    [MAT_FLESH] = true
}
function VJ.COFR_Effect_Impact(tr)
    if excludedMats[tr.MatType] then return end
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
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_COFR_DeathCode(ent)
    ent.HasBloodPool = false
    ent:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
    if GetConVar("VJ_COFR_DropAmmo"):GetInt() == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua", "GAME") then return end
    ent.DropCoFAmmo = {"weapon_cof_syringe", "ent_cof_glock_ammo", "ent_cof_g43_ammo", "ent_cof_m16_ammo", "ent_cof_p345_ammo", "ent_cof_revolver_ammo", "ent_cof_rifle_ammo", "ent_cof_shotgun_ammo", "ent_cof_tmp_ammo", "ent_cof_vp70_ammo"}
    local pickedAmmoType = VJ.PICK(ent.DropCoFAmmo)
    if pickedAmmoType != false then
        local ammoDrop = ents.Create(pickedAmmoType)
        ammoDrop:SetPos(ent:GetPos() + ent:OBBCenter())
        ammoDrop:SetLocalAngles(ent:GetAngles())
        ammoDrop:Spawn()
        ammoDrop:Activate()
        local phys = ammoDrop:GetPhysicsObject()
        if IsValid(phys) then
            phys:SetMass(1)
            phys:ApplyForceCenter(Vector())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function VJ_COFR_ApplyCorpse(ent, corpse)
    if !VJ_CVAR_AI_ENABLED then corpse:Remove() return end
    corpse.VJ_COFR_Corpse = true
    corpse.PhysgunDisabled = true
    corpse:ResetSequence(ent:GetSequence())
    corpse:SetCycle(1)
    corpse:SetMoveType(ent:GetMoveType())
    corpse:SetCollisionGroup(ent.DeathCorpseCollisionType)
    local minBounds, maxBounds = ent:GetCollisionBounds()
    corpse:SetCollisionBounds(Vector(minBounds.x, maxBounds.y, 5), Vector(-minBounds.x, -maxBounds.y, 0))
    corpse:SetSurroundingBounds(Vector(minBounds.x * 100, maxBounds.y * 100, 5 * 100), Vector(-minBounds.x * 100, -maxBounds.y * 100, 0))
end