AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/black_dog.mdl"} 
ENT.StartHealth = 70
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack2"} 
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1.5
ENT.MeleeAttackDistance = 100 
ENT.MeleeAttackDamageType = DMG_SONIC
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -20), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bottom_Jaw", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hellhound_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/hellhound/he_alert1.wav",
	"vj_cofr/aom/hellhound/he_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/hellhound/he_attack1.wav",
	"vj_cofr/aom/hellhound/he_attack2.wav",
	"vj_cofr/aom/hellhound/he_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/hellhound/he_pain1.wav",
	"vj_cofr/aom/hellhound/he_pain2.wav",
	"vj_cofr/aom/hellhound/he_pain3.wav",
	"vj_cofr/aom/hellhound/he_pain4.wav",
	"vj_cofr/aom/hellhound/he_pain5.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/hellhound/he_die1.wav",
	"vj_cofr/aom/hellhound/he_die2.wav",
	"vj_cofr/aom/hellhound/he_die3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(13, 13, 40), Vector(-13, -13, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Hellhound_CustomOnInitialize()
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
function ENT:CustomOnMeleeAttack_BeforeChecks()
    local friNum = 0 -- How many allies exist around the Hellhound
	local color = Color(255, 0, 0, 255) -- The shock wave color
	local dmg = 20 -- How much damage should the shock wave do?
	local myPos = self:GetPos()
	for _, v in ipairs(ents.FindInSphere(myPos, 200)) do
		if v != self && v:GetClass() == "npc_vj_cofraom_hellhound" then
			friNum = friNum + 1
	end
end
	-- More allies = more damage and different colors
	if friNum == 1 then
		--color = Color(101, 133, 221)
		dmg = 40
	elseif friNum == 2 then
		--color = Color(67, 85, 255)
		dmg = 60
	elseif friNum >= 3 then
		--color = Color(62, 33, 211)
		dmg = 80
end

	-- flags 0 = No fade!
	effects.BeamRingPoint(myPos, 0.3, 2, 400, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})
	effects.BeamRingPoint(myPos, 0.3, 2, 200, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})
	
	if self.HasSounds && GetConVar("vj_npc_sd_meleeattack"):GetInt() == 0 then
		VJ.EmitSound(self, {"vj_cofr/aom/hellhound/he_blast1.wav","vj_cofr/aom/hellhound/he_blast2.wav","vj_cofr/aom/hellhound/he_blast3.wav"}, 100, math.random(80,100))
end
	VJ.ApplyRadiusDamage(self, self, myPos, 200, dmg, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)
	-- Hellhound shouldn't have its sonic attack interrupted by a flinch animation!
	return self.CurrentAttackAnimationTime < CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/