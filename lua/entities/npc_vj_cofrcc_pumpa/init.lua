include("entities/npc_vj_cofr_psycho/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/psycho_pumpa_hc.mdl"
ENT.StartHealth = 300
ENT.VJ_ID_Boss = true
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cof/sawrunner/sawmusic2.mp3"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.MeleeAttackDamage = 4
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.MeleeAttackDamage = 7
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.MeleeAttackDamage = 13
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.MeleeAttackDamage = 25
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/