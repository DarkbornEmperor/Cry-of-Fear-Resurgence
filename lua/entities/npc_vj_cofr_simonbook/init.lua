AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/booksimon.mdl"} 
ENT.StartHealth = 500
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.TimeUntilMeleeAttackDamage = false
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.AnimTbl_RangeAttack = {ACT_IDLE}
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeDistance = 2600
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 3
ENT.NextAnyAttackTime_Range = 3
ENT.NoChaseAfterCertainRange = false
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
ENT.SoundTbl_RangeAttack = {
"vj_cofr/cof/booksimon/shoot.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/booksimon/sledgehammer_hitbody.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/booksimon/sledgehammer_swing.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/booksimon/ending5.mp3",
"vj_cofr/cof/booksimon/fucked.mp3",
"vj_cofr/cof/booksimon/fucked2.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.BreathSoundLevel = 75
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.BookSimon_Shotgun = true
ENT.BookSimon_Sledgehammer = false
ENT.BookSimon_SledgehammerFlare = false
ENT.Booksimon_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.BookSimon_SledgehammerFlare = true
end	
	if math.random(1,3) == 1 then
		self.BookSimon_Sledgehammer = true
end	
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()
	 if self.BookSimon_SledgehammerFlare then
	    self.BookSimon_Shotgun = false
		self.BookSimon_Sledgehammer = false
		self:SetSledgehammerFlare()
end
	 if self.BookSimon_Sledgehammer then
	    self.BookSimon_Shotgun = false
		self.BookSimon_SledgehammerFlare = false
		self:SetSledgehammer()
end
	 if self.BookSimon_Shotgun then
	    self.BookSimon_Sledgehammer = false
		self.BookSimon_SledgehammerFlare = false
		self:SetShotgun()
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()	
     self:SetCollisionBounds(Vector(13, 13, 77), Vector(-13, -13, 0))
     self:BookSimon_CustomOnInitialize()	 
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetShotgun()
    self.AnimTbl_IdleStand = {ACT_IDLE}
    self.AnimTbl_Walk = {ACT_WALK}
	self.AnimTbl_Run = {ACT_WALK}
	self:SetBodygroup(0,1)
	self.HasMeleeAttack = false
	self.HasRangeAttack = true
	self.NoChaseAfterCertainRange = true
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammer()
    self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
    self.AnimTbl_Walk = {ACT_RUN_STIMULATED}
	self.AnimTbl_Run = {ACT_RUN_STIMULATED}
	self:SetBodygroup(0,4)
	self.HasMeleeAttack = true
	self.HasRangeAttack = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetSledgehammerFlare()
    self.AnimTbl_IdleStand = {ACT_IDLE_RELAXED}
    self.AnimTbl_Walk = {ACT_SPRINT}
	self.AnimTbl_Run = {ACT_SPRINT}
	self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
	self:SetBodygroup(0,4)
	self:SetBodygroup(2,1)
	self.HasMeleeAttack = true
	self.HasRangeAttack = false	
	VJ_EmitSound(self, "vj_cofr/cof/booksimon/flare_ignite.wav", 75, 100)
	self.SoundTbl_Breath = {
    "vj_cofr/cof/booksimon/flare_burn.wav"
}	
	self.StartLight1 = ents.Create("light_dynamic")
	self.StartLight1:SetKeyValue("brightness", "1")
	self.StartLight1:SetKeyValue("distance", "1000")
	self.StartLight1:SetLocalPos(self:GetPos())
	self.StartLight1:SetLocalAngles( self:GetAngles() )
	self.StartLight1:Fire("Color", "255 0 0")
	self.StartLight1:SetParent(self)
	self.StartLight1:Spawn()
	self.StartLight1:Activate()
	self.StartLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.StartLight1)

	ParticleEffectAttach("vj_cofr_flare_sparks",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))
	ParticleEffectAttach("vj_cofr_flare_trail",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("flare"))	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_DoFireEffects()
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment("shotgun")).Pos)
	flash:SetKeyValue("scale","1")
	flash:SetKeyValue("angles",tostring(self:GetForward():Angle()))
	flash:Fire("Fire",0,0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment("shotgun")).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn","",0)
	FireLight1:Fire("Kill","",0.07)
	self:DeleteOnRemove(FireLight1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	local bullet = {}
		bullet.Num = 4
		bullet.Src = self:GetAttachment(self:LookupAttachment("shotgun")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-35) -self:GetPos()
		bullet.Spread = Vector(20,20,20)
		bullet.Tracer = 6
		bullet.TracerName = "Tracer"
		bullet.Force = 4
		bullet.Damage = 10
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
	    self.BookSimon_FiredAtLeastOnce = true
	    self:BookSimon_DoFireEffects()
	    timer.Simple(0.5,function() if IsValid(self) then
	    VJ_EmitSound(self, "vj_cofr/cof/booksimon/pump_seq.wav", 75, 100)
     end	
  end)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.25)		
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