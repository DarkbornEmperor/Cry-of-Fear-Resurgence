SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Grenade"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 2.5
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_FiringDistanceScale = 0.65
SWEP.NPC_ReloadSound = "vj_cofr/fx/null.wav"
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/aom/weapons/classic/w_grenade.mdl"
SWEP.HoldType = "grenade"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(0,0,0)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2,2,-3)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 1 -- Damage
SWEP.Primary.ClipSize = 10
SWEP.Primary.Ammo = "grenade"
SWEP.Primary.Sound = "vj_cofr/fx/null.wav"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.Primary.DisableBulletCode = true
SWEP.HasDryFireSound = false
SWEP.PrimaryEffects_SpawnMuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
    self:SetModelScale(0.7)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnGetBulletPos()
    local owner = self:GetOwner()

    return owner:GetPos() + owner:GetUp() + Vector(0,0,50)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status,statusData)
    if status == "Init" then
    if CLIENT then return end
    local grenade = ents.Create("obj_vj_cofraomc_grenade")
    grenade:SetPos(self:GetBulletPos())
    grenade:SetAngles(self:GetOwner():GetAngles())
    grenade:SetOwner(self:GetOwner())
    grenade:Spawn()
    grenade:Activate()

    local phys = grenade:GetPhysicsObject()
    if IsValid(phys) then
        phys:SetVelocity(self:GetOwner():CalculateProjectile("Curve", self:GetBulletPos(), self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 1500))
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_Reload()
    local owner = self:GetOwner()
    owner.NextThrowGrenadeT = owner.NextThrowGrenadeT + 2
    owner.NextChaseTime = 0
    self:OnReload("Start")
    if self.NPC_HasReloadSound == true then VJ.EmitSound(owner, self.NPC_ReloadSound, self.NPC_ReloadSoundLevel) end
end