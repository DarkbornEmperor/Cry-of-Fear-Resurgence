SWEP.Base 						= "weapon_vj_cofr_melee_base"
SWEP.PrintName					= "Axe"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_axe.mdl"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 55 -- Damage
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-95, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(3.3, 13, -2)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  self:SetModelScale(0.90)
  if self:GetOwner():GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(4.5, 14, -1)
  elseif self:GetOwner():GetClass() == "npc_vj_cofr_simon" then 
        self.WorldModel_CustomPositionOrigin = Vector(4, 14, -2)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnThink()
	self:GetOwner().MeleeAttackDamage = self.Primary.Damage	    
	self:GetOwner().MeleeAttackDamageType = DMG_SLASH
	self:GetOwner().SoundTbl_MeleeAttack = {
	"vj_cofr/aom/weapons/axe/Axe_hitbody.wav"
	}
	self:GetOwner().SoundTbl_MeleeAttackMiss = {
	"vj_cofr/aom/weapons/axe/Axe_swing.wav"
	}
end