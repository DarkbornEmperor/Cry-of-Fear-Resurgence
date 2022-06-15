AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david.mdl"} 
ENT.StartHealth = 200
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = 2
ENT.HealthRegenerationDelay = VJ_Set(0.5,0.5)
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {"vjges_shoot_crowbar"}
ENT.TimeUntilMeleeAttackDamage = false
//ENT.NextMeleeAttackTime = 1
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_AIM}
ENT.NextMoveRandomlyWhenShootingTime1 = 0
ENT.NextMoveRandomlyWhenShootingTime2 = 0.2
ENT.Weapon_NoSpawnMenu = true
ENT.WaitForEnemyToComeOut = false
ENT.HasCallForHelpAnimation = false
ENT.DropWeaponOnDeath = false
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
//ENT.LowHealth_NextSoundT = 0
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
    local Weapon_Type = math.random(1,5)
    if Weapon_Type == 1 then
        self:Give("weapon_vj_cofraom_beretta")		
elseif Weapon_Type == 2 then
        self:Give("weapon_vj_cofraom_glock")		
elseif Weapon_Type == 3 then	
        self:Give("weapon_vj_cofraom_p228")
elseif Weapon_Type == 4 then	
        self:Give("weapon_vj_cofraom_deagle")
elseif Weapon_Type == 5 then	
        self:Give("weapon_vj_cofraom_revolver")		
elseif Weapon_Type == 6 then	
        self:Give("weapon_vj_cofraom_mp5k")	
elseif Weapon_Type == 7 then	
        self:Give("weapon_vj_cofraom_uzi")
elseif Weapon_Type == 8 then	
        self:Give("weapon_vj_cofraom_l85")
elseif Weapon_Type == 9 then	
        self:Give("weapon_vj_cofraom_shotgun")
elseif Weapon_Type == 10 then	
        self:Give("weapon_vj_cofraom_knife")
elseif Weapon_Type == 11 then	
        self:Give("weapon_vj_cofraom_hammer")	
elseif Weapon_Type == 12 then	
        self:Give("weapon_vj_cofraom_axe")		
elseif Weapon_Type == 13 then	
        self:Give("weapon_vj_cofraom_spear")			
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     //self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
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
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)			
        if htype == "shotgun" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_SHOTGUN_IDLE4}) 		
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK_AGITATED})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN_AGITATED})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 							= ACT_RUN_AGITATED
			self.WeaponAnimTranslations[ACT_RUN_AIM] 							= ACT_RUN_AGITATED				
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_SHOTGUN
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 					= ACT_RANGE_ATTACK_SHOTGUN_LOW
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_SHOTGUN
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 			= ACT_GESTURE_RANGE_ATTACK2_LOW			
			self.WeaponAnimTranslations[ACT_RELOAD] 					= "vjges_reload_shotgun"
			self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_shotgun"	
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					= ACT_COVER_LOW
            self.AnimTbl_WeaponAim = {ACT_SHOTGUN_IDLE4}			

	elseif htype == "ar2" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_RIFLE})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK_RIFLE})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN_RIFLE})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 							= ACT_RUN_RIFLE
			self.WeaponAnimTranslations[ACT_RUN_AIM] 							= ACT_RUN_RIFLE				
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 					= ACT_RANGE_ATTACK_AR2_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 			= ACT_GESTURE_RANGE_ATTACK_SMG1_LOW			
			self.WeaponAnimTranslations[ACT_RELOAD] 					= "vjges_reload_m16"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_m16"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					= ACT_COVER_MED
            self.AnimTbl_WeaponAim = {ACT_IDLE_RIFLE}

	elseif htype == "smg" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_PISTOL})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 							= ACT_RUN_PISTOL
			self.WeaponAnimTranslations[ACT_RUN_AIM] 							= ACT_RUN_PISTOL			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 					= ACT_RANGE_ATTACK_PISTOL_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_AR2
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 			= ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
			self.WeaponAnimTranslations[ACT_RELOAD] 					= "vjges_reload_onehanded"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_onehanded"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					= ACT_COVER
            self.AnimTbl_WeaponAim = {ACT_IDLE_PISTOL}			
					
	elseif htype == "pistol" or htype == "revolver"  then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_PISTOL})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_PISTOL})
			self.WeaponAnimTranslations[ACT_WALK_AIM] 							= ACT_RUN_PISTOL
			self.WeaponAnimTranslations[ACT_RUN_AIM] 							= ACT_RUN_PISTOL			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 					= ACT_RANGE_ATTACK_PISTOL_LOW			
            self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_PISTOL
			self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1_LOW] 			= ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW
			self.WeaponAnimTranslations[ACT_RELOAD] 					= "vjges_reload_onehanded"
            self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= "vjges_crouch_reload_onehanded"			
			self.WeaponAnimTranslations[ACT_COVER_LOW] 					= ACT_COVER
            self.AnimTbl_WeaponAim = {ACT_IDLE_PISTOL}				
			
	elseif htype == "melee" then
			self.WeaponAnimTranslations[ACT_IDLE] 							= VJ_PICK({ACT_IDLE,ACT_IDLE_ANGRY})
			self.WeaponAnimTranslations[ACT_WALK] 							= VJ_PICK({ACT_WALK,ACT_WALK_STIMULATED})
			self.WeaponAnimTranslations[ACT_RUN] 							= VJ_PICK({ACT_RUN,ACT_RUN_STIMULATED})			
			self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_MELEE_ATTACK2
            self.AnimTbl_WeaponAim = {ACT_IDLE_ANGRY}				
end
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
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
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/