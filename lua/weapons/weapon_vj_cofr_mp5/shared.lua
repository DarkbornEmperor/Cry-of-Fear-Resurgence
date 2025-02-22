SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "MP5"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.08
//SWEP.NPC_ReloadSound = ""
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_mp5.mdl"
SWEP.HoldType = "smg"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-90, 5, -95)
SWEP.WorldModel_CustomPositionOrigin = Vector(7, -3, -0.5)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 8
SWEP.Primary.ClipSize = 30
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Sound = "vj_cofr/cof/weapons/mp5/mp5_shoot_end.wav"
SWEP.Primary.DistantSound = "vj_cofr/fx/distant/hks_distant_new.wav"
SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.Primary.Sound = "vj_cofr/cof/weapons/mp5/old/mp5_shoot_end.wav"
end
  self:SetModelScale(0.70)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(6, -2.4, -0.5)
  elseif owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(7, -2.1, -0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:DoImpactEffect(tr,damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Init" then
    local Brt = math.random(1,8)
    local Num = 0.08
    if Brt == 1 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
        self.NPC_NextPrimaryFire = math.Rand(0.6,0.7)
    elseif Brt == 2 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3}
        self.NPC_NextPrimaryFire = math.Rand(0.7,0.8)
    elseif Brt == 3 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4}
        self.NPC_NextPrimaryFire = math.Rand(0.8,0.9)
    elseif Brt == 4 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5}
        self.NPC_NextPrimaryFire = math.Rand(0.9,1.25)
    elseif Brt == 5 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6}
        self.NPC_NextPrimaryFire = math.Rand(1.25,1.35)
    elseif Brt == 6 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7}
        self.NPC_NextPrimaryFire = math.Rand(1.35,1.45)
    elseif Brt == 7 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7,Num*8}
        self.NPC_NextPrimaryFire = math.Rand(1.45,1.55)
    elseif Brt == 8 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2,Num*3,Num*4,Num*5,Num*6,Num*7,Num*8,Num*9}
        self.NPC_NextPrimaryFire = math.Rand(1.55,1.85)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:OnReload("Start")
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end