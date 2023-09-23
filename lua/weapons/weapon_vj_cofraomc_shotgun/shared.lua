SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Shotgun"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.6
SWEP.NPC_CustomSpread = 2.5
//SWEP.NPC_ReloadSound = {""}
SWEP.NPC_ExtraFireSoundTime = 0.5
SWEP.NPC_FiringDistanceScale = 0.5
SWEP.NPC_CanBePickedUp = false
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel	= "models/vj_cofr/aom/weapons/classic/w_shotgun.mdl"
SWEP.HoldType = "shotgun"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(0, 180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.4, -10, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage	= 10
SWEP.Primary.NumberOfShots = 5
SWEP.Primary.ClipSize = 8
SWEP.Primary.Ammo = "Buckshot"
SWEP.Primary.Sound = {"vj_cofr/aom/weapons/shotgun/classic/sbarrel1.wav"}
SWEP.Primary.DistantSound = {"vj_cofr/fx/distant/sbarrel1_distant2.wav"}
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_ShotgunShell1"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"vj_cofr/aom/weapons/dryfire.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.85)
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