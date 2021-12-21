if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Deagle"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire 		= 1.5 -- Next time it can use primary fire
//SWEP.NPC_ReloadSound			= {""} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_CanBePickedUp			= false -- Can this weapon be picked up by NPCs? (Ex: Rebels)
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_cofr/aom/weapons/w_deagle.mdl"
SWEP.HoldType 					= "pistol"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-160, -185, 95)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1, 6, -0.7)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 60 -- Damage
SWEP.Primary.ClipSize			= 7 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"vj_cofr/aom/weapons/deagle/deagle_fire.wav"}
SWEP.Primary.DistantSound		= {""}
SWEP.PrimaryEffects_ShellType 	= "VJ_Weapon_PistolShell1"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.85)
end