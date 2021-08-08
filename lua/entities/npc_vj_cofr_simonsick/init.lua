AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/vj_cofr/cof/sicksimon.mdl"}
ENT.StartHealth = 500 
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"}
ENT.BloodColor = "Red" 
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"} 
ENT.MovementType = VJ_MOVETYPE_STATIONARY 
ENT.HasMeleeAttack = false 
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HasDeathAnimation = true 
ENT.AnimTbl_Death = {ACT_DIESIMPLE}
ENT.DeathAnimationTime = 1.45 
ENT.HasSoundTrack = true
	-- ====== Controller Data ====== --
ENT.VJC_Data = {
	CameraMode = 1, -- Sets the default camera mode | 1 = Third Person, 2 = First Person
	ThirdP_Offset = Vector(30, 25, -40), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "Bip01 Head", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {
"vj_cofr/cof/sicksimon/sicksimon.mp3"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.SickSimon_NextTwisterSpawnT = 0
ENT.SickSimon_NextAttackT = 0
ENT.PropstoThrow ={
"models/props_junk/wood_crate001a.mdl",
"models/props_wasteland/dockplank01b.mdl",
"models/props_junk/wood_crate001a_damaged.mdl",
"models/props_wasteland/dockplank01a.mdl",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
    if GetConVarNumber("VJ_COFR_Boss_Music") == 0 then
        self.HasSoundTrack = false 
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SickSimon_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
     self:SetCollisionBounds(Vector(13, 13, 72), Vector(-13, -13, 0))
     self:SickSimon_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply)
    ply:ChatPrint("E: Telekinesis Attack")
	ply:ChatPrint("SPACE: Spawn Twisters")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
 	if IsValid(self:GetEnemy()) && CurTime() > self.SickSimon_NextTwisterSpawnT && !IsValid(self.Twister1) && !IsValid(self.Twister2) && !IsValid(self.Twister3) && !IsValid(self.Twister4) && !IsValid(self.Twister5) && ((self.VJ_IsBeingControlled == false) or (self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_JUMP))) then
		if self.VJ_IsBeingControlled == true then
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Spawning Twisters! Cool Down: 20 seconds!")
end		
		self.Twister1 = ents.Create("npc_vj_cofr_twister")
		self.Twister1:SetPos(self:GetPos() + self:GetRight()*60)
		self.Twister1:SetAngles(self:GetAngles())
		self.Twister1:Spawn()
		self.Twister1:SetOwner(self)
		self.Twister1:Activate()
		self:DeleteOnRemove(self.Twister1)		
		
		self.Twister2 = ents.Create("npc_vj_cofr_twister")
		self.Twister2:SetPos(self:GetPos() + self:GetRight()*-60)
		self.Twister2:SetAngles(self:GetAngles())
		self.Twister2:Spawn()
		self.Twister2:SetOwner(self)
	    self.Twister2:Activate()
		self:DeleteOnRemove(self.Twister2)	
		
		self.Twister3 = ents.Create("npc_vj_cofr_twister")
		self.Twister3:SetPos(self:GetPos() + self:GetRight()*90)
		self.Twister3:SetAngles(self:GetAngles())
		self.Twister3:Spawn()
		self.Twister3:SetOwner(self)
		self.Twister3:Activate()
		self:DeleteOnRemove(self.Twister3)			
		
		self.Twister4 = ents.Create("npc_vj_cofr_twister")
		self.Twister4:SetPos(self:GetPos() + self:GetRight()*-90)
		self.Twister4:SetAngles(self:GetAngles())
		self.Twister4:Spawn()
		self.Twister4:SetOwner(self)
		self.Twister4:Activate()
		self:DeleteOnRemove(self.Twister4)			

		self.Twister5 = ents.Create("npc_vj_cofr_twisterv")
		self.Twister5:SetPos(self:GetPos() + self:GetForward()*-90)
		self.Twister5:SetAngles(self:GetAngles())
		self.Twister5:Spawn()
		self.Twister5:SetOwner(self)
		self.Twister5:Activate()
		self:DeleteOnRemove(self.Twister5)			
		
		self.SickSimon_NextTwisterSpawnT = CurTime() + 20  
end
     if self:GetEnemy() != nil && CurTime() > self.SickSimon_NextAttackT && ((self.VJ_IsBeingControlled == false) or (self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_USE))) then
            self:VJ_ACT_PLAYACTIVITY(ACT_RANGE_ATTACK1,true,false,true) 
            self.Prop = ents.Create("prop_physics") 
			self.Prop:SetModel(VJ_PICK(self.PropstoThrow))
			self.Prop:SetLocalPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*-200 + self:GetUp()*60)
			self.Prop:SetOwner(self)
			self.Prop:Spawn()
			self.Prop:Activate()
			self:DeleteOnRemove(self.Prop)
			
            self.Prop2 = ents.Create("prop_physics") 
			self.Prop2:SetModel(VJ_PICK(self.PropstoThrow))
			self.Prop2:SetLocalPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*-400 + self:GetUp()*60)
			self.Prop2:SetOwner(self)
			self.Prop2:Spawn()
			self.Prop2:Activate()			
			self:DeleteOnRemove(self.Prop2)
			
            self.Prop3 = ents.Create("prop_physics") 
			self.Prop3:SetModel(VJ_PICK(self.PropstoThrow))
			self.Prop3:SetLocalPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*200 + self:GetUp()*60)
			self.Prop3:SetOwner(self)
			self.Prop3:Spawn()
			self.Prop3:Activate()
			self:DeleteOnRemove(self.Prop3)	
			
            self.Prop4 = ents.Create("prop_physics") 
			self.Prop4:SetModel(VJ_PICK(self.PropstoThrow))
			self.Prop4:SetLocalPos(self:GetPos() + self:GetForward()*90 + self:GetRight()*400 + self:GetUp()*60)
			self.Prop4:SetOwner(self)
			self.Prop4:Spawn()
			self.Prop4:Activate()
			self:DeleteOnRemove(self.Prop4)
			
            self.SickSimon_NextAttackT = CurTime() + 10
			
			for _,v in ipairs(ents.FindInSphere(self:GetPos(),99999999999999)) do
            timer.Simple(7,function() if IsValid(self) && IsValid(v) && v:GetClass() == "prop_physics" && IsValid(self.Prop) && IsValid(self.Prop2) && IsValid(self.Prop3) && IsValid(self.Prop4) then 
            self.Prop:Remove()
			self.Prop2:Remove()
			self.Prop3:Remove()
			self.Prop4:Remove()
        end  
    end)
