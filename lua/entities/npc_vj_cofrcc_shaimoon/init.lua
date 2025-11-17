include("entities/npc_vj_cofr_simonbook/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/booksimon_tsos.mdl"
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1", "vjseq_sledgeflare_attack2", "vjseq_sledgeflare_attack3"}
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasRangeAttack = false
ENT.CanTurnWhileMoving = true
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/faster/faster_hit1.wav",
    "vj_cofr/cof/faster/faster_hit2.wav",
    "vj_cofr/cof/faster/faster_hit3.wav",
    "vj_cofr/cof/faster/faster_hit4.wav"
}
ENT.SoundTbl_MeleeAttackMiss =
    "vj_cofr/cof/faster/faster_miss.wav"

ENT.SoundTbl_Spawn =
    "vj_cofr/cofcc/shaimoon/damned2_ritual_2b_mono.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/cofcc/shaimoon/egyptiantalk.wav",
        "vj_cofr/cofcc/shaimoon/egyptiantalk2.wav",
        "vj_cofr/cofcc/shaimoon/egyptiantalk3.wav"
    }
    self.SoundTbl_Death =
        "vj_cofr/cofcc/shaimoon/shaimoonsdeath.wav"

    self.SoundTbl_SoundTrack =
        "vj_cofr/cofcc/shaimoon/ruMpel4.mp3"
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorBlack = Color(0, 0, 0, 255)
--
function ENT:Init()
    -- Screen flash effect for all the players
    for _,v in ipairs(player.GetHumans()) do
        v:ScreenFade(SCREENFADE.IN, colorBlack, 1, 0)
    end
     self.Shaimoon_Spawn = VJ.CreateSound(self, self.SoundTbl_Spawn, 75, 100)
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
     self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
     self:BookSimon_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Shaimoon_Spawn)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/