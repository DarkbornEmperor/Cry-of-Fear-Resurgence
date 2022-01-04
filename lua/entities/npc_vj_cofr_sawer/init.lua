AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/sawer.mdl"} 
ENT.StartHealth = 120
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.TurningSpeed = 10
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 200 
ENT.MeleeAttackDistance = 40 
ENT.MeleeAttackDamageDistance = 70
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false 
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 10
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -80), -- The offset for the controller when the camera is in third person
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
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
-- Custom
ENT.Sawer_IsHurt = false
ENT.Sawer_NotHurt = true
ENT.Sawer_EyeClose = true
ENT.Sawer_EyeOpen = false
ENT.Sawer_NextDownTimeT = 0
ENT.Sawer_NextFlinchTimeT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end
end
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
    self.SoundTbl_Death = {
	"vj_cofr/cof/sawer/sawer_pain1.wav",
	"vj_cofr/cof/sawer/sawer_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     --VJ_EmitSound(self, "vj_cofr/sawer/chainsaw_start.wav", 85, 100)
	 --ParticleEffectAttach("smoke_exhaust_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chainsaw"))
     self:SetCollisionBounds(Vector(18, 18, 108), Vector(-18, -18, 0))
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
     if self.Sawer_NotHurt == true && self.Sawer_IsHurt == false && CurTime() > self.Sawer_NextFlinchTimeT && math.random(1,12) == 1 then
        self:VJ_ACT_PLAYACTIVITY(ACT_SMALL_FLINCH,true,false,false) 
		self.Sawer_NextFlinchTimeT = CurTime() + math.random(5,8)
end	 
     if hitgroup == 9 && self.Sawer_EyeOpen == true && self.Sawer_EyeClose == false then
	    dmginfo:ScaleDamage(0.10)
     else	
       	dmginfo:ScaleDamage(0.00) 
end
                  if self.Sawer_NotHurt == true && self.Sawer_IsHurt == false && CurTime() > self.Sawer_NextDownTimeT && math.random(1,20) == 1 && self.Sawer_EyeClose == true then 
                     self:VJ_ACT_PLAYACTIVITY(ACT_COWER,true,false,false)
		             VJ_EmitSound(self, "vj_cofr/cof/sawer/eye_open.wav", 75, 100)
		             self:SetSkin(1)
		             self.Sawer_EyeClose = false
		             self.Sawer_EyeOpen = true
		             self.Sawer_IsHurt = true
		             self.Sawer_NotHurt = false
                     self.MovementType = VJ_MOVETYPE_STATIONARY
                     self.CanTurnWhileStationary = false
                     self.CanFlinch = 0
                     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))		

                  timer.Simple(6,function()
                  if IsValid(self) then
	                 self:SetSkin(0)
	  	             self.Sawer_EyeClose = true
		             self.Sawer_EyeOpen = false
		 
                  timer.Simple(0.3,function()
                  if IsValid(self) then
		             self.Sawer_IsHurt = false
		             self.Sawer_NotHurt = true	 
                     self.MovementType = VJ_MOVETYPE_GROUND
                     self.CanFlinch = 1	
		             self:SetCollisionBounds(Vector(15, 15, 105), Vector(-15, -15, 0))
		             self.Sawer_NextDownTimeT = CurTime() + math.random(5,8) 
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/