include("entities/npc_vj_cofraom_david/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/police1.mdl","models/vj_cofr/cof/police2.mdl","models/vj_cofr/cof/police3.mdl","models/vj_cofr/cof/police4.mdl"}
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/cof/w_syringe.mdl"
ENT.Medic_HealthAmount = 50
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_MedicAfterHeal = {
"vj_cofr/cof/weapons/syringe/syringe_inject.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight()
     if GetConVar("VJ_COFR_Assistor_Flashlight"):GetInt() == 0 then return end
     if math.random(1,3) == 1 then
    self:SetBodygroup(0,1)
        self.light = ents.Create("env_projectedtexture")
        self.light:SetLocalPos( self:GetPos() + Vector(0,0,0) )
        self.light:SetLocalAngles( self:GetAngles() + Angle(0,0,0) )
        self.light:SetKeyValue('lightcolor', "255 255 255")
        self.light:SetKeyValue('lightfov', '30')
        self.light:SetKeyValue('farz', '1000')
        self.light:SetKeyValue('nearz', '10')
        self.light:SetKeyValue('shadowquality', '0')
        self.light:Input( 'SpotlightTexture', NULL, NULL, "effects/flashlight001")
        self.light:SetOwner(self)
        self.light:SetParent(self)
        self.light:Fire("setparentattachment", "flashlight")
        self.light:Spawn()
        self.light:Activate()
        self.light:DeleteOnRemove(self.light)

        local glow1 = ents.Create("env_sprite")
    glow1:SetKeyValue("model","sprites/light_ignorez.vmt")
    glow1:SetKeyValue("scale","0.2")
    glow1:SetKeyValue("rendermode","3")
    glow1:SetKeyValue("rendercolor","255 255 255")
    glow1:SetKeyValue("spawnflags","0.1") -- If animated
    glow1:SetParent(self)
    glow1:Fire("SetParentAttachment","flashlight",0)
    glow1:Spawn()
    glow1:Activate()
    self:DeleteOnRemove(glow1)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootSteps = {
   [MAT_ANTLION] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_BLOODYFLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_CONCRETE] = {
       "vj_cofr/cof/simon/footsteps/concrete1.wav",
       "vj_cofr/cof/simon/footsteps/concrete2.wav",
       "vj_cofr/cof/simon/footsteps/concrete3.wav",
       "vj_cofr/cof/simon/footsteps/concrete4.wav"
   },
   [MAT_DIRT] = {
       "vj_cofr/cof/simon/footsteps/dirt1.wav",
       "vj_cofr/cof/simon/footsteps/dirt2.wav",
       "vj_cofr/cof/simon/footsteps/dirt3.wav",
       "vj_cofr/cof/simon/footsteps/dirt4.wav"
   },
   [MAT_FLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [MAT_GRATE] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_ALIENFLESH] = {
       "vj_cofr/cof/simon/footsteps/mud1.wav",
       "vj_cofr/cof/simon/footsteps/mud2.wav",
       "vj_cofr/cof/simon/footsteps/mud3.wav",
       "vj_cofr/cof/simon/footsteps/mud4.wav"
   },
   [74] = { -- Snow
       "vj_cofr/cof/simon/footsteps/snow1.wav",
       "vj_cofr/cof/simon/footsteps/snow2.wav",
       "vj_cofr/cof/simon/footsteps/snow3.wav",
       "vj_cofr/cof/simon/footsteps/snow4.wav"
   },
   [MAT_PLASTIC] = {
       "vj_cofr/cof/simon/footsteps/paper1.wav",
       "vj_cofr/cof/simon/footsteps/paper2.wav",
       "vj_cofr/cof/simon/footsteps/paper3.wav",
       "vj_cofr/cof/simon/footsteps/paper4.wav"
   },
   [MAT_METAL] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_SAND] = {
       "vj_cofr/cof/simon/footsteps/sand1.wav",
       "vj_cofr/cof/simon/footsteps/sand2.wav",
       "vj_cofr/cof/simon/footsteps/sand3.wav",
       "vj_cofr/cof/simon/footsteps/sand4.wav"
   },
   [MAT_FOLIAGE] = {
       "vj_cofr/cof/simon/footsteps/gravel1.wav",
       "vj_cofr/cof/simon/footsteps/gravel2.wav",
       "vj_cofr/cof/simon/footsteps/gravel3.wav",
       "vj_cofr/cof/simon/footsteps/gravel4.wav"
   },
   [MAT_COMPUTER] = {
       "vj_cofr/cof/simon/footsteps/paper1.wav",
       "vj_cofr/cof/simon/footsteps/paper2.wav",
       "vj_cofr/cof/simon/footsteps/paper3.wav",
       "vj_cofr/cof/simon/footsteps/paper4.wav"
   },
   [MAT_SLOSH] = {
       "vj_cofr/cof/simon/footsteps/splash1.wav",
       "vj_cofr/cof/simon/footsteps/splash2.wav",
       "vj_cofr/cof/simon/footsteps/splash3.wav",
       "vj_cofr/cof/simon/footsteps/splash4.wav"
   },
   [MAT_TILE] = {
       "vj_cofr/cof/simon/footsteps/concrete1.wav",
       "vj_cofr/cof/simon/footsteps/concrete2.wav",
       "vj_cofr/cof/simon/footsteps/concrete3.wav",
       "vj_cofr/cof/simon/footsteps/concrete4.wav"
   },
   [85] = { -- Grass
       "vj_cofr/cof/simon/footsteps/grass1.wav",
       "vj_cofr/cof/simon/footsteps/grass2.wav",
       "vj_cofr/cof/simon/footsteps/grass3.wav",
       "vj_cofr/cof/simon/footsteps/grass4.wav"
   },
   [MAT_VENT] = {
       "vj_cofr/cof/simon/footsteps/metal1.wav",
       "vj_cofr/cof/simon/footsteps/metal2.wav",
       "vj_cofr/cof/simon/footsteps/metal3.wav",
       "vj_cofr/cof/simon/footsteps/metal4.wav"
   },
   [MAT_WOOD] = {
       "vj_cofr/cof/simon/footsteps/wood1.wav",
       "vj_cofr/cof/simon/footsteps/wood2.wav",
       "vj_cofr/cof/simon/footsteps/wood3.wav",
       "vj_cofr/cof/simon/footsteps/wood4.wav"
   },
   [MAT_GLASS] = {
       "vj_cofr/cof/simon/footsteps/glass1.wav",
       "vj_cofr/cof/simon/footsteps/glass2.wav",
       "vj_cofr/cof/simon/footsteps/glass3.wav",
       "vj_cofr/cof/simon/footsteps/glass4.wav"
   }
}
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/