AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/shaimoon_gold.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"}
ENT.Bleeds = false 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.CombatFaceEnemy = true
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 20
ENT.AnimTbl_Death = {ACT_DIESIMPLE} 
ENT.HasSoundTrack = false
ENT.HasExtraMeleeAttackSounds = true
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
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faster/faster_hit1.wav",
"vj_cofr/cof/faster/faster_hit2.wav",
"vj_cofr/cof/faster/faster_hit3.wav",
"vj_cofr/cof/faster/faster_hit4.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faster/faster_miss.wav"
}
ENT.SoundTbl_SoundTrack = {
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)	
	if self.HasSounds == true && self.HasImpactSounds == true then 
	    dmginfo:ScaleDamage(0.45)
		VJ_EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end
			local spark = ents.Create("env_spark")
			spark:SetKeyValue("Magnitude","1")
			spark:SetKeyValue("Spark Trail Length","1")
			spark:SetPos(dmginfo:GetDamagePosition())
			spark:SetAngles(self:GetAngles())
			spark:SetParent(self)
			spark:Spawn()
			spark:Activate()
			spark:Fire("StartSpark", "", 0)
			spark:Fire("StopSpark", "", 0.001)
			self:DeleteOnRemove(spark)	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/