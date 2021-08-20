AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/themummy.mdl"} 
ENT.MeleeAttackDamageType = DMG_CLUB
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faceless/fist_strike1.wav",
"vj_cofr/cof/faceless/fist_strike2.wav",
"vj_cofr/cof/faceless/fist_strike3.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faceless/fist_miss1.wav",
"vj_cofr/cof/faceless/fist_miss2.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Sawrunner_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/sawrunner/sawrunner_alert10.wav",
	"vj_cofr/cof/sawrunner/sawrunner_alert20.wav",
	"vj_cofr/cof/sawrunner/sawrunner_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/sawrunner/sawrunner_attack1.wav",
	"vj_cofr/cof/sawrunner/sawrunner_attack2.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/sawrunner/sawrunner_pain1.wav",
	"vj_cofr/cof/sawrunner/sawrunner_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/sawrunner/sawrunner_pain1.wav",
	"vj_cofr/cof/sawrunner/sawrunner_pain2.wav"
}
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
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(1,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/