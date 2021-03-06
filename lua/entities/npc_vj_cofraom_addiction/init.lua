AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/aom/david_monster.mdl"} 
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.HasMeleeAttack = true 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30 
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.RunAwayOnUnknownDamage = false
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 10 
ENT.HasSoundTrack = true
ENT.Immune_Fire = true 
ENT.HasExtraMeleeAttackSounds = true
ENT.HasBreathSound = false
ENT.BreathSoundLevel = 75
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip02 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {
"vj_cofr/aom/david/pl_step1.wav",
"vj_cofr/aom/david/pl_step2.wav",
"vj_cofr/aom/david/pl_step3.wav",
"vj_cofr/aom/david/pl_step4.wav"
}
ENT.SoundTbl_Breath = {
"vj_cofr/aom/davidbad/fire_loop.wav"
}
ENT.SoundTbl_FireIgnite = {
"vj_cofr/aom/davidbad/fire_ignite.wav"
}
ENT.SoundTbl_FireOff = {
"vj_cofr/aom/davidbad/fire_off.wav"
}
ENT.SoundTbl_SoundTrack = {
"vj_cofr/aom/davidbad/sickness.mp3",
"vj_cofr/aom/davidbad/4motherkill.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Addiction_Axe = false
ENT.Addiction_OnFire = false
ENT.Addiction_NextChangeAttackT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Addiction_CustomOnInitialize()
    self.SoundTbl_Alert = {
	"vj_cofr/aom/davidbad/db_alert10.wav",
	"vj_cofr/aom/davidbad/db_alert20.wav",
	"vj_cofr/aom/davidbad/db_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
	"vj_cofr/aom/davidbad/david_attack.wav"
}
    self.SoundTbl_Pain = {
	"vj_cofr/aom/davidbad/db_pain1.wav",
	"vj_cofr/aom/davidbad/db_pain2.wav"
}
    self.SoundTbl_Death = {
	"vj_cofr/aom/davidbad/db_pain1.wav",
	"vj_cofr/aom/davidbad/db_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))		
     self:Addiction_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
end
	if key == "attack" then
		self:MeleeAttackCode()
end	
	if key == "axe_grab" then
		VJ_EmitSound(self, "vj_cofr/aom/davidbad/david_axegrab.wav", 75, 100)
		ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("axe")).Pos,self:GetAngles())
end	
	if key == "death" then
		VJ_EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent) 
    if self.VJ_IsBeingControlled then return end
       self.Addiction_NextChangeAttackT = CurTime() + math.random(10,15)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("JUMP: Switch attacks")
	ply:ChatPrint("NOTE: Switching attacks will cause a 10/15 second delay until able to switch again.")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.DeathAnimationCodeRan then return end
	if !self:BusyWithActivity() && IsValid(self:GetEnemy()) && !self.Addiction_Axe && CurTime() > self.Addiction_NextChangeAttackT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
		self.Addiction_Axe = true
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,false)
		timer.Simple(3,function() if IsValid(self) && !self.DeathAnimationCodeRan then
        self:SetBodygroup(0,1)
		self.Addiction_NextChangeAttackT = CurTime() + math.random(10,15)	
     end		
  end)	
end    
    if !self:BusyWithActivity() && IsValid(self:GetEnemy()) && self.Addiction_Axe && CurTime() > self.Addiction_NextChangeAttackT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
		self.Addiction_Axe = false
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,false)
		timer.Simple(3,function() if IsValid(self) && !self.DeathAnimationCodeRan then
        self:SetBodygroup(0,0)
        self.Addiction_NextChangeAttackT = CurTime() + math.random(10,15)		
     end      	 
  end)
