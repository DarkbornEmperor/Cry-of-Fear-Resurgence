AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/simon.mdl"} 
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/cof/w_syringe.mdl" 
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
    self.SoundTbl_Breath = {
    "vj_cofr/cof/simon/breathing.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/cof/simon/Swing1.wav",
	"vj_cofr/cof/simon/Swing2.wav",
	"vj_cofr/cof/simon/Swing3.wav",
	"vj_cofr/cof/simon/Swing4.wav",
	"vj_cofr/cof/simon/Swing5.wav",
	"vj_cofr/cof/simon/Swing6.wav",
	"vj_cofr/cof/simon/Swing7.wav",
	"vj_cofr/cof/simon/Swing8.wav",
	"vj_cofr/cof/simon/Swing9.wav",
	"vj_cofr/cof/simon/Swing10.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/simon/Pain1.wav",
	"vj_cofr/cof/simon/Pain2.wav",
	"vj_cofr/cof/simon/Pain3.wav",
	"vj_cofr/cof/simon/Pain4.wav",
	"vj_cofr/cof/simon/Pain5.wav",
	"vj_cofr/cof/simon/Pain6.wav",
	"vj_cofr/cof/simon/Pain7.wav",
	"vj_cofr/cof/simon/Pain8.wav",
	"vj_cofr/cof/simon/Pain9.wav",
	"vj_cofr/cof/simon/Pain10.wav",
	"vj_cofr/cof/simon/Pain11.wav",
	"vj_cofr/cof/simon/Pain12.wav",
	"vj_cofr/cof/simon/Pain13.wav",
	"vj_cofr/cof/simon/Pain14.wav",
	"vj_cofr/cof/simon/Pain15.wav",
	"vj_cofr/cof/simon/Pain16.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/cof/simon/death1.wav",
	"vj_cofr/cof/simon/death2.wav",
	"vj_cofr/cof/simon/death3.wav",
	"vj_cofr/cof/simon/death4.wav",
	"vj_cofr/cof/simon/death5.wav",
	"vj_cofr/cof/simon/death6.wav",
	"vj_cofr/cof/simon/death7.wav"
}	
    local Weapon_Type = math.random(1,3)
    if Weapon_Type == 1 then
		self.David_Shotgun = true
        self:Give("weapon_vj_cofraom_shotgun")		
elseif Weapon_Type == 2 then
		self.David_Glock = true
        self:Give("weapon_vj_cofraom_glock")		
elseif Weapon_Type == 3 then
		self.David_Knife = true	
        self:Give("weapon_vj_cofraom_knife")		
    end	
end	
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/