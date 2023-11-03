AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/shaimoon.mdl"}
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1","vjseq_sledgeflare_attack2","vjseq_sledgeflare_attack3"}
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasRangeAttack = false
ENT.CombatFaceEnemy = true
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faster/faster_hit1.wav",
"vj_cofr/cof/faster/faster_hit2.wav",
"vj_cofr/cof/faster/faster_hit3.wav",
"vj_cofr/cof/faster/faster_hit4.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faster/faster_miss.wav"
}
ENT.SoundTbl_Spawn = {
"vj_cofr/custom/shaimoon/damned2_ritual_2b_mono.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/custom/shaimoon/egyptiantalk.wav",
	"vj_cofr/custom/shaimoon/egyptiantalk2.wav",
	"vj_cofr/custom/shaimoon/egyptiantalk3.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/custom/shaimoon/shaimoonsdeath.wav"
}
    self.SoundTbl_SoundTrack = {
    "vj_cofr/custom/shaimoon/ruMpel4.mp3"
}		
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:CustomOnInitialize()
	-- Screen flash effect for all the players
	for _,v in ipairs(player.GetHumans()) do
		v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
end
     self.Shaimoon_Spawn = VJ.CreateSound(self, self.SoundTbl_Spawn, 75, 100)	
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
     self:BookSimon_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    StopSound(self.Shaimoon_Spawn)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/