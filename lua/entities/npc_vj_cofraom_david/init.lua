AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david.mdl"} 
ENT.StartHealth = 200
ENT.HealthRegenerationAmount = 2
ENT.HealthRegenerationDelay = VJ.SET(0.5,0.5)
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.PoseParameterLooking_InvertPitch = true 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjseq_vjges_shoot_crowbar"}
ENT.TimeUntilMeleeAttackDamage = false
//ENT.NextMeleeAttackTime_DoRand = 0.25
ENT.NextAnyAttackTime_Melee = 1.5
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.WeaponInventory_Melee = true
ENT.WeaponReload_FindCover = false
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_AIM}
ENT.NextMoveRandomlyWhenShootingTime1 = 0
ENT.NextMoveRandomlyWhenShootingTime2 = 0.2
ENT.HasLostWeaponSightAnimation = true
ENT.WaitForEnemyToComeOut = false
ENT.HasCallForHelpAnimation = false
ENT.Weapon_NoSpawnMenu = true
ENT.IsMedicSNPC = true
ENT.Medic_TimeUntilHeal = 0.4
ENT.Medic_HealthAmount = 15
ENT.AnimTbl_Medic_GiveHealth = {"vjges_heal"}
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/w_medkit.mdl" 
ENT.Medic_SpawnPropOnHealAttachment = "rhand"
//ENT.AnimTbl_WeaponAttackSecondary = {"shoot_m203"}
ENT.WeaponAttackSecondaryTimeUntilFire = 0.05
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
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
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 40
-- Custom
ENT.Simon_French = false
ENT.Simon_Branch = false
ENT.CoFR_NextMeleeSoundT = 0
ENT.CoFR_NextWepSwitchT = 0
ENT.CoFR_NextLowHPSoundT = 0
ENT.Human_Type = 0
 	-- 0 = David & Assistor
	-- 1 = Simon
	-- 2 = Police
	-- 3 = David (Classic)

ENT.WeaponsList_AoMDC = {
	["Close"] = {
		"weapon_vj_cofraom_shotgun",
	},
	["Normal"] = {
		"weapon_vj_cofraom_beretta",
		"weapon_vj_cofraom_glock",
		"weapon_vj_cofraom_p228",
		"weapon_vj_cofraom_deagle",
		"weapon_vj_cofraom_revolver",
		"weapon_vj_cofraom_mp5k",
		"weapon_vj_cofraom_uzi"
	},
	["Far"] = {
		"weapon_vj_cofraom_l85",
	},
}
ENT.WeaponsList_AoMC = {
	["Close"] = {
		"weapon_vj_cofraomc_shotgun",
	},
	["Normal"] = {
		"weapon_vj_cofraomc_beretta",
		"weapon_vj_cofraomc_deagle",
		"weapon_vj_cofraomc_ak47",
		"weapon_vj_cofraomc_grenade",
	},
	["Far"] = {
		"weapon_vj_cofraomc_ak47",
	},
}
ENT.WeaponsList_CoF = {
	["Close"] = {
		"weapon_vj_cofr_shotgun",
	},
	["Normal"] = {
		"weapon_vj_cofr_glock",
		"weapon_vj_cofr_p345",
		"weapon_vj_cofr_pt92",
		"weapon_vj_cofr_vp70",
		"weapon_vj_cofr_browning",
		"weapon_vj_cofr_revolver",
		"weapon_vj_cofr_tmp",
		"weapon_vj_cofr_mp5",
		"weapon_vj_cofr_m76",
		"weapon_vj_cofr_m16",
		"weapon_vj_cofr_famas",
		"weapon_vj_cofr_g43",
		"weapon_vj_cofr_ak47",
	},
	["Far"] = {
		"weapon_vj_cofr_rifle",
	},
}
ENT.WeaponsList_CoF_Cont = {
	["ContWeapons"] = {
		"weapon_vj_cofr_glock",
		"weapon_vj_cofr_p345",
		"weapon_vj_cofr_pt92",
		"weapon_vj_cofr_vp70",
		"weapon_vj_cofr_browning",
		"weapon_vj_cofr_revolver",
		"weapon_vj_cofr_shotgun",
		"weapon_vj_cofr_tmp",
		"weapon_vj_cofr_mp5",
		"weapon_vj_cofr_m76",
		"weapon_vj_cofr_m16",
		"weapon_vj_cofr_famas",
		"weapon_vj_cofr_g43",
		"weapon_vj_cofr_ak47",
		"weapon_vj_cofr_rifle",
	},
}
ENT.WeaponsList_AoMDC_Cont = {
	["ContWeapons"] = {
		"weapon_vj_cofraom_beretta",
		"weapon_vj_cofraom_glock",
		"weapon_vj_cofraom_p228",
		"weapon_vj_cofraom_deagle",
		"weapon_vj_cofraom_revolver",
		"weapon_vj_cofraom_shotgun",
		"weapon_vj_cofraom_mp5k",
		"weapon_vj_cofraom_uzi",
		"weapon_vj_cofraom_l85",
	},
}
ENT.WeaponsList_AoMC_Cont = {
	["ContWeapons"] = {
		"weapon_vj_cofraomc_beretta",
		"weapon_vj_cofraomc_deagle",
		"weapon_vj_cofraomc_ak47",
		"weapon_vj_cofraomc_grenade",
		"weapon_vj_cofraomc_shotgun",
	},
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.WeaponInventory_Melee = false
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_CustomOnInitialize()
 if !self.DisableWeapons && self.Human_Type == 0 then
 if !self.WeaponInventory_Melee then
     self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_AOMDC))
	end
