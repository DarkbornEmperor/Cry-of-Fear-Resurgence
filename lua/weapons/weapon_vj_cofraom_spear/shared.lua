if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Spear"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.25
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_spear.mdl"
SWEP.HoldType = "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 30 -- Damage
SWEP.IsMeleeWeapon = true -- Should this weapon be a melee weapon?
SWEP.MeleeWeaponSound_Hit = {"vj_cofr/aom/weapons/spear/spear_stab.wav"} -- Sound it plays when it hits something
SWEP.MeleeWeaponSound_Miss = {"vj_cofr/aom/weapons/spear/spear_swing.wav"}
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-100, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(3.5, 15, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    //self:SetModelScale(0.95)
end