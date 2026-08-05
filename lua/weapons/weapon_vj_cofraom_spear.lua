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
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(5.067, 1, 14.338),
    Ang = Angle(-80, 0, 90)
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.90)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        owner.MeleeAttackDamage = self.Primary.Damage
        owner.MeleeAttackDamageType = DMG_SLASH
        owner.SoundTbl_MeleeAttackExtra =
            "vj_cofr/aom/weapons/spear/spear_stab.wav"

        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/aom/weapons/spear/spear_swing.wav"
    end
end