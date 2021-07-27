AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.CanFlinch = 0
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Twitcher_CustomOnInitialize()
local Twitcher_Sounds = math.random(1,2)
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
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))	
     self:Twitcher_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/