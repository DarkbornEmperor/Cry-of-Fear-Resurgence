AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/stranger.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.ConstantlyFaceEnemy = true 
ENT.ConstantlyFaceEnemy_IfAttacking = true 
ENT.ConstantlyFaceEnemy_Postures = "Standing" 
ENT.ConstantlyFaceEnemyDistance = 500 
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 500 
ENT.NoChaseAfterCertainRange_CloseDistance = 1 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 1.45 
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
-- Custom
ENT.Stranger_DamageDistance = 500
ENT.Stranger_NextEnemyDamage = 0

util.AddNetworkString("vj_cofr_stranger_damage")
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_CustomOnInitialize()
    self.SoundTbl_Breath = {
	"vj_cofr/cof/stranger/st_voiceloop.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/stranger/st_death.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
     self:Stranger_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_StartDmg()
	net.Start("vj_cofr_stranger_damage")
	net.WriteEntity(self)
	net.WriteEntity(self:GetEnemy())
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomAttack()
	if self.Dead == true or GetConVarNumber("vj_npc_norange") == 1 then self.NoChaseAfterCertainRange = false return end
	//print(self:GetPos():Distance(self:GetEnemy():GetPos()))
	if self:GetPos():Distance(self:GetEnemy():GetPos()) > self.Stranger_DamageDistance or !self:Visible(self:GetEnemy()) then return end
	if CurTime() > self.Stranger_NextEnemyDamage then
		self:StopMoving()
		self:GetEnemy():TakeDamage(10,self,self)
		if self:GetEnemy():IsPlayer() then self:Stranger_StartDmg() end
	self.Stranger_NextEnemyDamage = CurTime() + 0.5
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/