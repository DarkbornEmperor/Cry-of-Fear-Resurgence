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
function SWEP:OnPrimaryAttack(status,statusData)
   if status == "Initial" then
   local owner = self:GetOwner()
   if !owner.IsCoFRHuman then return end
     if CurTime() > owner.CoFR_NextMeleeSoundT then
        owner:PlaySoundSystem("BeforeMeleeAttack",owner.SoundTbl_BeforeMeleeAttack)
        owner.CoFR_NextMeleeSoundT = CurTime() + VJ.AnimDuration(owner,owner.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK1])
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttack(UseAlt)    -- Heavily modified PrimaryAttack function to have melee weapons work better and more fluid
 self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
 local owner = self:GetOwner()
 local isNPC = owner:IsNPC()

 if isNPC && !owner.VJ_IsBeingControlled && !IsValid(owner:GetEnemy()) then return end -- If the NPC owner isn't being controlled and doesn't have an enemy, then return end
 if (!self:CanPrimaryAttack()) then return end
 if self:OnPrimaryAttack("Initial") == true then return end

 -- Melee Gesture
 if owner.IsVJBaseSNPC_Human && !owner.DisableWeaponFiringGesture && CurTime() > self.NextMeleeAnimT then
    owner:PlayAnim(owner:TranslateActivity(VJ.PICK(owner.AnimTbl_WeaponAttackFiringGesture)), false, false, false, 0, {AlwaysUseGesture=true})
    self.NextMeleeAnimT = CurTime() + VJ.AnimDuration(owner,owner.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK1])
end
    self:OnPrimaryAttack("PostFire")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnGetBulletPos()
    local owner = self:GetOwner()
    return owner:EyePos()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:OnReload("Start")
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end