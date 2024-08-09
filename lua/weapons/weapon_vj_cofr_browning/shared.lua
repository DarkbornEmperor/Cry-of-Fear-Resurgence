SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Browning"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.35
//SWEP.NPC_ReloadSound = ""
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_browning.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(7, 4, 95)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.8, 4.5, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 12
SWEP.Primary.ClipSize = 13
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary.Sound = "vj_cofr/cof/weapons/browning/browning_fire.wav"
SWEP.Primary.DistantSound = "vj_cofr/fx/distant/glock_distant2.wav"
SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.Primary.Sound = "vj_cofr/cof/weapons/browning/old/browning_fire.wav"
end
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(-1.5, 4, -1)
  elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(-1.3, 4.5, -1)
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
    local Brt = math.random(1,3)
    local Num = 0.35
    if Brt == 1 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
    self.NPC_NextPrimaryFire = math.Rand(1.25,1.55)
    elseif Brt == 2 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3}
    self.NPC_NextPrimaryFire = math.Rand(1.65,1.85)
    elseif Brt == 3 then self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4}
    self.NPC_NextPrimaryFire = math.Rand(2.05,2.25)
    end
end