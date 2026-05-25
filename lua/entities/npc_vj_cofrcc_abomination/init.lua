include("entities/npc_vj_cofr_slowerno/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/slowerno_th.mdl"
ENT.StartHealth = 300
ENT.VJ_ID_Boss = true
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cofcc/abomination/watro.mp3"

local sdAlert = {
    "vj_cofr/cofcc/abomination/hole_canthide.wav",
    "vj_cofr/cofcc/abomination/hole_hurt_dialogue.wav",
    "vj_cofr/cofcc/abomination/hole_run.wav"
}
local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.MeleeAttackDamage = 5
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.MeleeAttackDamage = 7
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.MeleeAttackDamage = 10
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.MeleeAttackDamage = 20
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math_random(1,3) == 1 then
        self:PlaySoundSystem("Alert", sdAlert)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end