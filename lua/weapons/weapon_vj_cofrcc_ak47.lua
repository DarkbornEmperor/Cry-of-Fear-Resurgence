SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "AK-47"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.05
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cofcc/weapons/w_ak47.mdl"
SWEP.HoldType = "ar2"
SWEP.CoFR_HoldType = "m16"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-93.5, 0, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(10, -3.2, -0.5)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 16
SWEP.Primary.ClipSize = 20
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound =
    "vj_cofr/cofcc/weapons/ak47/shoot.wav"

SWEP.Primary.DistantSound =
    "vj_cofr/fx/distant/hks_distant_new.wav"

SWEP.PrimaryEffects_ShellType = "RifleShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false

local math_random = math.random
local math_rand = math.Rand
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/cof/weapons/weapon_fire_empty.wav"
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
    muz:SetKeyValue("framerate", "15.0")
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
function SWEP:DoImpactEffect(tr, damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
        local burst = math_random(1,2)
        local num = 0.05
        if burst == 1 then
            self.NPC_TimeUntilFireExtraTimers = {}
            self.NPC_NextPrimaryFire = math_rand(0.7,0.9)
        elseif burst == 2 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2}
            self.NPC_NextPrimaryFire = math_rand(1,1.2)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end