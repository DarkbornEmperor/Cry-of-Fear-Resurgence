AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/agrunt.mdl"} 
ENT.StartHealth = 350
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.Bleeds = false
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.HasRangeAttack = true 
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_soul" 
ENT.RangeDistance = 1100 
ENT.RangeToMeleeDistance = 200 
ENT.TimeUntilRangeAttackProjectileRelease = false 
ENT.NextRangeAttackTime = 0 
ENT.RangeAttackPos_Up = 50 
ENT.RangeAttackPos_Forward = 10 
ENT.RangeAttackPos_Right = 15 
ENT.NoChaseAfterCertainRange = true 
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance" 
ENT.NoChaseAfterCertainRange_Type = "Regular" 
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
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}	
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/zombie/claw_strike1.wav",
"vj_cofr/zombie/claw_strike2.wav",
"vj_cofr/zombie/claw_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/zombie/claw_miss1.wav",
"vj_cofr/zombie/claw_miss2.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/agrunt/ag_fire1.wav",
"vj_cofr/agrunt/ag_fire2.wav",
"vj_cofr/agrunt/ag_fire3.wav"
}	
-- Custom
ENT.Spector_Face = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Spector_CustomOnInitialize()
    self.SoundTbl_Alert = {
	--"vj_cofr/agrunt/ag_alert1.wav",
	"vj_cofr/agrunt/ag_alert2.wav",
	"vj_cofr/agrunt/ag_alert3.wav",
	"vj_cofr/agrunt/ag_alert4.wav",
	"vj_cofr/agrunt/ag_alert5.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/agrunt/ag_attack1.wav",
	"vj_cofr/agrunt/ag_attack2.wav",
	"vj_cofr/agrunt/ag_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/agrunt/ag_pain1.wav",
	"vj_cofr/agrunt/ag_pain2.wav",
	"vj_cofr/agrunt/ag_pain3.wav",
	"vj_cofr/agrunt/ag_pain4.wav",
	"vj_cofr/agrunt/ag_pain5.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/agrunt/ag_die1.wav",
	"vj_cofr/agrunt/ag_die2.wav",
	"vj_cofr/agrunt/ag_die3.wav",
	"vj_cofr/agrunt/ag_die4.wav",
	"vj_cofr/agrunt/ag_die5.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	 --self:SetNoDraw(true)
	 self:DrawShadow(false)
     self:SetCollisionBounds(Vector(25, 25, 85), Vector(-25, -25, 0))
     self:Spector_CustomOnInitialize() 	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack_range" then
		self:RangeAttackCode()
		--ParticleEffect("face",self:GetAttachment(self:LookupAttachment("hand")).Pos,self:GetAngles())
end
	if key == "attack" then
		self:MeleeAttackCode()
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    if IsValid(self:GetEnemy()) && self.RangeAttacking == true && self.Spector_Face == false then
	    self.Spector_Face = true
	    self.IdleEffect = ents.Create("env_sprite")
	    self.IdleEffect:SetKeyValue("model","vj_cofr/sprites/face.vmt")
	    self.IdleEffect:SetKeyValue("rendercolor","255 255 255")
	    self.IdleEffect:SetKeyValue("GlowProxySize","1.0")
	    self.IdleEffect:SetKeyValue("HDRColorScale","1.0")
	    self.IdleEffect:SetKeyValue("renderfx","0")
	    self.IdleEffect:SetKeyValue("rendermode","2")
	    self.IdleEffect:SetKeyValue("renderamt","255")
	    self.IdleEffect:SetKeyValue("disablereceiveshadows","0")
	    self.IdleEffect:SetKeyValue("mindxlevel","0")
	    self.IdleEffect:SetKeyValue("maxdxlevel","0")
	    self.IdleEffect:SetKeyValue("framerate","40.0")
	    self.IdleEffect:SetKeyValue("spawnflags","0")
	    self.IdleEffect:SetKeyValue("scale",tostring(self.Scale))
		self.IdleEffect:Fire("SetParentAttachment","face",0)
	    self.IdleEffect:SetPos(self:GetPos())
	    self.IdleEffect:Spawn()
	    self.IdleEffect:SetParent(self)
	    self:DeleteOnRemove(self.IdleEffect)	
elseif !IsValid(self:GetEnemy()) && self.RangeAttacking == false && self.Spector_Face == true then
        self.Spector_Face = false 
        SafeRemoveEntityDelayed(self.IdleEffect, 3)		
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	if IsValid(self:GetEnemy()) then
		projectile.Track_Enemy = self:GetEnemy()		
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
	if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	elseif hitgroup == HITGROUP_STOMACH then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT}
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/