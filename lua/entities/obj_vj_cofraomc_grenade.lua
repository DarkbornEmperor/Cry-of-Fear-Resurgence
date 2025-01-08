/*--------------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "obj_vj_projectile_base"
ENT.PrintName = "Grenade"
ENT.Author = "Darkborn"
ENT.Contact = "http://steamcommunity.com/groups/vrejgaming"
ENT.Information     = "Projectile, usually used for NPCs & Weapons"
ENT.Category = "Projectiles"

if CLIENT then
    VJ.AddKillIcon("obj_vj_cofraomc_grenade", ENT.PrintName, VJ.KILLICON_GRENADE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_cofr/aom/weapons/classic/w_grenade.mdl"
ENT.CollisionDecal = "VJ_COFR_Scorch"
ENT.SoundTbl_OnCollide = {"vj_cofr/aom/weapons/grenade/grenade_hit1.wav","vj_cofr/aom/weapons/grenade/grenade_hit2.wav","vj_cofr/aom/weapons/grenade/grenade_hit3.wav"}
ENT.SoundTbl_OnRemove = {"vj_cofr/aom/weapons/grenade/explode3.wav","vj_cofr/aom/weapons/grenade/explode4.wav","vj_cofr/aom/weapons/grenade/explode5.wav"}
ENT.OnRemoveSoundLevel = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCollision(data,phys)
    local getVel = phys:GetVelocity()
    local curVelSpeed = getVel:Length()
    phys:SetVelocity(getVel * 0.5)

    if curVelSpeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
        self:OnCollideSoundCode()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vezZ90 = Vector(0, 0, 90)
local vecZ4 = Vector(0, 0, 4)
local vezZ100 = Vector(0, 0, 100)
--
function ENT:OnDestroy()
    local myPos = self:GetPos()

    local spr = ents.Create("env_sprite")
    spr:SetKeyValue("model","vj_cofr/sprites/zerogxplode.vmt")
    spr:SetKeyValue("GlowProxySize","2.0")
    spr:SetKeyValue("HDRColorScale","1.0")
    spr:SetKeyValue("renderfx","14")
    spr:SetKeyValue("rendermode","5")
    spr:SetKeyValue("renderamt","255")
    spr:SetKeyValue("disablereceiveshadows","0")
    spr:SetKeyValue("mindxlevel","0")
    spr:SetKeyValue("maxdxlevel","0")
    spr:SetKeyValue("framerate","15.0")
    spr:SetKeyValue("spawnflags","0")
    spr:SetKeyValue("scale","4")
    spr:SetPos(myPos + vezZ90)
    spr:Spawn()
    spr:Fire("Kill", "", 0.9)
    timer.Simple(0.9,function() if IsValid(spr) then spr:Remove() end end)

    VJ.EmitSound(self, "vj_cofr/aom/weapons/grenade/debris"..math.random(1,3)..".wav", 80, 100)
    VJ.EmitSound(self, "vj_cofr/aom/weapons/grenade/explode"..math.random(3,5).."_dist.wav", 140, 100)
    util.ScreenShake(myPos, 100, 200, 1, 2500)

    local expLight = ents.Create("light_dynamic")
    expLight:SetKeyValue("brightness", "4")
    expLight:SetKeyValue("distance", "300")
    expLight:SetLocalPos(myPos)
    expLight:SetLocalAngles(self:GetAngles())
    expLight:Fire("Color", "255 150 0")
    //expLight:SetParent(self)
    expLight:Spawn()
    expLight:Activate()
    expLight:Fire("TurnOn", "", 0)
    expLight:Fire("Kill","",0.08)

    self:SetLocalPos(myPos + vecZ4) -- Because the entity is too close to the ground
    local tr = util.TraceLine({
        start = myPos,
        endpos = myPos - vezZ100,
        filter = self
    })
    util.Decal(VJ.PICK(self.CollisionDecal), tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)

    self:DealDamage()
    self:Remove()
end