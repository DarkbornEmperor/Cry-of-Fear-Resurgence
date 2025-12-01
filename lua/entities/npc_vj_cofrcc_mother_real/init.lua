include("entities/npc_vj_cofr_crazyrunner/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/crazyrunner_real_memo.mdl"
ENT.StartHealth = 300
ENT.VJ_ID_Boss = true
ENT.HasSoundTrack = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cofcc/mother/psycho1.mp3"

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.MeleeAttackDamage = 2
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.MeleeAttackDamage = 4
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 then // Difficult
        self.MeleeAttackDamage = 8
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Nightmare
        self.MeleeAttackDamage = 20
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if math_random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cofcc/mother/mothertalk.wav")
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