AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {} 
ENT.StartHealth = 110
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_SMALL_FLINCH} 
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
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/aom/zombie/claw_strike1.wav",
"vj_cofr/aom/zombie/claw_strike2.wav",
"vj_cofr/aom/zombie/claw_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/aom/zombie/claw_miss1.wav",
"vj_cofr/aom/zombie/claw_miss2.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Cuatom
ENT.Twitcher_Invisible = false
ENT.Twitcher_Transparent = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()	   
	if self:GetClass() == "npc_vj_cofraom_twitcher" then
		self.Model = {
        "models/vj_cofr/aom/zombie.mdl",
        "models/vj_cofr/aom/zombie2.mdl",
        "models/vj_cofr/aom/zombie3.mdl",
        "models/vj_cofr/aom/zombie4.mdl",
        "models/vj_cofr/aom/zombie5.mdl",
        "models/vj_cofr/aom/zombie2_1.mdl",
        "models/vj_cofr/aom/zombie2_2.mdl",
        "models/vj_cofr/aom/zombie2_3.mdl",
        "models/vj_cofr/aom/zombie2_4.mdl",
        "models/vj_cofr/aom/zombie2_5.mdl",
        "models/vj_cofr/aom/zombie3_1.mdl",
        "models/vj_cofr/aom/zombie3_2.mdl",
        "models/vj_cofr/aom/zombie3_3.mdl",
        "models/vj_cofr/aom/zombie3_4.mdl",
        "models/vj_cofr/aom/zombie3_5.mdl",
        "models/vj_cofr/aom/zombie4_1.mdl",
        "models/vj_cofr/aom/zombie4_2.mdl",
        "models/vj_cofr/aom/zombie4_3.mdl",
        "models/vj_cofr/aom/zombie4_4.mdl",
        "models/vj_cofr/aom/zombie4_5.mdl"		
}
 elseif self:GetClass() == "npc_vj_cofraom_twitcher_da" then
		self.Model = {
		"models/vj_cofr/aom/zombie_da.mdl"		
} 
 elseif self:GetClass() == "npc_vj_cofraom_twitcher_hd" then
		self.Model = {
		"models/vj_cofr/aom/zombiehd.mdl",
        "models/vj_cofr/aom/zombiehd2.mdl",
		"models/vj_cofr/aom/zombiehd3.mdl",
        "models/vj_cofr/aom/zombiehd4.mdl"		
}   
end
     if GetConVarNumber("VJ_COFR_Twitcher_Invisible") == 1 then
     if math.random(1,10) == 1 then
	    self.Twitcher_Invisible = true 
	    --self:SetNoDraw(true)
		self:SetMaterial("hud/killicons/default")
	    self:DrawShadow(false)

 elseif math.random(1,10) == 1 then
        self.Twitcher_Transparent = true
	    self:SetMaterial("vj_cofr/transparent")
		self:DrawShadow(false)
	end
  end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Twitcher_CustomOnInitialize()
   if self:GetModel() == "models/vj_cofr/aom/zombiehd2.mdl" then
       self:SetBodygroup(0,math.random(0,9))
else
       self:SetBodygroup(0,math.random(0,10))
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TwitcherSounds()
    local Twitcher_Sounds = math.random(1,3)
    if Twitcher_Sounds == 1 then
    self.SoundTbl_Alert = {
	"vj_cofr/aom/zombie/zo_alert10.wav",
	"vj_cofr/aom/zombie/zo_alert20.wav",
	"vj_cofr/aom/zombie/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/zombie/zo_attack1.wav",
	"vj_cofr/aom/zombie/zo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/zombie/zo_pain1.wav",
	"vj_cofr/aom/zombie/zo_pain2.wav"
}
elseif Twitcher_Sounds == 2 then
    self.SoundTbl_Alert = {
	"vj_cofr/aom/zombie2/zo_alert10.wav",
	"vj_cofr/aom/zombie2/zo_alert20.wav",
	"vj_cofr/aom/zombie2/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/zombie2/zo_attack1.wav",
	"vj_cofr/aom/zombie2/zo_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/zombie2/zo_pain1.wav",
	"vj_cofr/aom/zombie2/zo_pain2.wav"
}
elseif Twitcher_Sounds == 3 then
    self.SoundTbl_Alert = {
	"vj_cofr/aom/zombie/skuggfa.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	--"vj_cofr/aom/zombie/skuggfa.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/zombie/zo_pain1.wav",
	"vj_cofr/aom/zombie/zo_pain2.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/aom/zombie.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie2_1.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie3_1.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie4_1.mdl" then 
       self:SetBodygroup(0,math.random(0,3))
	   
elseif self:GetModel() == "models/vj_cofr/aom/zombie2.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie2_2.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie3_2.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie4_2.mdl" then 
       self:SetBodygroup(0,math.random(0,2))
		   
elseif self:GetModel() == "models/vj_cofr/aom/zombie3.mdl" 
	or self:GetModel() == "models/vj_cofr/aom/zombie2_5.mdl"
	or self:GetModel() == "models/vj_cofr/aom/zombie3_5.mdl"
	or self:GetModel() == "models/vj_cofr/aom/zombie4_5.mdl"
	or self:GetModel() == "models/vj_cofr/aom/zombie5_5.mdl" then 
       self:SetBodygroup(0,math.random(0,1))
end		
       self:Twitcher_CustomOnInitialize()
	   self:TwitcherSounds()
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 85, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFlinch_BeforeFlinch(dmginfo, hitgroup)
	if dmginfo:GetDamage() > 30 then
		self.AnimTbl_Flinch = {ACT_BIG_FLINCH}
	else
		self.AnimTbl_Flinch = {ACT_SMALL_FLINCH}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
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