AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/sawer.mdl"} 
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 80
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
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
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/sawrunner/chainsaw_attack_hit.wav"
}		
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/sawrunner/chainsaw_attack_miss.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/sawer/sawer.mp3"
}
ENT.BreathSoundLevel = 75
-- Custom
ENT.Sawer_IsHurt = false
ENT.Sawer_NotHurt = true
ENT.Eye_Close = true
ENT.Eye_Open = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sawer_CustomOnInitialize()
    self.SoundTbl_Breath = {
	"vj_cofr/cof/sawer/chainsaw_loop.wav"
}
    self.SoundTbl_Alert = {
	"vj_cofr/cof/sawer/sawer_alert10.wav",
	"vj_cofr/cof/sawer/sawer_alert20.wav",
	"vj_cofr/cof/sawer/sawer_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/sawer/sawer_attack1.wav",
	"vj_cofr/cof/sawer/sawer_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/sawer/sawer_pain1.wav",
	"vj_cofr/cof/sawer/sawer_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize(hitgroup)
    if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH or hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTLEG or hitgroup == HITGROUP_LEFTLEG or hitgroup == 8 then
		self:AddFlags(FL_NOTARGET)		
elseif hitgroup == 9 then
        self:RemoveFlags(FL_NOTARGET)		
end
     --VJ_EmitSound(self, "vj_cofr/sawer/chainsaw_start.wav", 85, 100)
	 --ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chainsaw"))
     self:SetCollisionBounds(Vector(15, 15, 105), Vector(-15, -15, 0))
     self:Sawer_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if hitgroup == HITGROUP_HEAD or hitgroup == HITGROUP_CHEST or hitgroup == HITGROUP_STOMACH or hitgroup == HITGROUP_RIGHTARM or hitgroup == HITGROUP_LEFTARM or hitgroup == HITGROUP_RIGHTLEG or hitgroup == HITGROUP_LEFTLEG or hitgroup == 8 then
	    dmginfo:ScaleDamage(0.00)	
elseif hitgroup == 9 then
	    dmginfo:ScaleDamage(0.001)		
end
     local attacker = dmginfo:GetAttacker()
     if self.Sawer_NotHurt == true && self.Sawer_IsHurt == false && math.random(1,20) == 1 && self.Eye_Close == true then 
        self:VJ_ACT_PLAYACTIVITY(ACT_COWER,true,5.9,false)
		VJ_EmitSound(self, "vj_cofr/cof/sawer/eye_open.wav", 85, 100)
		self:SetSkin(1)
		dmginfo:ScaleDamage(0.005)
		self.Eye_Close = false
		self.Eye_Open = true
		self.Sawer_IsHurt = true
		self.Sawer_NotHurt = false
        self.MovementType = VJ_MOVETYPE_STATIONARY
        self.DisableChasingEnemy = true
        self.DisableWandering = true
        self.CanTurnWhileStationary = false
        self.CanFlinch = 0
        self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))		

      timer.Simple(6,function()
      if IsValid(self) then
	     self:SetSkin(0)
	  	 self.Eye_Close = true
		 self.Eye_Open = false
		 
      timer.Simple(0.5,function()
      if IsValid(self) then
		 self.Sawer_IsHurt = false
		 self.Sawer_NotHurt = true 
         self.MovementType = VJ_MOVETYPE_GROUND
         self.DisableChasingEnemy = false
         self.DisableWandering = false
         self.CanFlinch = 1	
		 self:SetCollisionBounds(Vector(15, 15, 105), Vector(-15, -15, 0))
end		 
end)		 
end
end)
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:SetSkin(0)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/