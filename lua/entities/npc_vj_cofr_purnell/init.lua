AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/doctor.mdl"
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasLostWeaponSightAnimation = true
ENT.HasCallForHelpAnimation = false
ENT.HasShootWhileMoving = false
ENT.MoveRandomlyWhenShooting = false
ENT.DisableWeaponFiringGesture = true
ENT.Weapon_NoSpawnMenu = true
ENT.CanTurnWhileMoving = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.HasSoundTrack = true
-- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/doc_ai/doctorbattle.mp3",
"vj_cofr/cof/doc_ai/doctorbattle2.mp3"
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
ENT.Doctor_NextRunT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_CustomOnInitialize()
    self.SoundTbl_Pain = {
    "vj_cofr/cof/doc_ai/ouch1.wav",
    "vj_cofr/cof/doc_ai/ouch2.wav",
    "vj_cofr/cof/doc_ai/ouch3.wav",
    "vj_cofr/cof/doc_ai/ouch4.wav",
    "vj_cofr/cof/doc_ai/ouch5.wav",
    "vj_cofr/cof/doc_ai/ouch6.wav",
    "vj_cofr/cof/doc_ai/ouch7.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/doc_ai/ouch1.wav",
    "vj_cofr/cof/doc_ai/ouch2.wav",
    "vj_cofr/cof/doc_ai/ouch3.wav",
    "vj_cofr/cof/doc_ai/ouch4.wav",
    "vj_cofr/cof/doc_ai/ouch5.wav",
    "vj_cofr/cof/doc_ai/ouch6.wav",
    "vj_cofr/cof/doc_ai/ouch7.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Doctor_CustomOnInitialize()
    self.Doctor_NextRunT = CurTime() + math.Rand(8,12)
    local wep = math.random(1,2)
    if wep == 1 then
    self:Give("weapon_vj_cofr_revolver")
    elseif wep == 2 then
    self:Give("weapon_vj_cofr_p345")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
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
function ENT:CustomOnWeaponAttack()
    if self.VJ_IsBeingControlled or self.IsGuard or self:IsBusy() or self.Flinching then return end
    if CurTime() > self.Doctor_NextRunT then
    timer.Simple(0.5, function()
        if IsValid(self) && !self:IsMoving() && !self.Dead && !self.Flinching then
        self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = false end)
    end
end)
        self.Doctor_NextRunT = CurTime() + math.Rand(12,18)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(wepHoldType)
 if wepHoldType == "pistol" or wepHoldType == "revolver" then
    self.AnimationTranslations[ACT_IDLE] = ACT_IDLE
    self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_IDLE_ANGRY
    self.AnimationTranslations[ACT_WALK] = ACT_WALK
    self.AnimationTranslations[ACT_RUN] = ACT_RUN
    self.AnimationTranslations[ACT_WALK_AIM] = ACT_WALK_AIM
    self.AnimationTranslations[ACT_RUN_AIM] = ACT_RUN_AIM
    self.AnimationTranslations[ACT_RANGE_ATTACK1] = ACT_IDLE_ANGRY
    self.AnimationTranslations[ACT_RANGE_ATTACK1_LOW] = ACT_RANGE_ATTACK1_LOW
    self.AnimationTranslations[ACT_RELOAD] = ACT_CROUCHIDLE
    self.AnimationTranslations[ACT_RELOAD_LOW] = ACT_CROUCHIDLE
    self.AnimationTranslations[ACT_COVER_LOW] = ACT_CROUCHIDLE
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.45)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    self:DoDropWeaponOnDeath(dmginfo,hitgroup)
    local activeWep = self:GetActiveWeapon()
    if IsValid(activeWep) then activeWep:Remove() end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDropWeapon(dmginfo,hitgroup,wepEnt)
    wepEnt:SetModelScale(1)
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
function ENT:CustomOnFootStepSound()
    if !self:IsOnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() +Vector(0,0,-150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(customSd)
    if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
    if self:IsOnGround() && self:GetGroundEntity() != NULL then
        if self.DisableFootStepSoundTimer then
            local customTbl = VJ.PICK(customSd)
            local sdtbl = VJ.PICK(self.SoundTbl_FootStep)
            if customTbl then sdtbl = customTbl end
            VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
            local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Event", sdtbl) end
            if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
            return
        elseif self:IsMoving() && CurTime() > self.FootStepT && self:GetInternalVariable("m_flMoveWaitFinished") <= 0 then
            local customTbl = VJ.PICK(customSd)
            local sdtbl = VJ.PICK(self.SoundTbl_FootStep)
            if customTbl then sdtbl = customTbl end
            local curSched = self.CurrentSchedule
            if !self.DisableFootStepOnRun && ((VJ.HasValue(self.AnimTbl_Run, self:GetMovementActivity())) or (curSched != nil && curSched.MoveType == 1)) then
                VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
                local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Run", sdtbl) end
                if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
                self.FootStepT = CurTime() + self.FootStepTimeRun
                return
            elseif !self.DisableFootStepOnWalk && (VJ.HasValue(self.AnimTbl_Walk, self:GetMovementActivity()) or (curSched != nil && curSched.MoveType == 0)) then
                VJ.EmitSound(self, sdtbl, self.FootStepSoundLevel, self:VJ_DecideSoundPitch(self.FootStepPitch.a, self.FootStepPitch.b))
                local funcCustom = self.CustomOnFootStepSound; if funcCustom then funcCustom(self, "Walk", sdtbl) end
                if self.HasWorldShakeOnMove then util.ScreenShake(self:GetPos(), self.WorldShakeOnMoveAmplitude or 10, self.WorldShakeOnMoveFrequency or 100, self.WorldShakeOnMoveDuration or 0.4, self.WorldShakeOnMoveRadius or 1000) end -- !!!!!!!!!!!!!! DO NOT USE THESE !!!!!!!!!!!!!! [Backwards Compatibility!]
                self.FootStepT = CurTime() + self.FootStepTimeWalk
                return
            end
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/