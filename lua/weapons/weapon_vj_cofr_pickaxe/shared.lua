SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Pickaxe"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_e3cc3_pickaxe.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 45
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(160, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(4, -1, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.80)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/weapons/sledgehammer/sledgehammer_hitbody.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/weapons/sledgehammer/sledgehammer_swing.wav"
    }
end