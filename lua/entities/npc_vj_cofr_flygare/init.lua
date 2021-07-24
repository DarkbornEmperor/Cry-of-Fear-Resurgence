AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/flygare.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 120 
ENT.Aerial_FlyingSpeed_Alerted = 300 
ENT.Aerial_AnimTbl_Calm = {"forward"} 
ENT.Aerial_AnimTbl_Alerted = {"forward"} 
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_spit"
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 300
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "range"
ENT.NextRangeAttackTime = 1
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "Regular" 
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
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint11", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/flygare/flygare_slice.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/flygare/flygare_slash.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Flygare_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/flygare/flygare_alert1.wav",
	"vj_cofr/flygare/flygare_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/flygare/flygare_attack1.wav",
    "vj_cofr/flygare/flygare_attack2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/flygare/flygare_attack1.wav",
    "vj_cofr/flygare/flygare_attack2.wav"
}	
    self.SoundTbl_Pain = {
	"vj_cofr/flygare/flygare_pain.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/flygare/flygare_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(35, 35, 95), Vector(-35, -35, 40))
     self:Flygare_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "attack_range" then
		self:RangeAttackCode()
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/flygare/flygare_fallhit.wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
local attack = math.random(1,2)
	if attack == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
	elseif attack == 2 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/