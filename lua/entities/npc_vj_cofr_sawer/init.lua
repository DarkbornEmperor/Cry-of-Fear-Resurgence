AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sawer.mdl"
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
//ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack1","vjseq_attack2","vjseq_attack3"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 70
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 75
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -80),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
"vj_cofr/fx/npc_step1.wav"

ENT.SoundTbl_MeleeAttackExtra =
"vj_cofr/cof/sawrunner/chainsaw_attack_hit.wav"

ENT.SoundTbl_MeleeAttackMiss =
"vj_cofr/cof/sawrunner/chainsaw_attack_miss.wav"

ENT.SoundTbl_SoundTrack =
"vj_cofr/cof/sawer/sawersong.mp3"

ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Sawer_EyeOpen = false
ENT.Sawer_NextDownT = 0
ENT.Sawer_NextFlinchT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sawer_Init()
    self.SoundTbl_Breath =
    "vj_cofr/cof/sawer/chainsaw_loop.wav"

    self.SoundTbl_Alert = {
    "vj_cofr/cof/sawer/sawer_alert10.wav",
    "vj_cofr/cof/sawer/sawer_alert20.wav",
    "vj_cofr/cof/sawer/sawer_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/sawer/sawer_attack1.wav",
    "vj_cofr/cof/sawer/sawer_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/sawer/sawer_pain1.wav",
    "vj_cofr/cof/sawer/sawer_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/sawer/sawer_pain1.wav",
    "vj_cofr/cof/sawer/sawer_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(18, 18, 103), Vector(-18, -18, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 140))
    self:Sawer_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
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
function ENT:OnMeleeAttackExecute(status,ent,isProp)
    if status == "PreDamage" then
    if ent.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
        self.MeleeAttackDamage = ent:Health() + 10
    elseif ent:IsPlayer() then
        self.MeleeAttackDamage = ent:Health() + ent:Armor() + 10
    else
        self.MeleeAttackDamage = 200
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
 if status == "PreDamage" then
 if CurTime() > self.Sawer_NextFlinchT && math.random(1,16) == 1 && !self.Sawer_EyeOpen then
    self:PlayAnim(ACT_SMALL_FLINCH,true,false,false)
    self.Sawer_NextFlinchT = CurTime() + self.FlinchCooldown
end
 if hitgroup == 9 && self.Sawer_EyeOpen then
    dmginfo:ScaleDamage(0.2)
 else
    dmginfo:ScaleDamage(0)
end
 if hitgroup != 9 then
    self:SpawnBloodParticles(dmginfo,hitgroup)
    self:SpawnBloodDecals(dmginfo,hitgroup)
    self:PlaySoundSystem("Impact", self.SoundTbl_Impact)
end
     if CurTime() > self.Sawer_NextDownT && math.random(1,20) == 1 && !self.Sawer_EyeOpen then
     local animTime = VJ.AnimDuration(self,ACT_COWER)
        self:PlayAnim(ACT_COWER,true,false,false)
        VJ.EmitSound(self, "vj_cofr/cof/sawer/eye_open.wav", 75, 100)
        self:SetSkin(1)
        self.Sawer_EyeOpen = true
        self.MovementType = VJ_MOVETYPE_STATIONARY
        self.CanTurnWhileStationary = false
        self:AddFlags(FL_NOTARGET)
        self.Sawer_Eye = ents.Create("obj_vj_bullseye")
        self.Sawer_Eye:SetModel("models/hunter/plates/plate.mdl")
        self.Sawer_Eye:SetParent(self)
        self.Sawer_Eye:Fire("SetParentAttachment", "eye")
        self.Sawer_Eye:Spawn()
        self.Sawer_Eye:SetNoDraw(true)
        self.Sawer_Eye:DrawShadow(false)
        self.Sawer_Eye.VJ_NPC_Class = self.VJ_NPC_Class
        self:SetRelationshipMemory(self.Sawer_Eye, VJ.MEM_OVERRIDE_DISPOSITION, D_LI) -- In case relation class is changed dynamically!
        self:DeleteOnRemove(self.Sawer_Eye)

    timer.Simple(animTime,function()
    if IsValid(self) && IsValid(self.Sawer_Eye) then
        self:SetSkin(0)
        self.Sawer_EyeOpen = false
        self.Sawer_Eye:Remove()
        self:RemoveFlags(FL_NOTARGET)
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        self.Sawer_NextDownT = CurTime() + math.Rand(5,10) end end)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
 if status == "Init" then
 if self.Sawer_EyeOpen && IsValid(self.Sawer_Eye) then
    self:SetSkin(0)
    self.Sawer_Eye:Remove()
    self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
end
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