AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/hanger.mdl"} 
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CanTurnWhileStationary = false
ENT.SightAngle = 180
ENT.HasMeleeAttack = false
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}	
-- Custom
ENT.Hanger_Death = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hanger_CustomOnInitialize()
    self.SoundTbl_HangerScream = {
	"vj_cofr/cof/hanger/hangerscream1.wav",
	"vj_cofr/cof/hanger/hangerscream2.wav",
	"vj_cofr/cof/hanger/hangerscream3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	 self:SetMaterial("hud/killicons/default")
     self:DrawShadow(false)
     self:AddFlags(FL_NOTARGET)
	 self.CallForHelp = false
     self:Hanger_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("SPACE: Jumpscare")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	        if !IsValid(self:GetEnemy()) then return end
	        if !self.Hanger_Death && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
			   self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,10,false)
			   self.Hanger_Scream = VJ_CreateSound(self,self.SoundTbl_HangerScream,75,100)
			   self.Hanger_Death = true
	           self:DrawShadow(true)
			   self.CallForHelp = true
			   self:SetMaterial()
	        timer.Simple(0.4,function() if IsValid(self) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 then	
               self:GetEnemy():TakeDamage(10,self,self)	end end)			   
	        timer.Simple(8,function() if IsValid(self) then	
	           self:Remove()
            end	
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ_STOPSOUND(self.Hanger_Scream)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/