SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Revolver"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
//SWEP.NPC_ReloadSound = {""}
SWEP.NPC_CanBePickedUp = false
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel	= "models/vj_cofr/aom/weapons/w_revolver.mdl"
SWEP.HoldType = "revolver"
SWEP.Spawnable= false
SWEP.AdminSpawnable	= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-192, -185, -85)
SWEP.WorldModel_CustomPositionOrigin = Vector(-3, 4.5, -0.8)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage	= 60
SWEP.Primary.Force = 1.6
SWEP.Primary.ClipSize = 6
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = {"vj_cofr/aom/weapons/revolver/revolver_fire.wav"}
SWEP.Primary.DistantSound = {"vj_cofr/fx/distant/357_shot_distant_final.wav"}
SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"vj_cofr/aom/weapons/dryfire.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  self:SetModelScale(0.90)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(-3, 5.5, -0.8)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttackEffects(owner)
	self.PrimaryEffects_MuzzleFlash = false
	muz = ents.Create("env_sprite")
	muz:SetKeyValue("model","vj_cofr/sprites/muzzleflash.vmt")
	muz:SetKeyValue("scale",""..math.Rand(0.3,0.5))
	muz:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	muz:SetKeyValue("HDRColorScale","1.0")
	muz:SetKeyValue("renderfx","14")
	muz:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	muz:SetKeyValue("renderamt","255") -- Transparency
	muz:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	muz:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	muz:SetKeyValue("spawnflags","0")
	muz:SetParent(self)
	muz:Fire("SetParentAttachment",self.PrimaryEffects_MuzzleAttachment)
	muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)
	return true
end