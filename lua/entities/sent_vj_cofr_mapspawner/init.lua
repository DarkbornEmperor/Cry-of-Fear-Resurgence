AddCSLuaFile("shared.lua")
include('shared.lua') 
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVj, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	

======================================================================================================================================

  Knight: 

  This is the spawner that I have thought about for a few days. Although not as good as it is ideal, but it is enough. 
  After all, I spend most of my time designing other works. I think you can test this first. 
  To make sure it works, by the way tell ZAKAL and ask him to help me look at the new design, 
  I need more inspiration.

	
=======================================================================================================================================	
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------		
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------	
-----------------------------------------------*/
ENT.Model = {"models/Gibs/HGIBS.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 1
ENT.SightDistance = 99999999
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.HullType = HULL_HUMAN
ENT.GodMode = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR","CLASS_AOM_DC"}
ENT.BloodColor = ""
ENT.COFRControl = true
ENT.RunAwayOnUnknownDamage = false
ENT.HasMeleeAttack = false
ENT.SAngle2 = 55
ENT.FindEnemy_UseSphere = false 
ENT.FindEnemy_CanSeeThroughWalls = false
ENT.NUM = 0
ENT.DisableMakingSelfEnemyToNPCs = true
ENT.NUM2 = 0
ENT.NUM3 = 0
ENT.CREA = true
ENT.CREA2 = true
ENT.CREAd = true
ENT.CREA2d = true
ENT.CREAda = true
ENT.CREA2da = true
ENT.CREA3 = true
ENT.Decrease = false
ENT.HasDeathAnimation = false
ENT.HasBloodPool = false -- Does it have a blood pool?
ENT.HasDeathRagdoll = false
ENT.MaxMonster = 0 
ENT.cout = true
ENT.cout2 = false
ENT.cout3 = true
ENT.time = 0.65
ENT.time2 = 0.65
ENT.time3 = 0.65
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_SoundTrack = {""}
ENT.HasSoundTrack = true
ENT.SoundTrackLevel = 0.8
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
   if GetConVarNumber("VJ_COFR_MapSpawner_Music") == 0 then
        self.HasSoundTrack = false 
end	
   if GetConVarNumber("VJ_COFR_MapSpawner_Boss") == 1 then
    self.COFR = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
	"npc_vj_cofrc_duorunner",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_slowernoboss",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream",
	"npc_vj_cofr_sawer",
	"npc_vj_cofr_sawrunner",
	"npc_vj_cofr_mace",
	"npc_vj_cofr_carcass",
	"npc_vj_cofr_sawcrazy",
	"npc_vj_cofr_craig",
	"npc_vj_cofr_simonbook",
	"npc_vj_cofr_simonbookm",
	"npc_vj_cofr_simonsicksui",
	"npc_vj_cofrc_maceswimmer"
}
    self.COFR2 = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
	"npc_vj_cofrc_duorunner",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_slowernoboss",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream",
	"npc_vj_cofr_sawer",
	"npc_vj_cofr_sawrunner",
	"npc_vj_cofr_mace",
	"npc_vj_cofr_carcass",
	"npc_vj_cofr_sawcrazy",
	"npc_vj_cofr_craig",
	"npc_vj_cofr_simonbook",
	"npc_vj_cofr_simonbookm",
	"npc_vj_cofr_simonsicksui",
	"npc_vj_cofrc_maceswimmer"
}
    self.COFR3 = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
	"npc_vj_cofrc_duorunner",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream",
	"npc_vj_cofr_sawer",
	"npc_vj_cofr_sawrunner",
	"npc_vj_cofr_mace",
	"npc_vj_cofr_carcass",
	"npc_vj_cofr_sawcrazy",
	"npc_vj_cofr_craig",
	"npc_vj_cofr_simonbook",
	"npc_vj_cofr_simonbookm",
	"npc_vj_cofr_simonsicksui",
	"npc_vj_cofrc_maceswimmer"
}
elseif GetConVarNumber("VJ_COFR_MapSpawner_Boss") == 0 then
    self.COFR = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream"	
}
    self.COFR2 = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream"	
}
    self.COFR3 = {	
	"npc_vj_cofr_slower1",
	"npc_vj_cofr_slower3",
	"npc_vj_cofr_slowerno",
	"npc_vj_cofr_slower10",
	"npc_vj_cofr_crawler",
	"npc_vj_cofr_croucher",
	"npc_vj_cofr_upper",
	"npc_vj_cofr_baby",
	"npc_vj_cofr_children",
	"npc_vj_cofr_faster",
    "npc_vj_cofr_fastermale",
	"npc_vj_cofr_flygare",
    "npc_vj_cofr_drowned",
    "npc_vj_cofr_crazyrunner",	
    "npc_vj_cofr_sewmo",
    "npc_vj_cofr_citalopram",
    "npc_vj_cofr_faceless",	
    "npc_vj_cofr_faceless2",
    "npc_vj_cofr_faced",
    "npc_vj_cofr_twister",	
    "npc_vj_cofr_twisterv",
    "npc_vj_cofr_krypandenej",
    "npc_vj_cofr_suicider",	
    "npc_vj_cofr_taller",
    "npc_vj_cofr_psycho",
    "npc_vj_cofr_stranger",
    "npc_vj_cofr_dreamerrunner",
    "npc_vj_cofrc_crazyrumpel",
    "npc_vj_cofrc_fasterclown",
    "npc_vj_cofrc_psychopumpkin",
	"npc_vj_cofrc_babyswimmer",
	"npc_vj_cofrc_fasterfemale",
	"npc_vj_cofrc_slower3dream"	
}	
    end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
  for k,v in pairs(ents.GetAll()) do  
  if v:IsValid() && v != self && v.COFRControl == true then 
       PrintMessage(HUD_PRINTTALK, "Only one Map Spawner is allowed.")
       self:Remove()
