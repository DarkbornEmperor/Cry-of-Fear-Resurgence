AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/sewmo.mdl"} 
ENT.StartHealth = 140
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
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
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH,ACT_BIG_FLINCH} 
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {ACT_BIG_FLINCH}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {ACT_SMALL_FLINCH}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8 
ENT.GibOnDeathDamagesTable = {"All"}
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
"vj_cofr/common/npc_step1.wav"
}
-- Custom
ENT.Sewmo_WireBroken = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sewmo_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/sewmo/sewmo_alert10.wav",
	"vj_cofr/sewmo/sewmo_alert20.wav",
	"vj_cofr/sewmo/sewmo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/sewmo/sewmo_attack1.wav",
	"vj_cofr/sewmo/sewmo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/sewmo/sewmo_pain1.wav",
	"vj_cofr/sewmo/sewmo_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:Sewmo_CustomOnInitialize()
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
function ENT:CustomOnThink_AIEnabled()
	if self.Sewmo_WireBroken == false && self.Dead == false && (self.StartHealth *.30 > self:Health()) then
		self.Sewmo_WireBroken = true
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false)
		timer.Simple(0.3,function() if IsValid(self) then
			if self.HasSounds == true then VJ_EmitSound(self,"vj_cofr/sewmo/break_free.wav") end end end)
			timer.Simple(1,function() if IsValid(self) then
				self:SetBodygroup(0,1) 
				self:DoChaseAnimation()
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self:GetBodygroup(0) == 0 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDamage = 16
		self.SoundTbl_MeleeAttackMiss = {"vj_cofr/sewmo/tunga_miss.wav"}
		self.SoundTbl_MeleeAttack = {"vj_cofr/sewmo/tunga_strike1.wav","vj_cofr/sewmo/tunga_strike2.wav"}
	elseif self:GetBodygroup(0) == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.MeleeAttackDamage = 20 
		self.SoundTbl_MeleeAttackMiss = {"vj_cofr/sewmo/claw_miss1.wav","vj_cofr/sewmo/claw_miss2.wav","vj_cofr/sewmo/claw_miss3.wav"}
		self.SoundTbl_MeleeAttack = {"vj_cofr/sewmo/claw_strike1.wav","vj_cofr/sewmo/claw_strike2.wav","vj_cofr/sewmo/claw_strike3.wav"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
   end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/