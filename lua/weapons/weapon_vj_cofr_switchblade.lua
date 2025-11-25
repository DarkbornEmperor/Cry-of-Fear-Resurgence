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
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(0, -180, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2, -3.5, 0.45)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.65)
    if math_random(1,2) == 1 then
        self.Primary.Damage = 9
        self.WorldModel_CustomPositionAngle = Vector(0, -180, -90)
        self.WorldModel_CustomPositionOrigin = Vector(-2, -3.2, -1.2)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnEquip(newOwner)
    local owner = self:GetOwner()
    owner.MeleeAttackDamage = self.Primary.Damage
    owner.MeleeAttackDamageType = DMG_SLASH
    owner.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/cof/weapons/switchblade/switchblade_hitbody1.wav",
        "vj_cofr/cof/weapons/switchblade/switchblade_hitbody2.wav"
    }
    owner.SoundTbl_MeleeAttackMiss =
        "vj_cofr/aom/weapons/knife/knife_swing1.wav"
end