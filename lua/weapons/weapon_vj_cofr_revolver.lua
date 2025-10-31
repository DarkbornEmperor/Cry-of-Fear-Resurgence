SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Revolver"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_revolver.mdl"
SWEP.HoldType = "revolver"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(7, -1, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.5, 4.2, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 40
SWEP.Primary.Force = 1.6
SWEP.Primary.ClipSize = 5
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "vj_cofr/cof/weapons/revolver/revolver_fire.wav"
SWEP.Primary.DistantSound = "vj_cofr/fx/distant/357_shot_distant_final.wav"
SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.Primary.Sound = "vj_cofr/cof/weapons/revolver/old/revolver_fire.wav"
end
 local owner = self:GetOwner()
 if owner:GetClass() == "npc_vj_cofr_police" then
    self.WorldModel_CustomPositionOrigin = Vector(-1, 4, -0.8)
 elseif owner:GetClass() == "npc_vj_cofr_simon_beta" then
    self.WorldModel_CustomPositionOrigin = Vector(-1.5, 3.8, -0.8)
 elseif owner:GetClass() == "npc_vj_cofr_purnell" or owner:GetClass() == "npc_vj_cofr_purnell_fri" or owner:GetClass() == "npc_vj_cofrcc_robert" then
    self.WorldModel_CustomPositionAngle = Vector(80, 0, 10)
    self.WorldModel_CustomPositionOrigin = Vector(-2.4, 5, -1)
end
 if owner:GetClass() == "npc_vj_cofr_purnell" && owner:GetClass() != "npc_vj_cofr_purnell_fri" && owner:GetClass() != "npc_vj_cofrcc_robert" then
    self.Primary.Damage = 13
end
    if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
        self.NPC_ReloadSound = "vj_cofr/cof/doctorboss/old/revolver_reload.wav"
    else
        self.NPC_ReloadSound = "vj_cofr/cof/doctorboss/revolver_reload.wav"
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoImpactEffect(tr,damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
    local muz = ents.Create("env_sprite")
    muz:SetKeyValue("model", "vj_cofr/sprites/muzzleflash.vmt")
    muz:SetKeyValue("scale", "" .. math.Rand(0.3, 0.5))
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
    muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill", "", 0.08)
    self.BaseClass.PrimaryAttackEffects(self, owner)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
      local owner = self:GetOwner()
      owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
      owner.NextChaseTime = 0
      self:OnReload("Start")
      if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
  end