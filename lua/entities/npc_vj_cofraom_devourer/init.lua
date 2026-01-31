AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/devourer.mdl"
ENT.StartHealth = 50
ENT.SightDistance = 1270
ENT.SightAngle = 360
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileMoving = false
ENT.CanTurnWhileStationary = false
ENT.HullType = HULL_SMALL_CENTERED
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_attack1"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.NextAnyAttackTime_Melee = 10
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 80
ENT.MeleeAttackAngleRadius = 100
ENT.MeleeAttackDamageAngleRadius = 120
ENT.CanReceiveOrders = false
ENT.BringFriendsOnDeath = false
ENT.AlertFriendsOnDeath = true
ENT.CallForBackUpOnDamage = false
ENT.CallForHelp = false
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    FirstP_Bone = "bone01",
    FirstP_Offset = Vector(0, 0, -44),
    FirstP_ShrinkBone = false,
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/aom/devourer/bcl_bite3.wav",
    "vj_cofr/aom/devourer/bcl_chew1.wav",
    "vj_cofr/aom/devourer/bcl_chew2.wav",
    "vj_cofr/aom/devourer/bcl_chew3.wav"
}
ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
ENT.MainSoundPitch = 100
-- Custom
ENT.Devourer_LastHeight = 180
ENT.Devourer_CurEnt = NULL
ENT.Devourer_CurEntMoveType = MOVETYPE_WALK
ENT.Devourer_PullingEnt = 0
ENT.Devourer_NextPullSoundT = 0
ENT.Devourer_Type = 0
    -- 0 = Director's Cut
    -- 1 = Classic
    -- 2 = Remod

local math_clamp = math.Clamp
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_Init()
    self.SoundTbl_Death = {
        "vj_cofr/aom/devourer/bcl_die1.wav",
        "vj_cofr/aom/devourer/bcl_die3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self:GetModel() == "models/vj_cofr/aom/devourer.mdl" then // Already the default
        self.Devourer_Type = 0
    elseif self:GetModel() == "models/vj_cofr/aom/classic/devourer.mdl" then
        self.Devourer_Type = 1
    elseif self:GetModel() == "models/vj_cofr/aomr/devourer.mdl" then
        self.Devourer_Type = 2
    end
    if self.Devourer_Type == 1 or self.Devourer_Type == 2 then
        self:SetCollisionBounds(Vector(18, 18, 0),Vector(-18, -18, -50))
    else
        self:SetCollisionBounds(Vector(25, 25, 0),Vector(-25, -25, 39))
    end
    self:SetSurroundingBounds(Vector(60, 60, 70), Vector(-60, -60, -30))
    self:Devourer_Init()
    //self:GetPoseParameters(true) -- tongue_height 0 / 1024
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
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
local velInitial = Vector(0, 0, 2)
local offset = 200
local offsetPulling = 125
--
function ENT:Devourer_CalculateTongue()
    local myPos = self:GetPos()
    local myUpPos = self:GetUp()
    local tr = util.TraceLine({
        start = myPos,
        endpos = myPos - myUpPos * self.Devourer_LastHeight,
        filter = self
    })
    local trHitEnt = tr.Entity
    local trHitPos = tr.HitPos
    local height = myPos:Distance(trHitPos)
    -- Increase the height by 10 every tick | minimum = 0, maximum = 1024
    self.Devourer_LastHeight = math_clamp(height + 10, 0, 1024 + offset)

    if IsValid(trHitEnt) && trHitEnt.VJ_ID_Living && self:CheckRelationship(trHitEnt) == D_HT && !trHitEnt.VJ_ID_Boss then
        -- If the grabbed enemy is a new enemy then reset the enemy values
        if self.Devourer_CurEnt != trHitEnt then
            self:Devourer_ResetEnt()
            self.Devourer_CurEntMoveType = trHitEnt:GetMoveType()
            if trHitEnt:IsNextBot() then -- NextBots initially need to be repositioned upwards otherwise they will constantly snap to the ground
                trHitEnt:SetPos(trHitEnt:GetUp() * 150)
            end
        end
        self.Devourer_CurEnt = trHitEnt
        trHitEnt:AddEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
        if trHitEnt:IsNPC() then
            trHitEnt:StopMoving()
            trHitEnt:SetVelocity(velInitial)
            trHitEnt:SetMoveType(MOVETYPE_FLY)
        elseif trHitEnt:IsPlayer() then
            trHitEnt:SetMoveType(MOVETYPE_NONE)
            //trHitEnt:AddFlags(FL_ATCONTROLS)
        elseif trHitEnt:IsNextBot() then
            trHitEnt:SetVelocity(velInitial)
            trHitEnt:SetMoveType(MOVETYPE_NONE)
        end
        trHitEnt:SetGroundEntity(NULL)
        -- Make it pull the enemy up
        if height >= 50 then
                trHitEnt:SetPos(Vector(trHitPos.x, trHitPos.y, (trHitEnt:GetPos() + trHitEnt:GetUp() * 5).z)) -- Set the position for the enemy
            if CurTime() > self.Devourer_NextPullSoundT then -- Play the pulling sound
                if self:GetClass() == "npc_vj_cofraomc_devourer" then
                    VJ.EmitSound(self, "vj_cofr/aom/devourer/classic/bcl_alert2.wav")
                else
                    VJ.EmitSound(self, "vj_cofr/aom/devourer/bcl_alert2.wav")
                end
                self.Devourer_NextPullSoundT = CurTime() + 2.7950113378685 // Magic number is the sound duration of "bcl_alert2.wav"
            end
        end
        self:SetPoseParameter("tongue_height", myPos:Distance(trHitPos) - offsetPulling)
        return true
    else
        self:Devourer_ResetEnt()
    end
    self:SetPoseParameter("tongue_height", myPos:Distance(trHitPos) - offset)
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Devourer_ResetEnt()
    if !IsValid(self.Devourer_CurEnt) then return end
    self.Devourer_CurEnt:RemoveEFlags(EFL_IS_BEING_LIFTED_BY_BARNACLE)
    //self.Devourer_CurEnt:RemoveFlags(FL_ATCONTROLS)
    self.Devourer_CurEnt:SetMoveType(self.Devourer_CurEntMoveType) -- Reset the enemy's move type
    self.Devourer_CurEnt = NULL
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
    if act == ACT_IDLE then
        return (self.Devourer_PullingEnt and ACT_BARNACLE_PULL) or ACT_IDLE
    end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    if self.Dead then return end
    self.Devourer_PullingEnt = self:Devourer_CalculateTongue()
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
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        self:SetPos(self:GetPos() + self:GetUp() * -4)
        self:Devourer_ResetEnt()
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    corpse:SetPoseParameter("tongue_height", 1)
    VJ_COFR_ApplyCorpse(self, corpse)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    self:Devourer_ResetEnt()
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/