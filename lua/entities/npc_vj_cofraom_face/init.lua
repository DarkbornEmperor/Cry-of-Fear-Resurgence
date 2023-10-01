AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/agrunt.mdl"} 
ENT.StartHealth = 350
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_mattack2","vjseq_mattack3"} 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasRangeAttack = true 
ENT.RangeAttackEntityToSpawn = "obj_vj_cofraom_eyeball" 
ENT.RangeDistance = 1100 
ENT.RangeToMeleeDistance = 200 
ENT.TimeUntilRangeAttackProjectileRelease = false 
ENT.RangeUseAttachmentForPos = true 
ENT.RangeUseAttachmentForPosID = "hornet"
ENT.NextRangeAttackTime = 0  
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
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}	
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/twitcher/claw_strike1.wav",
"vj_cofr/aom/twitcher/claw_strike2.wav",
"vj_cofr/aom/twitcher/claw_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/twitcher/claw_miss1.wav",
"vj_cofr/aom/twitcher/claw_miss2.wav"
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
function ENT:Face_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/face/ag_alert1.wav",
	"vj_cofr/aom/face/ag_alert2.wav",
	"vj_cofr/aom/face/ag_alert3.wav",
	"vj_cofr/aom/face/ag_alert4.wav",
	"vj_cofr/aom/face/ag_alert5.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/face/ag_attack1.wav",
	"vj_cofr/aom/face/ag_attack2.wav",
	"vj_cofr/aom/face/ag_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/face/ag_pain1.wav",
	"vj_cofr/aom/face/ag_pain2.wav",
	"vj_cofr/aom/face/ag_pain3.wav",
	"vj_cofr/aom/face/ag_pain4.wav",
	"vj_cofr/aom/face/ag_pain5.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/face/ag_die1.wav",
	"vj_cofr/aom/face/ag_die2.wav",
	"vj_cofr/aom/face/ag_die3.wav",
	"vj_cofr/aom/face/ag_die4.wav",
	"vj_cofr/aom/face/ag_die5.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:DrawShadow(false)
    self:SetCollisionBounds(Vector(25, 25, 86), Vector(-25, -25, 0))
    self:Face_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "attack" then
		self:MeleeAttackCode()	
	elseif key == "attack_range" && self.AttackType == VJ.ATTACK_TYPE_RANGE && !self.Dead then
		self:RangeAttackCode()
		if IsValid(self.Face) then self.Face:Remove() end
		self.Face = ents.Create("env_sprite")
		self.Face:SetKeyValue("model","vj_cofr/sprites/face.vmt")
		self.Face:SetKeyValue("scale","1")
		//self.Face:SetKeyValue("rendercolor","255 128 0")
		self.Face:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
		//self.Face:SetKeyValue("HDRColorScale","1.0")
		self.Face:SetKeyValue("renderfx","14")
		self.Face:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
		self.Face:SetKeyValue("renderamt","255") -- Transparency
		self.Face:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
		//self.Face:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
		self.Face:SetKeyValue("spawnflags","0")
		self.Face:SetParent(self)
		self.Face:Fire("SetParentAttachment","hornet")
		self.Face:Spawn()
		self.Face:Activate()
		self:DeleteOnRemove(self.Face)
		timer.Simple(0.08,function() if IsValid(self) && IsValid(self.Face) then self.Face:Remove() end end)		
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
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
	local ene = self:GetEnemy()
	if IsValid(ene) then
		projectile.Track_Enemy = ene
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo,hitgroup)
	if dmginfo:GetDamage() > 30 then
		self.FlinchChance = 8
		self.AnimTbl_Flinch = {ACT_BIG_FLINCH}
	else
		self.FlinchChance = 16
		self.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:DrawShadow(false)
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