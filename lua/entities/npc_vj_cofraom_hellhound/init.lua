AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/black_dog.mdl"
ENT.StartHealth = 70
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack2"
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextMeleeAttackTime = 1.5
ENT.MeleeAttackDistance = 100
ENT.MeleeAttackDamageType = DMG_SONIC
ENT.MeleeAttackDSP = 34
ENT.MeleeAttackDSPLimit = false
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)

ENT.HideOnUnknownDamage = false
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
    ThirdP_Offset = Vector(30, 25, -20),
    FirstP_Bone = "Bottom_Jaw",
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hellhound_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/hellhound/he_alert1.wav",
    "vj_cofr/aom/hellhound/he_alert2.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/hellhound/he_attack1.wav",
    "vj_cofr/aom/hellhound/he_attack2.wav",
    "vj_cofr/aom/hellhound/he_attack3.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/hellhound/he_pain1.wav",
    "vj_cofr/aom/hellhound/he_pain2.wav",
    "vj_cofr/aom/hellhound/he_pain3.wav",
    "vj_cofr/aom/hellhound/he_pain4.wav",
    "vj_cofr/aom/hellhound/he_pain5.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/hellhound/he_die1.wav",
    "vj_cofr/aom/hellhound/he_die2.wav",
    "vj_cofr/aom/hellhound/he_die3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(13, 13, 40), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Hellhound_Init()
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
local hellhoundClasses = {npc_vj_cofraom_hellhound = true, npc_vj_cofraomc_hellhound = true}
local beamEffectTbl = {material = "vj_cofr/sprites/shockwave", framerate = 20, flags = 0}
--
function ENT:CustomOnMeleeAttack_BeforeChecks()
    local friNum = 0 -- How many allies exist around the Hellhound
    local color = Color(255, 0, 0, 255) -- The shock wave color
    local dmg = 20 -- How much damage should the shock wave do?
    local myPos = self:GetPos()
    for _, v in ipairs(ents.FindInSphere(myPos, 200)) do
        if v != self && hellhoundClasses[v:GetClass()] then
            friNum = friNum + 1
    end
end
    -- More allies = more damage and different colors
    if friNum == 1 then
        --color = Color(101, 133, 221)
        dmg = 40
    elseif friNum == 2 then
        --color = Color(67, 85, 255)
        dmg = 60
    elseif friNum >= 3 then
        --color = Color(62, 33, 211)
        dmg = 80
end

    -- flags 0 = No fade!
    effects.BeamRingPoint(myPos, 0.3, 2, 400, 16, 0, color, beamEffectTbl)
    effects.BeamRingPoint(myPos, 0.3, 2, 200, 16, 0, color, beamEffectTbl)

    if self.HasSounds && self.HasMeleeAttackSounds then
        VJ.EmitSound(self, {"vj_cofr/aom/hellhound/he_blast1.wav","vj_cofr/aom/hellhound/he_blast2.wav","vj_cofr/aom/hellhound/he_blast3.wav"}, 100, math.random(80,100))
end
    VJ.ApplyRadiusDamage(self, self, myPos, 200, dmg, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
    if status == "PriorExecution" then
        -- Hellhound shouldn't have its sonic attack interrupted by a flinch animation!
        return self.AttackAnimTime > CurTime()
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
