SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Remington 870"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.6
SWEP.NPC_CustomSpread = 2.5
SWEP.NPC_ExtraFireSound =
    "vj_cofr/cof/weapons/shotgun/pump_seq.wav"

SWEP.NPC_ExtraFireSoundTime = 0.5
SWEP.NPC_FiringDistanceScale = 0.5
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_shotgun.mdl"
SWEP.HoldType = "shotgun"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(8.337, 1.885, 2.181),
    Ang = Angle(24.996, -1.103, 89.534)
}
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 5
SWEP.Primary.NumberOfShots = 8
SWEP.Primary.ClipSize = 5
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = "VJ.CoFR_Shotgun.Single"
SWEP.PrimaryEffects_ShellType = "ShotgunShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false

local math_random = math.random
local math_rand = math.Rand
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.Primary.Sound = "VJ.CoFR_Shotgun_Old.Single"
        self.NPC_ExtraFireSound =
            "vj_cofr/cof/weapons/shotgun/old/pump_seq.wav"
    end
    self:SetModelScale(0.85)
    timer.Simple(0.1, function()
        if IsValid(self) && IsValid(self:GetOwner()) then
            if self:GetOwner():GetClass() == "npc_vj_cofr_police" then
                self.WorldModelOffsetParams.Pos = Vector(8.699, 1.878, 2.012)
            end
        end
    end)
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
    muz:Fire("Kill", nil, 0.08)
    self.BaseClass.PrimaryAttackEffects(self, owner)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    if !IsValid(owner) then return end
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end