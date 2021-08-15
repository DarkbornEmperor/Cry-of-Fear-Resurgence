AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY","CLASS_PLAYER_ALLY","CLASS_UNITED_STATES_FRIENDLY"} 
ENT.FriendsWithAllPlayerAllies = true
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAnimationAllowOtherTasks = true
ENT.HasRangeAttack = false
ENT.DisableDefaultRangeAttackCode = true
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 1
ENT.NoChaseAfterCertainRange = false
ENT.NoChaseAfterCertainRange_FarDistance = 600 
ENT.NoChaseAfterCertainRange_CloseDistance = 1 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 20
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/david/knife_hit1.wav",
"vj_cofr/aom/david/knife_hit2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/david/knife_swing1.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 40
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.David_Shotgun = false
ENT.David_Glock = false
ENT.David_Knife = false
ENT.David_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    self.SoundTbl_Breath = {
    "vj_cofr/aom/david/breathe1.wav",
	"vj_cofr/aom/david/breathe2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav",	
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/david/pl_pain2.wav",
    "vj_cofr/aom/david/pl_pain4.wav",
    "vj_cofr/aom/david/pl_pain5.wav",
    "vj_cofr/aom/david/pl_pain6.wav",
    "vj_cofr/aom/david/pl_pain7.wav",	
}
    local David_Type = math.random(1,3)
    if David_Type == 1 then
		self.David_Shotgun = true
elseif David_Type == 2 then
		self.David_Glock = true			
elseif David_Type == 3 then
		self.David_Knife = true	
end	
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_CustomOnInitialize()
	 if self.David_Shotgun then 
		self:SetShotgun()		
elseif self.David_Glock then
		self:SetGlock()					
elseif self.David_Knife then
		self:SetKnife()	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     self:SetCollisionBounds(Vector(13, 13, 77), Vector(-13, -13, 0))
     self:David_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
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
function ENT:SetShotgun()
    self.AnimTbl_IdleStand = {ACT_IDLE_STEALTH}
	self.AnimTbl_RangeAttack = {"vjges_ref_shoot_shotgun"}
	self:SetBodygroup(3,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 1
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
	self.AnimTbl_IdleStand = {ACT_IDLE_HURT}
	self.AnimTbl_RangeAttack = {"vjges_ref_shoot_onehanded"}
	self:SetBodygroup(2,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 0.2	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetKnife()
    self.AnimTbl_IdleStand = {ACT_IDLE}
	self.AnimTbl_MeleeAttack = {"vjges_ref_shoot_crowbar"}
	self:SetBodygroup(1,1)
	self.HasMeleeAttack = true
	self.HasRangeAttack = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_DoFireEffects()
    if self.David_Shotgun then
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment("shotgun")).Pos)
	flash:SetKeyValue("scale","1")
	flash:SetKeyValue("angles",tostring(self:GetForward():Angle()))
	flash:Fire("Fire",0,0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment("shotgun")).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)
	
elseif self.David_Glock then
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
	flash:SetKeyValue("scale","1")
	flash:SetKeyValue("angles",tostring(self:GetForward():Angle()))
	flash:Fire("Fire",0,0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)	
end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	if self.David_Shotgun then
	local bullet = {}
		bullet.Num = 6
		bullet.Src = self:GetAttachment(self:LookupAttachment("shotgun")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-35) -self:GetPos()
		bullet.Spread = Vector(60,50,40)
		bullet.Tracer = 6
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 10
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
	    self.David_FiredAtLeastOnce = true
	    self:David_DoFireEffects()
		VJ_EmitSound(self, "vj_cofr/aom/david/shotgun_fire.wav", 100, 100)
	    timer.Simple(0.5,function() if IsValid(self) then
	    VJ_EmitSound(self, "vj_cofr/aom/david/shotgun_pump.wav", 75, 100) end end)
		
elseif self.David_Glock then
	local bullet = {}
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-35) -self:GetPos()
		bullet.Spread = Vector(50,40,30)
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 10
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
	    self.David_FiredAtLeastOnce = true
	    self:David_DoFireEffects()
		VJ_EmitSound(self, "vj_cofr/aom/david/glock_fire.wav", 100, 100)			
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.25)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
     else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
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