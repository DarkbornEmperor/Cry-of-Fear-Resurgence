AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/suicider.mdl"} 
ENT.StartHealth = 70
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true 
ENT.DisableDefaultRangeAttackCode = true 
ENT.DisableRangeAttackAnimation = true 
ENT.RangeAttackAnimationStopMovement = false 
ENT.RangeDistance = 2000 
ENT.RangeToMeleeDistance = 1 
ENT.TimeUntilRangeAttackProjectileRelease = 0.1
ENT.NextRangeAttackTime = 0.5
ENT.NextRangeAttackTime_DoRand = 0.1
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 250 
ENT.NoChaseAfterCertainRange_CloseDistance = 200 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.CombatFaceEnemy = false
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIE_HEADSHOT} 
ENT.DeathAnimationTime = 8 
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
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.RangeAttackSoundLevel = 100
-- Custom
ENT.DropCoFAmmo = {"weapon_cof_syringe","ent_cof_glock_ammo","ent_cof_g43_ammo","ent_cof_m16_ammo","ent_cof_p345_ammo","ent_cof_revolver_ammo","ent_cof_rifle_ammo","ent_cof_shotgun_ammo","ent_cof_tmp_ammo","ent_cof_vp70_ammo"}
ENT.Suicider_DeathSuicide = false
ENT.Suicider_FiredAtLeastOnce = false
ENT.Suicider_Skin = 0
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
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
     self:Suicider_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "suicide" then
		self:Suicider_DoFireEffects()
		VJ_EmitSound(self,"vj_cofr/cof/suicider/suicider_glock_fire.wav", 100, 100)
		VJ_EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())
        self:SetBodygroup(0,1)		
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_DoFireEffects()
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled == true or !IsValid(self:GetEnemy()) or self.DeathAnimationCodeRan then return end
	local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())
	if EnemyDistance <= 100 && self:GetEnemy():Visible(self) && self.Suicider_FiredAtLeastOnce == true then
		self.Suicider_DeathSuicide = true
		self.Bleeds = false
		self:TakeDamage(self:Health())
		self.Bleeds = true
		return
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	local bullet = {}
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-45) -self:GetPos()
		bullet.Spread = Vector(50,40,30)
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 5
		bullet.Damage = 10
		bullet.AmmoType = "SMG1"
	    self:FireBullets(bullet)
		VJ_EmitSound(self, "vj_cofr/cof/suicider/suicider_glock_fire.wav", 100, 100)
	    self.Suicider_FiredAtLeastOnce = true
	    self:Suicider_DoFireEffects()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    if GetConVarNumber("VJ_COFR_Suicider_Headshot") == 0 then return end	
	if hitgroup == HITGROUP_HEAD then
		dmginfo:SetDamage(self:Health())
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)   	
	if self.Suicider_DeathSuicide == false && hitgroup == HITGROUP_HEAD && dmginfo:GetDamageForce():Length() > 600 then
	    dmginfo:SetDamage(self:Health())
		self:SetBodygroup(0,1)
	
	if self.HasGibDeathParticles == true then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
		bloodeffect:SetScale(30)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		bloodspray:SetScale(4)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
end
		VJ_EmitSound(self, "vj_cofr/cof/baby/b_attack"..math.random(1,2)..".wav", 75, 100)	
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())					
		return true,{DeathAnim=true}
	end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self:IsMoving() then 
	   self.AnimTbl_Death = {ACT_DIESIMPLE}	
	else
       self.AnimTbl_Death = {ACT_DIE_HEADSHOT}		
end
    if self.Suicider_DeathSuicide == false then
       self:DropGlock()
end	   
	if self.Suicider_DeathSuicide == true then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT}
		timer.Simple(0.5,function()
			if IsValid(self) then
			   self:DropGlock()
				if self.HasGibDeathParticles == true then
					local bloodeffect = EffectData()
					bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
					bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
					bloodeffect:SetScale(50)
					util.Effect("VJ_Blood1",bloodeffect)
				    local bloodspray = EffectData()
		            bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		            bloodspray:SetScale(4)
		            bloodspray:SetFlags(3)
		            bloodspray:SetColor(0)
		            util.Effect("bloodspray",bloodspray)
		            util.Effect("bloodspray",bloodspray)
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DropGlock() 
    if GetConVarNumber("VJ_COFR_Suicider_DropGlock") == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end	
	   self:SetBodygroup(1,1)	   
	   local Glock = ents.Create("weapon_cof_glock")
	   Glock:SetPos(self:GetAttachment(self:LookupAttachment("pistol")).Pos)
	   Glock:SetLocalAngles(self:GetAngles())   
	   //Glock:SetParent(self)
	   Glock:Spawn()
	   Glock:Activate()
	   //self:DeleteOnRemove(Glock)	 	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup) 
return false 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup) 
    self:SetSolid(SOLID_NONE) 
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
       if GetConVarNumber("VJ_COFR_DropAmmo") == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end
	   local pickedAmmoType = VJ_PICK(self.DropCoFAmmo)
	   if pickedAmmoType != false then	   
	   local AmmoDrop = ents.Create(pickedAmmoType)	   
	   AmmoDrop:SetPos(self:GetPos() + self:OBBCenter())
	   AmmoDrop:SetLocalAngles(self:GetAngles())	   
	   //AmmoDrop:SetParent(self)
	   AmmoDrop:Spawn()
	   AmmoDrop:Activate()
	   //self:DeleteOnRemove(AmmoDrop)
	   
		local phys = AmmoDrop:GetPhysicsObject()
			if IsValid(phys) then
				local dmgForce = (self.SavedDmgInfo.force / 40)
				if self.DeathAnimationCodeRan then
					dmgForce = self:GetMoveVelocity() == defPos
end
				phys:SetMass(1)
				phys:ApplyForceCenter(dmgForce)
		end		
	end		
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