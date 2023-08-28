SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Grenade"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 2.5
SWEP.NPC_TimeUntilFire = 0.8
SWEP.NPC_FiringDistanceScale = 0.65
//SWEP.NPC_ReloadSound			= {""} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_CanBePickedUp			= false -- Can this weapon be picked up by NPCs? (Ex: Rebels)
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_cofr/aom/weapons/classic/w_grenade.mdl"
SWEP.HoldType 					= "grenade"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(0,0,0)
SWEP.WorldModel_CustomPositionOrigin = Vector(-2,2,-3)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 1 -- Damage
SWEP.Primary.ClipSize			= 10 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "grenade" -- Ammo type
SWEP.Primary.Sound				= {"vj_cofr/fx/null.wav"}
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.Primary.DisableBulletCode = true
SWEP.HasDryFireSound = false
SWEP.PrimaryEffects_SpawnMuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    self:SetModelScale(0.5)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomBulletSpawnPosition()
	local owner = self:GetOwner()

	return owner:GetPos() + owner:GetUp() + Vector(0,0,50)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttackEffects()
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
	if CLIENT then return end
	local plasma = ents.Create("obj_vj_cofraomc_grenade")
	plasma:SetPos(self:GetNW2Vector("VJ_CurBulletPos"))
	plasma:SetAngles(self:GetOwner():GetAngles())
	plasma:SetOwner(self:GetOwner())
	plasma:Spawn()
	plasma:Activate()
	
	local phys = plasma:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetVelocity(self:GetOwner():CalculateProjectile("Curve", self:GetNW2Vector("VJ_CurBulletPos"), self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 1500))
	end
end