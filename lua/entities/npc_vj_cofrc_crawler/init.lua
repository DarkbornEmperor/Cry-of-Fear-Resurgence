AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/crawler.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
local Slower_Body = math.random(1,6)
if Slower_Body == 1 then
    self.Slower_Skin = 0
    self:SetBodygroup(0,0)
elseif Slower_Body == 2 then
    self.Slower_Skin = 1
    self:SetBodygroup(0,1)	
elseif Slower_Body == 3 then
    self.Slower_Skin = 2
    self:SetBodygroup(0,2)	
elseif Slower_Body == 4 then
    self.Slower_Skin = 4
    self:SetBodygroup(0,3)	
elseif Slower_Body == 5 then
    self.Slower_Skin = 5
    self:SetBodygroup(0,4)	
elseif Slower_Body == 6 then
    self.Slower_Skin = 6
    self:SetBodygroup(0,5)		
end	
    self.SoundTbl_Alert = {
	"vj_cofr/slower/slower_alert10.wav",
	"vj_cofr/slower/slower_alert20.wav",
	"vj_cofr/slower/slower_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/slower/slower_attack1.wav",
	"vj_cofr/slower/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/slower/slower_pain1.wav",
	"vj_cofr/slower/slower_pain2.wav"
}
    self:SetCollisionBounds(Vector(13, 13, 35), Vector(-13, -13, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self:GetBodygroup(0) == 0 then
		self.MeleeAttackDamage = 34
        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/davidbad/Axe_hitbody.wav"
}	
        self.SoundTbl_MeleeAttackMiss = {
        "vj_cofr/davidbad/Axe_swing.wav"
}
	elseif self:GetBodygroup(0) == 1 or self:GetBodygroup(0) == 2 or self:GetBodygroup(0) == 3 or self:GetBodygroup(0) == 4 or self:GetBodygroup(0) == 5 then
		self.MeleeAttackDamage = 24 
        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/slower/hammer_strike1.wav",
        "vj_cofr/slower/hammer_strike2.wav",
        "vj_cofr/slower/hammer_strike3.wav"
}	
        self.SoundTbl_MeleeAttackMiss = {
        "vj_cofr/slower/hammer_miss1.wav",
        "vj_cofr/slower/hammer_miss2.wav"
}	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo,hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/