end
    if !self.Addiction_OnFire && !self:IsOnFire() && (self.StartHealth -250 > self:Health()) then
		self.Addiction_OnFire = true
		self:Ignite(15)
		//self.HasBreathSound = true
		VJ_EmitSound(self, self.SoundTbl_FireIgnite, 75, 100)
	    for _,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
	    timer.Create("VJ_COFR_Addiction_Fire"..self:EntIndex(), 1, 15, function() if IsValid(self) && self.Addiction_OnFire && v:WaterLevel() != 3 then
        util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(10,15),DMG_BURN,true,true)
		//timer.Simple(15,function() if IsValid(self) && self.Addiction_OnFire then VJ_EmitSound(self, self.SoundTbl_FireOff, 75, 100) self.HasBreathSound = false end end)
                end
            end)
        end
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)  
   dmginfo:ScaleDamage(0.15)	   
   if GetConVarNumber("VJ_COFR_Addiction_SelfDamage") == 1 then
    local attacker = dmginfo:GetAttacker()
   if dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_CLUB) then	
       dmginfo:ScaleDamage(1.50)
   else
	   attacker:TakeDamage(10,attacker,attacker)
	   dmginfo:ScaleDamage(0.00)
    end	   
  end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self:GetBodygroup(0) == 0 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack"}
		self.MeleeAttackDamageType = DMG_SHOCK
		self.NextMeleeAttackTime = 2
		self.MeleeAttackDamageDistance = 150
		self.HasMeleeAttackMissSounds = false
		self.DisableDefaultMeleeAttackDamageCode = true
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/aom/davidbad/thunder_hit.wav"
}
    elseif self:GetBodygroup(0) == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack_axe"}
		self.MeleeAttackDamageType = DMG_SLASH
		self.NextMeleeAttackTime = 0
		self.MeleeAttackDamage = 35 
		self.MeleeAttackDamageDistance = 60
		self.HasMeleeAttackMissSounds = true
		self.DisableDefaultMeleeAttackDamageCode = false
		self.SoundTbl_MeleeAttackExtra = {
		"vj_cofr/aom/weapons/axe/Axe_hitbody.wav"
}
		self.SoundTbl_MeleeAttackMiss = {
		"vj_cofr/aom/weapons/axe/Axe_swing.wav"
}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeChecks()
    if self:GetBodygroup(0) == 0 then
	local color = Color(255, 243, 140, 255) -- The shock wave color
	local dmg = 25 -- How much damage should the shock wave do?

	-- flags 0 = No fade!
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, color)
	effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, color)
	
	if self.HasSounds && GetConVar("vj_npc_sd_meleeattack"):GetInt() == 0 then
		VJ_EmitSound(self, {"vj_cofr/aom/davidbad/thunder_attack1.wav","vj_cofr/aom/davidbad/thunder_attack2.wav","vj_cofr/aom/davidbad/thunder_attack3.wav"}, 100, math.random(80,100))
end
	util.VJ_SphereDamage(self, self, self:GetPos(), 150, dmg, DMG_SHOCK, true, true, {DisableVisibilityCheck=true, Force=80})
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt, isProp)
	if self:IsOnFire() && self:GetBodygroup(0) == 1 then hitEnt:Ignite(4) end
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	if self:IsOnFire() && self.Addiction_OnFire then
	   self.Addiction_OnFire = false
	   self:Extinguish()
       VJ_EmitSound(self, self.SoundTbl_FireOff, 75, 100)
	   //self.HasBreathSound = false
	   timer.Remove("VJ_COFR_Addiction_Fire")
