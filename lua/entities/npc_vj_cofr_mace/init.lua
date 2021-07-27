AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/mace.mdl"} 
ENT.StartHealth = 180
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 100 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.Immune_AcidPoisonRadiation = true 
ENT.Immune_Bullet = true 
ENT.Immune_Dissolve = true 
ENT.Immune_Fire = true 
ENT.Immune_Melee = true 
ENT.Immune_Physics = true 
ENT.Immune_Sonic = true 
ENT.ImmuneDamagesTable = {DMG_GENERIC}
ENT.CanFlinch = 2
ENT.FlinchDamageTypes = {DMG_BLAST,DMG_SHOCK}
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -70), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/common/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/sewer/mace_hitflesh.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/sewer/mace_swing.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/sewer/getout.mp3"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Mace_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/sewer/mace_scream.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(18, 18, 95), Vector(-18, -18, 0))
     self:Mace_CustomOnInitialize()
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
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if dmginfo:IsDamageType(DMG_SHOCK) or dmginfo:IsExplosionDamage() then
	    dmginfo:ScaleDamage(0.25)
    end			
end  
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/