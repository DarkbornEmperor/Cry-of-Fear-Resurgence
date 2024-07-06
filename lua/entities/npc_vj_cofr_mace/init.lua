AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/mace.mdl"
ENT.StartHealth = 180
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.CanFlinch = 2
ENT.FlinchDamageTypes = {DMG_BLAST,DMG_SHOCK}
ENT.FlinchChance = 2
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -70),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
    -- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/sewer/mace_hitflesh.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/sewer/mace_swing.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/sewer/sewer_boss.mp3"
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
function ENT:CustomOnPreInitialize()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Mace_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/sewer/mace_scream.wav"
}
/*
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/slower/slower_attack1.wav",
    "vj_cofr/cof/slower/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/slower/slower_pain1.wav",
    "vj_cofr/cof/slower/slower_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/slower/slower_pain1.wav",
    "vj_cofr/cof/slower/slower_pain2.wav"
}
*/
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
 if GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 0 then
    self.CanFlinch = 1
    self.FlinchChance = 16
end
    self:SetCollisionBounds(Vector(20, 20, 92), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-80, -80, 0), Vector(80, 80, 120))
    self:Mace_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "attack" then
        self:MeleeAttackCode()
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
    if hitEnt.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
        self.MeleeAttackDamage = hitEnt:Health() + 10
    elseif hitEnt:IsPlayer() then
        self.MeleeAttackDamage = hitEnt:Health() + hitEnt:Armor() + 10
    else
        self.MeleeAttackDamage = 200
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.2)
    if GetConVar("VJ_COFR_Mace_Damage"):GetInt() == 0 then return end
    if dmginfo:IsDamageType(DMG_SHOCK) or dmginfo:IsExplosionDamage() then
        dmginfo:ScaleDamage(0.5)
    else
        dmginfo:ScaleDamage(0)
end
     if !dmginfo:IsDamageType(DMG_SHOCK) && !dmginfo:IsExplosionDamage() then
        self:SpawnBloodParticles(dmginfo,hitgroup)
        self:SpawnBloodDecal(dmginfo,hitgroup)
        self:PlaySoundSystem("Impact", self.SoundTbl_Impact)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/