AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/doctor.mdl"} 
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeDistance = 2000
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 1
ENT.NextAnyAttackTime_Range = 1
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 600 
ENT.NoChaseAfterCertainRange_CloseDistance = 1 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.CombatFaceEnemy = false
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
"vj_cofr/cof/simon/concrete1.wav",
"vj_cofr/cof/simon/concrete2.wav",
"vj_cofr/cof/simon/concrete3.wav",
"vj_cofr/cof/simon/concrete4.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/doc_ai/despair.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Revolver = {
"vj_cofr/cof/weapons/revolver/revolver_fire.wav"
}
ENT.SoundTbl_P345 = {
"vj_cofr/cof/weapons/p345/p345_fire.wav"
}
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.Doctor_Revolver = false
ENT.Doctor_Pistol = false
ENT.Doctor_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    local Doctor_Type = math.random(1,2)
	if Doctor_Type == 1 then
		self.Doctor_Revolver = true
    elseif Doctor_Type == 2 then
		self.Doctor_Pistol = true		
end
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_CustomOnInitialize()
/*
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
*/
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
		self:SetPistol()
    elseif self.Doctor_Revolver then
		self:SetRevolver()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
     self:Doctor_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetRevolver()
	self:SetBodygroup(0,1)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetPistol()
	self:SetBodygroup(0,0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_DoFireEffects()
	muz = ents.Create("env_sprite")
	muz:SetKeyValue("model","vj_cofr/sprites/muzzleflash.vmt")
	muz:SetKeyValue("scale",""..math.Rand(0.3,0.5))
	muz:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
	muz:SetKeyValue("HDRColorScale","1.0")
	muz:SetKeyValue("renderfx","14")
	muz:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
	muz:SetKeyValue("renderamt","255") -- Transparency
	muz:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
	muz:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
	muz:SetKeyValue("spawnflags","0")
	muz:SetParent(self)
	muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)

	Light = ents.Create("light_dynamic")
	Light:SetKeyValue("brightness", "4")
	Light:SetKeyValue("distance", "120")
	Light:SetLocalAngles(self:GetAngles())
	Light:Fire("Color", "255 150 60")
	Light:SetParent(self)
	Light:Spawn()
	Light:Activate()
	Light:Fire("TurnOn","",0)
	Light:Fire("Kill","",0.07)
	self:DeleteOnRemove(Light)
	
    if self.Doctor_Revolver then
	   muz:Fire("SetParentAttachment","revolver")
	   Light:SetPos(self:GetAttachment(self:LookupAttachment("revolver")).Pos)

    elseif self.Doctor_Pistol then
	   muz:Fire("SetParentAttachment","pistol")
	   Light:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	local bullet = {}
	bullet.Num = 1
	bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-35) -self:GetPos()
	bullet.Spread = Vector(50,40,30)
	bullet.Tracer = 1
	bullet.TracerName = "Tracer"
	bullet.Force = 4
	bullet.AmmoType = "SMG1"
		
    if self.Doctor_Revolver then
		bullet.Src = self:GetAttachment(self:LookupAttachment("revolver")).Pos
		bullet.Damage = 13
		VJ_EmitSound(self, self.SoundTbl_Revolver, self.RangeAttackSoundLevel, self.RangeAttackPitch)
		
    elseif self.Doctor_Pistol then
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol")).Pos
		bullet.Damage = 15
		VJ_EmitSound(self, self.SoundTbl_P345, self.RangeAttackSoundLevel, self.RangeAttackPitch)
end	
    self:FireBullets(bullet)
	self.Doctor_FiredAtLeastOnce = true
	self:Doctor_DoFireEffects()	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
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