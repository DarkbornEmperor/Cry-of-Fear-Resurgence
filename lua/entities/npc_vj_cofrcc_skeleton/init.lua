include("entities/npc_vj_cofr_slower1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/skeleton.mdl"
ENT.Bleeds = false
-- Custom
ENT.Slower_Type = 3
ENT.SlowerSounds = false
ENT.FacelessSounds = false
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MeleeAttackExtra = {
    "vj_cofr/cof/faceless/fist_strike1.wav",
    "vj_cofr/cof/faceless/fist_strike2.wav",
    "vj_cofr/cof/faceless/fist_strike3.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
    "vj_cofr/cof/faceless/fist_miss1.wav",
    "vj_cofr/cof/faceless/fist_miss2.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Slower_Init()
    local voiceType = math.random(1,2)
    if voiceType == 1 then
        self.SlowerSounds = true
        self.SoundTbl_Alert = {
            "vj_cofr/cof/slower/slower_alert10.wav",
            "vj_cofr/cof/slower/slower_alert20.wav",
            "vj_cofr/cof/slower/slower_alert30.wav"
        }
        self.SoundTbl_BeforeMeleeAttack = {
            "vj_cofr/cof/slower/slower_attack1.wav",
            "vj_cofr/cof/slower/slower_attack2.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/cof/slower/slower_pain1.wav",
            "vj_cofr/cof/slower/slower_pain2.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/cof/slower/slower_pain1.wav",
            "vj_cofr/cof/slower/slower_pain2.wav"
        }
    elseif voiceType == 2 then
        self.FacelessSounds = true
        self.SoundTbl_Alert = {
            "vj_cofr/cof/faceless/faceless_alert10.wav",
            "vj_cofr/cof/faceless/faceless_alert20.wav",
            "vj_cofr/cof/faceless/faceless_alert30.wav"
        }
        self.SoundTbl_BeforeMeleeAttack = {
            "vj_cofr/cof/faceless/faceless_attack1.wav",
            "vj_cofr/cof/faceless/faceless_attack2.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/cof/faceless/faceless_pain1.wav",
            "vj_cofr/cof/faceless/faceless_pain2.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/cof/faceless/faceless_pain1.wav",
            "vj_cofr/cof/faceless/faceless_pain2.wav"
        }
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if self.SlowerSounds && math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/slower/scream1.wav")
    elseif self.FacelessSounds && math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/faceless/psyksjuk.wav")
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/