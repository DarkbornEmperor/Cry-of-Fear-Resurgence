AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/suicider.mdl"} 
ENT.StartHealth = 70
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.HasRangeAttack = true 
ENT.DisableDefaultRangeAttackCode = true 
ENT.DisableRangeAttackAnimation = true 
ENT.AnimTbl_RangeAttack = {ACT_IDLE} 
ENT.RangeAttackAnimationStopMovement = false 
ENT.RangeDistance = 2000 
ENT.RangeToMeleeDistance = 1 
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 0.5
ENT.NextAnyAttackTime_Range = 0.1 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE} 
ENT.DeathAnimationTime = 8 
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
"vj_cofr/common/npc_step1.wav"
}
ENT.SoundTbl_RangeAttack = {
"vj_cofr/suicider/suicider_glock_fire.wav"
}
-- Custom
ENT.Suicider_DeathSuicide = false
ENT.Suicider_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_CustomOnInitialize()

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
     self:Suicider_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
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
	if self.Dead == true then return end
	if !IsValid(self:GetEnemy()) then return end
	local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())
	/*if GetConVarNumber("vj_npc_nochasingenemy") == 0 then 
	if EnemyDistance >= self.RangeDistance && EnemyDistance <= 100 then
		self.DisableChasingEnemy = true else self.DisableChasingEnemy = false
		end
	end*/
	if EnemyDistance <= 100 && self:GetEnemy():Visible(self) && self.Suicider_FiredAtLeastOnce == true then
		self.Suicider_DeathSuicide = true
		self.Bleeds = false
		self:TakeDamage(999999999999999,self,self)
		self.Bleeds = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	local bullet = {}
		bullet.Num = 1
		bullet.Src = self:GetAttachment(self:LookupAttachment("pistol")).Pos
		bullet.Dir = (self:GetEnemy():GetPos()+self:GetEnemy():OBBCenter()+self:GetEnemy():GetUp()*-45) -self:GetPos()
		bullet.Spread = 0.001
		bullet.Tracer = 1
		bullet.TracerName = "Tracer"
		bullet.Force = 5
		bullet.Damage = 20
		bullet.AmmoType = "SMG1"
	self:FireBullets(bullet)
	self.Suicider_FiredAtLeastOnce = true
	self:Suicider_DoFireEffects()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self.Suicider_DeathSuicide == true then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT}
		timer.Simple(0.5,function()
			if IsValid(self) then
				self:Suicider_DoFireEffects()
				self:SetBodygroup(0,1)
				VJ_EmitSound(self,"vj_cofr/suicider/suicider_glock_fire.wav",100)
				VJ_EmitSound(self,"vj_cofr/common/bodysplat.wav",85)
				ParticleEffect("vj_hl_blood_red_large",self:GetAttachment(self:LookupAttachment("head")).Pos,self:GetAngles())	
				--self:PlayGibOnDeathSounds(dmginfo,hitgroup)
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/