end
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
    "vj_cofr/aom/david/pl_pain7.wav"	
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav"	
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DavidClassic_CustomOnInitialize()
 if !self.DisableWeapons && self.Human_Type == 3 then
 if !self.WeaponInventory_Melee then
     self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_AOMC))
	end
end
 if self.Human_Type == 3 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofraomc_knife"}
    self.SoundTbl_Breath = {
    "vj_cofr/aom/david/breathe1.wav",
	"vj_cofr/aom/david/breathe2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav"	
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav"
}
    if self:GetModel() == "models/vj_cofr/aom/classic/david_old.mdl" then
	    self:SetBodygroup(0,math.random(0,1))	
	    end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Simon_CustomOnInitialize()
 if !self.DisableWeapons then
 if !self.WeaponInventory_Melee && self.Human_Type == 1 then
     self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_COF))
	end
end
 if self.Human_Type == 1 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofr_switchblade","weapon_vj_cofr_nightstick","weapon_vj_cofr_sledgehammer","weapon_vj_cofr_branch","weapon_vj_cofraom_axe","weapon_vj_cofr_pickaxe","weapon_vj_cofr_shovel","weapon_vj_cofr_stone"}
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
    self.SoundTbl_LowHealth = {
    "vj_cofr/cof/simon/lhealth1.wav",
    "vj_cofr/cof/simon/lhealth2.wav",
    "vj_cofr/cof/simon/lhealth3.wav",
    "vj_cofr/cof/simon/lhealth4.wav",
    "vj_cofr/cof/simon/lhealth5.wav"
}
    self.SoundTbl_MedicReceiveHeal = {
    "vj_cofr/cof/simon/morphine1.wav", 
    "vj_cofr/cof/simon/morphine2.wav", 
    "vj_cofr/cof/simon/morphine3.wav", 
    "vj_cofr/cof/simon/morphine4.wav", 
    "vj_cofr/cof/simon/morphine5.wav", 
    "vj_cofr/cof/simon/morphine6.wav", 
    "vj_cofr/cof/simon/morphine7.wav", 
    "vj_cofr/cof/simon/morphine8.wav" 
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
	    self:SetSkin(math.random(0,13))
end
    if self:GetSkin() == 8 && math.random(1,10) == 1 && (self:GetModel() == "models/vj_cofr/cof/simon.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_hoodless.mdl") then
        self:PlaySoundSystem("GeneralSpeech", {"vj_cofr/cof/simon/hellokitty.wav"})		
        end
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Police_CustomOnInitialize()
 if !self.DisableWeapons then
 if !self.WeaponInventory_Melee && self.Human_Type == 2 then
     self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_COF))
	end
