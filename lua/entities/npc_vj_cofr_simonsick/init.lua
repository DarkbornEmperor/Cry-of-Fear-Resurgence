AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sicksimon.mdl"
ENT.StartHealth = 400 
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"} 
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true 
ENT.AnimTbl_RangeAttack = {"vjseq_bossmove1","vjseq_bossmove2"}
ENT.RangeDistance = 1500
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 10
ENT.NextRangeAttackTime_DoRand = 15
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -60), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(5, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/sicksimon/bossmusic.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.SickSimon_NextTwisterSpawnT = 0
ENT.SickSimon_NextPropT = 0

ENT.PropstoThrow = {
"models/props_junk/wood_crate001a.mdl",
"models/props_wasteland/dockplank01b.mdl",
"models/props_junk/wood_crate001a_damaged.mdl",
"models/props_wasteland/dockplank01a.mdl",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SickSimon_CustomOnInitialize() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:SickSimon_CustomOnInitialize()
    self.Twisters = {}
    self.Props = {}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "prepare_range" then
		self:LiftProps()
	elseif key == "attack_range" then
		self:RangeAttackCode()	
end		
    if key == "death" && self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
	ply:ChatPrint("JUMP: Summon Twisters")
    ply:ChatPrint("NOTE: Summoning Twisters will cause a 20 second delay until able to spawn more and the current Twisters are dead.")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    local ent = self:GetEnemy()
    for _,v in ipairs(ents.FindInSphere(self:GetPos(),500)) do
	local PropPhysics = v:GetPhysicsObject()			
	if IsValid(v) && v:GetClass() == "prop_physics" && (!IsValid(ent) or !IsValid(self) or self.Dead) then
		PropPhysics:EnableGravity(true)
	end
end
    if !IsValid(ent) or self.Dead then return end
 	if IsValid(ent) && CurTime() > self.SickSimon_NextTwisterSpawnT && !IsValid(self.Twister1) && !IsValid(self.Twister2) && !IsValid(self.Twister3) && !IsValid(self.Twister4) && !IsValid(self.Twister5) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then		
		local Twister1 = ents.Create("npc_vj_cofr_faceless_twister")
		Twister1:SetPos(self:GetPos() + self:GetRight()*40 + self:GetUp()*10)
		Twister1:SetAngles(self:GetAngles())
		Twister1.VJ_NPC_Class = self.VJ_NPC_Class	
		Twister1:Spawn()
	    self.Twisters[#self.Twisters + 1] = Twister1 -- Register the Twisters		
        self.Twister1 = Twister1		
		
		local Twister2 = ents.Create("npc_vj_cofr_faceless_twister")
		Twister2:SetPos(self:GetPos() + self:GetRight()*-40 + self:GetUp()*10)
		Twister2:SetAngles(self:GetAngles())
		Twister2.VJ_NPC_Class = self.VJ_NPC_Class		
		Twister2:Spawn()
	    self.Twisters[#self.Twisters + 1] = Twister2 -- Register the Twisters		
        self.Twister2 = Twister2		
		
		local Twister3 = ents.Create("npc_vj_cofr_faceless_twister")
		Twister3:SetPos(self:GetPos() + self:GetRight()*80 + self:GetUp()*10)
		Twister3:SetAngles(self:GetAngles())
		Twister3.VJ_NPC_Class = self.VJ_NPC_Class	
		Twister3:Spawn()
	    self.Twisters[#self.Twisters + 1] = Twister3 -- Register the Twisters		
        self.Twister3 = Twister3		
		
		local Twister4 = ents.Create("npc_vj_cofr_faceless_twister")
		Twister4:SetPos(self:GetPos() + self:GetRight()*-80 + self:GetUp()*10)
		Twister4:SetAngles(self:GetAngles())
		Twister4.VJ_NPC_Class = self.VJ_NPC_Class	
		Twister4:Spawn()
	    self.Twisters[#self.Twisters + 1] = Twister4 -- Register the Twisters		
        self.Twister4 = Twister4		

		local Twister5 = ents.Create("npc_vj_cofr_faceless_twisterv")
		Twister5:SetPos(self:GetPos() + self:GetForward()*-90 + self:GetUp()*10)
		Twister5:SetAngles(self:GetAngles())
		Twister5.VJ_NPC_Class = self.VJ_NPC_Class	
		Twister5:Spawn()
	    self.Twisters[#self.Twisters + 1] = Twister5 -- Register the Twisters		
        self.Twister5 = Twister5		
		
		self.SickSimon_NextTwisterSpawnT = CurTime() + 20  
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:LiftProps()
     local ent = self:GetEnemy()	
     for _,v in ipairs(ents.FindInSphere(self:GetPos(),500)) do
	 local PropPhysics = v:GetPhysicsObject()
     if IsValid(self) && IsValid(v) && v:GetClass() == "prop_physics" && IsValid(ent) && !self.Dead then
        PropPhysics:SetVelocity(v:GetUp()*100)
		PropPhysics:EnableGravity(false)			
        end
    end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed) 
     local ent = self:GetEnemy()	
     if IsValid(ent) && self:Visible(ent) && CurTime() > self.SickSimon_NextPropT /*&& !IsValid(self.Prop) && !IsValid(self.Prop2)*/ then
        local Prop = ents.Create("prop_physics") 
		Prop:SetModel(VJ.PICK(self.PropstoThrow))
		Prop:SetPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*-200 + self:GetUp()*60)
		Prop:SetAngles(self:GetAngles())
		Prop:SetOwner(self)
		Prop:Spawn()
	    self.Props[#self.Props + 1] = Prop -- Register the Props		
        self.Prop = Prop	
		
        local Prop2 = ents.Create("prop_physics") 
		Prop2:SetModel(VJ.PICK(self.PropstoThrow))
		Prop2:SetPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*200 + self:GetUp()*60)
		Prop2:SetAngles(self:GetAngles())
		Prop2:SetOwner(self)
        Prop2:Spawn()
	    self.Props[#self.Props + 1] = Prop2 -- Register the Props		
        self.Prop2 = Prop2
			
		self.SickSimon_NextPropT = CurTime() + self.NextRangeAttackTime or self.NextRangeAttackTime_DoRand 

        SafeRemoveEntityDelayed(self.Prop,15)
        SafeRemoveEntityDelayed(self.Prop2,15)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()	
     local ent = self:GetEnemy()	
     for _,v in ipairs(ents.FindInSphere(self:GetPos(),500)) do
	 local PropPhysics = v:GetPhysicsObject()
     if IsValid(self) && IsValid(v) && v:GetClass() == "prop_physics" && IsValid(ent) && !self.Dead then			
		PropPhysics:EnableGravity(true)
        PropPhysics:SetVelocity((ent:GetPos() + ent:OBBCenter() - v:GetPos())*8 + v:GetUp()*200) 			
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:CustomOnTakeDamage_BeforeImmuneChecks(dmginfo,hitgroup)
	-- Make a metal ricochet effect
    if hitgroup == 8 then
	if dmginfo:GetDamagePosition() != vec then
		local rico = EffectData()
		rico:SetOrigin(dmginfo:GetDamagePosition())
		rico:SetScale(5) -- Size
		rico:SetMagnitude(math.random(1,2)) -- Effect type | 1 = Animated | 2 = Basic
		util.Effect("VJ_COFR_Rico", rico)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	dmginfo:ScaleDamage(0.45)
    if hitgroup == 8 then
	if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self,"vj_cofr/cof/faster/faster_headhit"..math.random(1,4)..".wav", 75, 100) end		
        self.Bleeds = false
		dmginfo:ScaleDamage(0.20)
	else
	    self.Bleeds = true
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
    self:DoChangeMovementType(VJ_MOVETYPE_GROUND)	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
	VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
  	-- If the NPC was removed, then remove its children as well, but not when it's killed!
	if !self.Dead then
		for _, v in pairs(self.Twisters) do
			if IsValid(v) then v:Remove() end
	end
end
		for _, v in pairs(self.Props) do
			if IsValid(v) then v:Remove() end
    end	
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/