include("entities/npc_vj_cofr_simon/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/police1.mdl", "models/vj_cofr/cof/police2.mdl", "models/vj_cofr/cof/police3.mdl", "models/vj_cofr/cof/police4.mdl"}
-- Custom
ENT.Human_Type = 2

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FlashlightSetup()
    if GetConVar("VJ_COFR_Flashlight"):GetInt() == 0 then return end
    if math_random(1,3) == 1 then
        local myPos = self:GetPos()
        local myAng = self:GetAngles()

        local envLight = ents.Create("env_projectedtexture")
        envLight:SetLocalPos(myPos)
        envLight:SetLocalAngles(myAng)
        envLight:SetKeyValue("lightcolor", "255 255 255")
        envLight:SetKeyValue("lightfov", "40")
        envLight:SetKeyValue("farz", "1000")
        envLight:SetKeyValue("nearz", "10")
        envLight:SetKeyValue("shadowquality", "1")
        envLight:Input("SpotlightTexture", NULL, NULL, "effects/flashlight001")
        envLight:SetOwner(self)
        envLight:SetParent(self)
        envLight:Spawn()
        envLight:Fire("setparentattachment", "flashlight")
        self:DeleteOnRemove(envLight)

        local spotlight = ents.Create("beam_spotlight")
        spotlight:SetPos(myPos)
        spotlight:SetAngles(myAng)
        spotlight:SetKeyValue("spotlightlength", 40)
        spotlight:SetKeyValue("spotlightwidth", 10)
        spotlight:SetKeyValue("spawnflags", "2")
        spotlight:Fire("Color", "255 255 255")
        spotlight:SetParent(self)
        spotlight:Spawn()
        spotlight:Activate()
        spotlight:Fire("setparentattachment", "flashlight")
        spotlight:Fire("lighton")
        spotlight:AddEffects(EF_PARENT_ANIMATES)
        self:DeleteOnRemove(spotlight)

        local glow1 = ents.Create("env_sprite")
        glow1:SetKeyValue("model", "sprites/light_ignorez.vmt")
        glow1:SetKeyValue("scale", "0.1")
        glow1:SetKeyValue("rendermode", "9")
        glow1:SetKeyValue("rendercolor", "255 255 255")
        glow1:SetKeyValue("spawnflags", "0.1")
        glow1:SetParent(self)
        glow1:SetOwner(self)
        glow1:Fire("SetParentAttachment", "flashlight", 0)
        glow1:Spawn()
        self:DeleteOnRemove(glow1)

        self:SetBodygroup(0,1)
    end
end