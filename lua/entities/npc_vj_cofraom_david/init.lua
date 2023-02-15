AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david.mdl"} 
ENT.StartHealth = 200
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 2
ENT.HealthRegenerationDelay = VJ_Set(0.5,0.5)
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjges_shoot_crowbar"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.WeaponReload_FindCover = false
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_AIM}
ENT.NextMoveRandomlyWhenShootingTime1 = 0
ENT.NextMoveRandomlyWhenShootingTime2 = 0.2
ENT.WeaponInventory_Melee = true
ENT.WaitForEnemyToComeOut = false
ENT.HasCallForHelpAnimation = false
ENT.DropWeaponOnDeath = false
ENT.Weapon_NoSpawnMenu = true
ENT.IsMedicSNPC = true
ENT.Medic_HealthAmount = 15
ENT.AnimTbl_Medic_GiveHealth = {"vjges_shoot_crowbar_custom"}
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/w_medkit.mdl" 
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_RH" 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
/*
ENT.SoundTbl_MedicBeforeHeal = {
"vj_cofr/aom/pills/pills_pickup.wav"
}
*/
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/cof/weapons/melee_hit.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/weapons/melee_swing.wav"
}
ENT.SoundTbl_MedicAfterHeal = {
"vj_cofr/aom/pills/pills_use.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 40
-- Custom
ENT.Simon_French = false
ENT.Simon_Branch = false
//ENT.LowHealth_NextSoundT = 0
ENT.Human_Type = 0
 	-- 0 = David & Assistor
	-- 1 = Simon
	-- 2 = Police

ENT.WeaponsList_AoMDC = {
	["Close"] = {
		"weapon_vj_cofraom_beretta",
		"weapon_vj_cofraom_glock",
		"weapon_vj_cofraom_p228",
		"weapon_vj_cofraom_shotgun",
	},
	["Normal"] = {
		"weapon_vj_cofraom_deagle",
		"weapon_vj_cofraom_revolver",
		"weapon_vj_cofraom_mp5k",
		"weapon_vj_cofraom_uzi",
	},
	["Far"] = {
		"weapon_vj_cofraom_l85",
	},
}
ENT.WeaponsList_CoF = {
	["Close"] = {
		"weapon_vj_cofr_glock",
		"weapon_vj_cofr_p345",
		"weapon_vj_cofr_m76",
		"weapon_vj_cofr_vp70",
		"weapon_vj_cofr_browning",
		"weapon_vj_cofr_shotgun",
	},
	["Normal"] = {
		"weapon_vj_cofr_revolver",
		"weapon_vj_cofr_tmp",
		"weapon_vj_cofr_m16",
		"weapon_vj_cofr_famas",
		"weapon_vj_cofr_g43",
		"weapon_vj_cofr_ak47",
	},
	["Far"] = {
		"weapon_vj_cofr_rifle",
	},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_CustomOnInitialize()
 if self.Human_Type == 0 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofraom_knife","weapon_vj_cofraom_hammer","weapon_vj_cofraom_axe","weapon_vj_cofraom_spear"}
    self.SoundTbl_Breath = {
    "vj_cofr/aom/david/breathe1.wav",
	"vj_cofr/aom/david/breathe2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav",	
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav",	
}	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Simon_CustomOnInitialize()
 if self.Human_Type == 1 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofr_switchblade","weapon_vj_cofr_nightstick","weapon_vj_cofr_sledgehammer","weapon_vj_cofr_branch","weapon_vj_cofraom_axe","weapon_vj_cofr_pickaxe","weapon_vj_cofr_shovel"}
    self.SoundTbl_Breath = {
    "vj_cofr/cof/simon/breathing.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/simon/Swing1.wav",
	"vj_cofr/cof/simon/Swing2.wav",
	"vj_cofr/cof/simon/Swing3.wav",
	"vj_cofr/cof/simon/Swing4.wav",
	"vj_cofr/cof/simon/Swing5.wav",
	"vj_cofr/cof/simon/Swing6.wav",
	"vj_cofr/cof/simon/Swing7.wav",
	"vj_cofr/cof/simon/Swing8.wav",
	"vj_cofr/cof/simon/Swing9.wav",
	"vj_cofr/cof/simon/Swing10.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/simon/Pain1.wav",
	"vj_cofr/cof/simon/Pain2.wav",
	"vj_cofr/cof/simon/Pain3.wav",
	"vj_cofr/cof/simon/Pain4.wav",
	"vj_cofr/cof/simon/Pain5.wav",
	"vj_cofr/cof/simon/Pain6.wav",
	"vj_cofr/cof/simon/Pain7.wav",
	"vj_cofr/cof/simon/Pain8.wav",
	"vj_cofr/cof/simon/Pain9.wav",
	"vj_cofr/cof/simon/Pain10.wav",
	"vj_cofr/cof/simon/Pain11.wav",
	"vj_cofr/cof/simon/Pain12.wav",
	"vj_cofr/cof/simon/Pain13.wav",
	"vj_cofr/cof/simon/Pain14.wav",
	"vj_cofr/cof/simon/Pain15.wav",
	"vj_cofr/cof/simon/Pain16.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "vj_cofr/cof/simon/morphine1.wav", 
    "vj_cofr/cof/simon/morphine2.wav", 
    "vj_cofr/cof/simon/morphine3.wav", 
    "vj_cofr/cof/simon/morphine4.wav", 
    "vj_cofr/cof/simon/morphine5.wav", 
    "vj_cofr/cof/simon/morphine6.wav", 
    "vj_cofr/cof/simon/morphine7.wav", 
    "vj_cofr/cof/simon/morphine8.wav", 
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/simon/death1.wav",
	"vj_cofr/cof/simon/death2.wav",
	"vj_cofr/cof/simon/death3.wav",
	"vj_cofr/cof/simon/death4.wav",
	"vj_cofr/cof/simon/death5.wav",
	"vj_cofr/cof/simon/death6.wav",
	"vj_cofr/cof/simon/death7.wav"
}
    if GetConVar("VJ_COFR_Simon_Costumes"):GetInt() == 1 then
	    self:SetSkin(math.random(0,11))
        end	
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Police_CustomOnInitialize()
 if self.Human_Type == 2 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofr_switchblade","weapon_vj_cofr_nightstick","weapon_vj_cofr_sledgehammer","weapon_vj_cofr_branch","weapon_vj_cofraom_axe","weapon_vj_cofr_pickaxe","weapon_vj_cofr_shovel"}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/police/Swing1.wav",
	"vj_cofr/cof/police/Swing2.wav",
	"vj_cofr/cof/police/Swing3.wav",
	"vj_cofr/cof/police/Swing4.wav",
	"vj_cofr/cof/police/Swing5.wav",
	"vj_cofr/cof/police/Swing6.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/police/Pain1.wav",
	"vj_cofr/cof/police/Pain2.wav",
	"vj_cofr/cof/police/Pain3.wav",
	"vj_cofr/cof/police/Pain4.wav",
	"vj_cofr/cof/police/Pain5.wav",
	"vj_cofr/cof/police/Pain6.wav",
	"vj_cofr/cof/police/Pain7.wav",
	"vj_cofr/cof/police/Pain8.wav",
	"vj_cofr/cof/police/Pain9.wav",
	"vj_cofr/cof/police/Pain10.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "vj_cofr/cof/police/morphine1.wav", 
    "vj_cofr/cof/police/morphine2.wav", 
    "vj_cofr/cof/police/morphine3.wav", 
    "vj_cofr/cof/police/morphine4.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/police/death1.wav",
	"vj_cofr/cof/police/death2.wav",
	"vj_cofr/cof/police/death3.wav",
	"vj_cofr/cof/police/death4.wav",
	"vj_cofr/cof/police/death5.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
 if GetConVar("VJ_COFR_Human_ReloadCover"):GetInt() == 1 then 
    self.WeaponReload_FindCover = true
end
  if self:GetModel() == "models/vj_cofr/aom/david.mdl" or self:GetModel() == "models/vj_cofr/aom/david_da.mdl" or self:GetModel() == "models/vj_cofr/aom/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aom/cross.mdl" or self:GetModel() == "models/vj_cofr/aom/question.mdl" or self:GetModel() == "models/vj_cofr/aom/scream.mdl" or self:GetModel() == "models/vj_cofr/aom/two.mdl" or self:GetModel() == "models/vj_cofr/aom/david_dead_hd.mdl" or self:GetModel() == "models/vj_cofr/aom/david_hd.mdl" then // Already the default
	 self.Human_Type = 0
  elseif self:GetModel() == "models/vj_cofr/cof/simon.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_beta.mdl" then
	 self.Human_Type = 1
  elseif self:GetModel() == "models/vj_cofr/cof/police1.mdl" or self:GetModel() == "models/vj_cofr/cof/police2.mdl" or self:GetModel() == "models/vj_cofr/cof/police3.mdl" or self:GetModel() == "models/vj_cofr/cof/police4.mdl" then
	 self.Human_Type = 2
end
	self.NextWeaponSwitchT = CurTime() + math.Rand(2,4)
	
 if self.Human_Type == 0 then
	for _,category in pairs(self.WeaponsList_AoMDC) do
		for _,wep in pairs(category) do
			self:Give(wep)
	end
end

	 self:DoChangeWeapon(VJ_PICK(self.WeaponsList_AoMDC["Normal"]),true)
end
 if self.Human_Type == 1 or self.Human_Type == 2 then
	for _,category in pairs(self.WeaponsList_CoF) do
		for _,wep in pairs(category) do
			self:Give(wep)
	end
end

	 self:DoChangeWeapon(VJ_PICK(self.WeaponsList_CoF["Normal"]),true)
end		 
     self:David_CustomOnInitialize()
     self:Simon_CustomOnInitialize()
     self:Police_CustomOnInitialize()	 
     self:AssistorFlashlight()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end		
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
 if self.Human_Type == 1 then
    local wep = self:GetActiveWeapon()
	if !self.Simon_French && wep:GetClass() == "weapon_vj_cofr_famas" then self.French = VJ_CreateSound(self,"vj_cofr/cof/weapons/famas/french4.wav",75, 100) self.Simon_French = true
	elseif !self.Simon_Branch && wep:GetClass() == "weapon_vj_cofr_branch" then self.Branch = VJ_CreateSound(self,"vj_cofr/cof/weapons/branch/branch_first_get.wav",75, 100) self.Simon_Branch = true end 
end	
	local ent = self:GetEnemy()
	local dist = self.NearestPointToEnemyDistance
	if IsValid(ent) then
		local wep = self:GetActiveWeapon()
		local selectType = false
		if dist > 2200 then
			selectType = "Far"
		elseif dist <= 2200 && dist > 650 then
			selectType = "Normal"
		else
			selectType = "Close"
end
		if selectType != false && !self:IsBusy() && CurTime() > self.NextWeaponSwitchT && math.random(1,wep:Clip1() > 0 && (wep:Clip1() <= wep:GetMaxClip1() *0.35) && 1 or (selectType == "Close" && 20 or 150)) == 1 then
		if self.Human_Type == 0 then self:DoChangeWeapon(VJ_PICK(self.WeaponsList_AoMDC[selectType]),true) end
		if self.Human_Type == 1 or self.Human_Type == 2 then self:DoChangeWeapon(VJ_PICK(self.WeaponsList_CoF[selectType]),true) end
			wep = self:GetActiveWeapon()
			self.NextWeaponSwitchT = CurTime() + math.Rand(6,math.Round(math.Clamp(wep:Clip1() *0.5,1,wep:Clip1())))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)			
        if htype == "shotgun" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_SHOTGUN_IDLE4}) 		
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK_AGITATED})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN_AGITATED})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_RUN_AGITATED
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_AGITATED				
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_SHOTGUN
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_SHOTGUN_LOW
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_SHOTGUN
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 		= ACT_GESTURE_RANGE_ATTACK2_LOW			
			self.WeaponAnimTranslations[ACT_RELOAD] 					    = "vjges_reload_shotgun"
			self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_shotgun"	
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					    = ACT_COVER_LOW
            self.AnimTbl_WeaponAim = {ACT_SHOTGUN_IDLE4}			

	elseif htype == "ar2" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_RIFLE})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK_RIFLE})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN_RIFLE})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_RUN_RIFLE
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_RIFLE				
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_AR2_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 		= ACT_GESTURE_RANGE_ATTACK_SMG1_LOW			
			self.WeaponAnimTranslations[ACT_RELOAD] 					    = "vjges_reload_m16"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_m16"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					    = ACT_COVER_MED
            self.AnimTbl_WeaponAim = {ACT_IDLE_RIFLE}

	elseif htype == "smg" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_PISTOL})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_RUN_PISTOL
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_PISTOL			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_PISTOL_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 		= ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
			self.WeaponAnimTranslations[ACT_RELOAD] 					    = "vjges_reload_onehanded"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_onehanded"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					    = ACT_COVER
            self.AnimTbl_WeaponAim = {ACT_IDLE_PISTOL}			
					
	elseif htype == "pistol" or htype == "revolver"  then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_PISTOL})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_RUN_PISTOL
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_PISTOL			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_PISTOL_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 	    = ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
			self.WeaponAnimTranslations[ACT_RELOAD] 					    = "vjges_reload_onehanded"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_onehanded"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					    = ACT_COVER
            self.AnimTbl_WeaponAim = {ACT_IDLE_PISTOL}				
			
	elseif htype == "melee" then
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_IDLE_ANGRY
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= "vjges_shoot_crowbar_custom"
			self.WeaponAnimTranslations[ACT_COVER_LOW] 						= ACT_COVER			
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_ANGRY})
			self.WeaponAnimTranslations[ACT_IDLE_ANGRY] 					= ACT_IDLE_ANGRY			
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_STIMULATED})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_WALK_STIMULATED			
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_STIMULATED})
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_STIMULATED	
            self.AnimTbl_WeaponAim = {ACT_IDLE_ANGRY}			
