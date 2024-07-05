include("entities/npc_vj_cofr_simonbook/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/shaimoon_gold.mdl" 
ENT.StartHealth = 150
ENT.Bleeds = false
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_sledgeflare_attack1","vjseq_sledgeflare_attack2","vjseq_sledgeflare_attack3"}
ENT.MeleeAttackDamageType = DMG_SLASH
ENT.HasRangeAttack = false
ENT.CanTurnWhileMoving = true
ENT.HasSoundTrack = false
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/faster/faster_hit1.wav",
"vj_cofr/cof/faster/faster_hit2.wav",
"vj_cofr/cof/faster/faster_hit3.wav",
"vj_cofr/cof/faster/faster_hit4.wav"
}	
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/faster/faster_miss.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:BookSimon_CustomOnInitialize() return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
	self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:BookSimon_CustomOnInitialize()	 
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:CustomOnTakeDamage_BeforeImmuneChecks(dmginfo,hitgroup)
	-- Make a metal ricochet effect
	if dmginfo:GetDamagePosition() != vec then
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(5) -- Size
		rico:SetMagnitude(math.random(1,2)) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_COFR_Rico", rico)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)	
	dmginfo:ScaleDamage(0.45)	
    if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup) return end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound() return end 
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/