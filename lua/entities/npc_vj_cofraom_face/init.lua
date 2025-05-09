AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/agrunt.mdl"
ENT.StartHealth = 350
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_mattack2","vjseq_mattack3"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_cofraom_eyeball"
ENT.RangeAttackMaxDistance = 1100
ENT.RangeAttackMinDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 0
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = "UseRangeDistance"
ENT.LimitChaseDistance_Min = "UseRangeDistance"
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.FlinchHitGroupMap = {
    {HitGroup = HITGROUP_LEFTARM, Animation = ACT_FLINCH_LEFTARM},
    {HitGroup = HITGROUP_RIGHTARM, Animation = ACT_FLINCH_RIGHTARM},
    {HitGroup = HITGROUP_LEFTLEG, Animation = ACT_FLINCH_LEFTLEG},
    {HitGroup = HITGROUP_RIGHTLEG, Animation = ACT_FLINCH_RIGHTLEG}
}
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
       -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
"vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/twitcher/claw_strike1.wav",
"vj_cofr/aom/twitcher/claw_strike2.wav",
"vj_cofr/aom/twitcher/claw_strike3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/twitcher/claw_miss1.wav",
"vj_cofr/aom/twitcher/claw_miss2.wav"
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
function ENT:Face_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/face/ag_alert1.wav",
    "vj_cofr/aom/face/ag_alert2.wav",
    "vj_cofr/aom/face/ag_alert3.wav",
    "vj_cofr/aom/face/ag_alert4.wav",
    "vj_cofr/aom/face/ag_alert5.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/face/ag_attack1.wav",
    "vj_cofr/aom/face/ag_attack2.wav",
    "vj_cofr/aom/face/ag_attack3.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/face/ag_pain1.wav",
    "vj_cofr/aom/face/ag_pain2.wav",
    "vj_cofr/aom/face/ag_pain3.wav",
    "vj_cofr/aom/face/ag_pain4.wav",
    "vj_cofr/aom/face/ag_pain5.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/face/ag_die1.wav",
    "vj_cofr/aom/face/ag_die2.wav",
    "vj_cofr/aom/face/ag_die3.wav",
    "vj_cofr/aom/face/ag_die4.wav",
    "vj_cofr/aom/face/ag_die5.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    local face = ents.Create("env_sprite")
    face:SetKeyValue("model","vj_cofr/sprites/face.vmt")
    face:SetKeyValue("scale","1")
    face:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
    face:SetKeyValue("renderfx","14")
    face:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
    face:SetKeyValue("renderamt","255") -- Transparency
    face:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
    face:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
    face:SetKeyValue("spawnflags","0")
    face:SetParent(self)
    face:Fire("SetParentAttachment","hornet")
    face:Spawn()
    face:Activate()
    face:SetNoDraw(true)
    self:DeleteOnRemove(face)
    self.face = face

    self:DrawShadow(false)
    self:SetCollisionBounds(Vector(25, 25, 86), Vector(-25, -25, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 120))
    self:Face_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
 if key == "step" then
    self:PlayFootstepSound()
 elseif key == "attack" then
    self:ExecuteMeleeAttack()
 elseif key == "attack_range" && self.AttackType == VJ.ATTACK_TYPE_RANGE then
    self:ExecuteRangeAttack()
 if IsValid(self.face) then
    self.face:SetNoDraw(false)
end
    -- Backup timer to make sure the sprites are hidden in case event doesn't run!
    timer.Simple(0.08, function()
    if IsValid(self) then
    if IsValid(self.face) then
        self.face:SetNoDraw(true)
        end
    end
end)
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
function ENT:OnRangeAttackExecute(status,enemy,projectile)
 if status == "PreSpawn" && self:GetClass() == "npc_vj_cofraomc_face" then
    projectile.Eyeball_Classic = true
end
    if status == "PostSpawn" then
    local ene = self:GetEnemy()
    if IsValid(ene) then
        projectile.Track_Enemy = ene
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
    return self:GetAttachment(self:LookupAttachment("hornet")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo,hitgroup,status)
 if status == "Init" then
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
        end
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
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:DrawShadow(false)
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