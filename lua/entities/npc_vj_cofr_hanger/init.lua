AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/hanger.mdl"
ENT.GodMode = true
ENT.Bleeds = false
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CallForHelp = false
ENT.CanTurnWhileMoving = false
ENT.CanTurnWhileStationary = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageAngleRadius = 180
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -40),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Hanger_Jumpscare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hanger_Init()
    self.SoundTbl_HangerScream = {
        "vj_cofr/cof/hanger/hangerscream1.wav",
        "vj_cofr/cof/hanger/hangerscream2.wav",
        "vj_cofr/cof/hanger/hangerscream3.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:Hanger_Init()
    self:AddFlags(FL_NOTARGET)
    self:SetNoDraw(true)
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
    if !self.Hanger_Jumpscare && IsValid(eneData.Target) && eneData.Visible && eneData.Distance < 60 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self.Hanger_Jumpscare = true
        local animPick, animDur = self:PlayAnim(ACT_SIGNAL1, false, 0, false)
        if animPick != ACT_INVALID then
            self.AttackAnim = animPick
            self.AttackAnimDuration = animDur
            self.AttackAnimTime = CurTime() + self.AttackAnimDuration
        end
        sound.EmitHint(SOUND_DANGER, self:GetPos(), 100, 1, self)
        self.Hanger_Scream = VJ.EmitSound(self, self.SoundTbl_HangerScream, 75, 100)
        self.CallForHelp = true
        self:RemoveFlags(FL_NOTARGET)
        timer.Simple(0.15, function() if IsValid(self) then self:SetNoDraw(false) end end)
        timer.Simple(VJ.AnimDuration(self, ACT_SIGNAL1), function() if IsValid(self) then self.GodMode = false self:TakeDamage(self:Health(), self, self) end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
end