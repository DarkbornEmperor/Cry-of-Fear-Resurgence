include("entities/npc_vj_cofr_faceless/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/faceless_boss.mdl"
ENT.StartHealth = 300
//ENT.MeleeAttackDamage = 200
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
    -- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faster/faster_hit1.wav",
"vj_cofr/cof/faster/faster_hit2.wav",
"vj_cofr/cof/faster/faster_hit3.wav",
"vj_cofr/cof/faster/faster_hit4.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/custom/facelessboss/sound3.mp3"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
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