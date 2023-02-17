AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/drowned.mdl"} 
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}  
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = {"vjseq_attack"} 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14 
ENT.MeleeAttackDistance = 15 
ENT.MeleeAttackDamageDistance = 35
ENT.HasRangeAttack = true 
ENT.DisableDefaultRangeAttackCode = true 
ENT.AnimTbl_RangeAttack = {"vjseq_point"} 
ENT.RangeDistance = 500 
ENT.RangeToMeleeDistance = 300
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 15
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 500 
ENT.NoChaseAfterCertainRange_CloseDistance = 300 
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 8 
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
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/crazylady/knife_hitbody1.wav",
"vj_cofr/cof/crazylady/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/crazylady/knife_swing.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Drowned_Suicide = {
"vj_cofr/cof/crazylady/suicide_attempt.wav"
}
-- Custom
ENT.Drowned_Baby = false
ENT.Drowned_DamageDistance = 500
ENT.Drowned_NextEnemyDamageT = 0

util.AddNetworkString("VJ_COFR_Drowned_Damage")

local nwName = "VJ_COFR_Drowned_Controller"
util.AddNetworkString(nwName)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/crazylady/lady_alert10.wav",
	"vj_cofr/cof/crazylady/lady_alert20.wav",
	"vj_cofr/cof/crazylady/lady_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/crazylady/lady_attack1.wav",
	"vj_cofr/cof/crazylady/lady_attack2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
	"vj_cofr/cof/crazylady/lady_attack1.wav",
	"vj_cofr/cof/crazylady/lady_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/crazylady/lady_pain1.wav",
	"vj_cofr/cof/crazylady/lady_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/crazylady/lady_pain1.wav",
	"vj_cofr/cof/crazylady/lady_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    if math.random(1,3) == 1 then
	 self.NoChaseAfterCertainRange = false
end
     self:SetCollisionBounds(Vector(13, 13, 80), Vector(-13, -13, 0))
     self:Drowned_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
end
	if key == "attack_range" then
		self:RangeAttackCode()
end	
	if key == "baby_appear" then
		VJ_EmitSound(self,"vj_cofr/cof/crazylady/baby_burst.wav", 75, 100)
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("baby")).Pos,self:GetAngles())
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
function ENT:Controller_Initialize(ply)
	local opt1, opt2, opt3 = self, self:GetClass(), self.VJ_TheControllerEntity
    net.Start(nwName)
		net.WriteBool(false)
		net.WriteEntity(opt1)
		net.WriteString(opt2)
		net.WriteEntity(ply)
		net.WriteEntity(opt3)
        net.Send(ply)

	function self.VJ_TheControllerEntity:CustomOnStopControlling()
		net.Start(nwName)
			net.WriteBool(true)
			net.WriteEntity(opt1)
			net.WriteString(opt2)
			net.WriteEntity(ply)
			net.WriteEntity(opt3)
		    net.Send(ply)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_Damage()
	net.Start("VJ_COFR_Drowned_Damage")
	net.WriteEntity(self)
	net.WriteEntity(self:GetEnemy())
	net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
	if GetConVar("vj_npc_norange"):GetInt() == 1 or self.Dead then return end	
	local ent = self:GetEnemy()
    local cont = self.VJ_TheController
	if IsValid(cont) then
		for _,v in pairs(ents.FindInSphere(ent:GetPos(),10)) do
			if v != self && v != ent && (v:IsNPC() or v:IsPlayer()) then
				ent = v
			break
		end
	end
end	
	if self:GetPos():Distance(ent:GetPos()) > self.Drowned_DamageDistance or !IsValid(ent) or !self:Visible(ent) then return end
	if CurTime() > self.Drowned_NextEnemyDamageT then
	if self.HasSounds then self.Drowned_Suicide = VJ_CreateSound(ent, self.SoundTbl_Drowned_Suicide, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b)) end
	timer.Simple(5,function() if IsValid(self) && IsValid(ent) && ent:Visible(self) && !self.Dead then
		ent:TakeDamage(200,self,self)
        self:Drowned_Damage()
		self.Drowned_NextEnemyDamageT = self.NextRangeAttackTime
            end		
        end)		
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Baby Burst")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    if !IsValid(self:GetEnemy()) or self.Dead or self.Drowned_Baby then return end	
	if !self.Drowned_Baby && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 70 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
		self.Drowned_Baby = true
		self.HasMeleeAttack = true
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,false,false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ_STOPSOUND(self.Drowned_Suicide)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/