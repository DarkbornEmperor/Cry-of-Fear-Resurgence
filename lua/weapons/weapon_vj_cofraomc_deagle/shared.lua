SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Deagle"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
//SWEP.NPC_ReloadSound			= {""} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_CanBePickedUp			= false -- Can this weapon be picked up by NPCs? (Ex: Rebels)
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_cofr/aom/weapons/classic/w_deagle.mdl"
SWEP.HoldType 					= "revolver"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(8, 0, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1, 4.5, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 60 -- Damage
SWEP.Primary.ClipSize			= 6 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "357" -- Ammo type
SWEP.Primary.Sound				= {"vj_cofr/aom/weapons/revolver/classic/357_shot1.wav","vj_cofr/aom/weapons/revolver/classic/357_shot2.wav"}
SWEP.Primary.DistantSound		= {"vj_cofr/fx/distant/357_shot_distant_final.wav"}
SWEP.PrimaryEffects_ShellType 	= "VJ_Weapon_PistolShell1"
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"vj_cofr/aom/weapons/dryfire.wav"} -- The sound that it plays when the weapon is out of ammo
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.7)
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