AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/dreamer.mdl"
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CallForHelp = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = false
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
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
ENT.Dreamer_Jumpscare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dreamer_Init()
    self.SoundTbl_DreamerScream =
        "vj_cofr/cof/dreamer/dreamer_scream.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:AddFlags(FL_NOTARGET)
    self:SetNoDraw(true)
    self:DrawShadow(false)
    self:SetCollisionBounds(Vector(13, 13, 86), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Dreamer_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "melee" then
        self:JumpscareDamage()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    ply:ChatPrint("JUMP: Jumpscare")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local ent = self:GetEnemy()
    if !self.Dreamer_Jumpscare && IsValid(ent) && self:Visible(ent) && self.EnemyData.Distance < 60 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self:PlayAnim(ACT_SIGNAL1, true, false, true)
        self.Dreamer_Scream = VJ.CreateSound(self, self.SoundTbl_DreamerScream, 75, 100)
        self.Dreamer_Jumpscare = true
        self.CallForHelp = true
        self:DrawShadow(true)
        self:SetNoDraw(false)
        timer.Simple(SoundDuration("vj_cofr/cof/dreamer/dreamer_scream.wav"), function() if IsValid(self) then self:Remove() end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:JumpscareDamage()
    local ent = self:GetEnemy()
    if IsValid(ent) && self:Visible(ent) && VJ.GetNearestDistance(self, ent) < 60 then
        ent:TakeDamage(10, self, self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Dreamer_Scream)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/