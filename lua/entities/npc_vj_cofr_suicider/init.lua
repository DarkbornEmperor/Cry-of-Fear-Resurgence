AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/suicider.mdl"
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackMaxDistance = 2000
ENT.RangeAttackMinDistance = 0
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 250
ENT.LimitChaseDistance_Min = 200
ENT.CanTurnWhileMoving = false
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIE_HEADSHOT
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_Glock =
    "vj_cofr/cof/suicider/suicider_glock_fire.wav"

ENT.SoundTbl_P345 =
    "vj_cofr/cof/weapons/p345/p345_fire.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
ENT.RangeAttackSoundLevel = 90
-- Custom
ENT.Suicider_Glock = false
ENT.Suicider_P345 = false
ENT.Suicider_Suicide = false
ENT.Suicider_Ammo = 0
ENT.Suicider_Skin = 0

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 25
        self.SuiciderDamage = 2
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 40
        self.SuiciderDamage = 5
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.StartHealth = 50
        self.SuiciderDamage = 10
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.StartHealth = 70
        self.SuiciderDamage = 20
    end
    if GetConVar("VJ_COFR_Suicider_ExtraPistol"):GetInt() == 0 then self.Suicider_Glock = true self.Suicider_Ammo = 15 return end
    local Suicider_Type = math_random(1,2)
    if Suicider_Type == 1 then
        self.Suicider_Glock = true
        self.Suicider_Ammo = 15
    elseif Suicider_Type == 2 then
        self.Suicider_P345 = true
        self.Suicider_Ammo = 8
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cof/slower/slower_alert10.wav",
        "vj_cofr/cof/slower/slower_alert20.wav",
        "vj_cofr/cof/slower/slower_alert30.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/cof/slower/slower_pain1.wav",
        "vj_cofr/cof/slower/slower_pain2.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self.Suicider_Glock then
        if GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 1 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 0 then
            self.SoundTbl_Glock =
                "vj_cofr/cof/weapons/glock/glock_fire.wav"

        elseif GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 0 && GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
            self.SoundTbl_Glock =
                "vj_cofr/cof/weapons/glock/old/glock_fire.wav"
        end
    end
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 && self.Suicider_P345 then
        self.SoundTbl_P345 =
            "vj_cofr/cof/weapons/p345/old/p345_fire.wav"
    end
    if math_random(1,2) == 1 then
        self.LimitChaseDistance = false
    end
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Suicider_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
local vecZ50 = Vector(0, 0, -50)
--
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "suicide" then
        VJ.EmitSound(self, "vj_cofr/fx/distant/glock_distant2.wav", 140, self:GetSoundPitch(100, 110))
        if self.Suicider_Glock then
            VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
        elseif self.Suicider_P345 then
            VJ.EmitSound(self, self.SoundTbl_P345, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
        end
        self:RemoveAllDecals()
        self:FireFX()
        self:DropGlock()
        VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math_random(1,2)..".wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        if self.Suicider_Skin == 0 then self:SetBodygroup(0,1)
        elseif self.Suicider_Skin == 1 then self:SetBodygroup(0,3)
        elseif self.Suicider_Skin == 2 then self:SetBodygroup(0,5) end
        local selfPos = self:GetPos() + self:OBBCenter()
        local tr = util.TraceLine({start = selfPos, endpos = selfPos + vecZ50, filter = self})
        util.Decal("VJ_COFR_Blood_Red", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal, self)
        if self.HasGibOnDeathEffects && self.Suicider_Skin != 3 && self.Suicider_Skin != 4 then
            local effectData = EffectData()
            effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
            effectData:SetColor(colorRed)
            effectData:SetScale(25)
            util.Effect("VJ_Blood1", effectData)
            effectData:SetScale(5)
            effectData:SetFlags(3)
            effectData:SetColor(0)
            util.Effect("bloodspray", effectData)
            util.Effect("bloodspray", effectData)
        end
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math_random(3,4) .. ".wav", 75, 100)
        if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
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
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
        self.VJCE_NPC.EnemyDetection = true
        self.VJCE_NPC.JumpParams.Enabled = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireFX()
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
    muz:Fire("SetParentAttachment", "muzzle")
    muz:SetAngles(Angle(math_random(-100,100), math_random(-100,100), math_random(-100,100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill", "", 0.08)

    local muzLight = ents.Create("light_dynamic")
    muzLight:SetKeyValue("brightness", "4")
    muzLight:SetKeyValue("distance", "120")
    muzLight:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos)
    muzLight:SetLocalAngles(self:GetAngles())
    muzLight:Fire("Color", "255 150 60")
    //muzLight:SetParent(self)
    muzLight:Spawn()
    muzLight:Activate()
    muzLight:Fire("TurnOn", "" ,0)
    muzLight:Fire("Kill", "", 0.07)
    //self:DeleteOnRemove(muzLight)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoImpactEffect(tr, damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    ply:ChatPrint("JUMP: Suicide")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local ent = self:GetEnemy()
    if !IsValid(ent) or self.Suicider_Ammo < 1 or self.Dead then return end
    local eneDist = self.EnemyData.Distance
    if eneDist < 100 && ent:Visible(self) && !self.Suicider_Suicide && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self:Suicide()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status, enemy)
    if status == "Init" then
        self.NextRangeAttackTime = math_rand(0.1,1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local attPos = self:GetAttachment(self:LookupAttachment("muzzle")).Pos
        if self.Suicider_Glock then
            VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
        elseif self.Suicider_P345 then
            VJ.EmitSound(self, self.SoundTbl_P345, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
        end
        if GetConVar("VJ_COFR_Suicider_Ammo"):GetInt() == 1 then
            self.Suicider_Ammo = self.Suicider_Ammo - 1
            if self.Suicider_Ammo < 1 && !self.Suicider_Suicide then self:Suicide() end
        end
        VJ.EmitSound(self, "vj_cofr/fx/distant/glock_distant2.wav", 140, self:GetSoundPitch(100, 110))
        self:FireBullets({
            Attacker = self,
            Num = 1,
            Src = attPos,
            Dir = (self:GetAimPosition(enemy, attPos, 0) - attPos):Angle():Forward(),
            Spread = Vector(0.1, 0.1, 0),
            TracerName = "VJ_COFR_Tracer",
            Tracer = 1,
            Damage = self:ScaleByDifficulty(self.SuiciderDamage),
            Force = 5,
            AmmoType = "Pistol",
            Distance = 2048,
            HullSize = 1
        })
        self:FireFX()
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if GetConVar("VJ_COFR_Suicider_Headshot"):GetInt() == 0 then return end
    if status == "PreDamage" && hitgroup == HITGROUP_HEAD then
        dmginfo:SetDamage(self:Health())
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicide()
    self.Suicider_Suicide = true
    self.Bleeds = false
    self.HasDeathSounds = false
    self:TakeDamage(self:GetMaxHealth(), self, self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "DeathAnim" then
        if self:IsMoving() then
            self.AnimTbl_Death = ACT_DIESIMPLE
        else
            self.AnimTbl_Death = ACT_DIE_HEADSHOT
        end
        if !self.Suicider_Suicide then
            self:DropGlock()
        else
            self.AnimTbl_Death = ACT_DIE_GUTSHOT
        end
    end
    if status == "Init" then
        VJ_COFR_DeathCode(self)
        if self.Suicider_Skin == 3 or self.Suicider_Skin == 4 then return end
        if !self.Suicider_Suicide && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 600 then
            self.HasDeathSounds = false
            self:RemoveAllDecals()
            if self.Suicider_Skin == 0 then self:SetBodygroup(0,1)
            elseif self.Suicider_Skin == 1 then self:SetBodygroup(0,3)
            elseif self.Suicider_Skin == 2 then self:SetBodygroup(0,5) end

            if self.HasGibOnDeathEffects then
                local effectData = EffectData()
                effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
                effectData:SetColor(colorRed)
                effectData:SetScale(25)
                util.Effect("VJ_Blood1", effectData)
                effectData:SetScale(5)
                effectData:SetFlags(3)
                effectData:SetColor(0)
                util.Effect("bloodspray", effectData)
                util.Effect("bloodspray", effectData)
            end
            VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack" .. math_random(1,2) .. ".wav", 75, 100)
            ParticleEffect("vj_cofr_blood_red_large", self:GetAttachment(self:LookupAttachment("head")).Pos, self:GetAngles())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropGlock()
    if GetConVar("VJ_COFR_Suicider_DropGlock"):GetInt() == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua", "GAME") then return end
    self:SetBodygroup(1,1)
    if self.Suicider_Glock then
        local glock = ents.Create("weapon_cof_glock")
        glock:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos)
        glock:SetAngles(self:GetAngles())
        glock:Spawn()
        glock:Activate()
    elseif self.Suicider_P345 then
        local p345 = ents.Create("weapon_cof_p345")
        p345:SetPos(self:GetAttachment(self:LookupAttachment("muzzle")).Pos)
        p345:SetAngles(self:GetAngles())
        p345:Spawn()
        p345:Activate()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/