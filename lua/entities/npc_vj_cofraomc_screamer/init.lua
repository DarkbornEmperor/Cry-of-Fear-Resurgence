include("entities/npc_vj_cofraom_screamer/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/classic/controller.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Screamer_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/screamer/classic/con_alert1.wav",
	"vj_cofr/aom/screamer/classic/con_alert2.wav",
	"vj_cofr/aom/screamer/classic/con_alert3.wav"
}
    self.SoundTbl_RangeAttack = {
	"vj_cofr/aom/screamer/classic/con_attack1.wav",
    "vj_cofr/aom/screamer/classic/con_attack2.wav",
    "vj_cofr/aom/screamer/classic/con_attack3.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/screamer/classic/con_pain1.wav",
	"vj_cofr/aom/screamer/classic/con_pain2.wav",
	"vj_cofr/aom/screamer/classic/con_pain3.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/screamer/classic/con_die1.wav",
	"vj_cofr/aom/screamer/classic/con_die2.wav"
}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/