include("entities/npc_vj_cofr_slower1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/crawler.mdl"} 
ENT.StartHealth = 80
ENT.MeleeAttackDamage = 24 
ENT.HasHitGroupFlinching = false
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(45, 20, -15), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/slower/k_crawl1.wav",
"vj_cofr/cof/slower/k_crawl2.wav",
"vj_cofr/cof/slower/k_crawl3.wav",
"vj_cofr/cof/slower/k_crawl4.wav",
"vj_cofr/cof/slower/k_crawl5.wav",
"vj_cofr/cof/slower/k_crawl6.wav",
"vj_cofr/cof/slower/k_crawl7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/slower/slower_alert10.wav",
	"vj_cofr/cof/slower/slower_alert20.wav",
	"vj_cofr/cof/slower/slower_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/slower/slower_attack1.wav",
	"vj_cofr/cof/slower/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
    self:SetCollisionBounds(Vector(13, 13, 35), Vector(-13, -13, 0))
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/