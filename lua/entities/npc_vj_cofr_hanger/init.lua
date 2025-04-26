AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
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
ENT.CanTurnWhileStationary = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_SIGNAL1
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
ENT.Hanger_Death = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hanger_Init()
    self.SoundTbl_Death = {
    "vj_cofr/cof/hanger/hangerscream1.wav",
    "vj_cofr/cof/hanger/hangerscream2.wav",
    "vj_cofr/cof/hanger/hangerscream3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetNoDraw(true)
    self:DrawShadow(false)
    self:AddFlags(FL_NOTARGET)
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Hanger_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "attack" then
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
    if !self.Hanger_Death && IsValid(ent) && self:Visible(ent) && self.EnemyData.Distance < 60 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self.GodMode = false
        self:TakeDamage(self:GetMaxHealth(),self,self)
        self.Hanger_Death = true
        self.CallForHelp = true
        timer.Simple(0.1,function() if IsValid(self) then self:SetNoDraw(false) self:DrawShadow(true) end end)
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
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_NONE)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/