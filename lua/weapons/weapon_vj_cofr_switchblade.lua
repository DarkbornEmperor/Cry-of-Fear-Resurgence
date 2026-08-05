SWEP.Base = "weapon_vj_cofr_melee_base"
SWEP.PrintName = "Switchblade"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_switchblade.mdl"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 6
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModelOffsetParams = {
    Enabled = true,
    Bone = "Bip01 R Hand",
    Pos = Vector(3.5, 0.45, 2),
    Ang = Angle(0, -180, 90)
}
local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.65)
    if math_random(1,2) == 1 then
        self.Primary.Damage = 9
        timer.Simple(0.1, function()
            if IsValid(self) then
                self.WorldModelOffsetParams.Ang = Angle(0, -180, -90)
                self.WorldModelOffsetParams.Pos = Vector(3.2, 1.2, -2)
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnDeploy()
    local owner = self:GetOwner()
    if IsValid(owner) then
        owner.MeleeAttackDamage = self.Primary.Damage
        owner.MeleeAttackDamageType = DMG_SLASH
        owner.SoundTbl_MeleeAttackExtra = {
            "vj_cofr/cof/weapons/switchblade/switchblade_hitbody1.wav",
            "vj_cofr/cof/weapons/switchblade/switchblade_hitbody2.wav"
        }
        owner.SoundTbl_MeleeAttackMiss =
            "vj_cofr/aom/weapons/knife/knife_swing1.wav"
    end
end