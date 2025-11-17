SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Nigntstick"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_nightstick.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 11
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-350, -180, -90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.5, 0, -1.8)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.90)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_CLUB
    owner.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/cof/weapons/nightstick/nightstick_hitbody1.wav",
        "vj_cofr/cof/weapons/nightstick/nightstick_hitbody2.wav"
    }
    owner.SoundTbl_MeleeAttackMiss =
        "vj_cofr/cof/weapons/nightstick/nightstick_swing.wav"
end