AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/custom/suicider.mdl"} 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_CustomOnInitialize()
local Suicider_Body = math.random(1,2)
if Suicider_Body == 1 then
    self.Suicider_Skin = 0
    self:SetBodygroup(0,0)
elseif Suicider_Body == 2 then
    self.Suicider_Skin = 1
    self:SetBodygroup(0,2)		
end	
    self.SoundTbl_Alert = {
	"vj_cofr/cof/slower/slower_alert10.wav",
	"vj_cofr/cof/slower/slower_alert20.wav",
	"vj_cofr/cof/slower/slower_alert30.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/cof/slower/slower_pain1.wav",
	"vj_cofr/cof/slower/slower_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self:IsMoving() then 
	   self.AnimTbl_Death = {ACT_DIESIMPLE}	
	else
       self.AnimTbl_Death = {ACT_DIE_HEADSHOT}		
end
	if self.Suicider_DeathSuicide == true then
		self.AnimTbl_Death = {ACT_DIE_GUTSHOT}
		timer.Simple(0.5,function()
			if IsValid(self) then
               self:SetBodygroup(0,1)
				if self.HasGibDeathParticles == true then
					local bloodeffect = EffectData()
					bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
					bloodeffect:SetColor(VJ_Color2Byte(Color(130,19,10)))
					bloodeffect:SetScale(50)
					util.Effect("VJ_Blood1",bloodeffect)
				    local bloodspray = EffectData()
		            bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment("head")).Pos)
		            bloodspray:SetScale(4)
		            bloodspray:SetFlags(3)
		            bloodspray:SetColor(0)
		            util.Effect("bloodspray",bloodspray)
		            util.Effect("bloodspray",bloodspray)
				end
			end
		end)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/