end
    VJ_COFR_DeathCode(self)	
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
        "vj_cofr/aom/david/footsteps/pl_step1.wav",
        "vj_cofr/aom/david/footsteps/pl_step2.wav",
        "vj_cofr/aom/david/footsteps/pl_step3.wav",
        "vj_cofr/aom/david/footsteps/pl_step4.wav"
	},
	[MAT_DIRT] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_FLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[MAT_GRATE] = {
        "vj_cofr/aom/david/footsteps/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps/pl_metal4.wav"
	},
	[MAT_ALIENFLESH] = {
        "vj_cofr/cof/simon/footsteps/mud1.wav",
        "vj_cofr/cof/simon/footsteps/mud2.wav",
        "vj_cofr/cof/simon/footsteps/mud3.wav",
        "vj_cofr/cof/simon/footsteps/mud4.wav"
	},
	[74] = { -- Snow
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_PLASTIC] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[MAT_METAL] = {
        "vj_cofr/aom/david/footsteps/pl_metal1.wav",
        "vj_cofr/aom/david/footsteps/pl_metal2.wav",
        "vj_cofr/aom/david/footsteps/pl_metal3.wav",
        "vj_cofr/aom/david/footsteps/pl_metal4.wav"
	},
	[MAT_SAND] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_FOLIAGE] = {
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_COMPUTER] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[MAT_SLOSH] = {
        "vj_cofr/aom/david/footsteps/pl_slosh1.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh2.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh3.wav",
        "vj_cofr/aom/david/footsteps/pl_slosh4.wav"
	},
	[MAT_TILE] = {
        "vj_cofr/aom/david/footsteps/pl_tile1.wav",
        "vj_cofr/aom/david/footsteps/pl_tile2.wav",
        "vj_cofr/aom/david/footsteps/pl_tile3.wav",
        "vj_cofr/aom/david/footsteps/pl_tile4.wav",
        "vj_cofr/aom/david/footsteps/pl_tile5.wav"
	},
	[85] = { -- Grass
        "vj_cofr/aom/david/footsteps/pl_dirt1.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt2.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt3.wav",
        "vj_cofr/aom/david/footsteps/pl_dirt4.wav"
	},
	[MAT_VENT] = {
        "vj_cofr/aom/david/footsteps/pl_duct1.wav",
        "vj_cofr/aom/david/footsteps/pl_duct2.wav",
        "vj_cofr/aom/david/footsteps/pl_duct3.wav",
        "vj_cofr/aom/david/footsteps/pl_duct4.wav"
	},
	[MAT_WOOD] = {
        "vj_cofr/aom/david/footsteps/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps/pl_grate4.wav"
	},
	[MAT_GLASS] = {
        "vj_cofr/aom/david/footsteps/pl_grate1.wav",
        "vj_cofr/aom/david/footsteps/pl_grate2.wav",
        "vj_cofr/aom/david/footsteps/pl_grate3.wav",
        "vj_cofr/aom/david/footsteps/pl_grate4.wav"
	}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnFootStepSound()
	if !self:IsOnGround() then return end
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() +Vector(0,0,-150),
		filter = {self}
	})
	if tr.Hit && self.FootSteps[tr.MatType] then
		VJ_EmitSound(self,VJ_PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
	if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
		VJ_EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FootStepSoundCode(CustomTbl)
	if self.HasSounds == false or self.HasFootStepSound == false or self.MovementType == VJ_MOVETYPE_STATIONARY then return end
	if self:IsOnGround() && self:GetGroundEntity() != NULL then
		if self.DisableFootStepSoundTimer == true then
			self:CustomOnFootStepSound()
			return
		elseif self:IsMoving() && CurTime() > self.FootStepT then
			self:CustomOnFootStepSound()
			local CurSched = self.CurrentSchedule
			if self.DisableFootStepOnRun == false && ((VJ_HasValue(self.AnimTbl_Run,self:GetMovementActivity())) or (CurSched != nil  && CurSched.IsMovingTask_Run == true)) /*(VJ_HasValue(VJ_RunActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomRunActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Run()
				self.FootStepT = CurTime() + self.FootStepTimeRun
				return
			elseif self.DisableFootStepOnWalk == false && (VJ_HasValue(self.AnimTbl_Walk,self:GetMovementActivity()) or (CurSched != nil  && CurSched.IsMovingTask_Walk == true)) /*(VJ_HasValue(VJ_WalkActivites,self:GetMovementActivity()) or VJ_HasValue(self.CustomWalkActivites,self:GetMovementActivity()))*/ then
				self:CustomOnFootStepSound_Walk()
				self.FootStepT = CurTime() + self.FootStepTimeWalk
				return
			end
		end
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/