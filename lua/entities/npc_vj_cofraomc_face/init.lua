include("entities/npc_vj_cofraom_face/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/face.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Face_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/aom/face/classic/ag_alert1.wav",
        "vj_cofr/aom/face/classic/ag_alert2.wav",
        "vj_cofr/aom/face/classic/ag_alert3.wav",
        "vj_cofr/aom/face/classic/ag_alert4.wav",
        "vj_cofr/aom/face/classic/ag_alert5.wav"
    }
    self.SoundTbl_BeforeMeleeAttack = {
        "vj_cofr/aom/face/classic/ag_attack1.wav",
        "vj_cofr/aom/face/classic/ag_attack2.wav",
        "vj_cofr/aom/face/classic/ag_attack3.wav"
    }
    self.SoundTbl_Pain = {
        "vj_cofr/aom/face/classic/ag_pain1.wav",
        "vj_cofr/aom/face/classic/ag_pain2.wav",
        "vj_cofr/aom/face/classic/ag_pain3.wav",
        "vj_cofr/aom/face/classic/ag_pain4.wav",
        "vj_cofr/aom/face/classic/ag_pain5.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/face/classic/ag_die1.wav",
        "vj_cofr/aom/face/classic/ag_die2.wav",
        "vj_cofr/aom/face/classic/ag_die3.wav",
        "vj_cofr/aom/face/classic/ag_die4.wav",
        "vj_cofr/aom/face/classic/ag_die5.wav"
    }
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/