AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/faster.mdl","models/vj_cofr/faster2.mdl"} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14 --math.Rand(20,20)
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
ENT.SoundTbl_FootStep = {
"vj_cofr/faster/faster_step.wav"
}
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/faster/faster_hit1.wav",
"vj_cofr/faster/faster_hit2.wav",
"vj_cofr/faster/faster_hit3.wav",
"vj_cofr/faster/faster_hit4.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/faster/faster_miss.wav"
}
-- Custom
ENT.Faster_Type = 0
 	-- 0 = Female
	-- 1 = Male
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faster_CustomOnInitialize()
if self.Faster_Type == 1 then
   self.IdleSoundPitch = VJ_Set(50, 50)
   self.CombatIdleSoundPitch = VJ_Set(50, 50)
   self.AlertSoundPitch = VJ_Set(50, 50)
   self.CallForHelpSoundPitch = VJ_Set(50, 50)
   self.BeforeMeleeAttackSoundPitch = VJ_Set(50, 50)
   self.PainSoundPitch = VJ_Set(50, 50)
   self.DeathSoundPitch = VJ_Set(50, 50)
end
    self.SoundTbl_Alert = {
	"vj_cofr/faster/faster_alert1.wav",
	"vj_cofr/faster/faster_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/faster/faster_pain.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/slower/slower_pain1.wav",
	"vj_cofr/slower/slower_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/faster/faster_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/faster.mdl" then // Already the default
		self.Faster_Type = 0
	elseif self:GetModel() == "models/vj_cofr/faster2.mdl" then
		self.Faster_Type = 1			
end
     self:Faster_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "suicide" then
		VJ_EmitSound(self, "vj_cofr/faster/faster_suicide.wav", 85, 100)
		ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
end	
	if key == "death_metal" then
		VJ_EmitSound(self, "vj_cofr/faster/faster_metalfall.wav", 85, 100)
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if self.Faster_Type == 1 && (dmginfo:IsBulletDamage()) && hitgroup == HITGROUP_HEAD then	
	if (dmginfo:IsBulletDamage()) && self.HasSounds == true && self.HasImpactSounds == true then 
	    dmginfo:ScaleDamage(0.00)
		VJ_EmitSound(self,"vj_cofr/faster/faster_headhit"..math.random(1,4)..".wav",70) end
		local attacker = dmginfo:GetAttacker()
			self.DamageSpark1 = ents.Create("env_spark")
			self.DamageSpark1:SetKeyValue("Magnitude","1")
			self.DamageSpark1:SetKeyValue("Spark Trail Length","1")
			self.DamageSpark1:SetPos(dmginfo:GetDamagePosition())
			self.DamageSpark1:SetAngles(self:GetAngles())
			//self.DamageSpark1:Fire("LightColor", "255 255 255")
			self.DamageSpark1:SetParent(self)
			self.DamageSpark1:Spawn()
			self.DamageSpark1:Activate()
			self.DamageSpark1:Fire("StartSpark", "", 0)
			self.DamageSpark1:Fire("StopSpark", "", 0.001)
			self:DeleteOnRemove(self.DamageSpark1)
	end		
end	
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/