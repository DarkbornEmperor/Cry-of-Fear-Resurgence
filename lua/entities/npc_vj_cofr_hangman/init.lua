AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/hangman.mdl"}
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CanTurnWhileStationary = false
ENT.CallForHelp = false
ENT.SightAngle = 180
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = 0
ENT.NextMeleeAttackTime = 0.5
ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageAngleRadius = 180
ENT.DisableMeleeAttackAnimation = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -150), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "huvud2", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Hangman_CustomOnInitialize() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:AddFlags(FL_NOTARGET)
    self:SetCollisionBounds(Vector(13, 13, 150), Vector(-13, -13, 10))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 180))
    self:Hangman_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
	if hitEnt.IsVJBaseSNPC_Human then -- Make human NPCs die instantly
		self.MeleeAttackDamage = hitEnt:Health() + 10
	elseif hitEnt:IsPlayer() then
		self.MeleeAttackDamage = hitEnt:Health() + hitEnt:Armor() + 10
	else
		self.MeleeAttackDamage = 200
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/