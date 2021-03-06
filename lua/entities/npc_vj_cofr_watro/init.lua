AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/watro.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}  
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.CanTurnWhileStationary = false
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.SightAngle = 180
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = {"vjseq_attack"} 
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25 
ENT.MeleeAttackDistance = 80 
//ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 120
ENT.MeleeAttackDamageAngleRadius = 90
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 5 
ENT.HasExtraMeleeAttackSounds = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -120), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "joint8", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/watro/watro_hit.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/watro/watro_swing.wav"
}	
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}	
-- Custom
ENT.Watro_Burrowed = true
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Watro_CustomOnInitialize()
	if self.Watro_Burrowed then
	    self.AnimTbl_IdleStand = {ACT_IDLE_RELAXED}
		self.HasMeleeAttack = false
		self:DrawShadow(false)
		self.CallForHelp = false
		self:AddFlags(FL_NOTARGET)
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	 self:SetCollisionBounds(Vector(20, 20, 120), Vector(-20, -20, 0))
     self:Watro_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "attack" then
		self:MeleeAttackCode()
    end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
	ply:ChatPrint("SPACE: Unburrow")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    if !IsValid(self:GetEnemy()) or self.DeathAnimationCodeRan or !self.Watro_Burrowed then return end	
	if self.Watro_Burrowed && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 100 && !self.VJ_IsBeingControlled or self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ_EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    else
        VJ_EmitSound(self, "vj_cofr/fx/bodysplat.wav", 75, 100)
end		
		self.Watro_Burrowed = false
		self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,false,false)
	    self.AnimTbl_IdleStand = {ACT_IDLE_STIMULATED}
		self.HasMeleeAttack = true
		self:DrawShadow(true)
		self.CallForHelp = true
        self:RemoveFlags(FL_NOTARGET)		
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
    dmginfo:ScaleDamage(0.45)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
	self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
	self:DrawShadow(false)
	VJ_COFR_DeathCode(self)	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/