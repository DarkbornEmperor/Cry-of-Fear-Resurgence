AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/icky.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_LARGE
ENT.TurningUseAllAxis = true
ENT.MovementType = VJ_MOVETYPE_AQUATIC
ENT.Aquatic_SwimmingSpeed_Calm = 80
ENT.Aquatic_SwimmingSpeed_Alerted = 500
ENT.Aquatic_AnimTbl_Calm = ACT_WALK
ENT.Aquatic_AnimTbl_Alerted = ACT_RUN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_bite_l","vjseq_bite_r"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 35
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 120
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_HOVER,ACT_DIEVIOLENT,ACT_DIESIMPLE}
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(12, 0, 5),
}
    -- ====== Sound File Paths ====== --
    -- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/lurker/ichy_bite1.wav",
"vj_cofr/aom/lurker/ichy_bite2.wav"
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
ENT.Icky_BlinkingT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Lurker_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/lurker/ichy_alert1.wav",
    "vj_cofr/aom/lurker/ichy_alert3.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/lurker/ichy_attack1.wav",
    "vj_cofr/aom/lurker/ichy_attack2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/lurker/ichy_die1.wav",
    "vj_cofr/aom/lurker/ichy_die2.wav",
    "vj_cofr/aom/lurker/ichy_die3.wav",
    "vj_cofr/aom/lurker/ichy_die4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(40, 40, 60), Vector(-40, -40, 0))
    self:SetSurroundingBounds(Vector(-200, -200, 0), Vector(200, 200, 90))
    self:Lurker_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
    if key == "attack" then
        self:MeleeAttackCode()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    -- Blinking system
    if !self.Dead && CurTime() > self.Icky_BlinkingT then
        self:SetSkin(4)
        timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(3) end end)
        timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(2) end end)
        timer.Simple(0.4, function() if IsValid(self) then self:SetSkin(3) end end)
        timer.Simple(0.5, function()
            if IsValid(self) then
                if IsValid(self:GetEnemy()) then
                    self:SetSkin(0)
                else
                    self:SetSkin(1)
                end
            end
        end)
        self.Icky_BlinkingT = CurTime() + math.Rand(2, 3.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt)
    -- Increase its health when it deals damage (Up to 2x its max health)
        -- If the enemy is less health than its melee attack, then use the enemy's health as the addition
    self:SetHealth(math.Clamp(self:Health() + ((self.MeleeAttackDamage > hitEnt:Health() and hitEnt:Health()) or self.MeleeAttackDamage), self:Health(), self:GetMaxHealth()*2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetSkin(2)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/