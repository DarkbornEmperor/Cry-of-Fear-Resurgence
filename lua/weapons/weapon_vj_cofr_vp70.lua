SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "VP70"
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
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_vp70.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-35, 5, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1, -2, -0.5)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 15
SWEP.Primary.ClipSize = 18
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Sound =
    "vj_cofr/cof/weapons/vp70/vp70_fire.wav"

SWEP.Primary.DistantSound =
    "vj_cofr/fx/distant/glock_distant2.wav"

SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    local owner = self:GetOwner()
    if owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(-1.5, -2, -0.5)
    elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(-1.5, -2, -0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoImpactEffect(tr, damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
    local muz = ents.Create("env_sprite")
    muz:SetKeyValue("model", "vj_cofr/sprites/muzzleflash.vmt")
    muz:SetKeyValue("scale", "" .. math.Rand(0.3,0.5))
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
    muz:SetAngles(Angle(math.random(-100,100), math.random(-100,100), math.random(-100,100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill", "", 0.08)
    self.BaseClass.PrimaryAttackEffects(self, owner)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
    local num = 0.05
        self.NPC_TimeUntilFireExtraTimers = {num, num * 2}
        self.NPC_NextPrimaryFire = math.Rand(0.8,1.2)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end