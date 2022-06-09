AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/booksimon.mdl"} 
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.TimeUntilMeleeAttackDamage = false
ENT.AnimTbl_MeleeAttack = {"vjseq_attack_sledgehammer"}
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeAttackAnimationFaceEnemy = false
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
ENT.DeathAnimationTime = 10
ENT.AnimTbl_Death = {ACT_DIESIMPLE} 
ENT.HasSoundTrack = true
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
"vj_cofr/cof/simon/concrete1.wav",
"vj_cofr/cof/simon/concrete2.wav",
"vj_cofr/cof/simon/concrete3.wav",
"vj_cofr/cof/simon/concrete4.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/booksimon/sledgehammer_hitbody.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/booksimon/sledgehammer_swing.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/booksimon/ending5.mp3",
"vj_cofr/cof/booksimon/fucked.mp3",
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Glock = {
"vj_cofr/cof/weapons/glock/glock_fire.wav"
}
ENT.SoundTbl_Shotgun = {
"vj_cofr/cof/weapons/shotgun/shoot.wav"
}
ENT.SoundTbl_TMP = {
"vj_cofr/cof/weapons/tmp/tmp_fire.wav"
}
ENT.SoundTbl_M16 = {
"vj_cofr/cof/weapons/m16/m16_fire.wav"
}
ENT.BreathSoundLevel = 75
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.BookSimon_Shotgun = false
ENT.BookSimon_Glock = false
ENT.BookSimon_TMP = false
ENT.Booksimon_M16 = false
ENT.BookSimon_Sledgehammer = false
ENT.BookSimon_SledgehammerFlare = false
ENT.BookSimon_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    if GetConVarNumber("VJ_COFR_BookSimon_Normal") == 1 then
    local BookSimon_Type = math.random(1,3)
    if BookSimon_Type == 1 then
		self.BookSimon_Shotgun = true
elseif BookSimon_Type == 2 then
		self.BookSimon_Sledgehammer = true	
elseif BookSimon_Type == 3 then
		self.BookSimon_SledgehammerFlare = true	
	end	
end	
    if GetConVarNumber("VJ_COFR_BookSimon_Normal") == 0 then	
    local BookSimon_Type = math.random(1,6)
    if BookSimon_Type == 1 then
		self.BookSimon_Shotgun = true
elseif BookSimon_Type == 2 then
		self.BookSimon_Glock = true		
elseif BookSimon_Type == 3 then
		self.BookSimon_TMP = true		
elseif BookSimon_Type == 4 then
		self.BookSimon_M16 = true		
elseif BookSimon_Type == 5 then
		self.BookSimon_Sledgehammer = true	
elseif BookSimon_Type == 6 then
		self.BookSimon_SledgehammerFlare = true
	end	
end	
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()
	 if self.BookSimon_Shotgun then 
		self:SetShotgun()		
elseif self.BookSimon_Glock then
		self:SetGlock()			
elseif self.BookSimon_TMP then
		self:SetTMP()		
elseif self.BookSimon_M16 then
		self:SetM16()		
elseif self.BookSimon_Sledgehammer then
		self:SetSledgehammerFlare()	
