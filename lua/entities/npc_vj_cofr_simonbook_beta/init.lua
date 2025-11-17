include("entities/npc_vj_cofr_simonbook/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/booksimon_beta.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 1 then
        local bookSimon_Type = math.random(1,3)
        if bookSimon_Type == 1 then
            self.BookSimon_Shotgun = true
            self.Model = "models/vj_cofr/cof/booksimon_beta_shotgun.mdl"
        elseif bookSimon_Type == 2 then
            self.BookSimon_Sledgehammer = true
        elseif bookSimon_Type == 3 then
            self.BookSimon_SledgehammerFlare = true
        end
    end
    if GetConVar("VJ_COFR_BookSimon_Normal"):GetInt() == 0 then
        local bookSimon_Type = math.random(1,6)
        if bookSimon_Type == 1 then
            self.BookSimon_Shotgun = true
            self.Model = "models/vj_cofr/cof/booksimon_beta_shotgun.mdl"
        elseif bookSimon_Type == 2 then
            self.BookSimon_Glock = true
        elseif bookSimon_Type == 3 then
            self.BookSimon_TMP = true
            self.Model = "models/vj_cofr/cof/booksimon_beta_tmp.mdl"
        elseif bookSimon_Type == 4 then
            self.BookSimon_M16 = true
            self.Model = "models/vj_cofr/cof/booksimon_beta_m16.mdl"
        elseif bookSimon_Type == 5 then
            self.BookSimon_Sledgehammer = true
        elseif bookSimon_Type == 6 then
            self.BookSimon_SledgehammerFlare = true
        end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/