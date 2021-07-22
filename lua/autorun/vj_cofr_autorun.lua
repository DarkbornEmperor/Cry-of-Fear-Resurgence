/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
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

	local vCat = "CoF Resurgence" 
	VJ.AddCategoryInfo("CoF Resurgence", {Icon = "vj_cofr/icons/cofr.png"})
	-- Cry of Fear --
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
    VJ.AddNPC("Drowned","npc_vj_cofr_drowned",vCat)
	VJ.AddNPC("Crazyrunner","npc_vj_cofr_crazyrunner",vCat)
	VJ.AddNPC("Sewmo","npc_vj_cofr_sewmo",vCat)
	VJ.AddNPC("Citalopram","npc_vj_cofr_citalopram",vCat)
	VJ.AddNPC("Faceless","npc_vj_cofr_faceless",vCat) 
	VJ.AddNPC("Krypandenej","npc_vj_cofr_krypandenej",vCat)
    VJ.AddNPC("Suicider","npc_vj_cofr_suicider",vCat)
	VJ.AddNPC("Taller","npc_vj_cofr_taller",vCat)
    VJ.AddNPC("Psycho","npc_vj_cofr_psycho",vCat)	
	VJ.AddNPC("Stranger","npc_vj_cofr_stranger",vCat)
	
	-- Afraid of Monsters --
    VJ.AddNPC("Twitcher","npc_vj_cofr_twitcher",vCat)
	VJ.AddNPC("Twitcher (Dark Assistance)","npc_vj_cofr_twitcherda",vCat)
    VJ.AddNPC("Handcrab","npc_vj_cofr_handcrab",vCat)
	VJ.AddNPC("Wheelchair Twitcher","npc_vj_cofr_wheelchair",vCat)	
	
/*
    VJ.AddNPC("Ghost","npc_vj_cofr_ghost",vCat)
    VJ.AddNPC("Bleeding Spector","npc_vj_cofr_bleedspector",vCat)
    VJ.AddNPC("Addiction","npc_vj_cofr_addiction",vCat)
    VJ.AddNPC("One-Eyed Dog","npc_vj_cofr_dog",vCat)
	VJ.AddNPC("Mouth Monster","npc_vj_cofr_mouth",vCat)
	VJ.AddNPC("Abomination","npc_vj_cofr_abomination",vCat)
	VJ.AddNPC("Twitcher Spitter","npc_vj_cofr_twitcherspit",vCat)
    VJ.AddNPC("Dreamer","npc_vj_cofr_dreamer",vCat)
    VJ.AddNPC("Spitter","npc_vj_cofr_spitter",vCat)
    VJ.AddNPC("Watro","npc_vj_cofr_watro",vCat) 	
*/	

    -- Particles --
    game.AddParticles( "particles/vj_cofr_soul.pcf" )
    game.AddParticles( "particles/vj_cofr_soulsplat.pcf" )
    game.AddParticles( "particles/vj_cofr_face.pcf" )
    game.AddParticles( "particles/vj_cofr_spit.pcf" )
	game.AddParticles( "particles/vj_cofr_spitgib.pcf" )
    PrecacheParticleSystem("face")
    PrecacheParticleSystem("aomsoul")
    PrecacheParticleSystem("aomsoulsplat")
    PrecacheParticleSystem("mommaspit")
	PrecacheParticleSystem("MommaSpitGib")
	
	-- Precache Models --
	util.PrecacheModel("models/vj_cofr/slower.mdl")
	util.PrecacheModel("models/vj_cofr/crawler.mdl")
	util.PrecacheModel("models/vj_cofr/croucher.mdl")
	util.PrecacheModel("models/vj_cofr/slower3.mdl")
	util.PrecacheModel("models/vj_cofr/slowerno.mdl")
	util.PrecacheModel("models/vj_cofr/slower10.mdl")
	util.PrecacheModel("models/vj_cofr/slower102.mdl")	
	util.PrecacheModel("models/vj_cofr/baby.mdl")
	util.PrecacheModel("models/vj_cofr/faster.mdl")
	util.PrecacheModel("models/vj_cofr/faster2.mdl")
	util.PrecacheModel("models/vj_cofr/drowned.mdl")
	util.PrecacheModel("models/vj_cofr/headcrab.mdl")
	util.PrecacheModel("models/vj_cofr/sewmo.mdl")
	util.PrecacheModel("models/vj_cofr/crazyrunner.mdl")
	util.PrecacheModel("models/vj_cofr/children.mdl")
	util.PrecacheModel("models/vj_cofr/citalopram.mdl")
	util.PrecacheModel("models/vj_cofr/krypandenej.mdl")
	util.PrecacheModel("models/vj_cofr/children.mdl")	
	util.PrecacheModel("models/vj_cofr/faceless.mdl")
	util.PrecacheModel("models/vj_cofr/faceless2.mdl")
	util.PrecacheModel("models/vj_cofr/faceless3.mdl")
	util.PrecacheModel("models/vj_cofr/faceless_twister.mdl")
	util.PrecacheModel("models/vj_cofr/faceless_twisterv.mdl")
    util.PrecacheModel("models/vj_cofr/upper.mdl")		
	util.PrecacheModel("models/vj_cofr/zombie.mdl")
	util.PrecacheModel("models/vj_cofr/zombie2.mdl")
	util.PrecacheModel("models/vj_cofr/zombie3.mdl")
	util.PrecacheModel("models/vj_cofr/zombie4.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie5.mdl")
	util.PrecacheModel("models/vj_cofr/zombie2_1.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie2_2.mdl")
	util.PrecacheModel("models/vj_cofr/zombie2_3.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie2_4.mdl")
	util.PrecacheModel("models/vj_cofr/zombie2_5.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie3_1.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie3_2.mdl")
	util.PrecacheModel("models/vj_cofr/zombie3_3.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie3_4.mdl")
	util.PrecacheModel("models/vj_cofr/zombie3_5.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie4_1.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie4_2.mdl")
	util.PrecacheModel("models/vj_cofr/zombie4_3.mdl")	
	util.PrecacheModel("models/vj_cofr/zombie4_4.mdl")
	util.PrecacheModel("models/vj_cofr/zombie4_5.mdl")		
	
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