SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Shovel"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_sledgeshovel.mdl"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 45
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(90, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(3, -12, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	    
	owner.MeleeAttackDamageType = DMG_CLUB
	owner.SoundTbl_MeleeAttack = {
	"vj_cofr/cof/weapons/sledgehammer/sledgehammer_hitbody.wav"
	}
	owner.SoundTbl_MeleeAttackMiss = {
	"vj_cofr/cof/weapons/sledgehammer/sledgehammer_swing.wav"
	}
end