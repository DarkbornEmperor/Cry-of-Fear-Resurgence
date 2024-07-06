SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Stone"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_stone.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(143, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(7, -2, 0)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()
    self:SetModelScale(0.75)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/weapons/branch/branch_hit.wav"
    }
    owner.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/weapons/branch/branch_swing.wav"
    }
end