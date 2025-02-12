AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/ghost.mdl"
ENT.StartHealth = 300
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDamageType = DMG_NERVEGAS
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 1
ENT.MeleeAttackBleedEnemyDamage = 5
ENT.MeleeAttackBleedEnemyTime = 2
ENT.MeleeAttackBleedEnemyReps = 5
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}},
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}},
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParameters = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/twitcher/claw_strike1.wav",
"vj_cofr/aom/twitcher/claw_strike2.wav",
"vj_cofr/aom/twitcher/claw_strike3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/twitcher/claw_miss1.wav",
"vj_cofr/aom/twitcher/claw_miss2.wav"
}
ENT.SoundTbl_Tinnitus = {
"vj_cofr/aom/ghost/ear_ringing.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Ghost_Tinnitus = false
ENT.Ghost_NextTinnitusSoundT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Ghost_SlowSound"):GetInt() == 0 then
        self.SlowPlayerOnMeleeAttack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Ghost_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/ghost/slv_alert2.wav",
    "vj_cofr/aom/ghost/slv_alert4.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/ghost/slv_die1.wav",
    "vj_cofr/aom/ghost/slv_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 65), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-80, -80, 0), Vector(80, 80, 100))
    self:Ghost_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
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
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
 if hitEnt:IsPlayer() && !self.Ghost_Tinnitus && CurTime() > self.Ghost_NextTinnitusSoundT then
    self.Ghost_Tinnitus = true
 if self.HasSounds then
    self.Ghost_TinnitusSound = CreateSound(hitEnt,self.SoundTbl_Tinnitus)
    self.Ghost_TinnitusSound:Play()
    self.Ghost_TinnitusSound:SetSoundLevel(100)
    hook.Add("Think","VJ_COFR_GhostTinnitus",function()
    if !hitEnt:Alive() && self.Ghost_TinnitusSound then self.Ghost_TinnitusSound:FadeOut(1) hook.Remove("Think","VJ_COFR_GhostTinnitus") end
    end)
end
    net.Start("VJ_COFR_Ghost_ScreenEffect")
        net.WriteEntity(hitEnt)
    net.Send(hitEnt)
    self.Ghost_Tinnitus = false
    self.Ghost_NextTinnitusSoundT = CurTime() + SoundDuration("vj_cofr/aom/ghost/ear_ringing.wav")
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = ACT_DIE_HEADSHOT
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE}
    end
end
    if status == "Initial" then
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
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/