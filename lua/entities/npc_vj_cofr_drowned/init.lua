AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/drowned.mdl"} 
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5 
ENT.DisableDefaultRangeAttackCode = true
ENT.ConstantlyFaceEnemy_IfAttacking = true 
ENT.ConstantlyFaceEnemy_Postures = "Standing" 
ENT.ConstantlyFaceEnemyDistance = 2500 
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = 2500 
ENT.NoChaseAfterCertainRange_CloseDistance = 1
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
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
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/crazylady/knife_hitbody1.wav",
"vj_cofr/crazylady/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/crazylady/knife_swing.wav"
}
-- Custom
ENT.Drowned_Baby = false
ENT.Drowned_DamageDistance = 2500
ENT.Drowned_NextEnemyDamage = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/crazylady/lady_alert10.wav",
	"vj_cofr/crazylady/lady_alert20.wav",
	"vj_cofr/crazylady/lady_alert30.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
	"vj_cofr/crazylady/knife_hitbody1.wav",
	"vj_cofr/crazylady/knife_hitbody2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/crazylady/lady_pain1.wav",
	"vj_cofr/crazylady/lady_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:Drowned_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "baby_appear" then
		VJ_EmitSound(self, "vj_cofr/crazylady/baby_burst.wav", 85, 100)
		self:SetBodygroup(0,1)
		ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("baby")).Pos,self:GetAngles())
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
 --if self:GetEnemy() != nil && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 100 then
    self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false)
	self.Drowned_Baby = true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks() 
local attack = math.random(1,2)
   if attack == 1 && self:GetEnemy() != nil && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 30 then
      self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
      self.MeleeAttackDamage = 14 
      self.MeleeAttackDistance = 30 
      self.MeleeAttackDamageDistance = 60	  
elseif attack == 2  then
      self.AnimTbl_MeleeAttack = {ACT_SIGNAL1}
      self.MeleeAttackDamage = 14 
      self.MeleeAttackDistance = 2500 
      self.MeleeAttackDamageDistance = 4500
      self.HasMeleeAttackSounds = false 
      self.HasMeleeAttackMissSounds = false	  
	end  
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/