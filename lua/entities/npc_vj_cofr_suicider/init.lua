AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/suicider.mdl"} 
ENT.StartHealth = 70
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
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.NextRangeAttackTime = 0.5
ENT.NextRangeAttackTime_DoRand = 0.1
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 250 
ENT.NoChaseAfterCertainRange_CloseDistance = 200 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.CanTurnWhileMoving = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = {ACT_DIE_HEADSHOT} 
ENT.DeathCorpseEntityClass = "prop_vj_animatable" 
ENT.GibOnDeathDamagesTable = {"All"}
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
ENT.SoundTbl_Glock = {
"vj_cofr/cof/suicider/suicider_glock_fire.wav"
}
ENT.SoundTbl_P345 = {
"vj_cofr/cof/weapons/p345/p345_fire.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.RangeAttackSoundLevel = 90
-- Custom
ENT.Suicider_Glock = false
ENT.Suicider_P345 = false
ENT.Suicider_DeathSuicide = false
ENT.Suicider_Skin = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
 if GetConVar("VJ_COFR_Suicider_NewSound"):GetInt() == 1 then
    self.SoundTbl_Glock = {
    "vj_cofr/cof/weapons/glock/glock_fire.wav"
}
end
 if GetConVar("VJ_COFR_Suicider_ExtraPistol"):GetInt() == 0 then self.Suicider_Glock = true return end
    local Suicider_Type = math.random(1,2)
	if Suicider_Type == 1 then
		self.Suicider_Glock = true
    elseif Suicider_Type == 2 then
		self.Suicider_P345 = true		
    end
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/slower/slower_alert10.wav",
	"vj_cofr/cof/slower/slower_alert20.wav",
	"vj_cofr/cof/slower/slower_alert30.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
 if math.random(1,3) == 1 then
	self.NoChaseAfterCertainRange = false
end	 
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Suicider_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	elseif key == "suicide" then
        VJ.EmitSound(self, {"vj_cofr/fx/distant/glock_distant2.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))
	if self.Suicider_Glock then
        VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
    elseif self.Suicider_P345 then
        VJ.EmitSound(self, self.SoundTbl_P345, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
end
		self:FireFX()
		self:DropGlock()
		VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
        if self.Suicider_Skin == 0 then self:SetBodygroup(0,1)
	    elseif self.Suicider_Skin == 1 then self:SetBodygroup(0,3)
        elseif self.Suicider_Skin == 2 then self:SetBodygroup(0,5) end	
	 if self.HasGibDeathParticles && self.Suicider_Skin != 3 && self.Suicider_Skin != 4 then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		effectData:SetColor(colorRed)
		effectData:SetScale(25)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(5)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
end	 	
	elseif key == "death" then
		VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
	    /*local effectdata = EffectData()
	    effectdata:SetOrigin(self:GetPos())
	    effectdata:SetScale(10)
	    util.Effect("watersplash",effectdata)*/
	    end
    end			
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireFX()
	local muz = ents.Create("env_sprite")
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
	muz:Fire("SetParentAttachment","pistol_muzzle")
	muz:SetAngles(Angle(math.random(-100, 100), math.random(-100, 100), math.random(-100, 100)))
	muz:Spawn()
	muz:Activate()
	muz:Fire("Kill","",0.08)

	local Light = ents.Create("light_dynamic")
	Light:SetKeyValue("brightness", "4")
	Light:SetKeyValue("distance", "120")
	Light:SetPos(self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos)
	Light:SetLocalAngles(self:GetAngles())
	Light:Fire("Color", "255 150 60")
	Light:SetParent(self)
	Light:Spawn()
	Light:Activate()
	Light:Fire("TurnOn","",0)
	Light:Fire("Kill","",0.07)
	self:DeleteOnRemove(Light)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
	ply:ChatPrint("JUMP: Suicide")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    local ent = self:GetEnemy()
	if !IsValid(ent) or self.Dead then return end
	local EnemyDistance = self:GetPos():Distance(ent:GetPos())
	if EnemyDistance <= 100 && ent:Visible(self) && !self.Suicider_DeathSuicide && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
		self.Suicider_DeathSuicide = true
		self.Bleeds = false
		self:TakeDamage(self:Health())
		self.Bleeds = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()	
  local ene = self:GetEnemy()
  if IsValid(self) && IsValid(self:GetEnemy()) then
    if self.Suicider_Glock then
		VJ.EmitSound(self, self.SoundTbl_Glock, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))		
    elseif self.Suicider_P345 then
		VJ.EmitSound(self, self.SoundTbl_P345, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b))
end
    VJ.EmitSound(self, {"vj_cofr/fx/distant/glock_distant2.wav"}, 140, self:VJ_DecideSoundPitch(100, 110))
	self:FireBullets({
    Attacker = self,
	Num = 1,
	Src = self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos,
	Dir = (ene:GetPos() + ene:OBBCenter() - self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos):Angle():Forward(),
	Spread = Vector(0.1,0.1,0),
	TracerName = "VJ_COFR_Tracer",
	Tracer = 1,
	Damage = 10,
    Force = 5,
	AmmoType = "Pistol",
	Distance = 2048,
	HullSize = 1
 })
end			
	self:FireFX()	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if GetConVar("VJ_COFR_Suicider_Headshot"):GetInt() == 0 then return end	
	if hitgroup == HITGROUP_HEAD then
		dmginfo:SetDamage(self:Health())
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    if self.Suicider_Skin == 3 or self.Suicider_Skin == 4 then return end 	
	if !self.Suicider_DeathSuicide && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 600 then
	   dmginfo:SetDamage(self:Health())
    if self.Suicider_Skin == 0 then self:SetBodygroup(0,1)
	elseif self.Suicider_Skin == 1 then self:SetBodygroup(0,3)
    elseif self.Suicider_Skin == 2 then self:SetBodygroup(0,5) end	
	
	if self.HasGibDeathParticles then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		effectData:SetColor(colorRed)
		effectData:SetScale(25)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(5)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
end
		VJ.EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)	
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())					
		return true,{DeathAnim=true}
end
    VJ_COFR_DeathCode(self)		
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self:IsMoving() then 
	   self.AnimTbl_Death = {ACT_DIESIMPLE}	
	else
       self.AnimTbl_Death = {ACT_DIE_HEADSHOT}		
end
     if !self.Suicider_DeathSuicide then
        self:DropGlock()
     else
	    self.AnimTbl_Death = {ACT_DIE_GUTSHOT}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropGlock() 
    if GetConVar("VJ_COFR_Suicider_DropGlock"):GetInt() == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end	
	   self:SetBodygroup(1,1)		 
    if self.Suicider_Glock then	   
	   local Glock = ents.Create("weapon_cof_glock")
	   Glock:SetPos(self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos)
	   Glock:SetAngles(self:GetAngles())   
	   Glock:Spawn()
	   Glock:Activate()	   
	elseif self.Suicider_P345 then
	   local P345 = ents.Create("weapon_cof_p345")
	   P345:SetPos(self:GetAttachment(self:LookupAttachment("pistol_muzzle")).Pos)
	   P345:SetAngles(self:GetAngles())   
	   P345:Spawn()
	   P345:Activate()	   
    end	   
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo,hitgroup) return false end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
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