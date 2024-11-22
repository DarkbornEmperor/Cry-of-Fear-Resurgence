SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "AK-47"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_TimeUntilFire = 0.05
//SWEP.NPC_ReloadSound = ""
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_ooi_ak47.mdl"
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
SWEP.Primary.Sound = "vj_cofr/cof/weapons/ak47/shoot.wav"
SWEP.Primary.DistantSound = "vj_cofr/fx/distant/hks_distant_new.wav"
SWEP.PrimaryEffects_ShellType = "RifleShellEject"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "vj_cofr/cof/weapons/weapon_fire_empty.wav"
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
    if status == "Initial" then
    local Brt = math.random(1,2)
    local Num = 0.05
    if Brt == 1 then
        self.NPC_TimeUntilFireExtraTimers = {}
        self.NPC_NextPrimaryFire = math.Rand(0.7,0.9)
    elseif Brt == 2 then
        self.NPC_TimeUntilFireExtraTimers = {Num,Num*2}
        self.NPC_NextPrimaryFire = math.Rand(1,1.2)
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