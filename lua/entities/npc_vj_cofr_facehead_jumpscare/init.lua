AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/facehead_jumpscare.mdl"
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
     self:AddFlags(FL_NOTARGET)
     self:SetNoDraw(true)
     self:DrawShadow(false)
     self:SetCollisionBounds(Vector(13, 13, 80), Vector(-13, -13, 0))
     self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
     self:FaceHead_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "melee" then
        self:JumpscareDamage()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
    ply:ChatPrint("JUMP: Jumpscare")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local ent = self:GetEnemy()
    if !self.FaceHead_Jumpscare && IsValid(ent) && self:Visible(ent) && self.EnemyData.Distance < 60 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self:PlayAnim(ACT_SIGNAL1,true,false,true)
        self.FaceHead_Scream = VJ.CreateSound(self,self.SoundTbl_FaceHeadScream,75,100)
        self.FaceHead_Jumpscare = true
        VJ.STOPSOUND(self.CurrentAlertSound)
        self.CallForHelp = true
        self:DrawShadow(true)
        self:SetNoDraw(false)
        timer.Simple(SoundDuration("vj_cofr/cof/facehead/b_screamclose1.wav"),function() if IsValid(self) then self:Remove() end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:JumpscareDamage()
    local ent = self:GetEnemy()
    if IsValid(ent) && self:Visible(ent) && VJ.GetNearestDistance(self,ent) < 60 then
        ent:TakeDamage(10,self,self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.FaceHead_Scream)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/