AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/david_monster.mdl"
ENT.StartHealth = 400
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationStopMovement = false
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeDistance = 1500
ENT.RangeToMeleeDistance = 60
ENT.RangeAttackAngleRadius = 180
ENT.TimeUntilRangeAttackProjectileRelease = 0
ENT.NextRangeAttackTime = 10
ENT.NextRangeAttackTime_DoRand = 15
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip02 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep = {
"common/null.wav"
}
ENT.SoundTbl_FireLoop = {
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
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Addiction_FinishedIgnited = false
ENT.Addiction_OnFire = false
ENT.Addiction_NextChangeAttackT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Addiction_Init()
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
function ENT:Init()
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Addiction_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key,activator,caller,data)
    if key == "step" then
        self:FootStepSoundCode()
    elseif key == "attack" then
        self:MeleeAttackCode()
    elseif key == "axe_grab" then
        if self:GetBodygroup(0) == 0 then self:SetBodygroup(0,1)
        elseif self:GetBodygroup(0) == 1 then self:SetBodygroup(0,0) end
        VJ.EmitSound(self, "vj_cofr/aom/davidbad/david_axegrab.wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("axe")).Pos,self:GetAngles())
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop"..math.random(3,4)..".wav", 75, 100)
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
        /*local effectdata = EffectData()
        effectdata:SetOrigin(self:GetPos())
        effectdata:SetScale(10)
        util.Effect("watersplash",effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
 if self.VJ_IsBeingControlled then return end
    self.Addiction_NextChangeAttackT = CurTime() + math.Rand(15,20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
    ply:ChatPrint("JUMP: Switch attacks")
    ply:ChatPrint("NOTE: Switching attacks will cause a 15/20 second delay until able to switch again.")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
 local ent = self:GetEnemy()
 if self.Dead then return end
 if !self:IsBusy() && IsValid(ent) && CurTime() > self.Addiction_NextChangeAttackT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
    self:PlayAnim(ACT_SIGNAL1,true,false,false)
    self.Addiction_NextChangeAttackT = CurTime() + math.Rand(15,20)
end
    if self.Addiction_FinishedIgnited then self.Addiction_OnFire = false return end
    if !self.Addiction_OnFire && !self.Addiction_FinishedIgnited && self:Health() <= (self:GetMaxHealth() / 2) then
        self.Addiction_OnFire = true
        self:FireSprite()
        self.Addiction_FireIgnite = VJ.CreateSound(self,self.SoundTbl_FireIgnite,75,100)
        self.Addiction_FireLoop = VJ.CreateSound(self,self.SoundTbl_FireLoop,75,100)
        timer.Create("VJ_COFR_Addiction_Fire"..self:EntIndex(), 1, 15, function() if IsValid(self) && self.Addiction_OnFire then
    /*if IsValid(ent) && ent:WaterLevel() != 3 then*/
        VJ.ApplyRadiusDamage(self,self,self:GetPos(),150,10,DMG_BURN,true,true)
/*end*/
        timer.Simple(15,function() if IsValid(self) && self.Addiction_OnFire then self.Addiction_FinishedIgnited = true self.Addiction_FireOff = VJ.CreateSound(self,self.SoundTbl_FireOff,75,100) if IsValid(self.fireFX) then self.fireFX:Remove() end VJ.STOPSOUND(self.Addiction_FireLoop) end end) end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireSprite()
    local fireFX = ents.Create("env_sprite")
    fireFX:SetKeyValue("model","vj_cofr/sprites/fire.vmt")
    fireFX:SetKeyValue("scale","1")
    fireFX:SetKeyValue("GlowProxySize","2.0")
    fireFX:SetKeyValue("renderfx","0")
    fireFX:SetKeyValue("rendermode","2")
    fireFX:SetKeyValue("renderamt","255")
    fireFX:SetKeyValue("disablereceiveshadows","0")
    fireFX:SetKeyValue("framerate","10.0")
    fireFX:SetKeyValue("spawnflags","0")
    fireFX:SetPos(self:GetPos())
    fireFX:Spawn()
    fireFX:SetParent(self)
    fireFX:Fire("SetParentAttachment","fire")
    self:DeleteOnRemove(fireFX)
    self.fireFX = fireFX
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
    if self:GetBodygroup(0) == 0 then
        self.AnimTbl_MeleeAttack = "vjseq_attack"
        self.MeleeAttackDamage = 20
        self.HasMeleeAttackMissSounds = false
        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/aom/davidbad/david_hurt.wav",
        "vj_cofr/aom/davidbad/david_hurt2.wav",
        "vj_cofr/aom/davidbad/david_hurt3.wav"
}
    elseif self:GetBodygroup(0) == 1 then
        self.AnimTbl_MeleeAttack = "vjseq_attack_axe"
        self.MeleeAttackDamage = 35
        self.HasMeleeAttackMissSounds = true
        self.SoundTbl_MeleeAttackExtra = {
        "vj_cofr/aom/weapons/axe/Axe_hitbody.wav"
}
        self.SoundTbl_MeleeAttackMiss = {
        "vj_cofr/aom/weapons/axe/Axe_swing.wav"
}
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_AfterChecks(hitEnt,isProp)
    if self.Addiction_OnFire then hitEnt:Ignite(4) end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
 local ent = self:GetEnemy()
 if IsValid(ent) && self:Visible(ent) && ent:WaterLevel() != 3 then
    VJ.EmitSound(ent, {"vj_cofr/aom/davidbad/thunder_attack1.wav","vj_cofr/aom/davidbad/thunder_attack2.wav","vj_cofr/aom/davidbad/thunder_attack3.wav"}, 100, 100)
    local color = Color(0, 161, 255, 255) -- The shock wave color
    local dmg = 20 -- How much damage should the shock wave do?
    local enePos = ent:GetPos()

    timer.Simple(1,function() if IsValid(self) && IsValid(ent) then VJ.ApplyRadiusDamage(self, self, enePos, 200, dmg, DMG_SHOCK, true, true, {DisableVisibilityCheck=true, Force=80})
    -- flags 0 = No fade!
    effects.BeamRingPoint(enePos, 0.3, 2, 400, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})
    effects.BeamRingPoint(enePos, 0.3, 2, 200, 16, 0, color, {material="vj_cofr/sprites/shockwave", framerate=20, flags=0})

    local lightningFX = ents.Create("env_sprite")
    lightningFX:SetKeyValue("model","vj_cofr/sprites/lightning.vmt")
    lightningFX:SetKeyValue("scale","1")
    lightningFX:SetKeyValue("rendercolor","0, 161, 255, 255")
    lightningFX:SetKeyValue("GlowProxySize","2.0")
    lightningFX:SetKeyValue("renderfx","0")
    lightningFX:SetKeyValue("rendermode","2")
    lightningFX:SetKeyValue("renderamt","255")
    lightningFX:SetKeyValue("disablereceiveshadows","0")
    lightningFX:SetKeyValue("framerate","10.0")
    lightningFX:SetKeyValue("spawnflags","0")
    lightningFX:SetPos(enePos + ent:GetUp()*60)
    lightningFX:Spawn()
    lightningFX:Activate()
    lightningFX:Fire("Kill","",0.2)
    self:DeleteOnRemove(lightningFX)
    self.lightningFX = lightningFX

    VJ.EmitSound(ent, "vj_cofr/aom/davidbad/thunder_hit.wav", 90, 100) end end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
