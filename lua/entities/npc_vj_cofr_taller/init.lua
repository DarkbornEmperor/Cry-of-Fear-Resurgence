AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/taller.mdl"} 
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.VJ_IsHugeMonster = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 80
ENT.MeleeAttackDamageType = DMG_CRUSH
ENT.SlowPlayerOnMeleeAttack = false
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 0.001
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 0.001 
ENT.SlowPlayerOnMeleeAttackTime = 3.5
ENT.HasMeleeAttackKnockBack = false 
ENT.MeleeAttackKnockBack_Forward1 = 150 
ENT.MeleeAttackKnockBack_Forward2 = 150 
ENT.MeleeAttackKnockBack_Up1 = 250 
ENT.MeleeAttackKnockBack_Up2 = 250 
ENT.HasWorldShakeOnMove = true 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(10, 25, -120), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/taller/taller_step.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Taller_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/taller/taller_alert.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/taller/taller_pain.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/taller/taller_die.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(30, 30, 167), Vector(-30, -30, 0))
     self:Taller_CustomOnInitialize()
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
function ENT:MultipleMeleeAttacks()
    local attack = math.random(1,2)
	if attack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack"}
		self.MeleeAttackDamage = 60
		self.SlowPlayerOnMeleeAttack = true
		self.HasMeleeAttackKnockBack = true
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/taller/taller_swing.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/taller/taller_player_punch.wav"
}
	elseif attack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_stamp"}
		self.MeleeAttackDamage = 200 
		self.SlowPlayerOnMeleeAttack = false
		self.HasMeleeAttackKnockBack = false
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/taller/taller_wall_punch.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/taller/taller_stamp.wav"
}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/