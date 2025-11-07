include("entities/npc_vj_cofraom_hellhound/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/classic/hellhound.mdl"
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false //2.35
ENT.NextMeleeAttackTime = 2
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    -- Blinking
    if !self.Dead && CurTime() > self.Hellhound_BlinkingT && !self.Hellhound_Sleeping then
        self:SetSkin(1)
        timer.Simple(0.1, function() if IsValid(self) then self:SetSkin(2) end end)
        timer.Simple(0.2, function() if IsValid(self) then self:SetSkin(1) end end)
        timer.Simple(0.3, function() if IsValid(self) then self:SetSkin(0) end end)
        self.Hellhound_BlinkingT = CurTime() + math.Rand(2,3.5)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/