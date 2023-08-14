AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/dreamerrunner.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CrazyRunner_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/dreamer/dreamer_scream.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/dreamer/dreamer_attack.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/dreamer/dreamer_pain.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/dreamer/dreamer_pain.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert() end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/