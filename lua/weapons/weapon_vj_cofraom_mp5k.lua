SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "MP5K"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.07
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_mp5k.mdl"
SWEP.HoldType = "smg"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(181, -185, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(4, 7, -0.5)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 31
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound =
    "vj_cofr/aom/weapons/mp5k/mp5k_fire.wav"

SWEP.Primary.DistantSound =
    "vj_cofr/fx/distant/hks_distant_new.wav"

SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false

local math_random = math.random
local math_rand = math.Rand
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/aom/weapons/dryfire.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.45)
    /*local owner = self:GetOwner()
    if IsValid(owner) && owner:GetClass() == "npc_vj_cofraomda_david" then
        self.WorldModel_CustomPositionOrigin = Vector(3.5, 8.5, -0.7)
    end*/
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
function SWEP:OnPrimaryAttack(status, statusData)
    if status == "Init" then
        local burst = math_random(1,8)
        local num = 0.07
        if burst == 1 then
            self.NPC_TimeUntilFireExtraTimers = {num, num*2}
            self.NPC_NextPrimaryFire = math_rand(0.6,0.7)
        elseif burst == 2 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3}
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end