if status == "PreDamage" then
   dmginfo:ScaleDamage(0.15)
   if GetConVar("VJ_COFR_Addiction_SelfDamage"):GetInt() == 1 then
   local attacker = dmginfo:GetAttacker()
   if dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_CLUB) then
       dmginfo:ScaleDamage(1.50)
   else
       dmginfo:ScaleDamage(0.00)

   if IsValid(attacker) && (attacker:IsNPC() or attacker:IsPlayer()) && attacker:GetClass() != "npc_stalker" then
       attacker:TakeDamage(10,self,self)
       VJ.DamageSpecialEnts(self,attacker,dmginfo)
end
   if attacker:IsPlayer() then
        net.Start("VJ_COFR_Addiction_ScreenEffect")
            net.WriteEntity(attacker)
        net.Send(attacker)
    end
end
     if !dmginfo:IsDamageType(DMG_SLASH) && !dmginfo:IsDamageType(DMG_CLUB) then
        self:SpawnBloodParticles(dmginfo,hitgroup)
        self:SpawnBloodDecal(dmginfo,hitgroup) end
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
  if status == "Initial" then
     if self.Addiction_OnFire then
        self.Addiction_OnFire = false
     if IsValid(self.fireFX) then self.fireFX:Remove() end
        self.Addiction_FireOff = VJ.CreateSound(self,self.SoundTbl_FireOff,75,100)
        VJ.STOPSOUND(self.Addiction_FireLoop)
        timer.Remove("VJ_COFR_Addiction_Fire")
end
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Addiction_FireIgnite)
    VJ.STOPSOUND(self.Addiction_FireOff)
    VJ.STOPSOUND(self.Addiction_FireLoop)
    timer.Remove("VJ_COFR_Addiction_Fire")
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
function ENT:OnFootstepSound()
    if !self:IsOnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() +Vector(0,0,-150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self,VJ.PICK(self.FootSteps[tr.MatType]),self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self,"vj_cofr/fx/wade" .. math.random(1,4) .. ".wav",self.FootStepSoundLevel,self:VJ_DecideSoundPitch(self.FootStepPitch1,self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/