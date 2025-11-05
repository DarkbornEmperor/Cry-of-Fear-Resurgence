AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/spitter.mdl"
ENT.StartHealth = 250
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_bite"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 60
ENT.HasMeleeAttackKnockBack = true
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = "vjseq_range"
ENT.RangeAttackProjectiles = "obj_vj_cofraom_spit"
ENT.RangeAttackMaxDistance = 784
ENT.RangeAttackMinDistance = 300
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 1
ENT.LimitChaseDistance = "OnlyRange"
ENT.LimitChaseDistance_Max = "UseRangeDistance"
ENT.LimitChaseDistance_Min = "UseRangeDistance"
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEFORWARD}
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -30),
    FirstP_Bone = "Bip01 Spine1",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
"vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/spitter/bc_bite1.wav",
"vj_cofr/aom/spitter/bc_bite2.wav",
"vj_cofr/aom/spitter/bc_bite3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/twitcher/claw_miss1.wav",
"vj_cofr/aom/twitcher/claw_miss2.wav"
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
function ENT:PreInit()
    if GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Spitter_Init()
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/spitter/bc_attackgrowl.wav",
    "vj_cofr/aom/spitter/bc_attackgrowl2.wav",
    "vj_cofr/aom/spitter/bc_attackgrowl3.wav"
}
    self.SoundTbl_RangeAttack = {
    "vj_cofr/aom/spitter/bc_attack1.wav",
    "vj_cofr/aom/spitter/bc_attack2.wav",
    "vj_cofr/aom/spitter/bc_attack3.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/spitter/bc_pain1.wav",
    "vj_cofr/aom/spitter/bc_pain2.wav",
    "vj_cofr/aom/spitter/bc_pain3.wav",
    "vj_cofr/aom/spitter/bc_pain4.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/spitter/bc_die1.wav",
    "vj_cofr/aom/spitter/bc_die2.wav",
    "vj_cofr/aom/spitter/bc_die3.wav"
}
    if self:GetModel() == "models/vj_cofr/aom/bullsquidhd.mdl" then
        self.AnimTbl_MeleeAttack = {"vjseq_bite","vjseq_whip"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 44), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Spitter_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "range" then
        self:ExecuteRangeAttack()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
        /*local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        effectdata:SetScale(10)
        util.Effect("watersplash",effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
    return self:GetForward()*55 + self:GetUp()*255
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
    local projPos = projectile:GetPos()
    return VJ.CalculateTrajectory(self, self:GetEnemy(), "CurveOld", projPos, 1, 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
    if status == "Init" then
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
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