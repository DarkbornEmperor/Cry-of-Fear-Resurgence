AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/crawler.mdl"} 
ENT.StartHealth = 80
ENT.MeleeAttackDamage = 24 
ENT.HasHitGroupFlinching = false
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 20, -15), 
	FirstP_Bone = "ValveBiped.Bip01_Head1", 
	FirstP_Offset = Vector(10, 0, -30), 
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/slower/k_crawl1.wav",
"vj_cofr/slower/k_crawl2.wav",
"vj_cofr/slower/k_crawl3.wav",
"vj_cofr/slower/k_crawl4.wav",
"vj_cofr/slower/k_crawl5.wav",
"vj_cofr/slower/k_crawl6.wav",
"vj_cofr/slower/k_crawl7.wav"
}
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
    self:SetCollisionBounds(Vector(13, 13, 35), Vector(-13, -13, 0))
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
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/