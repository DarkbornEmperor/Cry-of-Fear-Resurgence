SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Deagle"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
//SWEP.NPC_ReloadSoun = {""}
SWEP.NPC_CanBePickedUp = false
SWEP.MadeForNPCsOnly = true
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel	= "models/vj_cofr/aom/weapons/w_deagle.mdl"
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(-159, -185, 95)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1, 6, -0.7)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage	= 40
SWEP.Primary.Force = 1.6
SWEP.Primary.ClipSize = 7
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = {"vj_cofr/aom/weapons/deagle/deagle_fire.wav"}
SWEP.Primary.DistantSound = {"vj_cofr/fx/distant/desert_eagle_fire_distant_final.wav"}
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_PistolShell1"
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = {"vj_cofr/aom/weapons/dryfire.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
  self:SetModelScale(0.75)
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofraom_david_da" then 
        self.WorldModel_CustomPositionOrigin = Vector(-1.8, 7, -0.7)
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