end
 if self.Human_Type == 2 then
    self.WeaponInventory_MeleeList = {"weapon_vj_cofr_switchblade","weapon_vj_cofr_nightstick","weapon_vj_cofr_sledgehammer","weapon_vj_cofr_branch","weapon_vj_cofraom_axe","weapon_vj_cofr_pickaxe","weapon_vj_cofr_shovel","weapon_vj_cofr_stone"}
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
    self.SoundTbl_LowHealth = {
    "vj_cofr/cof/police/lhealth1.wav",
    "vj_cofr/cof/police/lhealth2.wav",
    "vj_cofr/cof/police/lhealth3.wav",
    "vj_cofr/cof/police/lhealth4.wav",	
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
 if GetConVar("VJ_COFR_Human_Regen"):GetInt() == 1 then
	self.HasHealthRegeneration = true
end
  if self:GetModel() == "models/vj_cofr/aom/david.mdl" or self:GetModel() == "models/vj_cofr/aom/david_da.mdl" or self:GetModel() == "models/vj_cofr/aom/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aom/cross.mdl" or self:GetModel() == "models/vj_cofr/aom/question.mdl" or self:GetModel() == "models/vj_cofr/aom/scream.mdl" or self:GetModel() == "models/vj_cofr/aom/two.mdl" or self:GetModel() == "models/vj_cofr/aom/david_dead_hd.mdl" or self:GetModel() == "models/vj_cofr/aom/david_hd.mdl" then // Already the default
	 self.Human_Type = 0
  elseif self:GetModel() == "models/vj_cofr/cof/simon.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_beta.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_early.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_hoodless.mdl" or self:GetModel() == "models/vj_cofr/custom/roderick.mdl" then
	 self.Human_Type = 1
  elseif self:GetModel() == "models/vj_cofr/cof/police1.mdl" or self:GetModel() == "models/vj_cofr/cof/police2.mdl" or self:GetModel() == "models/vj_cofr/cof/police3.mdl" or self:GetModel() == "models/vj_cofr/cof/police4.mdl" then
	 self.Human_Type = 2
end
	self.NextWeaponSwitchT = CurTime() + math.Rand(2,4)

 if self.WeaponInventory_Melee then	
 if self.Human_Type == 0 then
	for _,category in pairs(self.WeaponsList_AoMDC) do
		for _,wep in pairs(category) do
			self:Give(wep)
	end
end
     local wepList = math.random(1,3)
	 if wepList == 1 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Normal"]),true)
	 elseif wepList == 2 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Close"]),true)
	 elseif wepList == 3 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Far"]),true)
	end
end
 if self.Human_Type == 1 or self.Human_Type == 2 then
	for _,category in pairs(self.WeaponsList_CoF) do
		for _,wep in pairs(category) do
			self:Give(wep)
	end
end
     local wepList = math.random(1,3)
	 if wepList == 1 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Normal"]),true)
	 elseif wepList == 2 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Close"]),true)
	 elseif wepList == 3 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Far"]),true)
	end
end
 if self.Human_Type == 3 then
	for _,category in pairs(self.WeaponsList_AoMC) do
		for _,wep in pairs(category) do
			self:Give(wep)
	end
end
     local wepList = math.random(1,3)
	 if wepList == 1 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Normal"]),true)
	 elseif wepList == 2 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Close"]),true)
	 elseif wepList == 3 then
	    self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Far"]),true)
	    end
    end
end
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:David_CustomOnInitialize()
    self:Simon_CustomOnInitialize()
    self:Police_CustomOnInitialize()
    self:DavidClassic_CustomOnInitialize()	 
    self:AssistorFlashlight()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack" or (key == "melee_weapon" && IsValid(self:GetActiveWeapon()) && self:GetActiveWeapon().IsMeleeWeapon) then
		self:MeleeAttackCode()		
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
	    /*local effectdata = EffectData()
	    effectdata:SetOrigin(self:GetPos())
	    effectdata:SetScale(10)
	    util.Effect("watersplash",effectdata)*/
	    end
    end			
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
 if IsValid(self:GetActiveWeapon()) && !self.CurrentWeaponEntity.IsMeleeWeapon then
    self.MeleeAttackDamage = 15
	self.SoundTbl_MeleeAttack = {
    "vj_cofr/cof/weapons/melee_hit.wav"
}
	self.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/weapons/melee_swing.wav"
}
end
    local controller = self.VJ_TheController
    if IsValid(controller) then
	if controller:KeyDown(IN_WALK) && CurTime() > self.CoFR_NextWepSwitchT && self.WeaponInventory_Melee then 
	if self.Human_Type == 1 or self.Human_Type == 2 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF_Cont["ContWeapons"]),true) end
	if self.Human_Type == 0 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC_Cont["ContWeapons"]),true) end
	if self.Human_Type == 3 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC_Cont["ContWeapons"]),true) end
	   self.CoFR_NextWepSwitchT = CurTime() + 1    
