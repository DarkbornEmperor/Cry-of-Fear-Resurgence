AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/wheelchair_monster.mdl"
ENT.StartHealth = 160
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack2"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1
ENT.MeleeAttackDamage = 30
ENT.MeleeAttackDistance = 25
ENT.MeleeAttackDamageDistance = 50
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)

ENT.HideOnUnknownDamage = false
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_DIESIMPLE,ACT_DIEFORWARD}
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"vj_cofr/aom/wheelchair/wheel01.wav",
"vj_cofr/aom/wheelchair/wheel02.wav",
"vj_cofr/aom/wheelchair/wheel03.wav",
"vj_cofr/aom/wheelchair/wheel04.wav"
}
ENT.SoundTbl_BeforeMeleeAttack = {
"vj_cofr/aom/wheelchair/wcm_squirt.wav"
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
function ENT:Wheelchair_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Wheelchair_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("mouth")).Pos,self:GetAngles())
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