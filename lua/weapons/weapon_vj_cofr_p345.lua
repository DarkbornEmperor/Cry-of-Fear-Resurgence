SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "P345"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.35
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_p345.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-14, -1, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2.5, 3.5, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 20
SWEP.Primary.ClipSize = 8
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Sound =
    "vj_cofr/cof/weapons/p345/p345_fire.wav"

SWEP.Primary.DistantSound =
    "vj_cofr/fx/distant/hks_distant_new.wav"

SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound =
    "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.Primary.Sound =
            "vj_cofr/cof/weapons/p345/old/p345_fire.wav"
    end
    local owner = self:GetOwner()
    if owner:GetClass() == "npc_vj_cofr_purnell" or owner:GetClass() == "npc_vj_cofr_purnell_fri" or owner:GetClass() == "npc_vj_cofrcc_robert" then
        self.WorldModel_CustomPositionAngle = Vector(80, -20, 10)
        self.WorldModel_CustomPositionOrigin = Vector(-3.2, 4, -1)
    elseif owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(-2, 3.2, -1)
    elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(-2, 3.5, -1)
    end
        if owner:GetClass() == "npc_vj_cofr_purnell" && owner:GetClass() != "npc_vj_cofr_purnell_fri" && owner:GetClass() != "npc_vj_cofrcc_robert" then
            self.NPC_NextPrimaryFire = 1
            self.Primary.Damage = 15
        if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
            self.NPC_ReloadSound =
                "vj_cofr/cof/doctorboss/old/p345_reload.wav"
        else
            self.NPC_ReloadSound =
                "vj_cofr/cof/doctorboss/p345_reload.wav"
        end
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
        local owner = self:GetOwner()
        if owner:GetClass() == "npc_vj_cofr_purnell" then return end
        local burst = math.random(1,3)
        local num = 0.35
        if burst == 1 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2}
            self.NPC_NextPrimaryFire = math.Rand(1.25,1.55)
        elseif burst == 2 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3}
            self.NPC_NextPrimaryFire = math.Rand(1.65,1.85)
        elseif burst == 3 then
            self.NPC_TimeUntilFireExtraTimers = {num, num * 2, num * 3, num * 4}
            self.NPC_NextPrimaryFire = math.Rand(2.05,2.25)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextChaseTime = 0
    self.BaseClass.NPC_Reload(self)
end