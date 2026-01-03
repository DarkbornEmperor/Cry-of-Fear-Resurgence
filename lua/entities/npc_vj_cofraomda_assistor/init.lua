include("entities/npc_vj_cofraomda_david/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/da/assistor_cross.mdl", "models/vj_cofr/aom/da/assistor_question.mdl", "models/vj_cofr/aom/da/assistor_scream.mdl", "models/vj_cofr/aom/da/assistor_two.mdl"}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FollowPlayer =
    "vj_cofr/aom/player_da/helpyou.wav"

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FlashlightSetup()
    if GetConVar("VJ_COFR_Flashlight"):GetInt() == 0 then return end
    if math_random(1,3) == 1 then
        self:SetBodygroup(0,1)
        self:SetSkin(1)
        local light = ents.Create("env_projectedtexture")
        light:SetLocalPos(self:GetPos() + Vector(0, 0, 0))
        light:SetLocalAngles(self:GetAngles() + Angle(0, 0, 0))
        light:SetKeyValue('lightcolor', "255 255 255")
        light:SetKeyValue('lightfov', '30')
        light:SetKeyValue('farz', '1000')
        light:SetKeyValue('nearz', '10')
        light:SetKeyValue('shadowquality', '0')
        light:Input('SpotlightTexture', NULL, NULL, "effects/flashlight001")
        light:SetOwner(self)
        light:SetParent(self)
        light:Fire("setparentattachment", "flashlight")
        light:Spawn()
        light:Activate()
        light:DeleteOnRemove(light)

        local glow = ents.Create("env_sprite")
        glow:SetKeyValue("model", "sprites/light_ignorez.vmt")
        glow:SetKeyValue("scale", "0.2")
        glow:SetKeyValue("rendermode", "3")
        glow:SetKeyValue("rendercolor", "255 255 255")
        glow:SetKeyValue("spawnflags", "0.1") -- If animated
        glow:SetParent(self)
        glow:Fire("SetParentAttachment", "flashlight", 0)
        glow:Spawn()
        glow:Activate()
        self:DeleteOnRemove(glow)
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/