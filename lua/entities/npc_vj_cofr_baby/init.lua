AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/baby.mdl"} 
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
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
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/common/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/baby/b_attack1.wav",
"vj_cofr/baby/b_attack2.wav"
}	
-- Custom
ENT.Baby_DeathFromMeleeAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Baby_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/baby/b_alert1.wav",
	"vj_cofr/baby/b_alert2.wav",
	"vj_cofr/baby/b_alert3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/baby/b_pain1.wav",
	"vj_cofr/baby/b_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/baby/b_death1.wav",
	"vj_cofr/baby/b_death2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 50), Vector(-15, -15, 0))
     self:Baby_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
		ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()
	if self.Dead == true or !IsValid(self:GetEnemy()) then return end
	self:SetGroundEntity(NULL)
	--self:SetLocalVelocity(((self:GetEnemy():GetPos() + self:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*200 + self:GetUp()*40 + self:GetForward()*20)
	self:SetBodygroup(0,1)
	self.Baby_DeathFromMeleeAttack = true
	self:TakeDamage(999999999999999,self,self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self.Baby_DeathFromMeleeAttack == false then
		self.AnimTbl_Death = {ACT_DIESIMPLE}
elseif self.Baby_DeathFromMeleeAttack == true then
		self.AnimTbl_Death = {ACT_SIGNAL1}		
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/