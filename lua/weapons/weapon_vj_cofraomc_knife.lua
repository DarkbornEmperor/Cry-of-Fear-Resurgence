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
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(3.81, 1.2, 5.633),
    Ang = Angle(-84, 0, 90)
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.7)
    timer.Simple(0.1, function()
        if IsValid(self) && IsValid(self:GetOwner()) then
            local owner = self:GetOwner()
            if owner:GetClass() == "npc_vj_cofraomc_david_early" && owner:GetBodygroup(0) == 0 then
                self.WorldModelOffsetParams.Pos = Vector(3.113, 1.2, 5.706)
            end
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        owner.MeleeAttackDamage = self.Primary.Damage
        owner.MeleeAttackDamageType = DMG_SLASH
        owner.SoundTbl_MeleeAttackExtra = {
            "vj_cofr/aom/weapons/knife/classic/cbar_hitbod1.wav",
            "vj_cofr/aom/weapons/knife/classic/cbar_hitbod2.wav",
            "vj_cofr/aom/weapons/knife/classic/cbar_hitbod3.wav"
        }
        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/aom/weapons/knife/classic/cbar_miss1.wav"
    end
end