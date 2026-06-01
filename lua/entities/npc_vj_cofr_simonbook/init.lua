AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/booksimon.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.CanTurnWhileMoving = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = "vjseq_attack_sledgehammer"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.RangeAttackAnimationFaceEnemy = false
ENT.NextRangeAttackTime = 0
ENT.RangeAttackMaxDistance = 2000
ENT.RangeAttackMinDistance = 0
ENT.LimitChaseDistance = false
ENT.LimitChaseDistance_Max = 600
ENT.LimitChaseDistance_Min = 0
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 75
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/null.wav"

ENT.SoundTbl_MeleeAttackExtra =
    "vj_cofr/cof/weapons/sledgehammer/sledgehammer_hitbody.wav"

ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/weapons/sledgehammer/sledgehammer_swing.wav"

ENT.SoundTbl_Glock = "VJ.CoFR_Glock_Suicider.Single"
ENT.SoundTbl_Shotgun = "VJ.CoFR_Shotgun.Single"
ENT.SoundTbl_ShotgunPump =
    "vj_cofr/cof/weapons/shotgun/pump_seq.wav"

ENT.SoundTbl_TMP = "VJ.CoFR_TMP.Loop"
ENT.SoundTbl_TMPEnd = "VJ.CoFR_TMP.Single"
ENT.SoundTbl_M16 = "VJ.CoFR_M16.Single"
ENT.SoundTbl_SoundTrack = {
    "vj_cofr/cof/booksimon/ending5.mp3",
    "vj_cofr/cof/booksimon/fucked.mp3"
}
ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.BookSimon_Shotgun = false
ENT.BookSimon_Glock = false
ENT.BookSimon_TMP = false
ENT.Booksimon_M16 = false
ENT.BookSimon_Sledgehammer = false
ENT.BookSimon_SledgehammerFlare = false
ENT.BookSimon_NextTMPSoundT = 0

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 1 then
        local bookSimon_Type = math_random(1,3)
        if bookSimon_Type == 1 then
            self.BookSimon_Shotgun = true
            self.Model = "models/vj_cofr/cof/booksimon_shotgun.mdl"
        elseif bookSimon_Type == 2 then
            self.BookSimon_Sledgehammer = true
        elseif bookSimon_Type == 3 then
            self.BookSimon_SledgehammerFlare = true
        end
    end
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 0 then
        local bookSimon_Type = math_random(1,6)
        if bookSimon_Type == 1 then
            self.BookSimon_Shotgun = true
            self.Model = "models/vj_cofr/cof/booksimon_shotgun.mdl"
        elseif bookSimon_Type == 2 then
            self.BookSimon_Glock = true
        elseif bookSimon_Type == 3 then
            self.BookSimon_TMP = true
            self.Model = "models/vj_cofr/cof/booksimon_tmp.mdl"
        elseif bookSimon_Type == 4 then
            self.BookSimon_M16 = true
            self.Model = "models/vj_cofr/cof/booksimon_m16.mdl"
        elseif bookSimon_Type == 5 then
            self.BookSimon_Sledgehammer = true
        elseif bookSimon_Type == 6 then
            self.BookSimon_SledgehammerFlare = true
        end
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
    if GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 1 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 0 then
        self.SoundTbl_Glock = "VJ.CoFR_Glock.Single"
    elseif GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 0 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.SoundTbl_Glock = "VJ.CoFR_Glock_Old.Single"
    end
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.SoundTbl_Shotgun = "VJ.CoFR_Shotgun_Old.Single"

        self.SoundTbl_ShotgunPump =
            "vj_cofr/cof/weapons/shotgun/old/pump_seq.wav"

        self.SoundTbl_TMP = "VJ.CoFR_TMP_Old.Loop"
        self.SoundTbl_TMPEnd = "VJ.CoFR_TMP_Old.Single"
        self.SoundTbl_M16 ="VJ.CoFR_M16_Old.Single"
    end
    if self.BookSimon_TMP then
        self.TMPSound = self.SoundTbl_TMP
        self.SoundTbl_TMP = nil
        self.TMPLoop = CreateSound(self, VJ.PICK(self.TMPSound), VJ_RecipientFilter)
        self.TMPLoop:SetSoundLevel(140)
    end
    -- Screen flash effect for all the players
    for _, v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
    end
    self:BookSimon_Init()
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math_random(3,4) .. ".wav", 75, 100)
        local watLevel = self:WaterLevel()
        if watLevel > 0 && watLevel < 3 then
            ParticleEffect("water_splash_01", self:GetPos(), Angle())
            VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
            /*local effectdata = EffectData()
            effectdata:SetOrigin(self:GetPos())
            effectdata:SetScale(10)
            util.Effect("watersplash", effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = (self.VJCE_NPC:IsMoving() && self.VJC_Camera_Mode == 1) or self.VJC_Camera_Mode == 2
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetShotgun()
    self:SetBodygroup(0,1)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.TimeUntilRangeAttackProjectileRelease = 0.5
    self.NextAnyAttackTime_Range = 1
    self.BookSimon_MuzzleAttach = "muzzle_shotgun"
    self.BookSimon_ShellAttach = "shell_shotgun"
    self.BookSimon_ShellType = "ShotgunShellEject"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetTMP()
    self:SetBodygroup(0,2)
    self:SetBodygroup(1,1)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.TimeUntilRangeAttackProjectileRelease = 0.09
    self.RangeAttackReps = 10
    self.NextAnyAttackTime_Range = 1.5
    self.BookSimon_MuzzleAttach = "muzzle_tmp"
    self.BookSimon_ShellAttach = "shell_tmp"
    self.BookSimon_ShellType = "ShellEject"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetGlock()
    self:SetBodygroup(0,3)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.TimeUntilRangeAttackProjectileRelease = 0.1
    self.NextAnyAttackTime_Range = 0.6
    self.BookSimon_MuzzleAttach = "muzzle_glock"
    self.BookSimon_ShellAttach = "shell_glock"
    self.BookSimon_ShellType = "ShellEject"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetM16()
    self:SetBodygroup(0,4)
    self.HasMeleeAttack = false
    self.HasRangeAttack = true
    self.LimitChaseDistance = true
    self.TimeUntilRangeAttackProjectileRelease = 0.05
    self.RangeAttackReps = 3
    self.NextAnyAttackTime_Range = 1.5
    self.BookSimon_MuzzleAttach = "muzzle_m16"
    self.BookSimon_ShellAttach = "shell_m16"
    self.BookSimon_ShellType = "RifleShellEject"
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
    self.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1", "vjseq_sledgeflare_attack2", "vjseq_sledgeflare_attack3"}
    self:SetBodygroup(0,5)
    self:SetBodygroup(2,1)
    self.HasPoseParameterLooking = false
    self.HasMeleeAttack = true
    self.HasRangeAttack = false
    self.Flare_Ignite = VJ.CreateSound(self, "vj_cofr/cof/booksimon/flare_ignite.wav", 75, 100)
    self.SoundTbl_Breath =
        "vj_cofr/cof/booksimon/flare_burn.wav"

    local att = self:LookupAttachment("flare")
    local flareLight = ents.Create("light_dynamic")
    flareLight:SetKeyValue("brightness", "1")
    flareLight:SetKeyValue("distance", "500")
    flareLight:SetLocalPos(self:GetPos())
    flareLight:SetLocalAngles(self:GetAngles())
    flareLight:Fire("Color", "255 0 0")
    flareLight:SetKeyValue("style", "1")
    flareLight:SetParent(self)
    flareLight:Spawn()
    flareLight:Activate()
    flareLight:Fire("SetParentAttachment", "flare")
    flareLight:Fire("TurnOn", "", 0)
    self:DeleteOnRemove(flareLight)

    ParticleEffectAttach("vj_cofr_flare_sparks", PATTACH_POINT_FOLLOW, self, att)
    ParticleEffectAttach("vj_cofr_flare_trail", PATTACH_POINT_FOLLOW, self, att)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireFX()
    local attMuz = self:GetAttachment(self:LookupAttachment(self.BookSimon_MuzzleAttach))
    local attShell = self:GetAttachment(self:LookupAttachment(self.BookSimon_ShellAttach))

    local effectData = EffectData()
    effectData:SetEntity(self)
    effectData:SetOrigin(attShell.Pos)
    effectData:SetAngles(attShell.Ang)
    util.Effect(self.BookSimon_ShellType, effectData, true, true)

    local muz = ents.Create("env_sprite")
    muz:SetKeyValue("model", "vj_cofr/sprites/muzzleflash.vmt")
    muz:SetKeyValue("scale", "" .. math_rand(0.15,0.25))
    muz:SetKeyValue("GlowProxySize", "2.0")
    muz:SetKeyValue("HDRColorScale", "1.0")
    muz:SetKeyValue("renderfx", "14")
    muz:SetKeyValue("rendermode", "3")
    muz:SetKeyValue("renderamt", "255")
    muz:SetKeyValue("disablereceiveshadows", "0")
    muz:SetKeyValue("framerate", "15.0")
    muz:SetKeyValue("spawnflags", "0")
    muz:SetParent(self)
    muz:Fire("SetParentAttachment", self.BookSimon_MuzzleAttach)
    muz:SetAngles(Angle(math_random(-100,100), math_random(-100,100), math_random(-100,100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill", "", 0.08)

    local muzLight = ents.Create("light_dynamic")
    muzLight:SetKeyValue("brightness", "4")
    muzLight:SetKeyValue("distance", "120")
    muzLight:SetPos(attMuz.Pos)
    muzLight:SetLocalAngles(self:GetAngles())
    muzLight:Fire("Color", "255 150 60")
    //muzLight:SetParent(self)
    muzLight:Spawn()
    muzLight:Activate()
    muzLight:Fire("TurnOn", "", 0)
    muzLight:Fire("Kill", "", 0.07)
    //self:DeleteOnRemove(muzLight)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoImpactEffect(tr, damageType)
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
    elseif self.BookSimon_TMP then
        if act == ACT_IDLE then
            return ACT_IDLE_HURT
        elseif act == ACT_RUN or act == ACT_WALK then
            return ACT_WALK_HURT
        end
    elseif self.BookSimon_Sledgehammer then
        if act == ACT_IDLE then
            return ACT_IDLE_STIMULATED
        elseif act == ACT_RUN or act == ACT_WALK then
            return ACT_RUN_STIMULATED
        end
    elseif self.BookSimon_SledgehammerFlare then
        if act == ACT_IDLE then
            return ACT_IDLE_RELAXED
        elseif act == ACT_RUN or act == ACT_WALK then
            return ACT_RUN_RELAXED
        end
    end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if !self.BookSimon_TMP then return end
    if self.TMPLoop then
        if CurTime() > self.BookSimon_NextTMPSoundT && self.BookSimon_NextTMPSoundT > 0 then
            self.TMPLoop:Stop()
            self.BookSimon_NextTMPSoundT = 0
            if IsValid(self) then
                local fireSd = VJ.PICK(self.SoundTbl_TMPEnd)
                if fireSd != false then
                    sound.Play(fireSd, self:GetPos(), 140, self:GetSoundPitch(self.RangeAttackPitch), 1)
                end
            end
        elseif self.BookSimon_NextTMPSoundT > CurTime() && !self.TMPLoop:IsPlaying() then
            self.TMPLoop:Play()
        end
        self:NextThink(CurTime())
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local attPos = self:GetAttachment(self:LookupAttachment(self.BookSimon_MuzzleAttach)).Pos
        if self.BookSimon_Shotgun then
            VJ.EmitSound(self, self.SoundTbl_Shotgun)
            timer.Simple(0.5, function() if IsValid(self) then self.Shotgun_Pump = VJ.EmitSound(self, self.SoundTbl_ShotgunPump, 75, 100) end end)
            self:FireBullets({
                Attacker = self,
                Num = 6,
                Src = attPos,
                Dir = (self:GetAimPosition(enemy, attPos, 0) - attPos):Angle():Forward(),
                Spread = Vector(0.1, 0.1, 0),
                TracerName = "VJ_COFR_Tracer",
                Tracer = 1,
                Damage = self:ScaleByDifficulty(5),
                Force = 1,
                AmmoType = "Buckshot",
                Distance = 2048,
                HullSize = 1
            })
        elseif self.BookSimon_Glock then
            VJ.EmitSound(self, self.SoundTbl_Glock)
            self:FireBullets({
                Attacker = self,
                Num = 1,
                Src = attPos,
                Dir = (self:GetAimPosition(enemy, attPos, 0) - attPos):Angle():Forward(),
                Spread = Vector(0.1, 0.1, 0),
                TracerName = "VJ_COFR_Tracer",
                Tracer = 1,
                Damage = self:ScaleByDifficulty(13),
                Force = 5,
                AmmoType = "Pistol",
                Distance = 2048,
                HullSize = 1
            })
        elseif self.BookSimon_TMP then
            self.BookSimon_NextTMPSoundT = CurTime() + 0.1
            if /*math_random(1,7) == 1 &&*/ self.TMPLoop:IsPlaying() && #self.TMPSound > 1 then
                self.TMPLoop:Stop()
                self.TMPLoop = CreateSound(self, VJ.PICK(self.TMPSound), VJ_RecipientFilter)
                self.TMPLoop:SetSoundLevel(140)
                self.TMPLoop:Play()
            end
            self:FireBullets({
                Attacker = self,
                Num = 1,
                Src = attPos,
                Dir = (self:GetAimPosition(enemy, attPos, 0) - attPos):Angle():Forward(),
                Spread = Vector(0.1, 0.1, 0),
                TracerName = "VJ_COFR_Tracer",
                Tracer = 1,
                Damage = self:ScaleByDifficulty(7),
                Force = 5,
                AmmoType = "SMG1",
                Distance = 2048,
                HullSize = 1
            })
        elseif self.BookSimon_M16 then
            VJ.EmitSound(self, self.SoundTbl_M16)
            self:FireBullets({
                Attacker = self,
                Num = 1,
                Src = attPos,
                Dir = (self:GetAimPosition(enemy, attPos, 0) - attPos):Angle():Forward(),
                Spread = Vector(0.1, 0.1, 0),
                TracerName = "VJ_COFR_Tracer",
                Tracer = 1,
                Damage = self:ScaleByDifficulty(16),
                Force = 5,
                AmmoType = "SMG1",
                Distance = 2048,
                HullSize = 1
            })
        end
        self:FireFX()
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    elseif status == "Finish" then
        -- Screen flash effect for all the players
        for _, v in ipairs(player.GetHumans()) do
            v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
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
    [MAT_SNOW] = {
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
    [MAT_GRASS] = {
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
local vecZ150 = Vector(0, 0, -150)
--
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    local myPos = self:GetPos()
    local tr = util.TraceLine({
        start = myPos,
        endpos = myPos + vecZ150,
        filter = self
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self, VJ.PICK(self.FootSteps[tr.MatType]), self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
    local watLevel = self:WaterLevel()
    if watLevel > 0 && watLevel < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    local watLevel = self:WaterLevel()
    if watLevel > 0 && watLevel < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end