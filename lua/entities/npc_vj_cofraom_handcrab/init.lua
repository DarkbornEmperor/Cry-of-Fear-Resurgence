AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/headcrab.mdl"} 
ENT.StartHealth = 20
ENT.HullType = HULL_TINY
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}   
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasLeapAttack = true 
ENT.LeapAttackDamage = 16
ENT.AnimTbl_LeapAttack = {"vjseq_jump","vjseq_jump_variation1","vjseq_jump_variation2"} 
ENT.LeapDistance = 256 
ENT.LeapToMeleeDistance = 1 
ENT.LeapAttackDamageDistance = 50 
ENT.TimeUntilLeapAttackDamage = 0.4 
ENT.TimeUntilLeapAttackVelocity = 0.4
ENT.NextLeapAttackTime = 1 
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1, 1.2, 1.4} 
ENT.NextAnyAttackTime_Leap = 3 
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackVelocityForward = 70 
ENT.LeapAttackVelocityUp = 200 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(45, 20, -15), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Pelvis", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_LeapAttackDamage  = {
"vj_cofr/aom/handcrab/hc_headbite.wav"
}	
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Handcrab_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/handcrab/hc_alert1.wav",
	"vj_cofr/aom/handcrab/hc_alert2.wav"
}
    self.SoundTbl_LeapAttackJump  = {
	"vj_cofr/aom/handcrab/hc_attack1.wav",
	"vj_cofr/aom/handcrab/hc_attack2.wav",
	"vj_cofr/aom/handcrab/hc_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/handcrab/hc_pain1.wav",
	"vj_cofr/aom/handcrab/hc_pain2.wav",
	"vj_cofr/aom/handcrab/hc_pain3.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/handcrab/hc_die1.wav",
	"vj_cofr/aom/handcrab/hc_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(10, 10, 18), Vector(-10, -10, 0))
     self:Handcrab_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end 
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/