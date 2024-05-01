SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Spear"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_spear.mdl"
SWEP.HoldType = "melee"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 50
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-100, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(2.5, 15, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(4, 15, -1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	    
	owner.MeleeAttackDamageType = DMG_SLASH
	owner.SoundTbl_MeleeAttackExtra = {
	"vj_cofr/aom/weapons/spear/spear_stab.wav"
	}
	owner.SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/spear/spear_swing.wav"
	}
end