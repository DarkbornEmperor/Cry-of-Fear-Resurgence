AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjges_ref_melee_crowbar"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.Weapon_NoSpawnMenu = true
ENT.MoveRandomlyWhenShooting = false
ENT.HasCallForHelpAnimation = false
ENT.AllowWeaponReloading = false
ENT.DropWeaponOnDeath = false
ENT.CombatFaceEnemy = false
ENT.IsMedicSNPC = true
ENT.Medic_HealthAmount = 15
ENT.AnimTbl_Medic_GiveHealth = {"vjges_ref_shoot_crowbar"}
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/w_medkit.mdl" 
ENT.Medic_SpawnPropOnHealAttachment = "pistol" 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 20
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/aom/david/pl_step1.wav",
"vj_cofr/aom/david/pl_step2.wav",
"vj_cofr/aom/david/pl_step3.wav",
"vj_cofr/aom/david/pl_step4.wav"
}
--ENT.SoundTbl_MedicBeforeHeal = {
--"vj_cofr/aom/pills/pills_pickup.wav"
--}
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
ENT.David_Shotgun = false
ENT.David_Glock = false
ENT.David_Knife = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
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
    local Weapon_Type = math.random(1,3)
    if Weapon_Type == 1 then
		self.David_Shotgun = true
        self:Give("weapon_vj_cofraom_shotgun")		
elseif Weapon_Type == 2 then
		self.David_Glock = true
        self:Give("weapon_vj_cofraom_glock")		
elseif Weapon_Type == 3 then
		self.David_Knife = true	
        self:Give("weapon_vj_cofraom_knife")		
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_CustomOnInitialize()
	 if self.David_Shotgun then 
		self:SetShotgun()		
elseif self.David_Glock then
		self:SetGlock()					
elseif self.David_Knife then
		self:SetKnife()	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     //self:SetCollisionBounds(Vector(13, 13, 77), Vector(-13, -13, 0))
     self:David_CustomOnInitialize()
     self:AssistorFlashlight()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight() 
end
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
function ENT:SetShotgun()
	self:SetBodygroup(1,3)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
	self:SetBodygroup(1,2)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetKnife()
	self:SetBodygroup(1,1)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	if IsValid(self:GetActiveWeapon()) then
		self:GetActiveWeapon():SetClip1(999)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)			
        if htype == "shotgun" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= ACT_SHOTGUN_IDLE4	
/*			
			self.WeaponAnimTranslations[ACT_WALK] 							= ACT_WALK_AIM_SHOTGUN
			self.WeaponAnimTranslations[ACT_RUN] 							= ACT_RUN_AIM_SHOTGUN
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_WALK_AIM_SHOTGUN
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_AIM_SHOTGUN
*/			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_SHOTGUN
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK2
            self.AnimTbl_WeaponAim = {ACT_SHOTGUN_IDLE4}			
					
	elseif htype == "pistol" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= ACT_IDLE_PISTOL
/*
			self.WeaponAnimTranslations[ACT_WALK] 							= ACT_WALK_PISTOL
			self.WeaponAnimTranslations[ACT_RUN] 							= ACT_RUN_PISTOL
			self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_WALK_PISTOL
			self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_PISTOL
*/			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK1
            self.AnimTbl_WeaponAim = {ACT_IDLE_PISTOL}				
			
	elseif htype == "melee" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= ACT_IDLE	
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK1
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_MELEE_ATTACK_SWING_GESTURE
            self.AnimTbl_WeaponAim = {ACT_IDLE}			
end
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.25)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
     else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
end
	//self:DropWeaponOnDeathCode(dmginfo, hitgroup)
	//self:SetBodygroup(1,0)
	//if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():Remove() end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDropWeapon_AfterWeaponSpawned(dmginfo, hitgroup, wepEnt)
	wepEnt.WorldModel_Invisible = false
	wepEnt:SetNW2Bool("VJ_WorldModel_Invisible", false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/