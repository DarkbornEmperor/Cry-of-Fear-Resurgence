include("entities/npc_vj_cofraom_spitter/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/spitter.mdl"
-- Custom
ENT.Spitter_BlinkingT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if !self.Dead && CurTime() > self.Spitter_BlinkingT then
        self:SetSkin(1)
        timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(0) end end)
        self.Spitter_BlinkingT = CurTime() + math.Rand(2,3.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetSkin(1)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/