end
     for _,v in ipairs(ents.FindInSphere(self:GetPos(),1000)) do
     if IsValid(v) && v:GetClass() == "prop_physics" or v:GetClass() == "prop_ragdoll" && self:GetEnemy() != nil then
            v:GetPhysicsObject():Wake()
            timer.Simple(1.2,function() if IsValid(self) && IsValid(v) && self:GetEnemy() != nil then 
            v:GetPhysicsObject():SetVelocity(v:GetUp()*100)
			v:GetPhysicsObject():EnableGravity(false)
            timer.Simple(2.5,function() if IsValid(self) && IsValid(v) && self:GetEnemy() != nil then 
			v:GetPhysicsObject():EnableGravity(true)
            v:GetPhysicsObject():SetVelocity((self:GetEnemy():GetPos() - v:GetPos())*8 + self:GetUp()*200) end end) end end)
		 end
      end
   end	  
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	    dmginfo:ScaleDamage(0.25)		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	   self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
       self:AddFlags(FL_NOTARGET) -- So normal NPCs can stop shooting at the corpse
end
---------------------------------------------------------------------------------------------------------------------------------------------
--function ENT:CustomOnRemove()
/*
     if IsValid(self.Prop) then self.Prop:Remove() end
     if IsValid(self.Prop2) then self.Prop2:Remove() end
     if IsValid(self.Prop3) then self.Prop3:Remove() end
     if IsValid(self.Prop4) then self.Prop4:Remove() end
*/
--end
/*-----------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/