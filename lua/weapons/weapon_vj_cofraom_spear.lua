SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Spear"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_spear.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 50
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-100, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(2.5, 15, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.90)
    /*local owner = self:GetOwner()
    if IsValid(owner) && owner:GetClass() == "npc_vj_cofraomda_david" then
        self.WorldModel_CustomPositionOrigin = Vector(4, 15, -1)
    end*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_SLASH
    owner.SoundTbl_MeleeAttackExtra =
        "vj_cofr/aom/weapons/spear/spear_stab.wav"

    owner.SoundTbl_MeleeAttackMiss =
        "vj_cofr/aom/weapons/spear/spear_swing.wav"
end