SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Knife"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_knife.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 10
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(3.747, 0, 3.401),
    Ang = Angle(-80, 0, -90)
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.75)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        owner.MeleeAttackDamage = self.Primary.Damage
        owner.MeleeAttackDamageType = DMG_SLASH
        owner.SoundTbl_MeleeAttackExtra = {
            "vj_cofr/aom/weapons/knife/knife_hit1.wav",
            "vj_cofr/aom/weapons/knife/knife_hit2.wav"
        }
        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/aom/weapons/knife/knife_swing1.wav"
    end
end