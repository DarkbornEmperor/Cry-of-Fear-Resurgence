AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/doctor.mdl"} 
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.AnimTbl_RangeAttack = {ACT_IDLE}
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 2600
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 1
ENT.NextAnyAttackTime_Range = 1
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 600 
ENT.NoChaseAfterCertainRange_CloseDistance = 1 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8
ENT.AnimTbl_Death = {ACT_DIESIMPLE} 
ENT.HasSoundTrack = true
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
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/doc_ai/despair.mp3"
}
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.Doctor_Revolver = true
ENT.Doctor_Pistol = false
ENT.Doctor_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,5) == 1 then
		self.Doctor_Pistol = true
end
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/doc_ai/be_careful_dont_make_me_angry.wav",
	"vj_cofr/cof/doc_ai/dont_make_me_angry.wav"
}
    self.SoundTbl_CombatIdle = {
	"vj_cofr/cof/doc_ai/simon_stop.wav",
	"vj_cofr/cof/doc_ai/stop.wav",
	"vj_cofr/cof/doc_ai/stop_doing_that.wav",
	"vj_cofr/cof/doc_ai/what_u_doin.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/doc_ai/ouch1.wav",
	"vj_cofr/cof/doc_ai/ouch2.wav",
	"vj_cofr/cof/doc_ai/ouch3.wav",
	"vj_cofr/cof/doc_ai/ouch4.wav",
	"vj_cofr/cof/doc_ai/ouch5.wav",
	"vj_cofr/cof/doc_ai/ouch6.wav",
	"vj_cofr/cof/doc_ai/ouch7.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/doc_ai/ouch1.wav",
	"vj_cofr/cof/doc_ai/ouch2.wav",
	"vj_cofr/cof/doc_ai/ouch3.wav",
	"vj_cofr/cof/doc_ai/ouch4.wav",
	"vj_cofr/cof/doc_ai/ouch5.wav",
	"vj_cofr/cof/doc_ai/ouch6.wav",
	"vj_cofr/cof/doc_ai/ouch7.wav"
}
	 if self.Doctor_Pistol then
	    self.Doctor_Revolver = false
		self:SetPistol()
end
	 if self.Doctor_Revolver then
	    self.Doctor_Pistol = false
		self:SetRevolver()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(13, 13, 80), Vector(-13, -13, 0))	
     self:Doctor_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetRevolver()
    self.SoundTbl_RangeAttack = {
    "vj_cofr/cof/doc_ai/revolver_fire.wav"
}
	self:SetBodygroup(0,1)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetPistol()
    self.SoundTbl_RangeAttack = {
    "vj_cofr/cof/doc_ai/p345_fire.wav"
}
	self:SetBodygroup(0,0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_DoFireEffects()
    if self.Doctor_Revolver then
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment("revolver")).Pos)
	flash:SetKeyValue("scale","1")
	flash:SetKeyValue("angles",tostring(self:GetForward():Angle()))
	flash:Fire("Fire",0,0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment("revolver")).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)
end
    if self.Doctor_Pistol then
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
	flash:SetKeyValue("scale","1")
	flash:SetKeyValue("angles",tostring(self:GetForward():Angle()))
	flash:Fire("Fire",0,0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)
end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
    if self.Doctor_Revolver then
	local bullet = {}
		bullet.Num = 4
		bullet.Src = self:GetAttachment(self:LookupAttachment("revolver")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-45) -self:GetPos()
		bullet.Spread = 1.5
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 20
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
	    self.Doctor_FiredAtLeastOnce = true
	    self:Doctor_DoFireEffects()
end
    if self.Doctor_Pistol then
	local bullet = {}
		bullet.Num = 4
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-45) -self:GetPos()
		bullet.Spread = 5.5
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 30
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
	    self.Doctor_FiredAtLeastOnce = true
	    self:Doctor_DoFireEffects()
end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/