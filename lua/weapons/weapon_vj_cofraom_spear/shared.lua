SWEP.Base 						= "weapon_vj_cofr_melee_base"
SWEP.PrintName					= "Spear"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_spear.mdl"
SWEP.HoldType = "melee"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 50 -- Damage
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-100, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(2.5, 15, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  if self:GetOwner():GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(4, 15, -1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
	self:GetOwner().MeleeAttackDamage = self.Primary.Damage	    
	self:GetOwner().MeleeAttackDamageType = DMG_SHOCK
	self:GetOwner().SoundTbl_MeleeAttack = {
	"vj_cofr/aom/weapons/spear/spear_stab.wav"
	}
	self:GetOwner().SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/spear/spear_swing.wav"
	}
end