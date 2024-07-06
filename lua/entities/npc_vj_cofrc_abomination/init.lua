include("entities/npc_vj_cofr_slower1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/slowerno_boss.mdl"
ENT.StartHealth = 300
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
    -- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {
"vj_cofr/custom/abomination/watro.mp3"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/slower3/slower_alert10.wav",
    "vj_cofr/cof/slower3/slower_alert20.wav",
    "vj_cofr/cof/slower3/slower_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/slower3/slower_attack1.wav",
    "vj_cofr/cof/slower3/slower_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/slower3/slower_pain1.wav",
    "vj_cofr/cof/slower3/slower_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/slower3/slower_pain1.wav",
    "vj_cofr/cof/slower3/slower_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", {"vj_cofr/custom/abomination/hole_canthide.wav","vj_cofr/custom/abomination/hole_hurt_dialogue.wav","vj_cofr/custom/abomination/hole_run.wav"})
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.45)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/