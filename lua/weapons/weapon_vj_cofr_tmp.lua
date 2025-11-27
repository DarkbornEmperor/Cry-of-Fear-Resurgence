SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "TMP"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.09
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_tmp.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(6, 5, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2.5, 3, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 7
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound =
    "vj_cofr/cof/weapons/tmp/tmp_shoot_loop.wav"

SWEP.Primary.EndSound =
    "vj_cofr/cof/weapons/tmp/tmp_shoot_end.wav"

SWEP.Primary.DistantSound =
    "vj_cofr/fx/distant/hks_distant_new.wav"

SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.Primary.UsesLoopedSound = true

local math_random = math.random
local math_rand = math.Rand
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.Primary.Sound =
            "vj_cofr/cof/weapons/tmp/old/tmp_shoot_loop.wav"
        self.Primary.EndSound =
            "vj_cofr/cof/weapons/tmp/old/tmp_shoot_end.wav"
    end
    self:SetModelScale(0.85)
    local owner = self:GetOwner()
    if owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(-2, 2.5, -1)
    elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(-2, 3, -1)
    end
    if self.Primary.UsesLoopedSound then
        self.PrimarySound = self.Primary.Sound
        self.Primary.Sound = nil
        self.PrimaryLoop = CreateSound(self, VJ.PICK(self.PrimarySound), VJ_RecipientFilter)
        self.PrimaryLoop:SetSoundLevel(self.Primary.SoundLevel or 75)
    end
    self.PrimaryLoopSoundT = 0
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoImpactEffect(tr, damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
    local muz = ents.Create("env_sprite")
    muz:SetKeyValue("model", "vj_cofr/sprites/muzzleflash.vmt")
    muz:SetKeyValue("scale", "" .. math_rand(0.15,0.25))
    muz:SetKeyValue("GlowProxySize", "2.0")
    muz:SetKeyValue("HDRColorScale", "1.0")
    muz:SetKeyValue("renderfx", "14")
    muz:SetKeyValue("rendermode", "3")
    muz:SetKeyValue("renderamt", "255")
    muz:SetKeyValue("disablereceiveshadows", "0")
    muz:SetKeyValue("framerate", "10.0")
    muz:SetKeyValue("spawnflags", "0")
    muz:SetParent(self)
    muz:Fire("SetParentAttachment", self.PrimaryEffects_MuzzleAttachment)
    muz:SetAngles(Angle(math_random(-100,100), math_random(-100,100), math_random(-100,100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill", "", 0.08)
    self.BaseClass.PrimaryAttackEffects(self, owner)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
        local burst = math_random(1,8)
        local num = 0.09
        if burst == 1 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2}
            self.NPC_NextPrimaryFire = math_rand(0.6,0.7)
        elseif burst == 2 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2,num * 3}
            self.NPC_NextPrimaryFire = math_rand(0.7,0.8)
        elseif burst == 3 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4}
            self.NPC_NextPrimaryFire = math_rand(0.8,0.9)
        elseif burst == 4 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5}
            self.NPC_NextPrimaryFire = math_rand(0.9,1.25)
        elseif burst == 5 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6}
            self.NPC_NextPrimaryFire = math_rand(1.25,1.35)
        elseif burst == 6 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7}
            self.NPC_NextPrimaryFire = math_rand(1.35,1.45)
        elseif burst == 7 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7, num * 8}
            self.NPC_NextPrimaryFire = math_rand(1.45,1.55)
        elseif burst == 8 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4, num * 5, num * 6, num * 7, num * 8, num * 9}
            self.NPC_NextPrimaryFire = math_rand(1.55,1.85)
        end
    end
    if status == "PostFire" then
        if self.Primary.UsesLoopedSound then
            self.PrimaryLoopSoundT = CurTime() +0.1
            if math_random(1,7) == 1 && self.PrimaryLoop:IsPlaying() && #self.PrimarySound > 1 then
                self.PrimaryLoop:Stop()
                self.PrimaryLoop = CreateSound(self, VJ.PICK(self.PrimarySound), VJ_RecipientFilter)
                self.PrimaryLoop:SetSoundLevel(self.Primary.SoundLevel or 75)
                self.PrimaryLoop:Play()
            end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnHolster(newWep)
    VJ.STOPSOUND(self.PrimaryLoop)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDrop()
    if self.Primary.UsesLoopedSound && self.PrimaryLoop then
        self.PrimaryLoop:Stop()
    end
    self.BaseClass.OnDrop(self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OwnerChanged()
    if self.Primary.UsesLoopedSound && self.PrimaryLoop then
        self.PrimaryLoop:Stop()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnThink()
	local owner = self:GetOwner()
	self.LastOwner = owner
    if self.PrimaryLoop then
        if CurTime() > self.PrimaryLoopSoundT && self.PrimaryLoopSoundT > 0 then
            self.PrimaryLoop:Stop()
            self.PrimaryLoopSoundT = 0
            if IsValid(owner) then
                local fireSd = VJ.PICK(self.Primary.EndSound)
                if fireSd != false then
                    sound.Play(fireSd, owner:GetPos(), self.Primary.SoundLevel, math_random(self.Primary.SoundPitch.a, self.Primary.SoundPitch.b), self.Primary.SoundVolume)
                end
            end
        elseif self.PrimaryLoopSoundT > CurTime() && !self.PrimaryLoop:IsPlaying() then
            self.PrimaryLoop:Play()
        end
        self:NextThink(CurTime())
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnRemove()
    VJ.STOPSOUND(self.PrimaryLoop)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end