elseif self.BookSimon_SledgehammerFlare then
		self:SetSledgehammer()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
     self:BookSimon_CustomOnInitialize()	 
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetShotgun()
    self.AnimTbl_IdleStand = {ACT_IDLE}
    self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self:SetBodygroup(0,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.5
	self.NextRangeAttackTime = 1	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTMP()
	self.AnimTbl_IdleStand = {ACT_IDLE_HURT}
	self.AnimTbl_Walk = {ACT_WALK_HURT}
	self.AnimTbl_Run = {ACT_WALK_HURT}
	self:SetBodygroup(0,2)
	self:SetBodygroup(1,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.01
	self.NextRangeAttackTime = 0.07
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
	self.AnimTbl_IdleStand = {ACT_IDLE_STEALTH}
	self.AnimTbl_Walk = {ACT_WALK_STEALTH}
	self.AnimTbl_Run = {ACT_WALK_STEALTH}
	self:SetBodygroup(0,3)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 0.6		
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetM16()
    self.AnimTbl_IdleStand = {ACT_IDLE}
    self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self:SetBodygroup(0,4)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextRangeAttackTime = 0.05	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammer()
    self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
    self.AnimTbl_Walk = {ACT_RUN_STIMULATED}
	self.AnimTbl_Run = {ACT_RUN_STIMULATED}
	self:SetBodygroup(0,5)
	self.HasPoseParameterLooking = false
	self.HasMeleeAttack = true
	self.HasRangeAttack = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammerFlare()
    self.AnimTbl_IdleStand = {ACT_IDLE_RELAXED}
    self.AnimTbl_Walk = {ACT_SPRINT}
	self.AnimTbl_Run = {ACT_SPRINT}
	self.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1","vjseq_sledgeflare_attack2","vjseq_sledgeflare_attack3"}
	self:SetBodygroup(0,5)
	self:SetBodygroup(2,1)
	self.HasPoseParameterLooking = false	
	self.HasMeleeAttack = true
	self.HasRangeAttack = false	
	VJ_EmitSound(self, "vj_cofr/cof/booksimon/flare_ignite.wav", 75, 100)
	self.SoundTbl_Breath = {
    "vj_cofr/cof/booksimon/flare_burn.wav"
}	
	self.FlareLight = ents.Create("light_dynamic")
	self.FlareLight:SetKeyValue("brightness", "1")
	self.FlareLight:SetKeyValue("distance", "500")
	self.FlareLight:SetLocalPos(self:GetPos())
	self.FlareLight:SetLocalAngles( self:GetAngles() )
	self.FlareLight:Fire("Color", "255 0 0")
	self.FlareLight:SetParent(self)
	self.FlareLight:Spawn()
	self.FlareLight:Activate()
	self.FlareLight:Fire("SetParentAttachment","flare")	
	self.FlareLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.FlareLight)

	ParticleEffectAttach("vj_cofr_flare_sparks",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))
	ParticleEffectAttach("vj_cofr_flare_trail",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_DoFireEffects()
	muz = ents.Create("env_sprite")
	muz:SetKeyValue("model","vj_cofr/sprites/muzzleflash.vmt")
	muz:SetKeyValue("scale",""..math.Rand(0.3,0.5))
	muz:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	muz:SetKeyValue("HDRColorScale","1.0")
	muz:SetKeyValue("renderfx","14")
	muz:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	muz:SetKeyValue("renderamt","255") -- Transparency
	muz:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	muz:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	muz:SetKeyValue("spawnflags","0")
	muz:SetParent(self)
	muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)

	Light = ents.Create("light_dynamic")
	Light:SetKeyValue("brightness", "4")
	Light:SetKeyValue("distance", "120")
	Light:SetLocalAngles(self:GetAngles())
	Light:Fire("Color", "255 150 60")
	Light:SetParent(self)
	Light:Spawn()
	Light:Activate()
	Light:Fire("TurnOn","",0)
	Light:Fire("Kill","",0.07)
	self:DeleteOnRemove(Light)
	
     if self.BookSimon_Shotgun then
	    muz:Fire("SetParentAttachment","shotgun_muzzle")
	    Light:SetPos(self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos)
	
     elseif self.BookSimon_Glock then
	    muz:Fire("SetParentAttachment","pistol_muzzle")
	    Light:SetPos(self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos)
	
     elseif self.BookSimon_TMP then
	    muz:Fire("SetParentAttachment","tmp_muzzle")
	    Light:SetPos(self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos)
	
     elseif self.BookSimon_M16 then
	    muz:Fire("SetParentAttachment","m16_muzzle")
	    Light:SetPos(self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos)	
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	local bullet = {}
	bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-35) -self:GetPos()
	bullet.TracerName = "Tracer"
	bullet.Force = 4
	bullet.AmmoType = "SMG1"
	
	if self.BookSimon_Shotgun then
		bullet.Num = 12
		bullet.Src = self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos
		bullet.Spread = Vector(60,50,40)
		bullet.Tracer = 6
		bullet.Damage = 5
		VJ_EmitSound(self, self.SoundTbl_Shotgun, self.RangeAttackSoundLevel, self.RangeAttackPitch)
	    timer.Simple(0.5,function() if IsValid(self) then
	    VJ_EmitSound(self, "vj_cofr/cof/weapons/shotgun/pump_seq.wav", 75, 100) end end)
		
    elseif self.BookSimon_Glock then
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos
		bullet.Spread = Vector(50,40,30)
		bullet.Tracer = 1
		bullet.Damage = 13
		VJ_EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self.RangeAttackPitch)
		
    elseif self.BookSimon_TMP then
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos
		bullet.Spread = Vector(60,50,40)
		bullet.Tracer = 1
		bullet.Force = 4
		bullet.Damage = 4
		VJ_EmitSound(self, self.SoundTbl_TMP, self.RangeAttackSoundLevel, self.RangeAttackPitch)
		
    elseif self.BookSimon_M16 then
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos
		bullet.Spread = Vector(50,40,30)
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 16
		bullet.AmmoType = "SMG1"
		VJ_EmitSound(self, self.SoundTbl_M16, self.RangeAttackSoundLevel, self.RangeAttackPitch)				
end	
	self:FireBullets(bullet)
	self.BookSimon_FiredAtLeastOnce = true
	self:BookSimon_DoFireEffects()	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/