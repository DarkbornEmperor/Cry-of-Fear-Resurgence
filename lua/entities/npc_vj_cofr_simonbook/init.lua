AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/booksimon.mdl"
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.TimeUntilMeleeAttackDamage = false
ENT.AnimTbl_MeleeAttack = "vjseq_attack_sledgehammer"
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
ENT.RangeAttackMaxDistance = 2000
ENT.RangeAttackMinDistance = 1
ENT.LimitChaseDistance = false
ENT.LimitChaseDistance_Max = 600
ENT.LimitChaseDistance_Min = 1
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100

ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = "common/null.wav"
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
ENT.SoundTbl_ShotgunPump = {
"vj_cofr/cof/weapons/shotgun/pump_seq.wav"
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
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_Init()
     if self.BookSimon_Shotgun then
        self:SetShotgun()
     elseif self.BookSimon_Glock then
        self:SetGlock()
     elseif self.BookSimon_TMP then
        self:SetTMP()
     elseif self.BookSimon_M16 then
        self:SetM16()
     elseif self.BookSimon_Sledgehammer then
        self:SetSledgehammer()
     elseif self.BookSimon_SledgehammerFlare then
        self:SetSledgehammerFlare()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:Init()
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
 if GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 1 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 0 then
    self.SoundTbl_Glock = {
    "vj_cofr/cof/weapons/glock/glock_fire.wav"
}
 elseif GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 0 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.SoundTbl_Glock = {
    "vj_cofr/cof/weapons/glock/old/glock_fire.wav"
}
end
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.SoundTbl_Shotgun = {
    "vj_cofr/cof/weapons/shotgun/old/shoot.wav"
}
    self.SoundTbl_ShotgunPump = {
    "vj_cofr/cof/weapons/shotgun/old/pump_seq.wav"
}
    self.SoundTbl_TMP = {
    "vj_cofr/cof/weapons/tmp/old/tmp_shoot_end.wav"
}
    self.SoundTbl_M16 = {
    "vj_cofr/cof/weapons/m16/old/m16_fire.wav"
}
end
    -- Screen flash effect for all the players
    for _,v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
end
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:BookSimon_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
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
function ENT:SetShotgun()
    self:SetBodygroup(0,1)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.CanTurnWhileMoving = false
    self.TimeUntilRangeAttackProjectileRelease = 0.5
    self.NextAnyAttackTime_Range = 1
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTMP()
    self:SetBodygroup(0,2)
    self:SetBodygroup(1,1)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.CanTurnWhileMoving = false
    self.TimeUntilRangeAttackProjectileRelease = 0.09
    self.RangeAttackReps = 10
    self.NextAnyAttackTime_Range = 1.5
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
    self:SetBodygroup(0,3)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.CanTurnWhileMoving = false
    self.TimeUntilRangeAttackProjectileRelease = 0.1
    self.NextAnyAttackTime_Range = 0.6
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetM16()
    self:SetBodygroup(0,4)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.CanTurnWhileMoving = false
    self.TimeUntilRangeAttackProjectileRelease = 0.05
    self.RangeAttackReps = 3
    self.NextAnyAttackTime_Range = 1.5
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammer()
    self:SetBodygroup(0,5)
    self.HasPoseParameterLooking = false
    self.HasMeleeAttack = true
    self.HasRangeAttack = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammerFlare()
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
    FlareLight:SetKeyValue("style","1")
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
    //Light:SetParent(self)
    Light:Spawn()
    Light:Activate()
    Light:Fire("TurnOn","",0)
    Light:Fire("Kill","",0.07)
    //self:DeleteOnRemove(Light)

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
function ENT:DoImpactEffect(tr,damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if self.BookSimon_Glock then
    if act == ACT_IDLE then
        return ACT_IDLE_STEALTH
    elseif act == ACT_RUN or act == ACT_WALK then
        return ACT_WALK_STEALTH
    end
end
    if self.BookSimon_TMP then
    if act == ACT_IDLE then
        return ACT_IDLE_HURT
    elseif act == ACT_RUN or act == ACT_WALK then
        return ACT_WALK_HURT
    end
end
    if self.BookSimon_Sledgehammer then
    if act == ACT_IDLE then
        return ACT_IDLE_STIMULATED
    elseif act == ACT_RUN or act == ACT_WALK then
        return ACT_RUN_STIMULATED
    end
end
    if self.BookSimon_SledgehammerFlare then
    if act == ACT_IDLE then
        return ACT_IDLE_RELAXED
    elseif act == ACT_RUN or act == ACT_WALK then
        return ACT_SPRINT
    end
end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
 local ene = self:GetEnemy()
 if IsValid(self) && IsValid(self:GetEnemy()) then
 if self.BookSimon_Shotgun then
    VJ.EmitSound(self, self.SoundTbl_Shotgun, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b), 1, CHAN_WEAPON)
    VJ.EmitSound(self, "vj_cofr/fx/distant/sbarrel1_distant2.wav", 140, self:GetSoundPitch(100, 110))
    timer.Simple(0.5,function() if IsValid(self) then self.Shotgun_Pump = VJ.CreateSound(self, self.SoundTbl_ShotgunPump, 75, 100) end end)
    self:FireBullets({
        Attacker = self,
        Num = 6,
        Src = self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos,
        Dir = (self:GetAimPosition(ene, self:GetAttachment(self:LookupAttachment("shotgun_muzzle")).Pos, 0) - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
        Spread = Vector(0.1,0.1,0),
        TracerName = "VJ_COFR_Tracer",
        Tracer = 1,
        Damage = self:ScaleByDifficulty(5),
        Force = 1,
        AmmoType = "Buckshot",
        Distance = 2048,
        HullSize = 1
     })

 elseif self.BookSimon_Glock then
    VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b), 1, CHAN_WEAPON)
    VJ.EmitSound(self, "vj_cofr/fx/distant/glock_distant2.wav", 140, self:GetSoundPitch(100, 110))
    self:FireBullets({
        Attacker = self,
        Num = 1,
        Src = self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos,
        Dir = (self:GetAimPosition(ene, self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos, 0) - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
        Spread = Vector(0.1,0.1,0),
        TracerName = "VJ_COFR_Tracer",
        Tracer = 1,
        Damage = self:ScaleByDifficulty(13),
        Force = 5,
        AmmoType = "Pistol",
        Distance = 2048,
        HullSize = 1
     })

 elseif self.BookSimon_TMP then
    VJ.EmitSound(self, self.SoundTbl_TMP, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b), 1, CHAN_WEAPON)
    VJ.EmitSound(self, "vj_cofr/fx/distant/hks_distant_new.wav", 140, self:GetSoundPitch(100, 110))
    self:FireBullets({
        Attacker = self,
        Num = 1,
        Src = self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos,
        Dir = (self:GetAimPosition(ene, self:GetAttachment(self:LookupAttachment("tmp_muzzle")).Pos, 0) - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
        Spread = Vector(0.1,0.1,0),
        TracerName = "VJ_COFR_Tracer",
        Tracer = 1,
        Damage = self:ScaleByDifficulty(7),
        Force = 5,
        AmmoType = "SMG1",
        Distance = 2048,
        HullSize = 1
     })

 elseif self.BookSimon_M16 then
    VJ.EmitSound(self, self.SoundTbl_M16, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b), 1, CHAN_WEAPON)
    VJ.EmitSound(self, "vj_cofr/fx/distant/hks_distant_new.wav", 140, self:GetSoundPitch(100, 110))
    self:FireBullets({
        Attacker = self,
        Num = 1,
        Src = self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos,
        Dir = (self:GetAimPosition(ene, self:GetAttachment(self:LookupAttachment("m16_muzzle")).Pos, 0) - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
        Spread = Vector(0.1,0.1,0),
        TracerName = "VJ_COFR_Tracer",
        Tracer = 1,
        Damage = self:ScaleByDifficulty(16),
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
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.45)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Finish" then
    -- Screen flash effect for all the players
    for _,v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
    end
end
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
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
function ENT:OnFootstepSound()
    if !self:IsOnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() +Vector(0,0,-150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/