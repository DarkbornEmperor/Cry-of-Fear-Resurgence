SWEP.Base 						= "weapon_vj_cofr_melee_base"
SWEP.PrintName					= "Switchblade"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_switchblade.mdl"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 6 -- Damage
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(0, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2, -3.5, 0.45)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
    self:SetModelScale(0.65)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	    
	owner.MeleeAttackDamageType = DMG_SLASH
	owner.SoundTbl_MeleeAttack = {
	"vj_cofr/cof/weapons/switchblade/switchblade_hitbody1.wav",
	"vj_cofr/cof/weapons/switchblade/switchblade_hitbody2.wav"
	}
	owner.SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/knife/knife_swing1.wav"
	}
end