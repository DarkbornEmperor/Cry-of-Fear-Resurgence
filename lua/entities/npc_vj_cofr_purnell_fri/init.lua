include("entities/npc_vj_cofr_purnell/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/doctor_friendly.mdl"
ENT.StartHealth = 200
ENT.HealthRegenerationAmount = 2
ENT.HealthRegenerationDelay = VJ.SET(0.5,0.5)
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
ENT.FriendsWithAllPlayerAllies = true
ENT.HasSoundTrack = false
-- Custom
ENT.CoFR_NextLowHPSoundT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Doctor_Init()
 if GetConVar("VJ_COFR_Human_Regen"):GetInt() == 1 then
    self.HasHealthRegeneration = true
end
    self.SoundTbl_Pain = {
    "vj_cofr/cof/doctor/Pain1.wav",
    "vj_cofr/cof/doctor/Pain2.wav",
    "vj_cofr/cof/doctor/Pain3.wav",
    "vj_cofr/cof/doctor/Pain4.wav",
    "vj_cofr/cof/doctor/Pain5.wav",
    "vj_cofr/cof/doctor/Pain6.wav",
    "vj_cofr/cof/doctor/Pain7.wav",
    "vj_cofr/cof/doctor/Pain8.wav"
}
    self.SoundTbl_LowHealth = {
    "vj_cofr/cof/doctor/lhealth1.wav",
    "vj_cofr/cof/doctor/lhealth2.wav",
    "vj_cofr/cof/doctor/lhealth3.wav",
    "vj_cofr/cof/doctor/lhealth4.wav",
    "vj_cofr/cof/doctor/lhealth5.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/doctor/death1.wav",
    "vj_cofr/cof/doctor/death2.wav",
    "vj_cofr/cof/doctor/death3.wav",
    "vj_cofr/cof/doctor/death4.wav",
    "vj_cofr/cof/doctor/death5.wav",
    "vj_cofr/cof/doctor/death6.wav",
    "vj_cofr/cof/doctor/death7.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
 if self.HasSounds && !self.Dead then
    if math.random(1,2) == 1 && self:Health() <= (self:GetMaxHealth() / 4) && self.CoFR_NextLowHPSoundT < CurTime() then
        self:PlaySoundSystem("GeneralSpeech", self.SoundTbl_LowHealth)
        self.CoFR_NextLowHPSoundT = CurTime() + math.random(10,20)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status) return end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/