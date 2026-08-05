SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Shovel"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cofcc/weapons/w_sledgehammer_shovel_hc.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 45
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(3, 0, 12),
    Ang = Angle(90, 90, 0)
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        owner.MeleeAttackDamage = self.Primary.Damage
        owner.MeleeAttackDamageType = DMG_CLUB
        owner.SoundTbl_MeleeAttackExtra =
            "vj_cofr/cof/weapons/sledgehammer/sledgehammer_hitbody.wav"

        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/cof/weapons/sledgehammer/sledgehammer_swing.wav"
    end
end