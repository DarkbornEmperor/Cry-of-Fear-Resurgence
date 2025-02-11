AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/carcass.mdl"
ENT.StartHealth = 2000
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL
ENT.Aerial_FlyingSpeed_Calm = 120
ENT.Aerial_FlyingSpeed_Alerted = 150
ENT.Aerial_AnimTbl_Calm = "kam52"
ENT.Aerial_AnimTbl_Alerted = "kam52"
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
//ENT.TurningSpeed = 10
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_attack"
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_carcasshead"
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 25
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
    -- ====== Controller Data ====== --
ENT.ControllerVars = {
    CameraMode = 1,
    ThirdP_Offset = Vector(20, 25, -60),
    FirstP_Bone = "joint11",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/roofboss/sophie3.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Carcass_Init()
    self.SoundTbl_Breath = {
    "vj_cofr/cof/roofboss/rb_mouthidle1.wav",
    "vj_cofr/cof/roofboss/rb_mouthidle2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/cof/roofboss/rb_attack1.wav",
    "vj_cofr/cof/roofboss/rb_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/roofboss/rb_hurt1.wav",
    "vj_cofr/cof/roofboss/rb_hurt2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/roofboss/rb_death.wav"
}
    if GetConVar("VJ_COFR_JoeBiden"):GetInt() == 1 then
        self.RangeAttackEntityToSpawn = "obj_vj_cofr_biden"
        self:SetNoDraw(true)
        self:DrawShadow(false)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(15, 15, 92), Vector(-15, -15, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Carcass_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "attack_range" then
        self:RangeAttackCode()
    elseif key == "stomach_open" then
        VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_stomopen.wav", 75, 100)
    elseif key == "stomach_close" then
        VJ.EmitSound(self, "vj_cofr/cof/roofboss/rb_stomclose.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode_AfterProjectileSpawn(projectile)
    local ene = self:GetEnemy()
    if IsValid(ene) then
        projectile.Track_Enemy = ene
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjSpawnPos(projectile)
    return self:GetAttachment(self:LookupAttachment("range")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVelocity(projectile)
    local projPos = projectile:GetPos()
    return self:CalculateProjectile("Line", projPos, self:GetAimPosition(self:GetEnemy(), projPos, 1, 700), 700)
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
    if status == "Initial" then
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/