AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/police1.mdl","models/vj_cofr/cof/police2.mdl","models/vj_cofr/cof/police3.mdl","models/vj_cofr/cof/police4.mdl"} 
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/cof/w_syringe.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "1" 
ENT.Medic_HealthAmount = 50
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/cof/simon/concrete1.wav",
"vj_cofr/cof/simon/concrete2.wav",
"vj_cofr/cof/simon/concrete3.wav",
"vj_cofr/cof/simon/concrete4.wav"
}
ENT.SoundTbl_MedicAfterHeal = {
"vj_cofr/cof/simon/syringe_inject.wav" 
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/police/Swing1.wav",
	"vj_cofr/cof/police/Swing2.wav",
	"vj_cofr/cof/police/Swing3.wav",
	"vj_cofr/cof/police/Swing4.wav",
	"vj_cofr/cof/police/Swing5.wav",
	"vj_cofr/cof/police/Swing6.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/police/Pain1.wav",
	"vj_cofr/cof/police/Pain2.wav",
	"vj_cofr/cof/police/Pain3.wav",
	"vj_cofr/cof/police/Pain4.wav",
	"vj_cofr/cof/police/Pain5.wav",
	"vj_cofr/cof/police/Pain6.wav",
	"vj_cofr/cof/police/Pain7.wav",
	"vj_cofr/cof/police/Pain8.wav",
	"vj_cofr/cof/police/Pain9.wav",
	"vj_cofr/cof/police/Pain10.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/police/death1.wav",
	"vj_cofr/cof/police/death2.wav",
	"vj_cofr/cof/police/death3.wav",
	"vj_cofr/cof/police/death4.wav",
	"vj_cofr/cof/police/death5.wav"
}	
    local Weapon_Type = math.random(1,12)
    if Weapon_Type == 1 then
        self:Give("weapon_vj_cofr_glock")		
elseif Weapon_Type == 2 then
        self:Give("weapon_vj_cofr_p345")		
elseif Weapon_Type == 3 then
        self:Give("weapon_vj_cofr_m76")	
elseif Weapon_Type == 4 then	
        self:Give("weapon_vj_cofr_vp70")
elseif Weapon_Type == 5 then	
        self:Give("weapon_vj_cofr_revolver")			
elseif Weapon_Type == 6 then	
        self:Give("weapon_vj_cofr_tmp")	
elseif Weapon_Type == 7 then	
        self:Give("weapon_vj_cofr_mp5")	
elseif Weapon_Type == 8 then	
        self:Give("weapon_vj_cofr_m16")	
elseif Weapon_Type == 9 then	
        self:Give("weapon_vj_cofr_famas")
elseif Weapon_Type == 10 then	
        self:Give("weapon_vj_cofr_shotgun")	
elseif Weapon_Type == 11 then	
        self:Give("weapon_vj_cofr_rifle")
elseif Weapon_Type == 12 then	
        self:Give("weapon_vj_cofr_g43")		
    end	
end	
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight()
     if GetConVarNumber("VJ_COFR_Assistor_Flashlight") == 0 then return end	
	 
     if math.random(1,3) == 1 then
	    self:SetBodygroup(0,1)
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
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/