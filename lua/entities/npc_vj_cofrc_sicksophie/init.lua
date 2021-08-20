AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/sicksophie.mdl"} 
ENT.CanFlinch = 0
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
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/