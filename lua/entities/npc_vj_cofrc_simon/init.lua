AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/bosssimon.mdl"} 
ENT.StartHealth = 100
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY","CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.NoChaseAfterCertainRange_FarDistance = 1500 
ENT.HasSoundTrack = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()
	 if self.BookSimon_Shotgun then 
		self:SetShotgun()		
elseif self.BookSimon_Glock then
		self:SetGlock()			
elseif self.BookSimon_TMP then
		self:SetTMP()		
elseif self.BookSimon_M16 then
		self:SetM16()		
elseif self.BookSimon_Sledgehammer then
		self:SetSledgehammerFlare()	
elseif self.BookSimon_SledgehammerFlare then
		self:SetSledgehammer()
end
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
    self.SoundTbl_Death = {
	"vj_cofr/cof/simon/death1.wav",
	"vj_cofr/cof/simon/death2.wav",
	"vj_cofr/cof/simon/death3.wav",
	"vj_cofr/cof/simon/death4.wav",
	"vj_cofr/cof/simon/death5.wav",
	"vj_cofr/cof/simon/death6.wav",
	"vj_cofr/cof/simon/death7.wav"
}	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetShotgun()
    self.AnimTbl_IdleStand = {ACT_IDLE}
    self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
	self:SetBodygroup(0,1)
	self.HasMeleeAttack = false 
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 1	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTMP()
	self.AnimTbl_IdleStand = {ACT_IDLE_HURT}
	self.AnimTbl_Walk = {ACT_WALK_HURT}
	self.AnimTbl_Run = {ACT_WALK_HURT}
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self:SetBodygroup(0,2)
	self:SetBodygroup(1,1)
	self.HasMeleeAttack = false 
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.01
	self.NextRangeAttackTime = 0.07
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
	self.AnimTbl_IdleStand = {ACT_IDLE_STEALTH}
	self.AnimTbl_Walk = {ACT_WALK_STEALTH}
	self.AnimTbl_Run = {ACT_WALK_STEALTH}
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self:SetBodygroup(0,3)
	self.HasMeleeAttack = false 
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 0.2		
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetM16()
    self.AnimTbl_IdleStand = {ACT_IDLE}
    self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}	
	self:SetBodygroup(0,4)
	self.HasMeleeAttack = false 
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 0.05	
end 
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/