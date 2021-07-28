AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/wheelchair_monster.mdl"} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_spit"
ENT.RangeDistance = 80
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.RangeUseAttachmentForPos = true 
ENT.AnimTbl_RangeAttack = {ACT_MELEE_ATTACK1}
ENT.RangeUseAttachmentForPosID = "mouth"
ENT.NextRangeAttackTime = 1
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH,ACT_BIG_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEFORWARD}
ENT.DeathAnimationTime = 8 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/aom/wheelchair/wheel01.wav",
"vj_cofr/aom/wheelchair/wheel02.wav",
"vj_cofr/aom/wheelchair/wheel03.wav",
"vj_cofr/aom/wheelchair/wheel04.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/aom/wheelchair/wcm_squirt.wav"
}	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:RangeAttackCode()
		--ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/