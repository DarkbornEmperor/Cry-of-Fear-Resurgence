AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/dreamer.mdl"} 
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CallForHelp = false
ENT.SightAngle = 180
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_SIGNAL1}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 45
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
ENT.Dreamer_Jumpscare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dreamer_CustomOnInitialize()
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/dreamer/dreamer_scream.wav",
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:AddFlags(FL_NOTARGET)
	 self:SetMaterial("hud/killicons/default")
	 self:DrawShadow(false)
     self:SetCollisionBounds(Vector(13, 13, 90), Vector(-13, -13, 0))
     self:Dreamer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	         if self.Dead == true or self.VJ_IsBeingControlled == true or !IsValid(self:GetEnemy()) then return end

	         if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 then
			   self.Dreamer_Jumpscare = true
	           self:DrawShadow(true)
			   self:SetGroundEntity(NULL)
               self:SetMaterial() 	
             timer.Simple(1.25,function() if IsValid(self) then	
	           self:Remove()
			   return
            end	
        end)
    end	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/