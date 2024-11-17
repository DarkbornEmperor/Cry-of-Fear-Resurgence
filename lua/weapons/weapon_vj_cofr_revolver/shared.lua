SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Revolver"
SWEP.Author = "Darkborn"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "This weapon is made for NPCs"
SWEP.Instructions = "Controls are like a regular weapon."
SWEP.Category = "Cry of Fear Resurgence"
-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 1.5
//SWEP.NPC_ReloadSound = ""
SWEP.NPC_CanBePickedUp = false
-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.MadeForNPCsOnly = true
SWEP.WorldModel = "models/vj_cofr/cof/weapons/w_revolver.mdl"
SWEP.HoldType = "revolver"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
-- World Model ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel_UseCustomPosition = true
SWEP.WorldModel_CustomPositionAngle = Vector(7, -1, 90)
SWEP.WorldModel_CustomPositionOrigin = Vector(-1.5, 4.2, -1)
SWEP.WorldModel_CustomPositionBone = "Bip01 R Hand"
-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.Damage = 40
SWEP.Primary.Force = 1.6
SWEP.Primary.ClipSize = 5
SWEP.Primary.Ammo = "357"
SWEP.Primary.Sound = "vj_cofr/cof/weapons/revolver/revolver_fire.wav"
SWEP.Primary.DistantSound = "vj_cofr/fx/distant/357_shot_distant_final.wav"
SWEP.PrimaryEffects_ShellType = "ShellEject"
SWEP.PrimaryEffects_SpawnShells = false
SWEP.Primary.TracerType = "VJ_COFR_Tracer"
SWEP.PrimaryEffects_MuzzleFlash = false
-- Dry Fire Variables ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.DryFireSound = "vj_cofr/cof/weapons/weapon_fire_empty.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.Primary.Sound = "vj_cofr/cof/weapons/revolver/old/revolver_fire.wav"
end
  local owner = self:GetOwner()
  if owner:GetClass() == "npc_vj_cofr_police" then
        self.WorldModel_CustomPositionOrigin = Vector(-1, 4, -0.8)
  elseif owner:GetClass() == "npc_vj_cofr_simon_beta" then
        self.WorldModel_CustomPositionOrigin = Vector(-1.5, 3.8, -0.8)
  elseif owner:GetClass() == "npc_vj_cofr_purnell" or owner:GetClass() == "npc_vj_cofr_purnell_fri" or owner:GetClass() == "npc_vj_cofrc_robert" then
        self.WorldModel_CustomPositionAngle = Vector(80, 0, 10)
        self.WorldModel_CustomPositionOrigin = Vector(-2.4, 5, -1)
  if owner:GetClass() == "npc_vj_cofr_purnell" && owner:GetClass() != "npc_vj_cofr_purnell_fri" && owner:GetClass() != "npc_vj_cofrc_robert" then
        self.NPC_NextPrimaryFire = 1
        self.Primary.Damage    = 13
        if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then self.NPC_ReloadSound = "vj_cofr/cof/doc_ai/old/revolver_reload.wav" end
        self.NPC_ReloadSound = "vj_cofr/cof/doc_ai/revolver_reload.wav"
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:PrimaryAttackEffects(owner)
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
end