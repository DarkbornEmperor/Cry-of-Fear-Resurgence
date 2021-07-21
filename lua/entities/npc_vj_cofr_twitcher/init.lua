AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {
"models/vj_cofr/zombie.mdl",
"models/vj_cofr/zombie2.mdl",
"models/vj_cofr/zombie3.mdl",
"models/vj_cofr/zombie4.mdl",
"models/vj_cofr/zombie5.mdl",
"models/vj_cofr/zombie2_1.mdl",
"models/vj_cofr/zombie2_2.mdl",
"models/vj_cofr/zombie2_3.mdl",
"models/vj_cofr/zombie2_4.mdl",
"models/vj_cofr/zombie2_5.mdl",
"models/vj_cofr/zombie3_1.mdl",
"models/vj_cofr/zombie3_2.mdl",
"models/vj_cofr/zombie3_3.mdl",
"models/vj_cofr/zombie3_4.mdl",
"models/vj_cofr/zombie3_5.mdl",
"models/vj_cofr/zombie4_1.mdl",
"models/vj_cofr/zombie4_2.mdl",
"models/vj_cofr/zombie4_3.mdl",
"models/vj_cofr/zombie4_4.mdl",
"models/vj_cofr/zombie4_5.mdl"
} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_hl_blood_red"}
ENT.CustomBlood_Decal = {"VJ_HLR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.SlowPlayerOnMeleeAttack = true
ENT.SlowPlayerOnMeleeAttack_WalkSpeed = 50
ENT.SlowPlayerOnMeleeAttack_RunSpeed = 50 
ENT.SlowPlayerOnMeleeAttackTime = 0.5
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH,ACT_BIG_FLINCH} 
ENT.HasHitGroupFlinching = true 
ENT.HitGroupFlinching_DefaultWhenNotHit = true
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {ACT_BIG_FLINCH}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {ACT_SMALL_FLINCH}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}},
{HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, 
{HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}
}
ENT.HasDeathAnimation = true 
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
ENT.SoundTbl_MeleeAttack = {
"vj_cofr/zombie/claw_strike1.wav",
"vj_cofr/zombie/claw_strike2.wav",
"vj_cofr/zombie/claw_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/zombie/claw_miss1.wav",
"vj_cofr/zombie/claw_miss2.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Twitcher_CustomOnInitialize()
local Twitcher_Sounds = math.random(1,2)
if Twitcher_Sounds == 1 then
    self.SoundTbl_Alert = {
	"vj_cofr/zombie/zo_alert10.wav",
	"vj_cofr/zombie/zo_alert20.wav",
	"vj_cofr/zombie/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/zombie/zo_attack1.wav",
	"vj_cofr/zombie/zo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/zombie/zo_pain1.wav",
	"vj_cofr/zombie/zo_pain2.wav"
}
elseif Twitcher_Sounds == 2 then
    self.SoundTbl_Alert = {
	"vj_cofr/zombie2/zo_alert10.wav",
	"vj_cofr/zombie2/zo_alert20.wav",
	"vj_cofr/zombie2/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/zombie2/zo_attack1.wav",
	"vj_cofr/zombie2/zo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/zombie2/zo_pain1.wav",
	"vj_cofr/zombie2/zo_pain2.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/zombie.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie2_1.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie3_1.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie4_1.mdl" then 
       self:SetBodygroup(0,math.random(0,3))
	   
elseif self:GetModel() == "models/vj_cofr/zombie2.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie2_2.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie3_2.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie4_2.mdl" then 
       self:SetBodygroup(0,math.random(0,2))
		   
elseif self:GetModel() == "models/vj_cofr/zombie3.mdl" 
	or self:GetModel() == "models/vj_cofr/zombie2_5.mdl"
	or self:GetModel() == "models/vj_cofr/zombie3_5.mdl"
	or self:GetModel() == "models/vj_cofr/zombie4_5.mdl"
	or self:GetModel() == "models/vj_cofr/zombie5_5.mdl" then 
       self:SetBodygroup(0,math.random(0,1))
end		
     self:Twitcher_CustomOnInitialize()
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
		VJ_EmitSound(self, "vj_cofr/common/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT,ACT_DIEVIOLENT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
   end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/