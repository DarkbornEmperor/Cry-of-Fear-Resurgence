SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Knife"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_kitchenknife.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-100, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-3.1, 4, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  self:SetModelScale(0.75)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(-4, 2.5, 0)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	    
	owner.MeleeAttackDamageType = DMG_SLASH
	owner.SoundTbl_MeleeAttack = {
	"vj_cofr/aom/weapons/knife/knife_hit1.wav",
	"vj_cofr/aom/weapons/knife/knife_hit2.wav"
	}
	owner.SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/knife/knife_swing1.wav"
	}
end