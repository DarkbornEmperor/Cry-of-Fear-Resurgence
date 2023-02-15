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
ENT.CombatFaceEnemy = true
ENT.DeathAnimationTime = 15
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false 
    end		
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/custom/shaimoon/shaimoonendtalk1.wav",
	"vj_cofr/custom/shaimoon/shaimoonendtalk2.wav",
	"vj_cofr/custom/shaimoon/shaimoonendtalk3.wav",
	"vj_cofr/custom/shaimoon/shaimoonendtalk4.wav",
	"vj_cofr/custom/shaimoon/shaimoonendtalk5.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/custom/shaimoon/shaimoonsdeath.wav"
}
    self.SoundTbl_SoundTrack = {
    "vj_cofr/custom/shaimoon/ruMpel4.mp3"
}		
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/