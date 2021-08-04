AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/carcass.mdl"} 
ENT.StartHealth = 3000
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 120 
ENT.Aerial_FlyingSpeed_Alerted = 150 
ENT.Aerial_AnimTbl_Calm = {"kam52"} 
ENT.Aerial_AnimTbl_Alerted = {"kam52"} 
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"}
ENT.TurningSpeed = 10
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red_large"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_carcasssoul"
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 1 
ENT.TimeUntilRangeAttackProjectileRelease = false 
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "range"
ENT.NextRangeAttackTime = 20
ENT.NextRangeAttackTime_DoRand = 20 
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
ENT.HasSoundTrack = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint11", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/roofboss/sorrow.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
-- Custom
ENT.Carcass_HomingAttack = false -- false = Regular, true = Homing
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(18, 18, 55), Vector(-18, -18, 0))
     self:Carcass_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)	
	if key == "attack_range" then
		self:RangeAttackCode()
end	
	if key == "stomach_open" then
		VJ_EmitSound(self, "vj_cofr/cof/roofboss/rb_stomopen.wav", 85, 100)
end	
	if key == "stomach_close" then
		VJ_EmitSound(self, "vj_cofr/cof/roofboss/rb_stomclose.wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	if self.Carcass_HomingAttack == true && IsValid(self:GetEnemy()) then
		projectile.Track_Enemy = self:GetEnemy()
		timer.Simple(10,function() if IsValid(projectile) then projectile:Remove() end end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Line", self:GetPos() + self:GetUp()*20, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 700)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
	self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/