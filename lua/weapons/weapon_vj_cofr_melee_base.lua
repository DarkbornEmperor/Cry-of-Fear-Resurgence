SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Melee Base"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for Players and NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1
SWEP.NPC_TimeUntilFire = 0
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.HoldType = "melee"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.MadeForNPCsOnly = true
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.IsMeleeWeapon = true
SWEP.MeleeWeaponDistance = 70
SWEP.MeleeWeaponSound_Hit = false
SWEP.MeleeWeaponSound_Miss = false
SWEP.NextMeleeAnimT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttack() -- Heavily modified PrimaryAttack function to have melee weapons work better and more fluid
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    local owner = self:GetOwner()
    local isNPC = owner:IsNPC()

    if isNPC && !owner.VJ_IsBeingControlled && !IsValid(owner:GetEnemy()) then return end -- If the NPC owner isn't being controlled and doesn't have an enemy, then return end
    if (!self:CanPrimaryAttack()) then return end
    if self:OnPrimaryAttack("Init") == true then return end

    self:OnPrimaryAttack("PostFire")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnGetBulletPos()
    local owner = self:GetOwner()
    return owner:EyePos()
end