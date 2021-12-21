if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Shotgun"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1.6 -- Next time it can use primary fire
SWEP.NPC_CustomSpread	 		= 2.5 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
//SWEP.NPC_ReloadSound			= {""} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_ExtraFireSound			= {"vj_cofr/aom/weapons/shotgun/shotgun_pump.wav"} -- Plays an extra sound after it fires (Example: Bolt action sound)
SWEP.NPC_ExtraFireSoundTime		= 0.5 -- How much time until it plays the sound (After Firing)?
SWEP.NPC_FiringDistanceScale = 0.5 -- Changes how far the NPC can fire | 1 = No change, x < 1 = closer, x > 1 = farther
SWEP.NPC_CanBePickedUp			= false -- Can this weapon be picked up by NPCs? (Ex: Rebels)
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_cofr/aom/weapons/w_shotgun.mdl"
SWEP.HoldType 					= "shotgun"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(55, 181, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-8, -8, -0.8)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 10 -- Damage
SWEP.Primary.NumberOfShots		= 12 -- How many shots per attack?
SWEP.Primary.ClipSize			= 5 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"vj_cofr/aom/weapons/shotgun/shotgun_fire.wav"}
SWEP.Primary.DistantSound		= {""}
SWEP.PrimaryEffects_ShellType 	= "VJ_Weapon_ShotgunShell1"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.90)
end