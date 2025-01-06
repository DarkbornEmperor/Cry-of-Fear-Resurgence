/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
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

ENT.VJ_ID_Danger = true

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
ENT.CollisionBehavior = VJ.PROJ_COLLISION_PERSIST
ENT.DoesDirectDamage = true
ENT.DirectDamage = 6
ENT.DirectDamageType = DMG_SLASH
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
function ENT:Init()
  timer.Simple(5, function() if IsValid(self) then
  if !self.Eyeball_Classic then VJ.EmitSound(self, "vj_cofr/fx/pl_wade1.wav", 75, 100)
  elseif self.Eyeball_Classic then VJ.EmitSound(self, "vj_cofr/fx/pl_wade2.wav", 75, 100) end
     self:Remove()
    end
end)
  if self.Eyeball_Classic then self.SoundTbl_OnCollide = {"vj_cofr/aom/eyeball/classic/ag_hornethit1.wav","vj_cofr/aom/eyeball/classic/ag_hornethit2.wav","vj_cofr/aom/eyeball/classic/ag_hornethit3.wav"} end
  if math.random(1,3) == 1 then
    self:SetNoDraw(true)
    local eyeballSpr = ents.Create("env_sprite")
    eyeballSpr:SetKeyValue("model","vj_cofr/sprites/eyeball.vmt")
    eyeballSpr:SetKeyValue("rendercolor","255 255 255")
    eyeballSpr:SetKeyValue("GlowProxySize","1.0")
    eyeballSpr:SetKeyValue("HDRColorScale","1.0")
    eyeballSpr:SetKeyValue("renderfx","0")
    eyeballSpr:SetKeyValue("rendermode","2")
    eyeballSpr:SetKeyValue("renderamt","255")
    eyeballSpr:SetKeyValue("disablereceiveshadows","0")
    eyeballSpr:SetKeyValue("mindxlevel","0")
    eyeballSpr:SetKeyValue("maxdxlevel","0")
    eyeballSpr:SetKeyValue("framerate","5.0")
    eyeballSpr:SetKeyValue("spawnflags","0")
    eyeballSpr:SetKeyValue("scale","0.2")
    eyeballSpr:SetPos(self:GetPos())
    eyeballSpr:Spawn()
    eyeballSpr:SetParent(self)
    self:DeleteOnRemove(eyeballSpr)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
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
function ENT:OnCollision(data,phys)
    local lastVel = math.max(data.OurOldVelocity:Length(), data.Speed) -- Get the last velocity and speed
    local newVel = phys:GetVelocity():GetNormal()
    lastVel = math.max(newVel:Length(), lastVel)
    phys:SetVelocity(newVel * lastVel * 0.3)
    self:SetAngles(self:GetVelocity():GetNormal():Angle())

    -- Remove if it's a living being
    if data.HitEntity.VJ_ID_Living then
        self.CollisionBehavior = VJ.PROJ_COLLISION_REMOVE
    end
end