end
       self:SetNoDraw(true)
       self:AddFlags(FL_NOTARGET)
       self:SetCollisionBounds(Vector(0, 0, 0), -Vector(0, 0, 0))
    end 
end			
----------------------------------------
function ENT:CustomOnThink_AIEnabled() 
local max = math.max(60)
if self.CREA == true && self.CREA2 == true then
for k,v in pairs(player.GetAll()) do  
if v:IsValid() && v != self && v:IsPlayer() && v:GetClass() != self:GetClass() && self.CREA == true && self.CREA2 == true && self.CREA3 == true && v:Health() > 0 &&  self.MaxMonster < max  then 
local at = player.GetAll()
local chce = at[math.random(1,#at)]
local pos2 = chce:LocalToWorld(Vector(math.random(-1800,1800),math.random(-1800,1800),17))
self.CREA = false	
self.cofrd = ents.Create(VJ_PICK(self.COFR))
self.cofrd:SetPos(pos2) 
self.cofrd:SetAngles(self:GetAngles()) 
self.cofrd:Spawn()
self.cofrd.IdleAlwaysWander = false 
self.cofrd.DisableWandering = true
self.cofrd:SetNoDraw(false)
self.cofrd.HasAlertSounds = false
 
self.cofrd:Activate() 
self.cofrd:SetOwner(self) 
self.cofrd.HasSounds = false
self.cofrd.FindEnemy_UseSphere = true 
self.cofrd.FindEnemy_CanSeeThroughWalls = true
self.cofrd.SightDistance = 9900000
self:DeleteOnRemove(self.cofrd)
timer.Simple(0.55,function() if IsValid(self.cofrd) then 
self.cofrd.HasSounds = true
self.cofrd.IdleAlwaysWander = true
self.cofrd.DisableWandering = false
self.cofrd:SetNoDraw(false)
self.cofrd.HasAlertSounds = true end end)	
timer.Simple(self.time,function() if IsValid(self) then 
self.CREA = true end end)
local tr1 = {
						start = self.cofrd:GetPos(),
						endpos = self.cofrd:GetPos() + self.cofrd:GetForward()*30 + self.cofrd:GetUp()*30,
						mins = self.cofrd:OBBMins(),
						maxs = self.cofrd:OBBMaxs(),
						filter = {self.cofrd}
					}
					local tr = util.TraceHull(tr1)
local tr12 = {
						start = self.cofrd:GetPos(),
						endpos = self.cofrd:GetPos() + self.cofrd:GetForward()*-30 + self.cofrd:GetUp()*30,
						mins = self.cofrd:OBBMins(),
						maxs = self.cofrd:OBBMaxs(),
						filter = {self.cofrd}
					}
					local tr2 = util.TraceHull(tr12)		

		local tr13 = {
						start = self.cofrd:GetPos(),
						endpos = self.cofrd:GetPos() + self.cofrd:GetRight()*30 + self.cofrd:GetUp()*30,
						mins = self.cofrd:OBBMins(),
						maxs = self.cofrd:OBBMaxs(),
						filter = {self.cofrd}
					}
					local tr3 = util.TraceHull(tr13)	

		local tr14 = {
						start = self.cofrd:GetPos(),
						endpos = self.cofrd:GetPos() + self.cofrd:GetRight()*-30 + self.cofrd:GetUp()*30,
						mins = self.cofrd:OBBMins(),
						maxs = self.cofrd:OBBMaxs(),
						filter = {self.cofrd}
					}
					local tr4 = util.TraceHull(tr14)

			local tr15 = {
						start = self.cofrd:GetPos(),
						endpos = self.cofrd:GetPos() + self.cofrd:GetUp()*80,
						mins = self.cofrd:OBBMins(),
						maxs = self.cofrd:OBBMaxs(),
						filter = {self.cofrd}
					}
					local tr5 = util.TraceHull(tr15)		
					
					
if tr.Hit && tr.HitWorld && tr2.HitWorld && tr3.HitWorld && tr4.HitWorld && tr5.HitWorld then

self.cofrd:Remove()

end
for k,n in ipairs(ents.GetAll()) do
if IsValid(self.cofrd) && n.IsVJBaseSNPC == true && n:GetClass() == self.cofrd:GetClass() && n != self && n != self.cofrd && self.cofrd:GetPos():Distance(n:GetPos()) <= 90 && (!v:Visible(self.cofrd) or (!IsValid(seen.Entity))) and  ((chce:GetForward():Dot((self.cofrd:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
n:Remove()
end
end
if IsValid(self.cofrd) && self.cofrd:GetPos():Distance(v:GetPos()) <= 300 then
self.cofrd:Remove()
end
if self.cofrd:WaterLevel() == 3 && IsValid(self.cofrd) then
self.cofrd:Remove()
end
if !self.cofrd:IsInWorld() && IsValid(self.cofrd) then
self.cofrd:Remove()
end 
timer.Simple(0.55,function() if !IsValid(self.cofrd) then 
self.time = 0.65
end end)
if IsValid(self.cofrd) then
timer.Simple(0.56,function() if IsValid(self.cofrd) then 
self.time = math.random(7,20)
self.MaxMonster = (self.MaxMonster + 1)
self.NUM = (self.NUM + 2)
end end)
end 

if IsValid(self.cofrd) then
timer.Simple(0.55,function() if IsValid(self.cofrd)  && !self.cofrd:IsOnGround() && self.cofrd:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd:Remove()
end end)
end 

if IsValid(self.cofrd) then
timer.Simple(0.55,function() if IsValid(self.cofrd)  && !self.cofrd:IsMoving() && self.cofrd:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd:Remove()
end end)
end  
local seen = util.TraceLine({start = self.cofrd:NearestPoint(self.cofrd:GetPos() + self.cofrd:OBBCenter()),endpos = v:EyePos()})
if IsValid(self.cofrd) && (IsValid(seen.Entity) == v:GetEyeTrace().Entity or v:Visible(self.cofrd)) and  ((chce:GetForward():Dot((self.cofrd:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
self.cofrd:Remove()
end
end
end
end
if self.MaxMonster >= max then
self.Decrease = true
self.CREA2 = false
end 
if self.NUM >= 250  then
self.CREA3 = false
self.cout2 = true
end
if self.cout2 == true && self.cout3 == true then
self.cout3 = false
self.NUM = (self.NUM - 6)
timer.Simple(math.random(1,3),function() if IsValid(self) then 
self.cout3 = true end end)
end

if self.NUM <= 0 then
self.cout2 = false
self.CREA3 = true

end

if self.Decrease == true && self.cout == true then
self.MaxMonster = (self.MaxMonster - 3)
self.cout = false
timer.Simple(math.random(1,3),function() if IsValid(self) then 
self.cout = true end end)
end
if self.MaxMonster <= 0 then
self.CREA2 = true
self.Decrease = false
end

local max = math.max(60)
if self.CREAd == true && self.CREA2d == true then
for k,v in pairs(player.GetAll()) do  
if v:IsValid() && v != self && v:IsPlayer() && v:GetClass() != self:GetClass() && self.CREAd == true && self.CREA2d == true && self.CREA3 == true && v:Health() > 0 &&  self.MaxMonster < max  then 
local at = player.GetAll()
local chce = at[math.random(1,#at)]
local pos3 = chce:LocalToWorld(Vector(math.random(-1800,1800),math.random(-1800,1800),17))
self.CREAd = false	
self.cofrd1 = ents.Create(VJ_PICK(self.COFR2))
self.cofrd1:SetPos(pos3) 
self.cofrd1:SetAngles(self:GetAngles()) 
self.cofrd1:Spawn()
self.cofrd1.IdleAlwaysWander = false 
self.cofrd1.DisableWandering = true
self.cofrd1:SetNoDraw(false)
self.cofrd1.HasAlertSounds = false
 
self.cofrd1:Activate() 
self.cofrd1:SetOwner(self) 
self.cofrd1.HasSounds = false
self.cofrd1.FindEnemy_UseSphere = true 
self.cofrd1.FindEnemy_CanSeeThroughWalls = true
self.cofrd1.SightDistance = 9900000
self:DeleteOnRemove(self.cofrd1)
timer.Simple(0.55,function() if IsValid(self.cofrd1) then 
self.cofrd1.HasSounds = true
self.cofrd1.IdleAlwaysWander = true
self.cofrd1.DisableWandering = false
self.cofrd1:SetNoDraw(false)
self.cofrd1.HasAlertSounds = true end end)	
timer.Simple(self.time2,function() if IsValid(self) then 
self.CREAd = true end end)
local tr1 = {
						start = self.cofrd1:GetPos(),
						endpos = self.cofrd1:GetPos() + self.cofrd1:GetForward()*30 + self.cofrd1:GetUp()*30,
						mins = self.cofrd1:OBBMins(),
						maxs = self.cofrd1:OBBMaxs(),
						filter = {self.cofrd1}
					}
					local tr = util.TraceHull(tr1)
local tr12 = {
						start = self.cofrd1:GetPos(),
						endpos = self.cofrd1:GetPos() + self.cofrd1:GetForward()*-30 + self.cofrd1:GetUp()*30,
						mins = self.cofrd1:OBBMins(),
						maxs = self.cofrd1:OBBMaxs(),
						filter = {self.cofrd1}
					}
					local tr2 = util.TraceHull(tr12)		

		local tr13 = {
						start = self.cofrd1:GetPos(),
						endpos = self.cofrd1:GetPos() + self.cofrd1:GetRight()*30 + self.cofrd1:GetUp()*30,
						mins = self.cofrd1:OBBMins(),
						maxs = self.cofrd1:OBBMaxs(),
						filter = {self.cofrd1}
					}
					local tr3 = util.TraceHull(tr13)	

		local tr14 = {
						start = self.cofrd1:GetPos(),
						endpos = self.cofrd1:GetPos() + self.cofrd1:GetRight()*-30 + self.cofrd1:GetUp()*30,
						mins = self.cofrd1:OBBMins(),
						maxs = self.cofrd1:OBBMaxs(),
						filter = {self.cofrd1}
					}
					local tr4 = util.TraceHull(tr14)

			local tr15 = {
						start = self.cofrd1:GetPos(),
						endpos = self.cofrd1:GetPos() + self.cofrd1:GetUp()*80,
						mins = self.cofrd1:OBBMins(),
						maxs = self.cofrd1:OBBMaxs(),
						filter = {self.cofrd1}
					}
					local tr5 = util.TraceHull(tr15)		
					
					
if tr.Hit && tr.HitWorld && tr2.HitWorld && tr3.HitWorld && tr4.HitWorld && tr5.HitWorld then

self.cofrd1:Remove()

end
for k,n in ipairs(ents.GetAll()) do
if IsValid(self.cofrd1) && n.IsVJBaseSNPC == true && n:GetClass() == self.cofrd1:GetClass() && n != self && n != self.cofrd1 && self.cofrd1:GetPos():Distance(n:GetPos()) <= 90 && (!v:Visible(self.cofrd1) or (!IsValid(seen.Entity))) and  ((chce:GetForward():Dot((self.cofrd1:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd1:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
n:Remove()
end
end
if IsValid(self.cofrd1) && self.cofrd1:GetPos():Distance(v:GetPos()) <= 300 then
self.cofrd1:Remove()
end
if self.cofrd1:WaterLevel() == 3 && IsValid(self.cofrd1) then
self.cofrd1:Remove() 
end
if !self.cofrd1:IsInWorld() && IsValid(self.cofrd1) then
self.cofrd1:Remove()
end 
timer.Simple(0.55,function() if !IsValid(self.cofrd1) then 
self.time2 = 0.65
end end)

if IsValid(self.cofrd1) then
timer.Simple(0.56,function() if IsValid(self.cofrd1) then 
self.time2 = math.random(7,20)
self.MaxMonster = (self.MaxMonster + 1)
self.NUM = (self.NUM + 2)
end end)
end 

if IsValid(self.cofrd1) then
timer.Simple(0.55,function() if IsValid(self.cofrd1)  && !self.cofrd1:IsOnGround() && self.cofrd1:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd1:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd1:Remove()
end end)
end 

if IsValid(self.cofrd1) then
timer.Simple(0.55,function() if IsValid(self.cofrd1)  && !self.cofrd1:IsMoving() && self.cofrd1:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd1:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd1:Remove()
end end)
end  
local seen = util.TraceLine({start = self.cofrd1:NearestPoint(self.cofrd1:GetPos() + self.cofrd1:OBBCenter()),endpos = v:EyePos()})
if IsValid(self.cofrd1) && (IsValid(seen.Entity) == v:GetEyeTrace().Entity or v:Visible(self.cofrd1)) and  ((chce:GetForward():Dot((self.cofrd1:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd1:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
self.cofrd1:Remove()
end
end
end
end
if self.MaxMonster >= max then
self.Decrease = true
self.CREA2d = false
end 
if self.NUM >= 250  then
self.CREA3 = false
self.cout2 = true
end
if self.cout2 == true && self.cout3 == true then
self.cout3 = false
self.NUM = (self.NUM - 4)
timer.Simple(math.random(1.3,3),function() if IsValid(self) then 
self.cout3 = true end end)
end

if self.NUM <= 0 then
self.cout2 = false
self.CREA3 = true

end

if self.Decrease == true && self.cout == true then
self.MaxMonster = (self.MaxMonster - 3)
self.cout = false
timer.Simple(math.random(1,3),function() if IsValid(self) then 
self.cout = true end end)
end
if self.MaxMonster <= 0 then
self.CREA2d = true
self.Decrease = false
end

local max = math.max(60)
if self.CREAda == true && self.CREA2da == true then
for k,v in pairs(player.GetAll()) do  
if v:IsValid() && v != self && v:IsPlayer() && v:GetClass() != self:GetClass() && self.CREAda == true && self.CREA2da == true && self.CREA3 == true && v:Health() > 0 &&  self.MaxMonster < max  then 
local at = player.GetAll()
local chce = at[math.random(1,#at)]
local pos4 = chce:LocalToWorld(Vector(math.random(-1800,1800),math.random(-1800,1800),17))
self.CREAda = false	
self.cofrd1a = ents.Create(VJ_PICK(self.COFR3))
self.cofrd1a:SetPos(pos4) 
self.cofrd1a:SetAngles(self:GetAngles()) 
self.cofrd1a:Spawn()
self.cofrd1a.IdleAlwaysWander = false 
self.cofrd1a.DisableWandering = true
self.cofrd1a:SetNoDraw(false)
self.cofrd1a.HasAlertSounds = false
 
self.cofrd1a:Activate() 
self.cofrd1a:SetOwner(self) 
self.cofrd1a.HasSounds = false
self.cofrd1a.FindEnemy_UseSphere = true 
self.cofrd1a.FindEnemy_CanSeeThroughWalls = true
self.cofrd1a.SightDistance = 9900000
self:DeleteOnRemove(self.cofrd1a)
timer.Simple(0.55,function() if IsValid(self.cofrd1a) then 
self.cofrd1a.HasSounds = true
self.cofrd1a.IdleAlwaysWander = true
self.cofrd1a.DisableWandering = false
self.cofrd1a:SetNoDraw(false)
self.cofrd1a.HasAlertSounds = true end end)	
timer.Simple(self.time3,function() if IsValid(self) then 
self.CREAda = true end end)
local tr1 = {
						start = self.cofrd1a:GetPos(),
						endpos = self.cofrd1a:GetPos() + self.cofrd1a:GetForward()*30 + self.cofrd1a:GetUp()*30,
						mins = self.cofrd1a:OBBMins(),
						maxs = self.cofrd1a:OBBMaxs(),
						filter = {self.cofrd1a}
					}
					local tr = util.TraceHull(tr1)
local tr12 = {
						start = self.cofrd1a:GetPos(),
						endpos = self.cofrd1a:GetPos() + self.cofrd1a:GetForward()*-30 + self.cofrd1a:GetUp()*30,
						mins = self.cofrd1a:OBBMins(),
						maxs = self.cofrd1a:OBBMaxs(),
						filter = {self.cofrd1a}
					}
					local tr2 = util.TraceHull(tr12)		

		local tr13 = {
						start = self.cofrd1a:GetPos(),
						endpos = self.cofrd1a:GetPos() + self.cofrd1a:GetRight()*30 + self.cofrd1a:GetUp()*30,
						mins = self.cofrd1a:OBBMins(),
						maxs = self.cofrd1a:OBBMaxs(),
						filter = {self.cofrd1a}
					}
					local tr3 = util.TraceHull(tr13)	

		local tr14 = {
						start = self.cofrd1a:GetPos(),
						endpos = self.cofrd1a:GetPos() + self.cofrd1a:GetRight()*-30 + self.cofrd1a:GetUp()*30,
						mins = self.cofrd1a:OBBMins(),
						maxs = self.cofrd1a:OBBMaxs(),
						filter = {self.cofrd1a}
					}
					local tr4 = util.TraceHull(tr14)

			local tr15 = {
						start = self.cofrd1a:GetPos(),
						endpos = self.cofrd1a:GetPos() + self.cofrd1a:GetUp()*80,
						mins = self.cofrd1a:OBBMins(),
						maxs = self.cofrd1a:OBBMaxs(),
						filter = {self.cofrd1a}
					}
					local tr5 = util.TraceHull(tr15)		
					
					
if tr.Hit && tr.HitWorld && tr2.HitWorld && tr3.HitWorld && tr4.HitWorld && tr5.HitWorld then

self.cofrd1a:Remove()

end
for k,n in ipairs(ents.GetAll()) do
if IsValid(self.cofrd1a) && n.IsVJBaseSNPC == true && n:GetClass() == self.cofrd1a:GetClass() && n != self && n != self.cofrd1a && self.cofrd1a:GetPos():Distance(n:GetPos()) <= 90 && (!v:Visible(self.cofrd1a) or (!IsValid(seen.Entity))) and  ((chce:GetForward():Dot((self.cofrd1a:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd1a:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
n:Remove()
end
end
if IsValid(self.cofrd1a) && self.cofrd1a:GetPos():Distance(v:GetPos()) <= 300 then
self.cofrd1a:Remove()
end
if self.cofrd1a:WaterLevel() == 3  && IsValid(self.cofrd1a) then
self.cofrd1a:Remove() 
end
if !self.cofrd1a:IsInWorld() && IsValid(self.cofrd1a) then
self.cofrd1a:Remove()
end 

timer.Simple(0.55,function() if !IsValid(self.cofrd1a) then 
self.time3 = 0.65
end end)

if IsValid(self.cofrd1a) then
timer.Simple(0.56,function() if IsValid(self.cofrd1a) then 
self.time3 = math.random(7,20)
self.MaxMonster = (self.MaxMonster + 1)
self.NUM = (self.NUM + 2)
end end)
end 

if IsValid(self.cofrd1a) then
timer.Simple(0.55,function() if IsValid(self.cofrd1a)  && !self.cofrd1a:IsOnGround() && self.cofrd1a:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd1a:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd1a:Remove()
end end)
end 

if IsValid(self.cofrd1a) then
timer.Simple(0.55,function() if IsValid(self.cofrd1a)  && !self.cofrd1a:IsMoving() && self.cofrd1a:GetModel() !="models/vj_cofr/cof/flygare.mdl" && self.cofrd1a:GetModel() !="models/vj_cofr/cof/carcass.mdl" then 
self.cofrd1a:Remove()
end end)
end  
local seen = util.TraceLine({start = self.cofrd1a:NearestPoint(self.cofrd1a:GetPos() + self.cofrd1a:OBBCenter()),endpos = v:EyePos()})
if IsValid(self.cofrd1a) && (IsValid(seen.Entity) == v:GetEyeTrace().Entity or v:Visible(self.cofrd1a)) and  ((chce:GetForward():Dot((self.cofrd1a:GetPos() -chce:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2))) or (v:GetForward():Dot((self.cofrd1a:GetPos() -v:GetPos()):GetNormalized()) >= math.cos(math.rad(self.SAngle2)))) then
self.cofrd1a:Remove()
end
end
end
end
if self.MaxMonster >= max then
self.Decrease = true
self.CREA2da = false
end 
if self.NUM >= 250  then
self.CREA3 = false
self.cout2 = true
end
if self.cout2 == true && self.cout3 == true then
self.cout3 = false
self.NUM = (self.NUM - 4)
timer.Simple(math.random(1.3,3),function() if IsValid(self) then 
self.cout3 = true end end)
end

if self.NUM <= 0 then
self.cout2 = false
self.CREA3 = true

end

if self.Decrease == true && self.cout == true then
self.MaxMonster = (self.MaxMonster - 3)
self.cout = false
timer.Simple(math.random(1,3),function() if IsValid(self) then 
self.cout = true end end)
end
if self.MaxMonster <= 0 then
self.CREA2da = true
self.Decrease = false
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2015 by DrVj, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/