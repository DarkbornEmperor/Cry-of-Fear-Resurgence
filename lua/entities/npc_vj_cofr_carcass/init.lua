AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/carcass.mdl"
ENT.StartHealth = 2000
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 120 
ENT.Aerial_FlyingSpeed_Alerted = 150 
ENT.Aerial_AnimTbl_Calm = "kam52"
ENT.Aerial_AnimTbl_Alerted = "kam52" 
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"} 
//ENT.TurningSpeed = 10
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_attack"
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_carcasshead"
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 1 
ENT.TimeUntilRangeAttackProjectileRelease = false 
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "range"
ENT.NextRangeAttackTime = 25
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "Regular" 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(20, 25, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint11", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/roofboss/sophie3.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Carcass_CustomOnInitialize()
    self.SoundTbl_Breath = {
	"vj_cofr/cof/roofboss/rb_mouthidle1.wav",
	"vj_cofr/cof/roofboss/rb_mouthidle2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/cof/roofboss/rb_attack1.wav",
    "vj_cofr/cof/roofboss/rb_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/roofboss/rb_hurt1.wav",
	"vj_cofr/cof/roofboss/rb_hurt2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/roofboss/rb_death.wav"
}
    if GetConVar("VJ_COFR_JoeBiden"):GetInt() == 1 then
        self.RangeAttackEntityToSpawn = "obj_vj_cofr_biden"
        self:SetMaterial("hud/killicons/default")
        self:DrawShadow(false)		
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(15, 15, 92), Vector(-15, -15, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Carcass_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)	
	if key == "attack_range" then
		self:RangeAttackCode()	
	elseif key == "stomach_open" then
		VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_stomopen.wav", 75, 100)	
	elseif key == "stomach_close" then
		VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_stomclose.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	local ene = self:GetEnemy()
	if IsValid(ene) then
		projectile.Track_Enemy = ene
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
	local projPos = projectile:GetPos()
	return self:CalculateProjectile("Line", projPos, self:GetAimPosition(ene, projPos, 1, 700), 700)
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