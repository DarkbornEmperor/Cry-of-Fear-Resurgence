AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/bullsquid.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_cofraom_spit"
ENT.RangeDistance = 784 
ENT.RangeToMeleeDistance = 250
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 1
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "OnlyRange" 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 20 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -30), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Spine1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}	
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/bullchicken/bc_bite1.wav",
"vj_cofr/aom/bullchicken/bc_bite2.wav",
"vj_cofr/aom/bullchicken/bc_bite3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/zombie/claw_miss1.wav",
"vj_cofr/aom/zombie/claw_miss2.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/aom/bullchicken/bc_attack1.wav",
"vj_cofr/aom/bullchicken/bc_attack2.wav",
"vj_cofr/aom/bullchicken/bc_attack3.wav"
}	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Spitter_CustomOnInitialize()
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/bullchicken/bc_attackgrowl.wav",
	"vj_cofr/aom/bullchicken/bc_attackgrowl2.wav",
	"vj_cofr/aom/bullchicken/bc_attackgrowl3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/bullchicken/bc_pain1.wav",
	"vj_cofr/aom/bullchicken/bc_pain2.wav",
	"vj_cofr/aom/bullchicken/bc_pain3.wav",
	"vj_cofr/aom/bullchicken/bc_pain4.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/bullchicken/bc_die1.wav",
	"vj_cofr/aom/bullchicken/bc_die2.wav",
	"vj_cofr/aom/bullchicken/bc_die3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(20, 20, 44), Vector(-20, -20, 0))
     self:Spitter_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack_range" then
		self:RangeAttackCode()
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
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
		return self:CalculateProjectile("Curve", projectile:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
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