end
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
     else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
end	
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ_STOPSOUND(self.French)
	VJ_STOPSOUND(self.Branch)
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootSteps = {
	[MAT_ANTLION] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_BLOODYFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_CONCRETE] = {
        "vj_cofr/aom/david/footsteps/pl_step1.wav",
        "vj_cofr/aom/david/footsteps/pl_step2.wav",
        "vj_cofr/aom/david/footsteps/pl_step3.wav",
        "vj_cofr/aom/david/footsteps/pl_step4.wav"
	},
	[MAT_DIRT] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_FLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_GRATE] = {
        "vj_cofr/aom/david/footsteps/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps/pl_metal4.wav"
	},
	[MAT_ALIENFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[74] = { -- Snow
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_PLASTIC] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[MAT_METAL] = {
        "vj_cofr/aom/david/footsteps/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps/pl_metal4.wav"
	},
	[MAT_SAND] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_FOLIAGE] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_COMPUTER] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[MAT_SLOSH] = {
        "vj_cofr/aom/david/footsteps/pl_slosh1.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh2.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh3.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh4.wav"
	},
	[MAT_TILE] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[85] = { -- Grass
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_VENT] = {
        "vj_cofr/aom/david/footsteps/pl_duct1.wav",
        "vj_cofr/aom/david/footsteps/pl_duct2.wav",
        "vj_cofr/aom/david/footsteps/pl_duct3.wav",
        "vj_cofr/aom/david/footsteps/pl_duct4.wav"
	},
	[MAT_WOOD] = {
        "vj_cofr/aom/david/footsteps/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps/pl_grate4.wav"
	},
	[MAT_GLASS] = {
        "vj_cofr/aom/david/footsteps/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps/pl_grate4.wav"
	}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(CustomTbl)
	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	if self:IsOnGround() && self:GetGroundEntity() != NULL then
		if self.DisableFootStepSoundTimer == true then
			self:CustomOnFootStepSound()
			return
		elseif self:IsMoving() && CurTime() > self.FootStepT then
			self:CustomOnFootStepSound()
			local CurSched = self.CurrentSchedule
			if self.DisableFootStepOnRun == false && ((VJ_HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or (CurSched != nil  && CurSched.IsMovingTask_Run == true)) /*(VJ_HasValue(VJ_RunActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomRunActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return
			elseif self.DisableFootStepOnWalk == false && (VJ_HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or (CurSched != nil  && CurSched.IsMovingTask_Walk == true)) /*(VJ_HasValue(VJ_WalkActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomWalkActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Walk()
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/