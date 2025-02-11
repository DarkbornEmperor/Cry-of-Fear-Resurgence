AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/headcrab.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_TINY
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = 16
ENT.AnimTbl_LeapAttack = {"vjseq_jump","vjseq_jump_variation1","vjseq_jump_variation2"}
ENT.LeapDistance = 256
ENT.LeapToMeleeDistance = 1
ENT.LeapAttackDamageDistance = 50
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.TimeUntilLeapAttackVelocity = 0.4
ENT.NextLeapAttackTime = 1
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1, 1.2, 1.4}
ENT.NextAnyAttackTime_Leap = 3
ENT.StopLeapAttackAfterFirstHit = true
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
    -- ====== Controller Data ====== --
ENT.ControllerVars = {
    CameraMode = 1,
    ThirdP_Offset = Vector(45, 20, -15),
    FirstP_Bone = "Bip01 Pelvis",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_LeapAttackDamage  = {
"vj_cofr/aom/handcrab/hc_headbite.wav"
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
function ENT:Handcrab_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/handcrab/hc_alert1.wav",
    "vj_cofr/aom/handcrab/hc_alert2.wav"
}
    self.SoundTbl_LeapAttackJump  = {
    "vj_cofr/aom/handcrab/hc_attack1.wav",
    "vj_cofr/aom/handcrab/hc_attack2.wav",
    "vj_cofr/aom/handcrab/hc_attack3.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/handcrab/hc_pain1.wav",
    "vj_cofr/aom/handcrab/hc_pain2.wav",
    "vj_cofr/aom/handcrab/hc_pain3.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/handcrab/hc_die1.wav",
    "vj_cofr/aom/handcrab/hc_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(10, 10, 18), Vector(-10, -10, 0))
    self:SetSurroundingBounds(Vector(-30, -30, 0), Vector(30, 30, 30))
    self:Handcrab_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetLeapAttackVelocity()
    return VJ.CalculateTrajectory(self, NULL, "Curve", self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), 1) + self:GetForward() * 80 - self:GetUp() * 30
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Initial" then
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