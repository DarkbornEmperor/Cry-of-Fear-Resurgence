AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/sewmo.mdl"} 
ENT.StartHealth = 140
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = { 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8 
ENT.HasExtraMeleeAttackSounds = true
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
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Sewmo_WireBroken = false
ENT.Sewmo_Skin = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sewmo_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/sewmo/sewmo_alert10.wav",
	"vj_cofr/cof/sewmo/sewmo_alert20.wav",
	"vj_cofr/cof/sewmo/sewmo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/sewmo/sewmo_attack1.wav",
	"vj_cofr/cof/sewmo/sewmo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/sewmo/sewmo_pain1.wav",
	"vj_cofr/cof/sewmo/sewmo_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/sewmo/sewmo_pain1.wav",
	"vj_cofr/cof/sewmo/sewmo_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(13, 13, 74), Vector(-13, -13, 0))
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
	if key == "barbedwire_break" then
		VJ_EmitSound(self,"vj_cofr/cof/sewmo/break_free.wav", 75, 100)
	if self.Sewmo_Skin == 0 then self:SetBodygroup(0,1) end
	if self.Sewmo_Skin == 1 then self:SetBodygroup(0,3) end		
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
	if self:GetBodygroup(0) == 0 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
        self.MeleeAttackDistance = 50 
        self.MeleeAttackDamageDistance = 90		
		self.MeleeAttackDamage = 16
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/sewmo/tunga_miss.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/sewmo/tunga_strike1.wav",
		"vj_cofr/cof/sewmo/tunga_strike2.wav"
}
	elseif self:GetBodygroup(0) == 1 or self:GetBodygroup(0) == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
        self.MeleeAttackDistance = 30 
        self.MeleeAttackDamageDistance = 60		
		self.MeleeAttackDamage = 20 
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/cof/sewmo/claw_miss1.wav",
		"vj_cofr/cof/sewmo/claw_miss2.wav",
		"vj_cofr/cof/sewmo/claw_miss3.wav"
}
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/cof/sewmo/claw_strike1.wav",
		"vj_cofr/cof/sewmo/claw_strike2.wav",
		"vj_cofr/cof/sewmo/claw_strike3.wav"
}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
 if self.Sewmo_WireBroken or self.DeathAnimationCodeRan then return end 
   if self:GetBodygroup(0) == 0 or self:GetBodygroup(0) == 2 then
	 if !self.Sewmo_WireBroken && (self.StartHealth *.65 > self:Health()) && math.random(1,5) == 1 && !self.DeathAnimationCodeRan then 
		    self.Sewmo_WireBroken = true
		    self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,false)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo, hitgroup)
	if dmginfo:GetDamage() > 30 then
		self.AnimTbl_Flinch = {ACT_BIG_FLINCH}
	else
		self.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
	end
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