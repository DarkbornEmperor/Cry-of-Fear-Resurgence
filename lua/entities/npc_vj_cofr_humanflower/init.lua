AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/humanflower.mdl"
ENT.GodMode = true
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
ENT.CallForHelp = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_smash"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDistance = 90
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 130
ENT.MeleeAttackDamageAngleRadius = 180
ENT.HasMeleeAttackKnockBack = true
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 8
ENT.HasExtraMeleeAttackSounds = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 75
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -150),
    FirstP_Bone = "joint2",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra =
    "vj_cofr/cof/watro/watro_hit.wav"

ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/watro/watro_swing.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HumanFlower_Init()
    self.SoundTbl_Breath =
        "vj_cofr/cof/humanflower/humanflowers.wav"

    self.SoundTbl_BeforeMeleeAttack =
        "vj_cofr/cof/humanflower/flowerstrike.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:AddFlags(FL_NOTARGET)
    self:SetCollisionBounds(Vector(30, 30, 150), Vector(-30, -30, 0))
    self:SetSurroundingBounds(Vector(-90, -90, 0), Vector(90, 90, 190))
    self:HumanFlower_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
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
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
    return self:GetForward() * -300 + self:GetUp() * 100
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/