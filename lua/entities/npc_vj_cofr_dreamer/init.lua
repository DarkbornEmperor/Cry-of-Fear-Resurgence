AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/dreamer.mdl"} 
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.SightAngle = 180
ENT.HasMeleeAttack = false 
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the controller when the camera is in third person
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
ENT.Dreamer_Jumpscare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dreamer_CustomOnInitialize()
    self.SoundTbl_DreamerScream = {
	"vj_cofr/cof/dreamer/dreamer_scream.wav",
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:AddFlags(FL_NOTARGET)
     self:SetMaterial("hud/killicons/default")
	 self:DrawShadow(false)
	 self.CallForHelp = false
     self:SetCollisionBounds(Vector(13, 13, 87), Vector(-13, -13, 0))
     self:Dreamer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("SPACE: Jumpscare")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if !IsValid(self:GetEnemy()) then return end
	if !self.Dreamer_Jumpscare && IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,true)
		self.Dreamer_Scream = VJ_CreateSound(self,self.SoundTbl_DreamerScream,75,100)
	    self.Dreamer_Jumpscare = true
		self.CallForHelp = true
	    self:DrawShadow(true)
        self:SetMaterial() 
	    timer.Simple(0.8,function() if IsValid(self) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 then	
        self:GetEnemy():TakeDamage(10,self,self)	end end)			   
        timer.Simple(1,function() if IsValid(self) then self:SetMaterial("hud/killicons/default") self:DrawShadow(false) end end)
        timer.Simple(1.5,function() if IsValid(self) then self:Remove() end end)
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ_STOPSOUND(self.Dreamer_Scream)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/