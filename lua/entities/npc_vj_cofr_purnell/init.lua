AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/doctor.mdl"
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.HasCallForHelpAnimation = false
ENT.Weapon_CanMoveFire = false
ENT.Weapon_Strafe = false
ENT.AnimTbl_WeaponAttackGesture = false
ENT.Weapon_IgnoreSpawnMenu = true
ENT.CanTurnWhileMoving = false
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DropDeathLoot = false
ENT.HasSoundTrack = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/null.wav"

ENT.SoundTbl_SoundTrack = {
    "vj_cofr/cof/doctorboss/doctorbattle.mp3",
    "vj_cofr/cof/doctorboss/doctorbattle2.mp3"
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

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.StartHealth = 100
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.StartHealth = 200
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.StartHealth = 300
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.StartHealth = 400
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_Init()
    self.SoundTbl_Pain = {
        "vj_cofr/cof/doctorboss/ouch1.wav",
        "vj_cofr/cof/doctorboss/ouch2.wav",
        "vj_cofr/cof/doctorboss/ouch3.wav",
        "vj_cofr/cof/doctorboss/ouch4.wav",
        "vj_cofr/cof/doctorboss/ouch5.wav",
        "vj_cofr/cof/doctorboss/ouch6.wav",
        "vj_cofr/cof/doctorboss/ouch7.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/cof/doctorboss/ouch1.wav",
        "vj_cofr/cof/doctorboss/ouch2.wav",
        "vj_cofr/cof/doctorboss/ouch3.wav",
        "vj_cofr/cof/doctorboss/ouch4.wav",
        "vj_cofr/cof/doctorboss/ouch5.wav",
        "vj_cofr/cof/doctorboss/ouch6.wav",
        "vj_cofr/cof/doctorboss/ouch7.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self.Doctor_NextRunT = CurTime() + math_rand(8,12)
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Doctor_Init()
    local wep = math_random(1,2)
    if wep == 1 then
        self:Give("weapon_vj_cofr_revolver")
    elseif wep == 2 then
        self:Give("weapon_vj_cofr_p345")
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math_random(3,4) .. ".wav", 75, 100)
        if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
            VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
            /*local effectdata = EffectData()
            effectdata:SetOrigin(self:GetPos())
            effectdata:SetScale(10)
            util.Effect("watersplash", effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
        self.VJCE_NPC.EnemyDetection = true
        self.VJCE_NPC.JumpParams.Enabled = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponAttack()
    if self.VJ_IsBeingControlled or self.IsGuard or self:IsBusy() or self.Flinching then return end
    if CurTime() > self.Doctor_NextRunT then
        timer.Simple(0.5, function()
            if IsValid(self) && !self:IsMoving() && !self.Dead && !self.Flinching then
                self:SCHEDULE_COVER_ENEMY("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = false end)
            end
        end)
        self.Doctor_NextRunT = CurTime() + math_rand(12,18)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(wepHoldType)
    if wepHoldType == "pistol" or wepHoldType == "revolver" then
        self.AnimationTranslations[ACT_IDLE] = ACT_IDLE
        self.AnimationTranslations[ACT_IDLE_ANGRY] = ACT_IDLE_ANGRY
        self.AnimationTranslations[ACT_WALK] = ACT_WALK
        self.AnimationTranslations[ACT_RUN] = ACT_RUN
        self.AnimationTranslations[ACT_WALK_CROUCH] = ACT_WALK
        self.AnimationTranslations[ACT_RUN_CROUCH] = ACT_RUN
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
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "DeathAnim" then
        self:DeathWeaponDrop(dmginfo,hitgroup)
        local activeWep = self:GetActiveWeapon()
        if IsValid(activeWep) then activeWep:Remove() end
    end
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeathWeaponDrop(dmginfo, hitgroup, wepEnt)
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
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() + Vector(0, 0, -150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self, VJ.PICK(self.FootSteps[tr.MatType]), self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/