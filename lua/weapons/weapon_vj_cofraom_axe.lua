SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Axe"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/aom/weapons/w_axe.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 35
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(4.42, 2, 12.663),
    Ang = Angle(-85, 0, 90)
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.90)
    timer.Simple(0.1, function()
        if IsValid(self) && IsValid(self:GetOwner()) then
            local owner = self:GetOwner()
            if owner:GetClass() == "npc_vj_cofr_simon" then
                self.WorldModelOffsetParams.Pos = Vector(5.205, 2, 13.598)
            end
            if owner.Human_Type == 1 or owner.Human_Type == 2 then
                self.Primary.Damage = 55
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
        owner.SoundTbl_MeleeAttackExtra =
            "vj_cofr/aom/weapons/axe/Axe_hitbody.wav"

        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/aom/weapons/axe/Axe_swing.wav"
    end
end