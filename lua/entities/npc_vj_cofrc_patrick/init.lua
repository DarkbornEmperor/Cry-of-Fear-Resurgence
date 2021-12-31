AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/patrick.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Psycho_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/custom/patrick/patrick_scream.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/custom/patrick/patrick_attack.wav"
}
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/