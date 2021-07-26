AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david_monster.mdl"} 
ENT.StartHealth = 3000
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
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
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
ENT.HasSoundTrack = true
ENT.Immune_Fire = true
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip02 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/common/npc_step1.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/davidbad/sickness.mp3",
"vj_cofr/davidbad/4motherkill.wav"
}
-- Custom
ENT.Addiction_Axe = false
ENT.Addiction_OnFire = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Addiction_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/davidbad/db_alert10.wav",
	"vj_cofr/davidbad/db_alert20.wav",
	"vj_cofr/davidbad/db_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/davidbad/david_attack.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/davidbad/db_pain1.wav",
	"vj_cofr/davidbad/db_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     self:Addiction_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "axe_grab" then
		VJ_EmitSound(self, "vj_cofr/davidbad/david_axegrab.wav", 85, 100)
		ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("axe")).Pos,self:GetAngles())
		self:SetBodygroup(0,1)
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.Addiction_Axe == false && (self.StartHealth -500 > self:Health()) then
		self.Addiction_Axe = true
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,3.7941175539395,false)
end		
    if self.Addiction_OnFire == false && !self:IsOnFire() && (self.StartHealth -1000 > self:Health()) then
		self.Addiction_OnFire = true
		self:Ignite(15)
	    for _,v in ipairs(ents.FindInSphere(self:GetPos(),DMG_BURN,150)) do
	    timer.Create("Addiction_Fire"..self:EntIndex(), 1.5, 5, function()
	    if IsValid(self) then
        util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(10,15),DMG_BURN,true,true)
end
end)
end
end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self:GetBodygroup(0) == 0 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDamageType = DMG_SHOCK
		self.HasMeleeAttackMissSounds = false
		self.SoundTbl_MeleeAttackExtra = {"vj_cofr/davidbad/thunder_hit.wav"}
	elseif self:GetBodygroup(0) == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.MeleeAttackDamageType = DMG_SLASH
		self.MeleeAttackDamage = 25 
		self.SoundTbl_MeleeAttackMiss = {"vj_cofr/davidbad/Axe_swing.wav"}
		self.SoundTbl_MeleeAttackExtra = {"vj_cofr/davidbad/Axe_hitbody.wav"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()
if self:GetBodygroup(0) == 0 then
	local color = Color(255, 255, 255, 255) -- The shock wave color
	local dmg = 15 -- How much damage should the shock wave do?

	-- flags 0 = No fade!
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, color, {material="sprites/bluelight1", framerate=20, flags=0})
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, color, {material="sprites/bluelight1", framerate=20, flags=0})
	
	if self.HasSounds == true && GetConVar("vj_npc_sd_meleeattack"):GetInt() == 0 then
		VJ_EmitSound(self, {"vj_cofr/davidbad/thunder_attack1.wav","vj_cofr/davidbad/thunder_attack2.wav","vj_cofr/davidbad/thunder_attack3.wav"}, 100, math.random(80,100))
end
	util.VJ_SphereDamage(self, self, self:GetPos(), 400, dmg, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self:IsOnFire() then hitEnt:Ignite(4) end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if self:IsOnFire() then
	   self.Addiction_OnFire = false
	   self:Extinguish()
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/