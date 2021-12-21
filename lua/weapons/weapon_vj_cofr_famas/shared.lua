if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base 						= "weapon_vj_base"
SWEP.PrintName					= "Famas"
SWEP.Author 					= "Darkborn"
SWEP.Contact					= "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose					= "This weapon is made for Players and NPCs"
SWEP.Instructions				= "Controls are like a regular weapon."
SWEP.Category					= "VJ Base"
	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
SWEP.NPC_TimeUntilFire = 0.08 
SWEP.NPC_ExtraShotsPerFire = 7
//SWEP.NPC_ReloadSound			= {""} -- Sounds it plays when the base detects the SNPC playing a reload animation
SWEP.NPC_CanBePickedUp			= false -- Can this weapon be picked up by NPCs? (Ex: Rebels)
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly 			= true -- Is this weapon meant to be for NPCs only?
SWEP.WorldModel					= "models/vj_cofr/cof/weapons/w_famas.mdl"
SWEP.HoldType 					= "ar2"
SWEP.Spawnable					= false
SWEP.AdminSpawnable				= false
	-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_Invisible = false -- Should the world model be invisible?
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(-30, 5, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-4.5, 2, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand" -- The bone it will use as the main point
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage				= 16 -- Damage
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.Primary.Ammo				= "SMG1" -- Ammo type
SWEP.Primary.Sound				= {"vj_cofr/cof/weapons/famas/famas_shoot.wav"}
SWEP.Primary.DistantSound		= {""}
SWEP.PrimaryEffects_ShellType 	= "VJ_Weapon_RifleShell1"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize() 
    //VJ_EmitSound(self, "vj_cofr/cof/weapons/famas/french4.wav", 75, 100)
    self:SetModelScale(0.70)
	self:GetOwner().HasWeaponReload = self.NPC_HasReload
	local Owner = self:GetOwner()
	for i=1,(self.NPC_ExtraShotsPerFire) do
		table.insert(self.NPC_TimeUntilFireExtraTimers, self.NPC_TimeUntilFire*(1+#self.NPC_TimeUntilFireExtraTimers))
	end
	if (self.Primary.Burst ==false) then
		if Owner.ExtraShotCount then
			for i=1,(Owner.ExtraShotCount) do
				table.insert(self.NPC_TimeUntilFireExtraTimers, self.NPC_TimeUntilFire*(1+#self.NPC_TimeUntilFireExtraTimers))
			end
		end
	end	
end