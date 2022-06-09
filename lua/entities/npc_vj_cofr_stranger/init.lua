AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/stranger.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = false 
ENT.ConstantlyFaceEnemy = true 
ENT.ConstantlyFaceEnemy_IfAttacking = true 
ENT.ConstantlyFaceEnemy_Postures = "Standing" 
ENT.ConstantlyFaceEnemyDistance = 500 
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 300 
ENT.NoChaseAfterCertainRange_CloseDistance = 1 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the controller when the camera is in third person
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
ENT.SoundTbl_Stranger_HeartBeat = {
"vj_cofr/cof/stranger/st_hearbeat.wav"
}
ENT.BreathSoundLevel = 75
-- Custom
ENT.Stranger_DamageDistance = 500
ENT.Stranger_NextEnemyDamage = 0
ENT.Stranger_UsingDamageEffect = false
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
    if math.random(1,3) == 1 then
	 self.NoChaseAfterCertainRange_FarDistance = 100 
end
     self:SetCollisionBounds(Vector(13, 13, 82), Vector(-13, -13, 0))
     self:Stranger_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Stranger_Damage()
	net.Start("vj_cofr_stranger_damage")
	net.WriteEntity(self)
	net.WriteEntity(self:GetEnemy())
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomAttack()
	if self.DeathAnimationCodeRan then return end	
    if GetConVarNumber("vj_npc_norange") == 1 then self.NoChaseAfterCertainRange = false return end	
    local ent = self:GetEnemy()	
	if self:GetPos():Distance(ent:GetPos()) > self.Stranger_DamageDistance or !IsValid(ent) or !self:Visible(ent) then return end
	if CurTime() > self.Stranger_NextEnemyDamage then
	if self.HasSounds then VJ_EmitSound(ent, self.SoundTbl_Stranger_HeartBeat, self.RangeAttackSoundLevel, self.RangeAttackPitch) end
		ent:TakeDamage(10,self,self)
        self:Stranger_Damage() 
	    self.Stranger_NextEnemyDamage = CurTime() + 0.5			
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
if math.random(1,50) && self.DeathAnimationCodeRan then
     self:SetRenderFX(kRenderFxFlickerSlow)
     self:SetRenderMode(RENDERMODE_NORMAL)
end	 
  if GetConVarNumber("VJ_COFR_Stranger_ScreenEffect") == 0 then return end
  if !IsValid(self:GetEnemy()) or !self:GetEnemy():Visible(self) or self.DeathAnimationCodeRan then self.Stranger_UsingDamageEffect = false RunConsoleCommand("pp_colormod", "0") return end
    if self:GetEnemy():IsPlayer() then
  	local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())  
	if self.Stranger_UsingDamageEffect && EnemyDistance > self.Stranger_DamageDistance then self.Stranger_UsingDamageEffect = false RunConsoleCommand("pp_colormod", "0") return end
    if !self.Stranger_UsingDamageEffect && EnemyDistance < self.Stranger_DamageDistance then
       self.Stranger_UsingDamageEffect = true	
	   RunConsoleCommand("pp_colormod", "1")
	   RunConsoleCommand("pp_colormod_brightness", "-0.10")
	   RunConsoleCommand("pp_colormod_contrast", "0.50")
	  end
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
  local Deathanim = math.random(1,4)
	 if Deathanim == 1 then
		self.DeathAnimationTime = 1.25
     elseif Deathanim == 2 then
		self.DeathAnimationTime = 1.00
     elseif Deathanim == 3 then
		self.DeathAnimationTime = 0.85
     elseif Deathanim == 4 then
		self.DeathAnimationTime = 0.75			
end
	VJ_COFR_DeathCode(self)	
end  
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove() 
  if self.Stranger_UsingDamageEffect then
        RunConsoleCommand("pp_colormod", "0")
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