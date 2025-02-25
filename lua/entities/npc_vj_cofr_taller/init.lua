AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/taller.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 55
ENT.MeleeAttackDamageDistance = 85
ENT.MeleeAttackDamageType = DMG_CRUSH
ENT.MeleeAttackPlayerSpeed = false
ENT.MeleeAttackPlayerSpeedWalk = 0.001
ENT.MeleeAttackPlayerSpeedRun = 0.001
ENT.MeleeAttackPlayerSpeedTime = 4
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.HasMeleeAttackKnockBack = false
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100

ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(10, 25, -120),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/taller/taller_step.wav"
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
function ENT:Taller_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/taller/taller_alert.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/taller/taller_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/taller/taller_die.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(30, 30, 167), Vector(-30, -30, 0))
    self:SetSurroundingBounds(Vector(-90, -90, 0), Vector(90, 90, 200))
    self:Taller_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
        util.ScreenShake(self:GetPos(),10,100,0.4,300)
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end
    if key == "attack" && self:GetSequence() == self:LookupSequence("stamp") then
        util.ScreenShake(self:GetPos(),10,100,0.4,300)
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
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
    local attack = math.random(1,2)
    if attack == 1 then
        self.AnimTbl_MeleeAttack = "vjseq_attack"
        self.MeleeAttackDamage = 60
        self.MeleeAttackPlayerSpeed = true
        self.HasMeleeAttackKnockBack = true
        self.SoundTbl_MeleeAttackMiss =
        "vj_cofr/cof/taller/taller_swing.wav"

        self.SoundTbl_MeleeAttackExtra =
        "vj_cofr/cof/taller/taller_player_punch.wav"

    elseif attack == 2 then
        self.AnimTbl_MeleeAttack = "vjseq_stamp"
        self.MeleeAttackDamage = 200
        self.MeleeAttackPlayerSpeed = false
        self.HasMeleeAttackKnockBack = false
        self.SoundTbl_MeleeAttackMiss =
        "vj_cofr/cof/taller/taller_wall_punch.wav"

        self.SoundTbl_MeleeAttackExtra =
        "vj_cofr/cof/taller/taller_stamp.wav"
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
 if self:GetSequence() == self:LookupSequence("stamp") then
    if hitEnt.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
        self.MeleeAttackDamage = hitEnt:Health() + 10
    elseif hitEnt:IsPlayer() then
        self.MeleeAttackDamage = hitEnt:Health() + hitEnt:Armor() + 10
    else
        self.MeleeAttackDamage = 200
    end
end
     if self:GetSequence() == self:LookupSequence("attack") && (hitEnt.IsVJBaseSNPC && hitEnt.MovementType == VJ_MOVETYPE_GROUND && !hitEnt.VJ_ID_Boss && !hitEnt.IsVJBaseSNPC_Tank) then
        hitEnt:StopMoving()
        hitEnt:SetState(VJ_STATE_ONLY_ANIMATION)
        timer.Simple(4,function() if IsValid(hitEnt) then
        hitEnt:SetState()
        end
    end)
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(hitEnt)
    return self:GetForward()*150 + self:GetUp()*250
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.45)
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