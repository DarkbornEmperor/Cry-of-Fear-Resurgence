AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/controller.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL 
ENT.Aerial_FlyingSpeed_Calm = 120 
ENT.Aerial_FlyingSpeed_Alerted = 300 
ENT.Aerial_AnimTbl_Calm = {"forward"} 
ENT.Aerial_AnimTbl_Alerted = {"forward"} 
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.Bleeds = false
ENT.ConstantlyFaceEnemy = true
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true 
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_ghost_soul" 
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
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_BIG_FLINCH}
ENT.HasDeathAnimation = false 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "bip01 neck", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(10, 0, -3), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_RangeAttack = {
"vj_cofr/aom/controller/con_attack1.wav",
"vj_cofr/aom/controller/con_attack2.wav",
"vj_cofr/aom/controller/con_attack3.wav"
}	
-- Custom
ENT.Ghost_HomingAttack = false -- false = Regular, true = Homing
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Ghost_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/controller/con_alert1.wav",
	"vj_cofr/aom/controller/con_alert2.wav",
	"vj_cofr/aom/controller/con_alert3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/controller/con_pain1.wav",
	"vj_cofr/aom/controller/con_pain2.wav",
	"vj_cofr/aom/controller/con_pain3.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/controller/con_die1.wav",
	"vj_cofr/aom/controller/con_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:DrawShadow(false)
     self:SetCollisionBounds(Vector(20, 20, 70), Vector(-20, -20, -10))
     self:Ghost_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack_range" && self.RangeAttacking == true && self.Ghost_HomingAttack == false then
		self:RangeAttackCode()
		if IsValid(self.Glow1) then self.Glow1:Remove() end
		if IsValid(self.Glow2) then self.Glow2:Remove() end
		self.Glow1 = ents.Create("env_sprite")
		self.Glow1:SetKeyValue("model","vj_cofr/sprites/aom_soul.vmt")
		self.Glow1:SetKeyValue("scale","1")
		//self.Glow1:SetKeyValue("rendercolor","255 128 0")
		self.Glow1:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
		//self.Glow1:SetKeyValue("HDRColorScale","1.0")
		self.Glow1:SetKeyValue("renderfx","14")
		self.Glow1:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
		self.Glow1:SetKeyValue("renderamt","255") -- Transparency
		self.Glow1:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
		self.Glow1:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
		self.Glow1:SetKeyValue("spawnflags","0")
		self.Glow1:SetParent(self)
		self.Glow1:Fire("SetParentAttachment","rhand")
		self.Glow1:Spawn()
		self.Glow1:Activate()
		self:DeleteOnRemove(self.Glow1)
		timer.Simple(2,function() if IsValid(self) && IsValid(self.Glow1) then self.Glow1:Remove() end end)
		
		self.Glow2 = ents.Create("env_sprite")
		self.Glow2:SetKeyValue("model","vj_cofr/sprites/aom_soul.vmt")
		self.Glow2:SetKeyValue("scale","1")
		//self.Glow2:SetKeyValue("rendercolor","255 128 0")
		self.Glow2:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
		//self.Glow2:SetKeyValue("HDRColorScale","1.0")
		self.Glow2:SetKeyValue("renderfx","14")
		self.Glow2:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
		self.Glow2:SetKeyValue("renderamt","255") -- Transparency
		self.Glow2:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
		self.Glow2:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
		self.Glow2:SetKeyValue("spawnflags","0")
		self.Glow2:SetParent(self)
		self.Glow2:Fire("SetParentAttachment","lhand")
		self.Glow2:Spawn()
		self.Glow2:Activate()
		self:DeleteOnRemove(self.Glow2)
		timer.Simple(2,function() if IsValid(self) && IsValid(self.Glow2) then self.Glow2:Remove() end end)
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleRangeAttacks()
	if (math.random(1,2) == 1 && self.NearestPointToEnemyDistance < 850) or (self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK)) then
		self.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK2}
		self.RangeAttackPos_Up = 20
		self.Ghost_HomingAttack = true
	else
		self.AnimTbl_RangeAttack = {ACT_RANGE_ATTACK1}
		self.RangeAttackPos_Up = 20
		self.Ghost_HomingAttack = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	if self.Ghost_HomingAttack == true && IsValid(self:GetEnemy()) then
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
	ParticleEffect("face",self:GetAttachment(self:LookupAttachment(0)).Pos,self:GetAngles())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/