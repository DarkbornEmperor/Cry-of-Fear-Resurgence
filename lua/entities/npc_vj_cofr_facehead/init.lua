AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/facehead.mdl"} 
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CanTurnWhileStationary = false
ENT.CallForHelp = false
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_IDLE}
ENT.TimeUntilMeleeAttackDamage = 0.001
ENT.NextAnyAttackTime_Melee = 0.5
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}	
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Face_CustomOnInitialize()
self.SoundTbl_Breath = {
"vj_cofr/cof/facehead/facehead.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:AddFlags(FL_NOTARGET)
     self:SetPos(self:GetPos() + self:GetUp()*30)
	 self:SetCollisionBounds(Vector(30, 30, 100), Vector(-30, -30, -35))
     self:Face_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
    end		
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/