end
	/*if controller:KeyDown(IN_DUCK) then
		self.AnimTbl_IdleStand = {ACT_COVER_LOW}
		self.AnimTbl_WeaponAttack = {ACT_COVER_LOW}
		self.AnimTbl_Walk = {ACT_WALK_CROUCH}
		self.AnimTbl_Run = {ACT_RUN_CROUCH}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_CROUCH_AIM}
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_CROUCH_AIM}
	else
		self.AnimTbl_IdleStand = {ACT_IDLE}
		self.AnimTbl_WeaponAttack = {ACT_IDLE}
		self.AnimTbl_Walk = {ACT_WALK}
		self.AnimTbl_Run = {ACT_RUN}
		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_AIM}
		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_AIM}
        end*/
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
 if self.HasSounds && !self.Dead then	
    if math.random(1,2) == 1 && self:Health() <= (self:GetMaxHealth() / 4) && self.CoFR_NextLowHPSoundT < CurTime() then
        self:PlaySoundSystem("GeneralSpeech", self.SoundTbl_LowHealth) 
	    self.CoFR_NextLowHPSoundT = CurTime() + math.random(10,20)
    end
end
 if self.Human_Type == 1 && IsValid(self:GetActiveWeapon()) then
    local wep = self:GetActiveWeapon()
	if !self.Simon_French && wep:GetClass() == "weapon_vj_cofr_famas" then self:PlaySoundSystem("GeneralSpeech", {"vj_cofr/cof/weapons/famas/french4.wav"}) self.Simon_French = true
	elseif !self.Simon_Branch && (wep:GetClass() == "weapon_vj_cofr_branch" or wep:GetClass() == "weapon_vj_cofr_stone") then self:PlaySoundSystem("GeneralSpeech", {"vj_cofr/cof/weapons/branch/branch_first_get.wav"}) self.Simon_Branch = true end 
end	
 if !self.WeaponInventory_Melee or self.DisableWeapons or !IsValid(self:GetActiveWeapon()) then return end
	local ent = self:GetEnemy()
	local dist = self.NearestPointToEnemyDistance
	if IsValid(ent) && !self.VJ_IsBeingControlled then
		local wep = self:GetActiveWeapon()
		if self.WeaponInventoryStatus == VJ.NPC_WEP_INVENTORY_MELEE then return end
		local selectType = false
		if dist > 2200 then
			selectType = "Far"
		elseif dist <= 2200 && dist > 650 then
			selectType = "Normal"
		else
			selectType = "Close"
