SWEP.Base 						= "weapon_vj_cofr_melee_base"
SWEP.PrintName					= "Knife"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/classic/w_crowbar.mdl"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10 -- Damage
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(264, 180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(3.2, 4.5, -1.2)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.5)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
	self:GetOwner().MeleeAttackDamage = self.Primary.Damage	    
	self:GetOwner().MeleeAttackDamageType = DMG_SLASH
	self:GetOwner().SoundTbl_MeleeAttack = {
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod1.wav",
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod2.wav",
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod3.wav",
	}
	self:GetOwner().SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/knife/classic/cbar_miss1.wav"
	}
end