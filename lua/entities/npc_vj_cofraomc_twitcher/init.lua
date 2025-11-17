include("entities/npc_vj_cofraom_twitcher1/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:TwitcherSounds()
    self.SoundTbl_Alert = {
        "vj_cofr/aom/twitcher/zo_alert10.wav",
        "vj_cofr/aom/twitcher/zo_alert20.wav",
        "vj_cofr/aom/twitcher/zo_alert30.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/aom/twitcher/zo_attack1.wav",
        "vj_cofr/aom/twitcher/zo_attack2.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/aom/twitcher/zo_pain1.wav",
        "vj_cofr/aom/twitcher/zo_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/twitcher/zo_pain1.wav",
        "vj_cofr/aom/twitcher/zo_pain2.wav"
    }
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/