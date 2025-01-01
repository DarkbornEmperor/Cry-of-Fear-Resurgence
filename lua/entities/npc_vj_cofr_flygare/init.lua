AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/flygare.mdl"
ENT.StartHealth = 100
ENT.HullType = HULL_MEDIUM
ENT.MovementType = VJ_MOVETYPE_AERIAL
ENT.Aerial_FlyingSpeed_Calm = 150
ENT.Aerial_FlyingSpeed_Alerted = 500
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.ConstantlyFaceEnemy = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_punch","vjseq_punchdown"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_shoot"
ENT.RangeAttackEntityToSpawn = "obj_vj_cofr_spit"
ENT.RangeDistance = 2048
ENT.RangeToMeleeDistance = 300
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 1
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_CloseDistance = "UseRangeDistance"
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "joint11",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/flygare/flygare_slice.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/flygare/flygare_slash.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Flygare_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/flygare/flygare_alert1.wav",
    "vj_cofr/cof/flygare/flygare_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/flygare/flygare_attack1.wav",
    "vj_cofr/cof/flygare/flygare_attack2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/cof/flygare/flygare_attack1.wav",
    "vj_cofr/cof/flygare/flygare_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/flygare/flygare_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/flygare/flygare_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self.Flygare_FlyAnim_Forward  = self:GetSequenceActivity(self:LookupSequence("forward"))
    self.Flygare_FlyAnim_Backward  = self:GetSequenceActivity(self:LookupSequence("backward"))
    self.Flygare_FlyAnim_Right  = self:GetSequenceActivity(self:LookupSequence("right"))
    self.Flygare_FlyAnim_Left  = self:GetSequenceActivity(self:LookupSequence("left"))
    self.Flygare_FlyAnim_Up  = self:GetSequenceActivity(self:LookupSequence("up"))
    self.Flygare_FlyAnim_Down  = self:GetSequenceActivity(self:LookupSequence("down"))

    self:SetCollisionBounds(Vector(25, 25, 100), Vector(-25, -25, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 120))
    self:Flygare_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "attack" then
        self:MeleeAttackCode()
    elseif key == "attack_range" then
        self:RangeAttackCode()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/cof/flygare/flygare_fallhit.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if act == ACT_FLY then
    if self.AA_CurrentMovePosDir then
    local moveDir = self.AA_CurrentMovePosDir:GetNormal()
    -- Up-down
    local dotUp = moveDir:Dot(self:GetUp())
    if dotUp > 0.60 then
        return self.Flygare_FlyAnim_Up
    elseif dotUp < -0.60 then
        return self.Flygare_FlyAnim_Down
end
    -- Forward-backward
    local dotForward = moveDir:Dot(self:GetForward())
    if dotForward > 0.5 then
        return self.Flygare_FlyAnim_Forward
    elseif dotForward < -0.5 then
        return self.Flygare_FlyAnim_Backward
end
    -- Right-left
    local dotRight = moveDir:Dot(self:GetRight())
    if dotRight > 0.5 then
        return self.Flygare_FlyAnim_Right
    elseif dotRight < -0.5 then
        return self.Flygare_FlyAnim_Left
    end
end
        return self.Flygare_FlyAnim_Up -- Fallback animation
end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVelocity(projectile)
    local projPos = projectile:GetPos()
    return self:CalculateProjectile("Curve", projPos, self:GetAimPosition(self:GetEnemy(), projPos, 1, 1500), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjSpawnPos(projectile)
    return self:GetAttachment(self:LookupAttachment("range")).Pos
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