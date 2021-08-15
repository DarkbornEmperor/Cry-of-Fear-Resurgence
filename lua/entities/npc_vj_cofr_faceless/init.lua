AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/faceless.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = { 
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 20 
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
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faceless/fist_strike1.wav",
"vj_cofr/cof/faceless/fist_strike2.wav",
"vj_cofr/cof/faceless/fist_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faceless/fist_miss1.wav",
"vj_cofr/cof/faceless/fist_miss2.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Faceless_Type = 0 
 	-- 0 = Normal Faceless
	-- 1 = Faceless Crawler
	-- 2 = Faced Faceless
	-- 3 = Twister
	-- 4 = Twister Valve
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Faceless_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/faceless/faceless_alert10.wav",
	"vj_cofr/cof/faceless/faceless_alert20.wav",
	"vj_cofr/cof/faceless/faceless_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/faceless/faceless_attack1.wav",
	"vj_cofr/cof/faceless/faceless_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/faceless/faceless_pain1.wav",
	"vj_cofr/cof/faceless/faceless_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/faceless/faceless_pain1.wav",
	"vj_cofr/cof/faceless/faceless_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/cof/faceless.mdl" then // Already the default
		self.Faceless_Type = 0
	elseif self:GetModel() == "models/vj_cofr/cof/faceless2.mdl" then
		self.Faceless_Type = 1
	elseif self:GetModel() == "models/vj_cofr/cof/faceless3.mdl" then
		self.Faceless_Type = 2			
	elseif self:GetModel() == "models/vj_cofr/cof/faceless_twister.mdl" then
		self.Faceless_Type = 3
	elseif self:GetModel() == "models/vj_cofr/cof/faceless_twisterv.mdl" then
		self.Faceless_Type = 4			
end
     self:Faceless_CustomOnInitialize()
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/faceless/psyksjuk.wav"}) 	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    if self.Faceless_Type == 4 && hitgroup == HITGROUP_HEAD then
            self.Bleeds = false
            dmginfo:ScaleDamage(0.20)	   
	    if self.HasSounds == true && self.HasImpactSounds == true then 
		VJ_EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end
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
		else
	        self.Bleeds = true		
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
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/