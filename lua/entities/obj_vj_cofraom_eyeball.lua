/*--------------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Eyeball"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

ENT.VJTag_ID_Danger = true

if CLIENT then
    local Name = "Eyeball"
    local LangName = "obj_vj_cofraom_eyeball"
    language.Add(LangName, Name)
    killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
    language.Add("#"..LangName, Name)
    killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_cofr/aom/hornet.mdl"
ENT.MoveCollideType = MOVECOLLIDE_FLY_SLIDE
ENT.RemoveOnHit = false
ENT.DoesDirectDamage = true
ENT.DirectDamage = 6
ENT.DirectDamageType = DMG_SLASH
ENT.CollideCodeWithoutRemoving = true
ENT.SoundTbl_Idle = {"vj_cofr/aom/eyeball/ag_buzz1.wav","vj_cofr/aom/eyeball/ag_buzz2.wav","vj_cofr/aom/eyeball/ag_buzz3.wav"}
ENT.SoundTbl_OnCollide = {"vj_cofr/aom/eyeball/ag_hornethit1.wav","vj_cofr/aom/eyeball/ag_hornethit2.wav","vj_cofr/aom/eyeball/ag_hornethit3.wav"}
ENT.IdleSoundPitch = VJ_Set(100, 100)
-- Custom
local defVec = Vector(0, 0, 0)
ENT.Track_Enemy = NULL
ENT.Track_Position = defVec
ENT.Eyeball_ChaseSpeed = 600
ENT.Eyeball_Classic = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
    phys:Wake()
    phys:SetMass(1)
    phys:SetBuoyancyRatio(0)
    phys:EnableDrag(false)
    phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
  timer.Simple(5, function() if IsValid(self) then
  if !self.Eyeball_Classic then VJ.EmitSound(self, "vj_cofr/fx/pl_wade1.wav", 75, 100)
  elseif self.Eyeball_Classic then VJ.EmitSound(self, "vj_cofr/fx/pl_wade2.wav", 75, 100) end
     self:Remove()
    end
end)
  if self.Eyeball_Classic then self.SoundTbl_OnCollide = {"vj_cofr/aom/eyeball/classic/ag_hornethit1.wav","vj_cofr/aom/eyeball/classic/ag_hornethit2.wav","vj_cofr/aom/eyeball/classic/ag_hornethit3.wav"} end
  if math.random(1,3) == 1 then
    self:SetNoDraw(true)
    self.IdleEffect = ents.Create("env_sprite")
    self.IdleEffect:SetKeyValue("model","vj_cofr/sprites/eyeball.vmt")
    self.IdleEffect:SetKeyValue("rendercolor","255 255 255")
    self.IdleEffect:SetKeyValue("GlowProxySize","1.0")
    self.IdleEffect:SetKeyValue("HDRColorScale","1.0")
    self.IdleEffect:SetKeyValue("renderfx","0")
    self.IdleEffect:SetKeyValue("rendermode","2")
    self.IdleEffect:SetKeyValue("renderamt","255")
    self.IdleEffect:SetKeyValue("disablereceiveshadows","0")
    self.IdleEffect:SetKeyValue("mindxlevel","0")
    self.IdleEffect:SetKeyValue("maxdxlevel","0")
    self.IdleEffect:SetKeyValue("framerate","5.0")
    self.IdleEffect:SetKeyValue("spawnflags","0")
    self.IdleEffect:SetKeyValue("scale","0.2")
    self.IdleEffect:SetPos(self:GetPos())
    self.IdleEffect:Spawn()
    self.IdleEffect:SetParent(self)
    self:DeleteOnRemove(self.IdleEffect)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink()
    local phys = self:GetPhysicsObject()
    local trackedEnt = self.Track_Enemy
    -- Homing Behavior
    if IsValid(trackedEnt) then
        local pos = trackedEnt:GetPos() + trackedEnt:OBBCenter()
        if self:VisibleVec(pos) or self.Track_Position == defVec then
            self.Track_Position = pos
end
        if IsValid(phys) then
            phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self.Track_Position + trackedEnt:GetUp()*math.random(-50,50) + trackedEnt:GetRight()*math.random(-50,50), self.Eyeball_ChaseSpeed))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
end
    -- Not tracking, go in straight line
    else
        if IsValid(phys) then
            phys:SetVelocity(self:CalculateProjectile("Line", self:GetPos(), self:GetPos() + self:GetForward()*math.random(-80, 80)+ self:GetRight()*math.random(-80, 80) + self:GetUp()*math.random(-80, 80), self.Eyeball_ChaseSpeed / 2))
            self:SetAngles(self:GetVelocity():GetNormal():Angle())
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPhysicsCollide(data,phys)
    local lastVel = math.max(data.OurOldVelocity:Length(), data.Speed) -- Get the last velocity and speed
    local newVel = phys:GetVelocity():GetNormal()
    lastVel = math.max(newVel:Length(), lastVel)
    phys:SetVelocity(newVel * lastVel * 0.3)
    self:SetAngles(self:GetVelocity():GetNormal():Angle())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage(data,phys,hitEnt)
    if data.HitEntity:IsNPC() or data.HitEntity:IsPlayer() then
        self:SetDeathVariablesTrue(data, phys)
        self:Remove()
    end
end