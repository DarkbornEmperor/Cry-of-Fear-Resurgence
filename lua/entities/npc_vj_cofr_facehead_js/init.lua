AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/facehead_js.mdl"}
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CallForHelp = false
ENT.SightAngle = 180
ENT.HasMeleeAttack = false 
ENT.TimeUntilMeleeAttackDamage = 0.001
ENT.NextMeleeAttackTime = 0.5
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageAngleRadius = 180
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint2", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(10, 0, 5), -- The offset for the controller when the camera is in first person
}	
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.FaceHead_Jumpscare = false
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FaceHead_CustomOnInitialize()
    self.SoundTbl_FaceHeadScream = {
    "vj_cofr/cof/facehead/b_screamclose1.wav"
}
    self.SoundTbl_Alert = {
    "vj_cofr/cof/facehead/b_screamdistance4.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:AddFlags(FL_NOTARGET)
	 self:SetMaterial("hud/killicons/default")
	 self:DrawShadow(false)
	 self.CallForHelp = false
	 self:SetCollisionBounds(Vector(13, 13, 80), Vector(-13, -13, 0))
     self:FaceHead_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("SPACE: Jumpscare")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	         if !IsValid(self:GetEnemy()) then return end
	         if !self.FaceHead_Jumpscare && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
			   self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,true)
			   self.FaceHead_Scream = VJ_CreateSound(self,self.SoundTbl_FaceHeadScream,75,100)
			   self.FaceHead_Jumpscare = true
			   VJ_STOPSOUND(self.CurrentAlertSound)
			   self.CallForHelp = true
	           self:DrawShadow(true)
               self:SetMaterial() 
	        timer.Simple(0.2,function() if IsValid(self) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 then	
               self:GetEnemy():TakeDamage(10,self,self)	end end)			   
             timer.Simple(1.6,function() if IsValid(self) then	
	           self:Remove()
            end	
        end)
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ_STOPSOUND(self.FaceHead_Scream)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/