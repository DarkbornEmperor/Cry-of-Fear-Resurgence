AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/citalopram.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CrazyRunner_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/rcrazy/rc_alert1.wav",
	"vj_cofr/cof/rcrazy/rc_alert2.wav",
	"vj_cofr/cof/rcrazy/rc_alert3.wav"
}
    self:SetCollisionBounds(Vector(13, 13, 77), Vector(-13, -13, 0)) 
end 
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/citalopram/citalopramscream.wav"}) 	
    end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/