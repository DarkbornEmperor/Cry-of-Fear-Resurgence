AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/flygare.mdl"
ENT.StartHealth = 100
ENT.HullType = HULL_MEDIUM
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 150 
ENT.Aerial_FlyingSpeed_Alerted = 500
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_punch","vjseq_punchdown"}  
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_shoot"
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
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint11", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/flygare/flygare_slice.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/flygare/flygare_slash.wav"
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
function ENT:Flygare_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/flygare/flygare_alert1.wav",
	"vj_cofr/cof/flygare/flygare_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/flygare/flygare_attack1.wav",
    "vj_cofr/cof/flygare/flygare_attack2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/cof/flygare/flygare_attack1.wav",
    "vj_cofr/cof/flygare/flygare_attack2.wav"
}	
    self.SoundTbl_Pain = {
	"vj_cofr/cof/flygare/flygare_pain.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/flygare/flygare_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.Flygare_FlyAnim_Forward  = self:GetSequenceActivity(self:LookupSequence("forward"))
	self.Flygare_FlyAnim_Backward  = self:GetSequenceActivity(self:LookupSequence("backward"))
	self.Flygare_FlyAnim_Right  = self:GetSequenceActivity(self:LookupSequence("right"))
	self.Flygare_FlyAnim_Left  = self:GetSequenceActivity(self:LookupSequence("left"))
	self.Flygare_FlyAnim_Up  = self:GetSequenceActivity(self:LookupSequence("up"))
	self.Flygare_FlyAnim_Down  = self:GetSequenceActivity(self:LookupSequence("down"))

    self:SetCollisionBounds(Vector(25, 25, 100), Vector(-25, -25, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 120))
    self:Flygare_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()	
	elseif key == "attack_range" then
		self:RangeAttackCode()	
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/cof/flygare/flygare_fallhit.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_FLY then
	if self.AA_CurrentMovePosDir then
	local moveDir = self.AA_CurrentMovePosDir:GetNormal()
	-- Up-down
	local dotUp = moveDir:Dot(self:GetUp())
	if dotUp > 0.60 then
		return self.Flygare_FlyAnim_Up
	elseif dotUp < -0.60 then
		return self.Flygare_FlyAnim_Down
end
	-- Forward-backward
	local dotForward = moveDir:Dot(self:GetForward())
	if dotForward > 0.5 then
		return self.Flygare_FlyAnim_Forward
	elseif dotForward < -0.5 then
		return self.Flygare_FlyAnim_Backward
end
	-- Right-left
	local dotRight = moveDir:Dot(self:GetRight())
	if dotRight > 0.5 then
		return self.Flygare_FlyAnim_Right
	elseif dotRight < -0.5 then
		return self.Flygare_FlyAnim_Left
	end
end
		return self.Flygare_FlyAnim_Up -- Fallback animation
end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
	local projPos = projectile:GetPos()
	return self:CalculateProjectile("Curve", projPos, self:GetAimPosition(ene, projPos, 1, 1500), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:CustomOnTakeDamage_BeforeImmuneChecks(dmginfo,hitgroup)
	-- Make a metal ricochet effect
    if hitgroup == 8 then
	if dmginfo:GetDamagePosition() != vec then
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(5) -- Size
		rico:SetMagnitude(math.random(1,2)) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_COFR_Rico", rico)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if hitgroup == 8 then
	if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end		
        self.Bleeds = false
		dmginfo:ScaleDamage(0.20)
	else
	    self.Bleeds = true
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/