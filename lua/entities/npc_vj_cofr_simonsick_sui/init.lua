AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sicksimon_sui.mdl"
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackMaxDistance = 2600
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = 600
ENT.LimitChaseDistance_Min = 1
ENT.CanTurnWhileMoving = false
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasSoundTrack = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.RangeAttackSoundLevel = 90
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/sicksimon/wheelchair_move1.wav",
"vj_cofr/cof/sicksimon/wheelchair_move2.wav",
"vj_cofr/cof/sicksimon/wheelchair_move3.wav"
}
ENT.SoundTbl_Browning =
"vj_cofr/cof/weapons/browning/browning_fire.wav"

ENT.SoundTbl_SoundTrack =
"vj_cofr/cof/booksimon/ending5.mp3"

ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SickSimon_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
 if GetConVar("VJ_COFR_OldWepSounds"):GetInt() == 1 then
    self.SoundTbl_Browning =
    "vj_cofr/cof/weapons/browning/old/browning_fire.wav"

end
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:SickSimon_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "suicide" then
        VJ.EmitSound(self, self.SoundTbl_Browning, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
        VJ.EmitSound(self, "vj_cofr/fx/distant/glock_distant2.wav", 140, self:GetSoundPitch(100, 110))
        VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        self:FireFX()
        self:SetBodygroup(0,1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireFX()
    local muz = ents.Create("env_sprite")
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
    muz:Fire("SetParentAttachment","pistol_muzzle")
    muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
    muz:Spawn()
    muz:Activate()
    muz:Fire("Kill","",0.08)

    local Light = ents.Create("light_dynamic")
    Light:SetKeyValue("brightness", "4")
    Light:SetKeyValue("distance", "120")
    Light:SetPos(self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos)
    Light:SetLocalAngles(self:GetAngles())
    Light:Fire("Color", "255 150 60")
    //Light:SetParent(self)
    Light:Spawn()
    Light:Activate()
    Light:Fire("TurnOn","",0)
    Light:Fire("Kill","",0.07)
    //self:DeleteOnRemove(Light)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoImpactEffect(tr,damageType)
    return VJ.COFR_Effect_Impact(tr)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status,enemy)
    if status == "Init" then
        self.NextRangeAttackTime = (math.random(2) == 1 and 0 or 0.6)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status,enemy,projectile)
  if status == "Init" then
  local ene = self:GetEnemy()
  if IsValid(self) && IsValid(self:GetEnemy()) then
  VJ.EmitSound(self, self.SoundTbl_Browning, self.RangeAttackSoundLevel, self:GetSoundPitch(self.RangeAttackPitch), 1, CHAN_WEAPON)
  VJ.EmitSound(self, "vj_cofr/fx/distant/glock_distant2.wav", 140, self:GetSoundPitch(100, 110))
    self:FireBullets({
    Attacker = self,
    Num = 1,
    Src = self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos,
    Dir = (self:GetAimPosition(ene, self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos, 0) - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
    Spread = Vector(0.1,0.1,0),
    TracerName = "VJ_COFR_Tracer",
    Tracer = 1,
    Damage = self:ScaleByDifficulty(12),
    Force = 5,
    AmmoType = "Pistol",
    Distance = 2048,
    HullSize = 1
 })
end
        self:FireFX()
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:OnDamaged(dmginfo,hitgroup,status)
    -- Make a metal ricochet effect
    if status == "PreDamage" && hitgroup == 8 then
    if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end
    dmginfo:SetDamage(0)
    if dmginfo:GetDamagePosition() != vec then
        local rico = EffectData()
        rico:SetOrigin(dmginfo:GetDamagePosition())
        rico:SetScale(4) -- Size
        rico:SetMagnitude(2) -- Effect type | 1 = Animated | 2 = Basic
        util.Effect("VJ_COFR_Rico", rico)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/