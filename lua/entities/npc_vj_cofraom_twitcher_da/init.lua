include("entities/npc_vj_cofraom_twitcher1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.CanFlinch = false
ENT.AnimTbl_Death = ACT_DIESIMPLE
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
     self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
     self:Twitcher_Init()
     self:TwitcherSounds()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TwitcherSounds()
    self.SoundTbl_Pain = {
    "vj_cofr/aom/twitcher/zo_pain1.wav",
    "vj_cofr/aom/twitcher/zo_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/twitcher/zo_pain1.wav",
    "vj_cofr/aom/twitcher/zo_pain2.wav"
}
    local Twitcher_Sounds = math.random(1,2)
    if Twitcher_Sounds == 1 then
    self.SoundTbl_Alert = {
    "vj_cofr/aom/twitcher/zo_alert10.wav",
    "vj_cofr/aom/twitcher/zo_alert20.wav",
    "vj_cofr/aom/twitcher/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/twitcher/zo_attack1.wav",
    "vj_cofr/aom/twitcher/zo_attack2.wav"
}
    elseif Twitcher_Sounds == 2 then
    self.SoundTbl_Alert = {
    "vj_cofr/aom/twitcher2/zo_alert10.wav",
    "vj_cofr/aom/twitcher2/zo_alert20.wav",
    "vj_cofr/aom/twitcher2/zo_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/aom/twitcher2/zo_attack1.wav",
    "vj_cofr/aom/twitcher2/zo_attack2.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/