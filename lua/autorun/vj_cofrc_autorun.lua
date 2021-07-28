/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Cry of Fear Resurgence - Custom Content"
local AddonName = "Cry of Fear Resurgence - Custom Content"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_cofrc_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	-- Custom --
	vCat = "CoF Resurgence: Custom"
    VJ.AddNPC("Slower 1","npc_vj_cofrc_slower1",vCat)
	VJ.AddNPC("Slower 3","npc_vj_cofrc_slower3",vCat)
	VJ.AddNPC("Slower No","npc_vj_cofrc_slowerno",vCat)
	VJ.AddNPC("Slower 10","npc_vj_cofrc_slower10",vCat)
    VJ.AddNPC("Croucher","npc_vj_cofrc_croucher",vCat)	
    VJ.AddNPC("Crawler","npc_vj_cofrc_crawler",vCat)
	VJ.AddNPC("Crawler 2","npc_vj_cofrc_crawler2",vCat)
	VJ.AddNPC("Krypandenej","npc_vj_cofrc_krypandenej",vCat)
    VJ.AddNPC("Faceless (Claw)","npc_vj_cofrc_facelessclaw",vCat)	
    VJ.AddNPC("Suicider","npc_vj_cofrc_suicider",vCat)
    VJ.AddNPC("Suicider 3","npc_vj_cofrc_suicider3",vCat)
    VJ.AddNPC("Sewmo","npc_vj_cofrc_sewmo",vCat)		

	-- Afraid of Monsters: Remod --
	vCat = "CoF Resurgence: AoM"	
	VJ.AddNPC("Twitcher (HD)","npc_vj_cofraom_twitcherhd",vCat)
	VJ.AddNPC("Handcrab (HD)","npc_vj_cofraom_handcrabhd",vCat)
	VJ.AddNPC("Spitter Twitcher (HD)","npc_vj_cofraom_twitcherspithd",vCat)
    VJ.AddNPC("One-Eyed Dog (HD)","npc_vj_cofraom_doghd",vCat)		
	VJ.AddNPC("Abomination (HD)","npc_vj_cofraom_abominationhd",vCat)
	VJ.AddNPC("Launcher Ghost (HD)","npc_vj_cofraom_ghosthd",vCat)
    VJ.AddNPC("The Addiction (HD)","npc_vj_cofraom_addictionhd",vCat)
	
	-- Precache Models --
    util.PrecacheModel("models/vj_cofr/custom/suicider.mdl")
    util.PrecacheModel("models/vj_cofr/custom/suicider3.mdl")
    util.PrecacheModel("models/vj_cofr/custom/sewmo.mdl")
    util.PrecacheModel("models/vj_cofr/custom/slower1.mdl")
    util.PrecacheModel("models/vj_cofr/custom/slower3.mdl")
    util.PrecacheModel("models/vj_cofr/custom/slowerno.mdl") 
    util.PrecacheModel("models/vj_cofr/custom/slower10.mdl")  	
    util.PrecacheModel("models/vj_cofr/custom/croucher.mdl")
    util.PrecacheModel("models/vj_cofr/custom/crawler.mdl")
    util.PrecacheModel("models/vj_cofr/custom/crawler2.mdl")
    util.PrecacheModel("models/vj_cofr/custom/krypandenej.mdl")
    util.PrecacheModel("models/vj_cofr/custom/faceless_claw.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombiehd.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombiehd2.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombiehd3.mdl")
	util.PrecacheModel("models/vj_cofr/aom/zombiehd4.mdl")
    util.PrecacheModel("models/vj_cofr/aom/david_monsterhd.mdl")
    util.PrecacheModel("models/vj_cofr/aom/controllerhd.mdl")
    util.PrecacheModel("models/vj_cofr/aom/ghosthd.mdl")
    util.PrecacheModel("models/vj_cofr/aom/black_doghd.mdl")
    util.PrecacheModel("models/vj_cofr/aom/bullsquidhd.mdl")
	
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