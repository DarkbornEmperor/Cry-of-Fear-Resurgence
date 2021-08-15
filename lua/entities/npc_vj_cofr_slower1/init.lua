AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/slower1.mdl"} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
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
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
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
	if self:GetModel() == "models/vj_cofr/cof/slower1.mdl" then // Already the default
		self.Slower_Type = 0
	elseif self:GetModel() == "models/vj_cofr/cof/crawler.mdl" or self:GetModel() == "models/vj_cofr/cof/krypandenej.mdl" then
		self.Slower_Type = 1
	elseif self:GetModel() == "models/vj_cofr/cof/croucher.mdl" then
		self.Slower_Type = 2			
	elseif self:GetModel() == "models/vj_cofr/cof/slower3.mdl" then
		self.Slower_Type = 3
	elseif self:GetModel() == "models/vj_cofr/cof/slowerno.mdl" then
		self.Slower_Type = 4
	elseif self:GetModel() == "models/vj_cofr/cof/slower10.mdl" then
		self.Slower_Type = 5
	elseif self:GetModel() == "models/vj_cofr/cof/slower102.mdl" then
		self.Slower_Type = 6
	elseif self:GetModel() == "models/vj_cofr/cof/upper.mdl" then
		self.Slower_Type = 7		
end
     self:Slower_CustomOnInitialize()
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
	 if self.Slower_Type == 0 or self.Slower_Type == 2 or self.Slower_Type == 3 or self.Slower_Type == 4 or self.Slower_Type == 5 or self.Slower_Type == 7 then
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
		--timer.Simple(1,function()
			--if IsValid(self) then
				--self:RunGibOnDeathCode(dmginfo,hitgroup,{CustomDmgTbl={"All"}})
			--end
		--end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if GetConVarNumber("VJ_COFR_Slower_HeadGib") == 0 or self.Slower_Type == 1 or self.Slower_Type == 2 or self.Slower_Type == 3 or self.Slower_Type == 4 or self.Slower_Type == 6 or self.Slower_Type == 7 then return end
	
	if hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 800 then
	
	if self.Slower_Skin == 0 then self:SetBodygroup(0,3) end
	if self.Slower_Skin == 1 then self:SetBodygroup(0,4) end
	if self.Slower_Skin == 2 then self:SetBodygroup(0,5) end
	
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(30)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodspray:SetScale(4)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
end
		VJ_EmitSound(self,"vj_cofr/fx/bodysplat.wav", 75, 100)	
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())					
		return true,{DeathAnim=true}
	end	
end	  
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup) 
return false 
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