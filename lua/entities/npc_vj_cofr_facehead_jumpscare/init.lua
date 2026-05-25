AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/facehead_jumpscare.mdl"
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileMoving = false
ENT.CallForHelp = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = false
ENT.MeleeAttackDamage = 10
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "joint2",
    FirstP_Offset = Vector(10, 0, 5),
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
ENT.FaceHead_Jumpscare = false
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FaceHead_Init()
    self.SoundTbl_FaceHeadScream =
        "vj_cofr/cof/facehead/b_screamclose1.wav"

    self.SoundTbl_Alert =
        "vj_cofr/cof/facehead/b_screamdistance4.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:FaceHead_Init()
    self:AddFlags(FL_NOTARGET)
    self:SetNoDraw(true)
    self:SetCollisionBounds(Vector(13, 13, 80), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:ExecuteMeleeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    ply:ChatPrint("JUMP: Jumpscare")
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local eneData = self.EnemyData
    if !self.FaceHead_Jumpscare && IsValid(eneData.Target) && eneData.Visible && eneData.Distance < 60 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self.FaceHead_Jumpscare = true
        local animPick, animDur = self:PlayAnim(ACT_SIGNAL1, false, 0, false)
        if animPick != ACT_INVALID then
            self.AttackAnim = animPick
            self.AttackAnimDuration = animDur
            self.AttackAnimTime = CurTime() + self.AttackAnimDuration
        end
        sound.EmitHint(SOUND_DANGER, self:GetPos(), 100, 1, self)
        self.FaceHead_Scream = VJ.EmitSound(self, self.SoundTbl_FaceHeadScream, 75, 100)
        VJ.STOPSOUND(self.CurrentAlertSound)
        self.CallForHelp = true
        self:RemoveFlags(FL_NOTARGET)
        self:SetNoDraw(false)
        timer.Simple(SoundDuration("vj_cofr/cof/facehead/b_screamclose1.wav"), function() if IsValid(self) then self:Remove() end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end