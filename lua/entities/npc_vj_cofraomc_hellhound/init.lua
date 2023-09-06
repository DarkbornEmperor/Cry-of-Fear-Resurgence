AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/classic/houndeye.mdl"} 
ENT.AnimTbl_MeleeAttack = {"vjseq_attack"}
ENT.TimeUntilMeleeAttackDamage = false //2.35
ENT.NextMeleeAttackTime = 2

-- Custom
ENT.Hellhound_BlinkingT = 0
ENT.Hellhound_NextSleepT = 0
ENT.Hellhound_Sleeping = false
ENT.Hellhound_LimpWalking = false -- Used for optimization
ENT.Hellhound_CurIdleAnim = 0 -- 0 = regular | 1 = sleeping | 2 = angry
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(20, 20, 40), Vector(-20, -20, 0))
     self:Hellhound_CustomOnInitialize()
	 
	 self.Hellhound_NextSleepT = CurTime() + math.Rand(0, 15)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
	-- Idle animations
	if self.VJ_IsBeingControlled then
		self.AnimTbl_IdleStand = {ACT_IDLE, ACT_IDLE_PACKAGE}
		self.DisableWandering = false
	else
		if IsValid(self:GetEnemy()) then
			if self.Hellhound_CurIdleAnim != 2 then
				self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
				self.Hellhound_CurIdleAnim = 2
				self.DisableWandering = true
			end
		elseif !self.Hellhound_Sleeping && self.Hellhound_CurIdleAnim != 0 then
			self.Hellhound_CurIdleAnim = 0
			self.AnimTbl_IdleStand = {ACT_IDLE, ACT_IDLE_PACKAGE}
			self.DisableWandering = false
		end
	end
	
	-- Limp walking
	if (self:GetMaxHealth() * 0.35) > self:Health() then
		if !self.Hellhound_LimpWalking then
			self.AnimTbl_Walk = {ACT_WALK_HURT}
			self.Hellhound_LimpWalking = true
		end
	elseif self.Hellhound_LimpWalking then
		self.AnimTbl_Walk = {ACT_WALK}
		self.Hellhound_LimpWalking = false
	end
	
	-- Blinking
	if !self.Dead && CurTime() > self.Hellhound_BlinkingT && self.Hellhound_Sleeping == false then
		self:SetSkin(1)
		timer.Simple(0.1, function() if IsValid(self) then self:SetSkin(2) end end)
		timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(1) end end)
		timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(0) end end)
		self.Hellhound_BlinkingT = CurTime() + math.Rand(2, 3.5)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled then return end
	
	-- Sleep system
	if !self.Alerted && !IsValid(self:GetEnemy()) && !self:IsMoving() && CurTime() > self.Hellhound_NextSleepT && !self.Hellhound_Sleeping && !self:IsBusy() then
		local sleept = math.Rand(15, 30) -- How long it should sleep
		self.Hellhound_Sleeping = true
		self.AnimTbl_IdleStand = {ACT_CROUCHIDLE}
		self.Hellhound_CurIdleAnim = 1
		self:VJ_ACT_PLAYACTIVITY(ACT_CROUCH, true, false, false)
		self:SetState(VJ_STATE_ONLY_ANIMATION, sleept)
		timer.Simple(7, function() if IsValid(self) && self.Hellhound_Sleeping then self:SetSkin(2) end end) -- Close eyes
		timer.Simple(sleept, function() -- Reset after sleept seconds
			if IsValid(self) && self.Hellhound_Sleeping == true then
				self.Hellhound_Sleeping = false
				self:VJ_ACT_PLAYACTIVITY(ACT_STAND, true, false, false)
				self.Hellhound_NextSleepT = CurTime() + math.Rand(15, 45)
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local alertAnims = {"vjseq_madidle1", "vjseq_madidle2", "vjseq_madidle3"}
--
function ENT:CustomOnAlert(ent)
	if self.Hellhound_Sleeping then -- Wake up if sleeping and play a special alert animation
		if self:GetState() == VJ_STATE_ONLY_ANIMATION then self:SetState() end
		self.Hellhound_Sleeping = false
		self:VJ_ACT_PLAYACTIVITY(ACT_HOP, true, false, false)
		self.Hellhound_NextSleepT = CurTime() + 20
	elseif math.random(1,2) == 1 then -- Random alert animation
		self:VJ_ACT_PLAYACTIVITY(alertAnims, true, false, true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnResetEnemy()
	self.Hellhound_NextSleepT = CurTime() + math.Rand(15, 45)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()
    local friNum = 0 -- How many allies exist around the Hellhound
	local color = Color(255, 0, 0, 255) -- The shock wave color
	local dmg = 20 -- How much damage should the shock wave do?
	local myPos = self:GetPos()
	for _, v in ipairs(ents.FindInSphere(myPos, 200)) do
		if v != self && v:GetClass() == "npc_vj_cofraomc_hellhound" then
			friNum = friNum + 1
	end
end
	-- More allies = more damage and different colors
	if friNum == 1 then
		--color = Color(101, 133, 221)
		dmg = 40
	elseif friNum == 2 then
		--color = Color(67, 85, 255)
		dmg = 60
	elseif friNum >= 3 then
		--color = Color(62, 33, 211)
		dmg = 80
end

	-- flags 0 = No fade!
	effects.BeamRingPoint(myPos, 0.3, 2, 400, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})
	effects.BeamRingPoint(myPos, 0.3, 2, 200, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})
	
	if self.HasSounds && GetConVar("vj_npc_sd_meleeattack"):GetInt() == 0 then
		VJ.EmitSound(self, {"vj_cofr/aom/hellhound/he_blast1.wav","vj_cofr/aom/hellhound/he_blast2.wav","vj_cofr/aom/hellhound/he_blast3.wav"}, 100, math.random(80,100))
end
	VJ.ApplyRadiusDamage(self, self, myPos, 200, dmg, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetSkin(2)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/