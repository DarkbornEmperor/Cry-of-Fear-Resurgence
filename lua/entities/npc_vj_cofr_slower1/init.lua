AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/slower1.mdl"} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH}  
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = { 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
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
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/slower/hammer_strike1.wav",
"vj_cofr/cof/slower/hammer_strike2.wav",
"vj_cofr/cof/slower/hammer_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/slower/hammer_miss1.wav",
"vj_cofr/cof/slower/hammer_miss2.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Slower_Skin = 0
ENT.Slower_Type = 0 
 	-- 0 = Slower 1
	-- 1 = Crawler/Krypandenej aka Slower 2
	-- 2 = Croucher
	-- 3 = Slower 3
	-- 4 = Slower No
	-- 5 = Slower 10
	-- 6 = Slower 10-2
	-- 7 = Upper
	-- 8 = Custom Slower 1
	-- 9 = Custom Slower 10
	-- 10 = Misc Custom	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
 local Slower_Body = math.random(1,3)
 if Slower_Body == 1 then
    self.Slower_Skin = 0
    self:SetBodygroup(0,0)
 elseif Slower_Body == 2 then
    self.Slower_Skin = 1
    self:SetBodygroup(0,1)	
 elseif Slower_Body == 3 then
    self.Slower_Skin = 2
    self:SetBodygroup(0,2)	
end	
    self.SoundTbl_Alert = {
	"vj_cofr/cof/slower/slower_alert10.wav",
	"vj_cofr/cof/slower/slower_alert20.wav",
	"vj_cofr/cof/slower/slower_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/slower/slower_attack1.wav",
	"vj_cofr/cof/slower/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/cof/slower1.mdl" or self:GetModel() == "models/vj_cofr/custom/pedoslow.mdl" then // Already the default
		self.Slower_Type = 0
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack4","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/cof/crawler.mdl" or self:GetModel() == "models/vj_cofr/cof/krypandenej.mdl" or self:GetModel() == "models/vj_cofr/custom/crawler.mdl" or self:GetModel() == "models/vj_cofr/custom/crawler2.mdl" or self:GetModel() == "models/vj_cofr/custom/krypandenej.mdl" then
		self.Slower_Type = 1
		self.AnimTbl_MeleeAttack = {"vjseq_attack"}
	elseif self:GetModel() == "models/vj_cofr/cof/croucher.mdl" or self:GetModel() == "models/vj_cofr/custom/croucher.mdl" then
		self.Slower_Type = 2
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}		
	elseif self:GetModel() == "models/vj_cofr/cof/slower3.mdl" or self:GetModel() == "models/vj_cofr/custom/slower3_dream.mdl" or self:GetModel() == "models/vj_cofr/custom/slower3.mdl" or self:GetModel() == "models/vj_cofr/custom/faceless_slower.mdl" or self:GetModel() == "models/vj_cofr/custom/hh/slower3_hh.mdl" then
		self.Slower_Type = 3
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/cof/slowerno.mdl" or self:GetModel() == "models/vj_cofr/custom/slowerno_boss.mdl" or self:GetModel() == "models/vj_cofr/custom/slowerno.mdl" then
		self.Slower_Type = 4
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/cof/slower10.mdl" then
		self.Slower_Type = 5
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/cof/slower102.mdl" then
		self.Slower_Type = 6
		self.AnimTbl_MeleeAttack = {"vjseq_attack"}
	elseif self:GetModel() == "models/vj_cofr/cof/upper.mdl" then
		self.Slower_Type = 7
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack3","vjseq_attack4","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/custom/monster_cutter.mdl" or self:GetModel() == "models/vj_cofr/custom/slowermummy.mdl" or self:GetModel() == "models/vj_cofr/custom/genome_soldier1.mdl" or self:GetModel() == "models/vj_cofr/custom/slower1.mdl" then
		self.Slower_Type = 8
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack4","vjseq_attack5"}		
	elseif self:GetModel() == "models/vj_cofr/custom/slower10.mdl" then
		self.Slower_Type = 9
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3","vjseq_attack5"}
	elseif self:GetModel() == "models/vj_cofr/custom/sicksophie.mdl" then
		self.Slower_Type = 10
		self.AnimTbl_MeleeAttack = {"vjseq_attack"}
	elseif self:GetModel() == "models/vj_cofr/custom/zombie.mdl" then
		self.Slower_Type = 10
		self.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2"}		
end
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Slower_CustomOnInitialize() 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack" then
		self:MeleeAttackCode()	
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
	    /*local effectdata = EffectData()
	    effectdata:SetOrigin(self:GetPos())
	    effectdata:SetScale(10)
	    util.Effect("watersplash",effectdata)*/
	    end
    end				
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
 if self.Slower_Type == 3 then return end	
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/slower/scream1.wav"}) 	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)
	if dmginfo:GetDamage() > 30 then
		self.FlinchChance = 8
		self.AnimTbl_Flinch = {ACT_BIG_FLINCH}
	else
		self.FlinchChance = 16
		self.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	 if self.Slower_Type == 0 or self.Slower_Type == 2 or self.Slower_Type == 3 or self.Slower_Type == 4 or self.Slower_Type == 5 or self.Slower_Type == 7 or self.Slower_Type == 8 or self.Slower_Type == 9 or self.Slower_Type == 10 then
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
     else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
	end	
end
    if self.Slower_Type == 0 or self.Slower_Type == 3 or self.Slower_Type == 4 or self.Slower_Type == 5 then
	local headsplat = math.random(1,3)
	if headsplat == 1 && hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIEVIOLENT}
        end
    end 
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVar("VJ_COFR_Slower_HeadGib"):GetInt() == 0 or self.Slower_Type == 1 or self.Slower_Type == 2 or self.Slower_Type == 3 or self.Slower_Type == 4 or self.Slower_Type == 6 or self.Slower_Type == 7 or self.Slower_Type == 8 or self.Slower_Type == 9 or self.Slower_Type == 10 then return end	
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then	
	if self.Slower_Skin == 0 then self:SetBodygroup(0,3)
	elseif self.Slower_Skin == 1 then self:SetBodygroup(0,4)
	elseif self.Slower_Skin == 2 then self:SetBodygroup(0,5) end
	
	if self.HasGibDeathParticles then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		effectData:SetColor(colorRed)
		effectData:SetScale(25)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(5)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
end
		VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)	
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())					
		return true,{DeathAnim=true}
end
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end  
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup) return false end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/