end
		if selectType != false && !self:IsBusy() && CurTime() > self.NextWeaponSwitchT && math.random(1,wep:Clip1() > 0 && (wep:Clip1() <= wep:GetMaxClip1() *0.35) && 1 or (selectType == "Close" && 20 or 150)) == 1 then
		if self.Human_Type == 0 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC[selectType]),true) end
		if self.Human_Type == 1 or self.Human_Type == 2 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF[selectType]),true) end
		if self.Human_Type == 3 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC[selectType]),true) end
			wep = self:GetActiveWeapon()
			self.NextWeaponSwitchT = CurTime() + math.Rand(6,math.Round(math.Clamp(wep:Clip1() *0.5,1,wep:Clip1())))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_BeforeHeal() 
    if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(true) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_OnHeal(ent) 
	timer.Simple(0.1,function()
	if IsValid(self) then
		if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(false) end
	end
end) return true end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
    if self.Human_Type == 1 && math.random(1,2) == 1 then
	if ent:GetClass() == "npc_vj_cofr_purnell" then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/simon/simonbossangry.wav"})
	elseif ent:GetClass() == "npc_vj_cofr_carcass" then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/simon/simon32.wav"})
	elseif ent:GetClass() == "npc_vj_cofr_mace" then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/simon/sub3.wav"})
        end		
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMoveRandomlyWhenShooting()
    if math.random(1,3) == 1 then
        self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_CROUCH_AIM}
        self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_CROUCH_AIM}
	else
        self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_AIM}
        self.AnimTbl_ShootWhileMovingWalk = {ACT_WALK_AIM}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnWeaponReload()
 //if self.WeaponReload_FindCover then self:VJ_TASK_COVER_FROM_ORIGIN("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy_IfVisible = (IsValid(self:GetActiveWeapon()) and true) or false x.DisableChasingEnemy = false end) return end
 if self.IsGuard or self.VJ_IsBeingControlled or !IsValid(self:GetEnemy()) or self.WeaponReload_FindCover or GetConVar("VJ_COFR_Human_ReloadRun"):GetInt() == 0 or self:VJ_ForwardIsHidingZone(self:NearestPoint(self:GetPos() + self:OBBCenter()), self:GetEnemy():EyePos(), false, {SetLastHiddenTime=true}) == true then return end
 timer.Simple(0,function() if IsValid(self) && !self.Dead then
    local moveCheck = VJ.PICK(self:VJ_CheckAllFourSides(math.random(150, 400), true, "0111"))
    if moveCheck then
    self:StopMoving()
    self:SetLastPosition(moveCheck)
	self:VJ_TASK_GOTO_LASTPOS(VJ.PICK({"TASK_RUN_PATH", "TASK_WALK_PATH"}), function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.FaceData = {Type = VJ.NPC_FACE_ENEMY} end) end end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(h)
	local defIdleAim = ACT_IDLE -- ACT_IDLE_ANGRY
	local defWalkAim = ACT_WALK
	local defRunAim = ACT_RUN
	local defFire = ACT_RANGE_ATTACK1
	local defCrouch = ACT_RANGE_ATTACK1_LOW
	local defCrawl = ACT_RUN_CROUCH
	local defReload = ACT_RELOAD

	if self:GetActiveWeapon().CoFR_HoldType then -- Allow for more than default hold types
		h = self:GetActiveWeapon().CoFR_HoldType
end

	if h == "crossbow" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_bow")
		defWalkAim = VJ.SequenceToActivity(self,"walk_bow")
		defRunAim = VJ.SequenceToActivity(self,"run_bow")
		defCrouch = VJ.SequenceToActivity(self,"crouch_bow")
		defCrawl = VJ.SequenceToActivity(self,"crawl_bow")
		defFire = "vjges_shoot_bow"
		defReload = "vjges_reload_bow"
	elseif h == "melee" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_crowbar")
		defWalkAim = VJ.SequenceToActivity(self,"walk_crowbar")
		defRunAim = VJ.SequenceToActivity(self,"run_crowbar")
		defCrouch = VJ.SequenceToActivity(self,"crouch_crowbar")
		defCrawl = VJ.SequenceToActivity(self,"crawl_crowbar")
		defFire = "vjges_shoot_crowbar_melee"
		defReload = "vjges_reload_crowbar"
	elseif h == "ar2" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_gauss")
		defWalkAim = VJ.SequenceToActivity(self,"walk_gauss")
		defRunAim = VJ.SequenceToActivity(self,"run_gauss")
		defCrouch = VJ.SequenceToActivity(self,"crouch_gauss")
		defCrawl = VJ.SequenceToActivity(self,"crawl_gauss")
		defFire = "vjges_shoot_gauss"
		defReload = "vjges_reload_gauss"
	elseif h == "physgun" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_hive")
		defWalkAim = VJ.SequenceToActivity(self,"walk_hive")
		defRunAim = VJ.SequenceToActivity(self,"run_hive")
		defCrouch = VJ.SequenceToActivity(self,"crouch_hive")
		defCrawl = VJ.SequenceToActivity(self,"crawl_hive")
		defFire = "vjges_shoot_hive"
		defReload = "vjges_reload_hive"
	elseif h == "smg" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_mp5")
		defWalkAim = VJ.SequenceToActivity(self,"walk_mp5")
		defRunAim = VJ.SequenceToActivity(self,"run_mp5")
		defCrouch = VJ.SequenceToActivity(self,"crouch_mp5")
		defCrawl = VJ.SequenceToActivity(self,"crawl_mp5")
		defFire = "vjges_shoot_mp5"
		defReload = "vjges_reload_mp5"
	elseif h == "pistol" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_onehanded")
		defWalkAim = VJ.SequenceToActivity(self,"walk_onehanded")
		defRunAim = VJ.SequenceToActivity(self,"run_onehanded")
		defCrouch = VJ.SequenceToActivity(self,"crouch_onehanded")
		defCrawl = VJ.SequenceToActivity(self,"crawl_onehanded")
		defFire = "vjges_shoot_onehanded"
		defReload = "vjges_reload_onehanded"
	elseif h == "revolver" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_python")
		defWalkAim = VJ.SequenceToActivity(self,"walk_python")
		defRunAim = VJ.SequenceToActivity(self,"run_python")
		defCrouch = VJ.SequenceToActivity(self,"crouch_python")
		defCrawl = VJ.SequenceToActivity(self,"crawl_python")
		defFire = "vjges_shoot_python"
		defReload = "vjges_reload_python"
	elseif h == "rpg" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_rpg")
		defWalkAim = VJ.SequenceToActivity(self,"walk_rpg")
		defRunAim = VJ.SequenceToActivity(self,"run_rpg")
		defCrouch = VJ.SequenceToActivity(self,"crouch_rpg")
		defCrawl = VJ.SequenceToActivity(self,"crawl_rpg")
		defFire = "vjges_shoot_rpg"
		defReload = "vjges_reload_rpg"
	elseif h == "shotgun" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_shotgun")
		defWalkAim = VJ.SequenceToActivity(self,"walk_shotgun")
		defRunAim = VJ.SequenceToActivity(self,"run_shotgun")
		defCrouch = VJ.SequenceToActivity(self,"crouch_shotgun")
		defCrawl = VJ.SequenceToActivity(self,"crawl_shotgun")
		defFire = "vjges_shoot_shotgun"
		defReload = "vjges_reload_shotgun"
	elseif h == "slam" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_squeak")
		defWalkAim = VJ.SequenceToActivity(self,"walk_squeak")
		defRunAim = VJ.SequenceToActivity(self,"run_squeak")
		defCrouch = VJ.SequenceToActivity(self,"crouch_squeak")
		defCrawl = VJ.SequenceToActivity(self,"crawl_squeak")
		defFire = "vjges_shoot_squeak"
		defReload = "vjges_reload_squeak"
	elseif h == "grenade" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_gren")
		defWalkAim = VJ.SequenceToActivity(self,"walk_gren")
		defRunAim = VJ.SequenceToActivity(self,"run_gren")
		defCrouch = VJ.SequenceToActivity(self,"crouch_gren")
		defCrawl = VJ.SequenceToActivity(self,"crawl_gren")
		defFire = "vjges_shoot_gren"
		defReload = "vjges_reload_onehanded" //vjges_reload_gren
	elseif h == "saw" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_saw")
		defWalkAim = VJ.SequenceToActivity(self,"walk_saw")
		defRunAim = VJ.SequenceToActivity(self,"run_saw")
		defCrouch = VJ.SequenceToActivity(self,"crouch_saw")
		defCrawl = VJ.SequenceToActivity(self,"crawl_saw")
		defFire = "vjges_shoot_saw"
		defReload = "vjges_reload_saw"
	elseif h == "sniper" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_sniper")
		defWalkAim = VJ.SequenceToActivity(self,"walk_sniper")
		defRunAim = VJ.SequenceToActivity(self,"run_sniper")
		defCrouch = VJ.SequenceToActivity(self,"crouch_sniper")
		defCrawl = VJ.SequenceToActivity(self,"crawl_sniper")
		defFire = "vjges_shoot_sniper"
		defReload = "vjges_reload_sniper"
	elseif h == "m16" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_m16")
		defWalkAim = VJ.SequenceToActivity(self,"walk_m16")
		defRunAim = VJ.SequenceToActivity(self,"run_m16")
		defCrouch = VJ.SequenceToActivity(self,"crouch_m16")
		defCrawl = VJ.SequenceToActivity(self,"crawl_m16")
		defFire = "vjges_shoot_m16"
		defReload = "vjges_reload_m16"
	elseif h == "shockrifle" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_m16")
		defWalkAim = VJ.SequenceToActivity(self,"walk_m16")
		defRunAim = VJ.SequenceToActivity(self,"run_m16")
		defCrouch = VJ.SequenceToActivity(self,"crouch_m16")
		defCrawl = VJ.SequenceToActivity(self,"crawl_m16")
		defFire = "vjges_shoot_m16"
		defReload = "vjges_reload_null"
	elseif h == "minigun" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_minigun")
		defWalkAim = VJ.SequenceToActivity(self,"walk_minigun")
		defRunAim = VJ.SequenceToActivity(self,"run_minigun")
		defCrouch = VJ.SequenceToActivity(self,"crouch_minigun")
		defCrawl = VJ.SequenceToActivity(self,"crawl_minigun")
		defFire = "vjges_shoot_minigun"
		defReload = "vjges_reload_minigun"
	elseif h == "uzi" then
		defIdleAim = VJ.SequenceToActivity(self,"aim_hive")
		defWalkAim = VJ.SequenceToActivity(self,"walk_hive")
		defRunAim = VJ.SequenceToActivity(self,"run_hive")
		defCrouch = VJ.SequenceToActivity(self,"crouch_hive")
		defCrawl = VJ.SequenceToActivity(self,"crawl_hive")
		defFire = "vjges_shoot_hive"
		defReload = "vjges_reload_uzis_right"
end

	self.WeaponAnimTranslations[ACT_IDLE] = defIdleAim
	self.WeaponAnimTranslations[ACT_IDLE_ANGRY] = defIdleAim
	self.WeaponAnimTranslations[ACT_WALK] = defWalkAim
	self.WeaponAnimTranslations[ACT_WALK_AIM] = defWalkAim
	self.WeaponAnimTranslations[ACT_RUN] = defRunAim
	self.WeaponAnimTranslations[ACT_RUN_AIM] = defRunAim
	self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] = defIdleAim
	self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] = defCrouch
	self.WeaponAnimTranslations[ACT_COVER_LOW] = defCrouch
	self.WeaponAnimTranslations[ACT_WALK_CROUCH] = defCrawl
	self.WeaponAnimTranslations[ACT_WALK_CROUCH_AIM] = defCrawl
	self.WeaponAnimTranslations[ACT_RUN_CROUCH] = defCrawl
	self.WeaponAnimTranslations[ACT_RUN_CROUCH_AIM] = defCrawl
	self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] = defFire
	self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK2] = defFire
	self.WeaponAnimTranslations[ACT_RELOAD] = defReload
	self.WeaponAnimTranslations[ACT_RELOAD_LOW] = defReload
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
     else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
