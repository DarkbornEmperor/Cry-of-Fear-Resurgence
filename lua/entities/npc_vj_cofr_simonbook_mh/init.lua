AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/booksimon_m.mdl"
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack_1","vjseq_attack_2","vjseq_attack_3"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = VJ.SET(100, 100)

ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = "common/null.wav"
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/weapons/sledgehammer/sledgehammer_hitbody.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/weapons/sledgehammer/sledgehammer_swing.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/booksimon/fucked2.mp3"
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
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:Init()
    -- Screen flash effect for all the players
    for _,v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
end
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:BookSimon_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "attack" then
        self:ExecuteMeleeAttack()
    elseif key == "death_hammer" then
        VJ.EmitSound(self, "vj_cofr/cof/weapons/sledgehammer/sledgehammer_hit.wav", 75, 100)
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
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.45)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Finish" then
    -- Screen flash effect for all the players
    for _,v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
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
ENT.FootSteps = {
   [MAT_ANTLION] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_BLOODYFLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_CONCRETE] = {
       "vj_cofr/cof/simon/footsteps/concrete1.wav",
       "vj_cofr/cof/simon/footsteps/concrete2.wav",
       "vj_cofr/cof/simon/footsteps/concrete3.wav",
       "vj_cofr/cof/simon/footsteps/concrete4.wav"
   },
   [MAT_DIRT] = {
       "vj_cofr/cof/simon/footsteps/dirt1.wav",
       "vj_cofr/cof/simon/footsteps/dirt2.wav",
       "vj_cofr/cof/simon/footsteps/dirt3.wav",
       "vj_cofr/cof/simon/footsteps/dirt4.wav"
   },
   [MAT_FLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_GRATE] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_ALIENFLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [74] = { -- Snow
       "vj_cofr/cof/simon/footsteps/snow1.wav",
       "vj_cofr/cof/simon/footsteps/snow2.wav",
       "vj_cofr/cof/simon/footsteps/snow3.wav",
       "vj_cofr/cof/simon/footsteps/snow4.wav"
   },
   [MAT_PLASTIC] = {
       "vj_cofr/cof/simon/footsteps/paper1.wav",
       "vj_cofr/cof/simon/footsteps/paper2.wav",
       "vj_cofr/cof/simon/footsteps/paper3.wav",
       "vj_cofr/cof/simon/footsteps/paper4.wav"
   },
   [MAT_METAL] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_SAND] = {
       "vj_cofr/cof/simon/footsteps/sand1.wav",
       "vj_cofr/cof/simon/footsteps/sand2.wav",
       "vj_cofr/cof/simon/footsteps/sand3.wav",
       "vj_cofr/cof/simon/footsteps/sand4.wav"
   },
   [MAT_FOLIAGE] = {
       "vj_cofr/cof/simon/footsteps/gravel1.wav",
       "vj_cofr/cof/simon/footsteps/gravel2.wav",
       "vj_cofr/cof/simon/footsteps/gravel3.wav",
       "vj_cofr/cof/simon/footsteps/gravel4.wav"
   },
   [MAT_COMPUTER] = {
       "vj_cofr/cof/simon/footsteps/paper1.wav",
       "vj_cofr/cof/simon/footsteps/paper2.wav",
       "vj_cofr/cof/simon/footsteps/paper3.wav",
       "vj_cofr/cof/simon/footsteps/paper4.wav"
   },
   [MAT_SLOSH] = {
       "vj_cofr/cof/simon/footsteps/splash1.wav",
       "vj_cofr/cof/simon/footsteps/splash2.wav",
       "vj_cofr/cof/simon/footsteps/splash3.wav",
       "vj_cofr/cof/simon/footsteps/splash4.wav"
   },
   [MAT_TILE] = {
       "vj_cofr/cof/simon/footsteps/concrete1.wav",
       "vj_cofr/cof/simon/footsteps/concrete2.wav",
       "vj_cofr/cof/simon/footsteps/concrete3.wav",
       "vj_cofr/cof/simon/footsteps/concrete4.wav"
   },
   [85] = { -- Grass
       "vj_cofr/cof/simon/footsteps/grass1.wav",
       "vj_cofr/cof/simon/footsteps/grass2.wav",
       "vj_cofr/cof/simon/footsteps/grass3.wav",
       "vj_cofr/cof/simon/footsteps/grass4.wav"
   },
   [MAT_VENT] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_WOOD] = {
       "vj_cofr/cof/simon/footsteps/wood1.wav",
       "vj_cofr/cof/simon/footsteps/wood2.wav",
       "vj_cofr/cof/simon/footsteps/wood3.wav",
       "vj_cofr/cof/simon/footsteps/wood4.wav"
   },
   [MAT_GLASS] = {
       "vj_cofr/cof/simon/footsteps/glass1.wav",
       "vj_cofr/cof/simon/footsteps/glass2.wav",
       "vj_cofr/cof/simon/footsteps/glass3.wav",
       "vj_cofr/cof/simon/footsteps/glass4.wav"
   }
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound()
    if !self:IsOnGround() then return end
    local tr = util.TraceLine({
    start = self:GetPos(),
    endpos = self:GetPos() +Vector(0,0,-150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
    VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootstepSoundLevel,self:GetSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/