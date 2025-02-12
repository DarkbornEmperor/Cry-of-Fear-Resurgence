AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/watro.mdl"
ENT.StartHealth = 160
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CallForHelp = false
ENT.CanTurnWhileStationary = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.SightAngle = 180
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 120
ENT.MeleeAttackDamageAngleRadius = 90
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.ControllerParameters = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -120),
    FirstP_Bone = "joint8",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/watro/watro_hit.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/watro/watro_swing.wav"
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
ENT.Watro_Burrowed = true
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Watro_Init()
    if self.Watro_Burrowed then
        self.HasMeleeAttack = false
        self:DrawShadow(false)
        self:AddFlags(FL_NOTARGET)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetCollisionBounds(Vector(20, 20, 120), Vector(-20, -20, 0))
    self:SetSurroundingBounds(Vector(-80, -80, 0), Vector(80, 80, 160))
    self:Watro_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "attack" then
        self:ExecuteMeleeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
    ply:ChatPrint("JUMP: Unburrow")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
 if act == ACT_IDLE && self.Watro_Burrowed then
    return ACT_IDLE_RELAXED
 elseif act == ACT_IDLE && !self.Watro_Burrowed then
    return ACT_IDLE_STIMULATED
end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local ent = self:GetEnemy()
    if self.Watro_Burrowed && IsValid(ent) && self:Visible(ent) && self:GetPos():Distance(ent:GetPos()) <= 130 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/out_water.wav", 75, 100)
    else
        VJ.EmitSound(self, "vj_cofr/fx/bodysplat.wav", 75, 100)
end
        self.Watro_Burrowed = false
        self:PlayAnim(ACT_SIGNAL1,true,false,false)
        self.HasMeleeAttack = true
        self:DrawShadow(true)
        self.CallForHelp = true
        self:RemoveFlags(FL_NOTARGET)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.45)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Initial" then
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
       self.SoundTbl_Death = {
       "vj_cofr/fx/out_water.wav"
}
    else
       self.SoundTbl_Death = {
       "vj_cofr/fx/bodysplat.wav"
}
end
        self:DrawShadow(false)
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:DrawShadow(false)
    corpseEnt:SetMoveType(MOVETYPE_NONE)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/