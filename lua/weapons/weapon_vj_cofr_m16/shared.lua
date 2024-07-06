SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "M16"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.05
//SWEP.NPC_ReloadSound = {""}
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_m16.mdl"
SWEP.HoldType = "ar2"
SWEP.CoFR_HoldType = "m16"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-92, 15, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(9, -2.5, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 16
SWEP.Primary.ClipSize = 20
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = {"vj_cofr/cof/weapons/m16/m16_fire.wav"}
SWEP.Primary.DistantSound = {"vj_cofr/fx/distant/hks_distant_new.wav"}
SWEP.PrimaryEffects_ShellType = "RifleShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"vj_cofr/cof/weapons/weapon_fire_empty.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.Primary.Sound = {"vj_cofr/cof/weapons/m16/old/m16_fire.wav"}
end
  self:SetModelScale(0.85)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(8, -2.5, -0.3)
  elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(9, -2, -0.3)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttackEffects(owner)
    self.PrimaryEffects_MuzzleFlash = false
    muz = ents.Create("env_sprite")
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
    muz:Fire("SetParentAttachment",self.PrimaryEffects_MuzzleAttachment)
    muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill","",0.08)
    return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
    local Brt = math.random(1,2)
    local Num = 0.05
    if Brt == 1 then self.NPC_TimeUntilFireExtraTimers = {}
    self.NPC_NextPrimaryFire = math.Rand(0.7,0.9)
    elseif Brt == 2 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
    self.NPC_NextPrimaryFire = math.Rand(1,1.2)
    end
end