AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sewmo.mdl"
ENT.StartHealth = 140
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)

ENT.HideOnUnknownDamage = false
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupPlayDefault = true
ENT.FlinchHitGroupMap = {
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
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
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
//ENT.Sewmo_Sleep = false
ENT.Sewmo_WireBroken = false
ENT.Sewmo_Skin = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sewmo_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/sewmo/sewmo_alert10.wav",
    "vj_cofr/cof/sewmo/sewmo_alert20.wav",
    "vj_cofr/cof/sewmo/sewmo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/sewmo/sewmo_attack1.wav",
    "vj_cofr/cof/sewmo/sewmo_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/sewmo/sewmo_pain1.wav",
    "vj_cofr/cof/sewmo/sewmo_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/sewmo/sewmo_pain1.wav",
    "vj_cofr/cof/sewmo/sewmo_pain2.wav"
}
    /*if self.Sewmo_Sleep then
        self.MovementType = VJ_MOVETYPE_STATIONARY
        self.CanTurnWhileStationary = false
        self.AnimTbl_IdleStand = {ACT_IDLE_RELAXED}
        self.HasMeleeAttack = false
        self.CallForHelp = false
        self:AddFlags(FL_NOTARGET)
    end*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(13, 13, 74), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Sewmo_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
    elseif key == "barbedwire_break" then
        VJ.EmitSound(self,"vj_cofr/cof/sewmo/break_free.wav", 75, 100)
        self:RemoveAllDecals()
        if self.Sewmo_Skin == 0 then self:SetBodygroup(0,1) end
        if self.Sewmo_Skin == 1 then self:SetBodygroup(0,3) end
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
/*function ENT:OnThinkActive()
    if !IsValid(self:GetEnemy()) or !self:Visible(self:GetEnemy()) or self.Dead or !self.Sewmo_Sleep then return end
    if self.Sewmo_Sleep && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 100 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
        self.Sewmo_Sleep = false
        self:PlayAnim(ACT_SIGNAL2,true,false,false)
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        self.AnimTbl_IdleStand = {ACT_IDLE}
        self.HasMeleeAttack = true
        self.CallForHelp = true
        self:RemoveFlags(FL_NOTARGET)
    end
end*/
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
    if self:GetBodygroup(0) == 0 then
        self.AnimTbl_MeleeAttack = "vjseq_attack1"
        self.MeleeAttackDistance = 50
        self.MeleeAttackDamageDistance = 75
        self.MeleeAttackDamage = 16
        self.SoundTbl_MeleeAttackMiss =
        "vj_cofr/cof/sewmo/tunga_miss.wav"

        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/cof/sewmo/tunga_strike1.wav",
        "vj_cofr/cof/sewmo/tunga_strike2.wav"
}
    elseif self:GetBodygroup(0) == 1 or self:GetBodygroup(0) == 3 then
        self.AnimTbl_MeleeAttack = "vjseq_attack2"
        self.MeleeAttackDistance = 30
        self.MeleeAttackDamageDistance = 60
        self.MeleeAttackDamage = 20
        self.SoundTbl_MeleeAttackMiss = {
        "vj_cofr/cof/sewmo/claw_miss1.wav",
        "vj_cofr/cof/sewmo/claw_miss2.wav",
        "vj_cofr/cof/sewmo/claw_miss3.wav"
}
        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/cof/sewmo/claw_strike1.wav",
        "vj_cofr/cof/sewmo/claw_strike2.wav",
        "vj_cofr/cof/sewmo/claw_strike3.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 if self.Sewmo_WireBroken or self.Dead then return end
   if status == "PreDamage" && self:Health() > 0 && (self:GetBodygroup(0) == 0 or self:GetBodygroup(0) == 2) then
     if !self.Sewmo_WireBroken && self:Health() <= (self:GetMaxHealth() / 2) && math.random(1,5) == 1 then
            self.Sewmo_WireBroken = true
            self:PlayAnim(ACT_SIGNAL1,true,false,false)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
 local curAct = self:GetSequenceActivity(self:GetIdealSequence())
 if status == "PriorExecution" then
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
end
        -- Make sure the barbed wire breaking animation doesn't get interrupted from flinching
        return curAct == ACT_SIGNAL1
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "DeathAnim" then
    if hitgroup == HITGROUP_HEAD then
        self.AnimTbl_Death = ACT_DIE_HEADSHOT
    else
        self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
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
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/