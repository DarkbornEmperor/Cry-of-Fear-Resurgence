include("entities/npc_vj_cofr_faceless/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/faceless_reci.mdl"
ENT.StartHealth = 300
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/faster/faster_hit1.wav",
    "vj_cofr/cof/faster/faster_hit2.wav",
    "vj_cofr/cof/faster/faster_hit3.wav",
    "vj_cofr/cof/faster/faster_hit4.wav"
}
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cofcc/facelessboss/sound3.mp3"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/