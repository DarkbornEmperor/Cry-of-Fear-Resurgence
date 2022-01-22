AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/crazyrunner.mdl"} 
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC","CLASS_GREY"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_attack"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20 
ENT.MeleeAttackDistance = 30 
ENT.MeleeAttackDamageDistance = 60
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.DeathAnimationTime = 8 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/fx/npc_step1.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/crazylady/knife_hitbody1.wav",
"vj_cofr/cof/crazylady/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/crazylady/knife_swing.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.DropCoFAmmo = {"weapon_cof_syringe","ent_cof_glock_ammo","ent_cof_g43_ammo","ent_cof_m16_ammo","ent_cof_p345_ammo","ent_cof_revolver_ammo","ent_cof_rifle_ammo","ent_cof_shotgun_ammo","ent_cof_tmp_ammo","ent_cof_vp70_ammo"}
ENT.CrazyRunner_Type = 0 
 	-- 0 = Crazyrunner
	-- 1 = Citalopram
	-- 2 = Dreamer (Runner)
	-- 3 = CrazyruMpel
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CrazyRunner_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/cof/rcrazy/rc_alert1.wav",
	"vj_cofr/cof/rcrazy/rc_alert2.wav",
	"vj_cofr/cof/rcrazy/rc_alert3.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self:GetModel() == "models/vj_cofr/cof/crazyrunner.mdl" then // Already the default
		self.CrazyRunner_Type = 0
	elseif self:GetModel() == "models/vj_cofr/cof/citalopram.mdl" then
		self.CrazyRunner_Type = 1
	elseif self:GetModel() == "models/vj_cofr/cof/dreamerrunner.mdl" then
		self.CrazyRunner_Type = 2			
	elseif self:GetModel() == "models/vj_cofr/custom/crazyrumpel.mdl" then
		self.CrazyRunner_Type = 3	
end
     self:CrazyRunner_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert()
    if math.random(1,3) == 1 then
        self:PlaySoundSystem("Alert", {"vj_cofr/cof/rcrazy/screamloud.wav"}) 	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo, hitgroup)
	 if hitgroup == HITGROUP_HEAD then
		self.AnimTbl_Death = {ACT_DIE_HEADSHOT}
	else
		self.AnimTbl_Death = {ACT_DIEBACKWARD,ACT_DIEFORWARD,ACT_DIESIMPLE,ACT_DIE_GUTSHOT}
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:SetSolid(SOLID_NONE)
    self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
       if GetConVarNumber("VJ_COFR_DropAmmo") == 0 or !file.Exists("lua/weapons/weapon_cof_glock.lua","GAME") then return end
	   local pickedAmmoType = VJ_PICK(self.DropCoFAmmo)
	   if pickedAmmoType != false then	   
	   local AmmoDrop = ents.Create(pickedAmmoType)	   
	   AmmoDrop:SetPos(self:GetPos() + self:OBBCenter())
	   AmmoDrop:SetLocalAngles(self:GetAngles())	   
	   //AmmoDrop:SetParent(self)
	   AmmoDrop:Spawn()
	   AmmoDrop:Activate()
	   //self:DeleteOnRemove(AmmoDrop)
	   
		local phys = AmmoDrop:GetPhysicsObject()
			if IsValid(phys) then
				local dmgForce = (self.SavedDmgInfo.force / 40)
				if self.DeathAnimationCodeRan then
					dmgForce = self:GetMoveVelocity() == defPos
end
				phys:SetMass(1)
				phys:ApplyForceCenter(dmgForce)
		end		
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/