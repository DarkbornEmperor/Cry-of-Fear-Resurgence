AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
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
ENT.NextRangeAttackTime = 0
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
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
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
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/booksimon/sledgehammer_hitbody.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/booksimon/sledgehammer_swing.wav"
}
ENT.SoundTbl_Glock = {
"vj_cofr/cof/suicider/suicider_glock_fire.wav"
}
ENT.SoundTbl_Shotgun = {
"vj_cofr/cof/weapons/shotgun/shoot.wav"
}
ENT.SoundTbl_TMP = {
"vj_cofr/cof/weapons/tmp/tmp_shoot_end.wav"
}
ENT.SoundTbl_M16 = {
"vj_cofr/cof/weapons/m16/m16_fire.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/booksimon/ending5.mp3",
"vj_cofr/cof/booksimon/fucked.mp3",
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
ENT.RangeAttackSoundLevel = 90
-- Custom
ENT.BookSimon_Shotgun = false
ENT.BookSimon_Glock = false
ENT.BookSimon_TMP = false
ENT.Booksimon_M16 = false
ENT.BookSimon_Sledgehammer = false
ENT.BookSimon_SledgehammerFlare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()	
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
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
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:CustomOnInitialize()
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 1 then
    local BookSimon_Type = math.random(1,3)
    if BookSimon_Type == 1 then
		self.BookSimon_Shotgun = true
    elseif BookSimon_Type == 2 then
		self.BookSimon_Sledgehammer = true	
    elseif BookSimon_Type == 3 then
		self.BookSimon_SledgehammerFlare = true	
	end	
end	
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 0 then	
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
	-- Screen flash effect for all the players
	for _,v in ipairs(player.GetHumans()) do
		v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
end	
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:BookSimon_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
		self:CustomOnFootStepSound()
	elseif key == "attack" then
		self:MeleeAttackCode()	
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
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
	self.NextAnyAttackTime_Range = 1	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTMP()
	self.AnimTbl_IdleStand = {ACT_IDLE_HURT}
	self:SetIdleAnimation({ACT_IDLE_HURT}, true)
	self.AnimTbl_Walk = {ACT_WALK_HURT}
	self.AnimTbl_Run = {ACT_WALK_HURT}
	self:SetBodygroup(0,2)
	self:SetBodygroup(1,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.09
	self.RangeAttackReps = 10
	self.NextAnyAttackTime_Range = 1.5
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
	self.AnimTbl_IdleStand = {ACT_IDLE_STEALTH}
	self:SetIdleAnimation({ACT_IDLE_STEALTH}, true)
	self.AnimTbl_Walk = {ACT_WALK_STEALTH}
	self.AnimTbl_Run = {ACT_WALK_STEALTH}
	self:SetBodygroup(0,3)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
	self.CombatFaceEnemy = false
	self.TimeUntilRangeAttackProjectileRelease = 0.1
	self.NextAnyAttackTime_Range = 0.6		
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
	self.TimeUntilRangeAttackProjectileRelease = 0.05
	self.RangeAttackReps = 3
	self.NextAnyAttackTime_Range = 1.5	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammer()
    self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
	self:SetIdleAnimation({ACT_IDLE_STIMULATED}, true)
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
	self:SetIdleAnimation({ACT_IDLE_RELAXED}, true)
    self.AnimTbl_Walk = {ACT_SPRINT}
	self.AnimTbl_Run = {ACT_SPRINT}
	self.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1","vjseq_sledgeflare_attack2","vjseq_sledgeflare_attack3"}
	self:SetBodygroup(0,5)
	self:SetBodygroup(2,1)
	self.HasPoseParameterLooking = false	
	self.HasMeleeAttack = true
	self.HasRangeAttack = false	
	self.Flare_Ignite = VJ.CreateSound(self, "vj_cofr/cof/booksimon/flare_ignite.wav", 75, 100)
	self.SoundTbl_Breath = {
    "vj_cofr/cof/booksimon/flare_burn.wav"
}	
	local FlareLight = ents.Create("light_dynamic")
	FlareLight:SetKeyValue("brightness", "1")
	FlareLight:SetKeyValue("distance", "500")
	FlareLight:SetLocalPos(self:GetPos())
	FlareLight:SetLocalAngles( self:GetAngles() )
	FlareLight:Fire("Color", "255 0 0")
	FlareLight:SetParent(self)
	FlareLight:Spawn()
	FlareLight:Activate()
	FlareLight:Fire("SetParentAttachment","flare")	
	FlareLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(FlareLight)

	ParticleEffectAttach("vj_cofr_flare_sparks",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))
	ParticleEffectAttach("vj_cofr_flare_trail",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeActivity(newAct)
    if self.BookSimon_Glock or self.BookSimon_TMP or self.BookSimon_Sledgehammer or self.BookSimon_SledgehammerFlare then self.NextIdleStandTime = 0 end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireFX()
	local muz = ents.Create("env_sprite")
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

	local Light = ents.Create("light_dynamic")
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
 local ene = self:GetEnemy()
 if IsValid(self) && IsValid(self:GetEnemy()) then	
 if self.BookSimon_Shotgun then
    VJ.EmitSound(self, self.SoundTbl_Shotgun, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
    VJ.EmitSound(self, {"vj_cofr/fx/distant/sbarrel1_distant2.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))
	timer.Simple(0.5,function() if IsValid(self) then self.Shotgun_Pump = VJ.CreateSound(self, "vj_cofr/cof/weapons/shotgun/pump_seq.wav", 75, 100) end end)
	self:FireBullets({
        Attacker = self,
		Num = 6,
		Src = self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos,
	    Dir = (ene:GetPos() + ene:OBBCenter() - self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos):Angle():Forward(),
		Spread = Vector(0.1,0.1,0),
		TracerName = "VJ_COFR_Tracer",
		Tracer = 1,
		Damage = 5,
		Force = 5,
	    AmmoType = "Buckshot",
		Distance = 2048,
		HullSize = 1
     })
		
 elseif self.BookSimon_Glock then
    VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
    VJ.EmitSound(self, {"vj_cofr/fx/distant/glock_distant2.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))
	self:FireBullets({
        Attacker = self,
		Num = 1,
		Src = self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos,
	    Dir = (ene:GetPos() + ene:OBBCenter() - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
		Spread = Vector(0.1,0.1,0),
		TracerName = "VJ_COFR_Tracer",
		Tracer = 1,
		Damage = 13,
		Force = 5,
	    AmmoType = "Pistol",
		Distance = 2048,
		HullSize = 1
     })
		
 elseif self.BookSimon_TMP then
	VJ.EmitSound(self, self.SoundTbl_TMP, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
    VJ.EmitSound(self, {"vj_cofr/fx/distant/hks_distant_new.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))
	self:FireBullets({
        Attacker = self,
		Num = 1,
		Src = self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos,
	    Dir = (ene:GetPos() + ene:OBBCenter() - self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos):Angle():Forward(),
		Spread = Vector(0.1,0.1,0),
		TracerName = "VJ_COFR_Tracer",
		Tracer = 1,
		Force = 4,
		Damage = 7,
		Force = 5,
	    AmmoType = "SMG1",
		Distance = 2048,
		HullSize = 1
	 })
		
 elseif self.BookSimon_M16 then
	VJ.EmitSound(self, self.SoundTbl_M16, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))	
    VJ.EmitSound(self, {"vj_cofr/fx/distant/hks_distant_new.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))	
	self:FireBullets({
        Attacker = self,
		Num = 1,
		Src = self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos,
	    Dir = (ene:GetPos() + ene:OBBCenter() - self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos):Angle():Forward(),
		Spread = Vector(0.1,0.1,0),
		TracerName = "VJ_COFR_Tracer",
		Tracer = 1,
		Force = 4,
		Damage = 16,
		Force = 5,
		AmmoType = "SMG1",
		Distance = 2048,
		HullSize = 1
	 })
	end
end
	self:FireFX()	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:CustomOnKilled(dmginfo,hitgroup)
	-- Screen flash effect for all the players
	for _,v in ipairs(player.GetHumans()) do
		v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Shotgun_Pump)
    VJ.STOPSOUND(self.Flare_Ignite)
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootSteps = {
	[MAT_ANTLION] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_BLOODYFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_CONCRETE] = {
        "vj_cofr/cof/simon/footsteps/concrete1.wav",
        "vj_cofr/cof/simon/footsteps/concrete2.wav",
        "vj_cofr/cof/simon/footsteps/concrete3.wav",
        "vj_cofr/cof/simon/footsteps/concrete4.wav"
    },
	[MAT_DIRT] = {
        "vj_cofr/cof/simon/footsteps/dirt1.wav",
        "vj_cofr/cof/simon/footsteps/dirt2.wav",
        "vj_cofr/cof/simon/footsteps/dirt3.wav",
        "vj_cofr/cof/simon/footsteps/dirt4.wav"
    },
	[MAT_FLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_GRATE] = {
        "vj_cofr/cof/simon/footsteps/metal1.wav",
        "vj_cofr/cof/simon/footsteps/metal2.wav",
        "vj_cofr/cof/simon/footsteps/metal3.wav",
        "vj_cofr/cof/simon/footsteps/metal4.wav"
	},
	[MAT_ALIENFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[74] = { -- Snow
        "vj_cofr/cof/simon/footsteps/snow1.wav",
        "vj_cofr/cof/simon/footsteps/snow2.wav",
        "vj_cofr/cof/simon/footsteps/snow3.wav",
        "vj_cofr/cof/simon/footsteps/snow4.wav"
    },
	[MAT_PLASTIC] = {
        "vj_cofr/cof/simon/footsteps/paper1.wav",
        "vj_cofr/cof/simon/footsteps/paper2.wav",
        "vj_cofr/cof/simon/footsteps/paper3.wav",
        "vj_cofr/cof/simon/footsteps/paper4.wav"
	},
	[MAT_METAL] = {
        "vj_cofr/cof/simon/footsteps/metal1.wav",
        "vj_cofr/cof/simon/footsteps/metal2.wav",
        "vj_cofr/cof/simon/footsteps/metal3.wav",
        "vj_cofr/cof/simon/footsteps/metal4.wav"
    },
	[MAT_SAND] = {
        "vj_cofr/cof/simon/footsteps/sand1.wav",
        "vj_cofr/cof/simon/footsteps/sand2.wav",
        "vj_cofr/cof/simon/footsteps/sand3.wav",
        "vj_cofr/cof/simon/footsteps/sand4.wav"
    },
	[MAT_FOLIAGE] = {
        "vj_cofr/cof/simon/footsteps/gravel1.wav",
        "vj_cofr/cof/simon/footsteps/gravel2.wav",
        "vj_cofr/cof/simon/footsteps/gravel3.wav",
        "vj_cofr/cof/simon/footsteps/gravel4.wav"
	},
	[MAT_COMPUTER] = {
        "vj_cofr/cof/simon/footsteps/paper1.wav",
        "vj_cofr/cof/simon/footsteps/paper2.wav",
        "vj_cofr/cof/simon/footsteps/paper3.wav",
        "vj_cofr/cof/simon/footsteps/paper4.wav"
	},
	[MAT_SLOSH] = {
        "vj_cofr/cof/simon/footsteps/splash1.wav",
        "vj_cofr/cof/simon/footsteps/splash2.wav",
        "vj_cofr/cof/simon/footsteps/splash3.wav",
        "vj_cofr/cof/simon/footsteps/splash4.wav"
	},
	[MAT_TILE] = {
        "vj_cofr/cof/simon/footsteps/concrete1.wav",
        "vj_cofr/cof/simon/footsteps/concrete2.wav",
        "vj_cofr/cof/simon/footsteps/concrete3.wav",
        "vj_cofr/cof/simon/footsteps/concrete4.wav"
	},
	[85] = { -- Grass
        "vj_cofr/cof/simon/footsteps/grass1.wav",
        "vj_cofr/cof/simon/footsteps/grass2.wav",
        "vj_cofr/cof/simon/footsteps/grass3.wav",
        "vj_cofr/cof/simon/footsteps/grass4.wav"
	},
	[MAT_VENT] = {
        "vj_cofr/cof/simon/footsteps/metal1.wav",
        "vj_cofr/cof/simon/footsteps/metal2.wav",
        "vj_cofr/cof/simon/footsteps/metal3.wav",
        "vj_cofr/cof/simon/footsteps/metal4.wav"
	},
	[MAT_WOOD] = {
        "vj_cofr/cof/simon/footsteps/wood1.wav",
        "vj_cofr/cof/simon/footsteps/wood2.wav",
        "vj_cofr/cof/simon/footsteps/wood3.wav",
        "vj_cofr/cof/simon/footsteps/wood4.wav"
	},
	[MAT_GLASS] = {
        "vj_cofr/cof/simon/footsteps/glass1.wav",
        "vj_cofr/cof/simon/footsteps/glass2.wav",
        "vj_cofr/cof/simon/footsteps/glass3.wav",
        "vj_cofr/cof/simon/footsteps/glass4.wav"
	}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/