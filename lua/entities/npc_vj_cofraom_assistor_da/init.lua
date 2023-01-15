AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {
"models/vj_cofr/aom/cross.mdl",
"models/vj_cofr/aom/question.mdl",
"models/vj_cofr/aom/scream.mdl",
"models/vj_cofr/aom/two.mdl"
}
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/pill_bottle.mdl"
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FollowPlayer = {
"vj_cofr/aom/player_da/helpyou.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight()
     if GetConVarNumber("VJ_COFR_Assistor_Flashlight") == 0 then return end	
	 
     if math.random(1,3) == 1 then
	    self:SetBodygroup(1,1)
		self:SetSkin(1)
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
/*-----------------------------------------------
	*** Copyright (c) 2012-2023 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/