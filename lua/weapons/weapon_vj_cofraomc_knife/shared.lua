SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Knife"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/classic/w_knife.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(264, 180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(3.2, 6, -1.2)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  self:SetModelScale(0.7)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofraomc_david_old" && owner:GetBodygroup(0) == 0 then 
        self.WorldModel_CustomPositionOrigin = Vector(2.5, 6, -1.2)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
	owner.MeleeAttackDamage = self.Primary.Damage	    
	owner.MeleeAttackDamageType = DMG_SLASH
	owner.SoundTbl_MeleeAttackExtra = {
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod1.wav",
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod2.wav",
	"vj_cofr/aom/weapons/knife/classic/cbar_hitbod3.wav",
	}
	owner.SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/knife/classic/cbar_miss1.wav"
	}
end