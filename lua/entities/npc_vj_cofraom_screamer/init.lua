AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/controller.mdl"} 
ENT.StartHealth = 170
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 120 
ENT.Aerial_FlyingSpeed_Alerted = 300 
ENT.Aerial_AnimTbl_Calm = {"forward"} 
ENT.Aerial_AnimTbl_Alerted = {"forward"} 
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.ConstantlyFaceEnemy = true
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_cofraom_soul" 
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 1 
ENT.TimeUntilRangeAttackProjectileRelease = false 
ENT.NextRangeAttackTime = 3 
ENT.NextRangeAttackTime_DoRand = 4 
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "Regular" 
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
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the screamer when the camera is in third person
	FirstP_Bone = "bip01 neck", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(10, 0, -3), -- The offset for the screamer when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play	
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Screamer_HomingAttack = false -- false = Regular, true = Homing
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Screamer_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/screamer/con_alert1.wav",
	"vj_cofr/aom/screamer/con_alert2.wav",
	"vj_cofr/aom/screamer/con_alert3.wav"
}
    self.SoundTbl_RangeAttack = {
	"vj_cofr/aom/screamer/con_attack1.wav",
    "vj_cofr/aom/screamer/con_attack2.wav",
    "vj_cofr/aom/screamer/con_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/screamer/con_pain1.wav",
	"vj_cofr/aom/screamer/con_pain2.wav",
	"vj_cofr/aom/screamer/con_pain3.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/screamer/con_die1.wav",
	"vj_cofr/aom/screamer/con_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:DrawShadow(false)
    self:SetCollisionBounds(Vector(20, 20, 70), Vector(-20, -20, -10))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Screamer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack_rangeclose" then
		if IsValid(self.Soul1) then self.Soul1:Remove() end
		if IsValid(self.Soul2) then self.Soul2:Remove() end
		self.Screamer_HomingAttack = true
		self:RangeAttackCode()
    elseif key == "attack_range" then
		if IsValid(self.Soul1) then self.Soul1:Remove() end
		if IsValid(self.Soul2) then self.Soul2:Remove() end
		self.Screamer_HomingAttack = false
		self:RangeAttackCode()
    elseif key == "sprite" && self.AttackType == VJ.ATTACK_TYPE_RANGE && !self.Screamer_HomingAttack then
		if IsValid(self.Soul1) then self.Soul1:Remove() end
		if IsValid(self.Soul2) then self.Soul2:Remove() end
		self.Soul1 = ents.Create("env_sprite")
		self.Soul1:SetKeyValue("model","vj_cofr/sprites/soul.vmt")
		self.Soul1:SetKeyValue("scale","1")
		//self.Soul1:SetKeyValue("rendercolor","255 128 0")
		self.Soul1:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
		//self.Soul1:SetKeyValue("HDRColorScale","1.0")
		self.Soul1:SetKeyValue("renderfx","14")
		self.Soul1:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
		self.Soul1:SetKeyValue("renderamt","255") -- Transparency
		self.Soul1:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
		self.Soul1:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
		self.Soul1:SetKeyValue("spawnflags","0")
		self.Soul1:SetParent(self)
		self.Soul1:Fire("SetParentAttachment","rhand")
		self.Soul1:Spawn()
		self.Soul1:Activate()
		self:DeleteOnRemove(self.Soul1)
		timer.Simple(2,function() if IsValid(self) && IsValid(self.Soul1) then self.Soul1:Remove() end end)
		
		self.Soul2 = ents.Create("env_sprite")
		self.Soul2:SetKeyValue("model","vj_cofr/sprites/soul.vmt")
		self.Soul2:SetKeyValue("scale","1")
		//self.Soul2:SetKeyValue("rendercolor","255 128 0")
		self.Soul2:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
		//self.Soul2:SetKeyValue("HDRColorScale","1.0")
		self.Soul2:SetKeyValue("renderfx","14")
		self.Soul2:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
		self.Soul2:SetKeyValue("renderamt","255") -- Transparency
		self.Soul2:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
		self.Soul2:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
		self.Soul2:SetKeyValue("spawnflags","0")
		self.Soul2:SetParent(self)
		self.Soul2:Fire("SetParentAttachment","lhand")
		self.Soul2:Spawn()
		self.Soul2:Activate()
		self:DeleteOnRemove(self.Soul2)
		timer.Simple(2,function() if IsValid(self) && IsValid(self.Soul2) then self.Soul2:Remove() end end)
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	if (math.random(1,2) == 1 && self.NearestPointToEnemyDistance < 850) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_DUCK)) then
		self.AnimTbl_RangeAttack = {"vjseq_shoot"}
		self.RangeAttackPos_Up = 80
		self.Screamer_HomingAttack = true
	else
		self.AnimTbl_RangeAttack = {"vjseq_attack1","vjseq_attack2"}
		self.RangeAttackPos_Up = 20
		self.Screamer_HomingAttack = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	if self.Screamer_HomingAttack && IsValid(self:GetEnemy()) then
		projectile.Track_Enemy = self:GetEnemy()
		timer.Simple(10,function() if IsValid(projectile) then projectile:Remove() end end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
	local projPos = projectile:GetPos()
	return self:CalculateProjectile("Line", projPos, self:GetAimPosition(ene, projPos, 1, 700), 700)
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
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:DrawShadow(false)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/