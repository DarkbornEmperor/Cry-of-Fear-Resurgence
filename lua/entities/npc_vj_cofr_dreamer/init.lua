AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/dreamer.mdl"} 
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CallForHelp = false
ENT.HasMeleeAttack = true 
ENT.AnimTbl_MeleeAttack = {ACT_SIGNAL1}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10 
ENT.MeleeAttackDistance = 30 
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
-- Custom
ENT.Dreamer_Jumpscare = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Dreamer_CustomOnInitialize()
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/dreamer/dreamer_attack.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:AddFlags(FL_NOTARGET)
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
	if !IsValid(self:GetEnemy()) then
	self:SetNoDraw(true)
	self:DrawShadow(false)
end	
	if IsValid(self:GetEnemy()) && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 60 then
	self:SetNoDraw(false)
	self:DrawShadow(true)	
    timer.Simple(1,function() if IsValid(self) then	
	self:SetGroundEntity(NULL)
	self.Dreamer_Jumpscare = true
	self:Remove()
end	
end)
end	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/