end
	self:DoDropWeaponOnDeath(dmginfo,hitgroup)
	local activeWep = self:GetActiveWeapon()
	if IsValid(activeWep) then activeWep:Remove() end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
 if self.Human_Type == 2 or self.Human_Type == 0 then 
 if self.Human_Type == 2 then corpseEnt:SetBodygroup(0,0) end
	corpseEnt:SetSkin(0)
end
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDropWeapon(dmginfo,hitgroup,wepEnt)
	wepEnt:SetModelScale(1)
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
		VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(customSd)
	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	if self:IsOnGround() && self:GetGroundEntity() != NULL then
		if self.DisableFootStepSoundTimer then
			local customTbl = VJ.PICK(customSd)
			local sdtbl = VJ.PICK(self.SoundTbl_FootStep)
			if customTbl then sdtbl = customTbl end
			VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
			local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Event", sdtbl) end
			if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
			return
		elseif self:IsMoving() && CurTime() > self.FootStepT && self:GetInternalVariable("m_flMoveWaitFinished") <= 0 then
			local customTbl = VJ.PICK(customSd)
			local sdtbl = VJ.PICK(self.SoundTbl_FootStep)
			if customTbl then sdtbl = customTbl end
			local curSched = self.CurrentSchedule
			if !self.DisableFootStepOnRun && ((VJ.HasValue(self.AnimTbl_Run, self:GetMovementActivity())) or (curSched != nil && curSched.MoveType == 1)) then
				VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
				local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Run", sdtbl) end
				if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return
			elseif !self.DisableFootStepOnWalk && (VJ.HasValue(self.AnimTbl_Walk, self:GetMovementActivity()) or (curSched != nil && curSched.MoveType == 0)) then
				VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
				local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Walk", sdtbl) end
				if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/