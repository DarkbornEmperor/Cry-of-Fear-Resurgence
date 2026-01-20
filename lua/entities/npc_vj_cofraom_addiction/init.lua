AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/addiction.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.HasRangeAttack = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackAnimationFaceEnemy = false
ENT.RangeAttackMaxDistance = 1500
ENT.RangeAttackMinDistance = 60
ENT.RangeAttackAngleRadius = 180
ENT.TimeUntilRangeAttackProjectileRelease = 0
ENT.NextRangeAttackTime = VJ.PICK(10,15)
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = true
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip02 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "vj_cofr/fx/null.wav"

ENT.SoundTbl_FireLoop =
    "vj_cofr/aom/addiction/fire_loop.wav"

ENT.SoundTbl_FireIgnite =
    "vj_cofr/aom/addiction/fire_ignite.wav"

ENT.SoundTbl_FireOff =
    "vj_cofr/aom/addiction/fire_off.wav"

ENT.SoundTbl_SoundTrack = {
    "vj_cofr/aom/addiction/sickness.mp3",
    "vj_cofr/aom/addiction/4motherkill.wav"
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
ENT.Addiction_NextChangeMeleeT = 0
ENT.Addiction_Type = 0
    -- 0 = Director's Cut
    -- 1 = Dark Assistance
    -- 2 = Remod

local math_random = math.random
local math_rand = math.Rand
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    elseif GetConVar("VJ_COFR_CoFvsAoM"):GetInt() == 1 then
        self.VJ_NPC_Class = {"CLASS_AFRAID_OF_MONSTERS"}
    end
    if GetConVar("VJ_COFR_Difficulty"):GetInt() == 1 then // Easy
        self.MeleeAttackDamage_Hands = 5
        self.MeleeAttackDamage_Axe = 10
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 2 then // Medium
        self.MeleeAttackDamage_Hands = 10
        self.MeleeAttackDamage_Axe = 15
    elseif GetConVar("VJ_COFR_Difficulty"):GetInt() == 3 or GetConVar("VJ_COFR_Difficulty"):GetInt() == 4 then // Difficult & Nightmare
        self.MeleeAttackDamage_Hands = 20
        self.MeleeAttackDamage_Axe = 25
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Addiction_Init()
    self.SoundTbl_Alert = {
        "vj_cofr/aom/addiction/db_alert10.wav",
        "vj_cofr/aom/addiction/db_alert20.wav",
        "vj_cofr/aom/addiction/db_alert30.wav"
    }
    self.SoundTbl_BeforeMeleeAttack =
        "vj_cofr/aom/addiction/david_attack.wav"

    self.SoundTbl_Pain = {
        "vj_cofr/aom/addiction/db_pain1.wav",
        "vj_cofr/aom/addiction/db_pain2.wav"
    }
    self.SoundTbl_Death = {
        "vj_cofr/aom/addiction/db_pain1.wav",
        "vj_cofr/aom/addiction/db_pain2.wav"
    }
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if self:GetModel() == "models/vj_cofr/aom/addiction.mdl" then // Already the default
        self.Addiction_Type = 0
    elseif self:GetModel() == "models/vj_cofr/aom/da/addiction.mdl" then
        self.Addiction_Type = 1
    elseif self:GetModel() == "models/vj_cofr/aomr/addiction.mdl" then
        self.Addiction_Type = 2
    end
    self:SetCollisionBounds(Vector(13, 13, 75), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:Addiction_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" then
        self:ExecuteMeleeAttack()
    elseif key == "axe_grab" then
        if self:GetBodygroup(0) == 0 then self:SetBodygroup(0,1)
        elseif self:GetBodygroup(0) == 1 then self:SetBodygroup(0,0) end
        self:RemoveAllDecals()
        VJ.EmitSound(self, "vj_cofr/aom/addiction/david_axegrab.wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large", self:GetAttachment(self:LookupAttachment("axe")).Pos, self:GetAngles())
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math_random(3,4) .. ".wav", 75, 100)
        if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
            VJ.EmitSound(self, "vj_cofr/fx/water_splash.wav", 75, 100)
            /*local effectdata = EffectData()
            effectdata:SetOrigin(self:GetPos())
            effectdata:SetScale(10)
            util.Effect("watersplash", effectdata)*/
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if self.VJ_IsBeingControlled then return end
    self.Addiction_NextChangeMeleeT = CurTime() + math_rand(15,20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    ply:ChatPrint("JUMP: Switch melee")
    ply:ChatPrint("NOTE: Switching melee will cause a 15/20 second delay until able to switch again.")
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = self.VJC_Camera_Mode == 2
        self.VJCE_NPC.EnemyDetection = true
        self.VJCE_NPC.JumpParams.Enabled = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    local ent = self:GetEnemy()
    if self.Dead then return end
    if !self:IsBusy() && IsValid(ent) && CurTime() > self.Addiction_NextChangeMeleeT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
        self:PlayAnim(ACT_SMALL_FLINCH,true,false,false)
        self.Addiction_NextChangeMeleeT = CurTime() + math_rand(15,20)
    end
    if self.Addiction_FinishedIgnited then self.Addiction_OnFire = false return end
    if !self.Addiction_OnFire && !self.Addiction_FinishedIgnited && self:Health() <= (self:GetMaxHealth() / 2) then
        self.Addiction_OnFire = true
        self:FireSprite()
        self.Addiction_FireIgnite = VJ.CreateSound(self,self.SoundTbl_FireIgnite,75,100)
        self.Addiction_FireLoop = VJ.CreateSound(self,self.SoundTbl_FireLoop,75,100)
        timer.Create("VJ_COFR_Addiction_Fire" .. self:EntIndex(), 1, 15, function()
            if IsValid(self) && self.Addiction_OnFire then
                /*if IsValid(ent) && ent:WaterLevel() != 3 then*/
                    VJ.ApplyRadiusDamage(self, self, self:GetPos(), 150, 1, DMG_BURN, true, true)
                /*end*/
                timer.Simple(15, function() if IsValid(self) && self.Addiction_OnFire then self.Addiction_FinishedIgnited = true self.Addiction_FireOff = VJ.CreateSound(self,self.SoundTbl_FireOff,75,100) if IsValid(self.fireFX) && IsValid(self.fireLight) then self.fireFX:Remove() self.fireLight:Remove() end VJ.STOPSOUND(self.Addiction_FireLoop) end end)
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FireSprite()
    local fireFX = ents.Create("env_sprite")
    fireFX:SetKeyValue("model", "vj_cofr/sprites/fire.vmt")
    fireFX:SetKeyValue("rendercolor", "255 255 255")
    fireFX:SetKeyValue("GlowProxySize", "2.0")
    fireFX:SetKeyValue("HDRColorScale", "1.0")
    fireFX:SetKeyValue("renderfx", "14")
    fireFX:SetKeyValue("rendermode", "5")
    fireFX:SetKeyValue("renderamt", "255")
    fireFX:SetKeyValue("disablereceiveshadows", "0")
    fireFX:SetKeyValue("mindxlevel", "0")
    fireFX:SetKeyValue("maxdxlevel", "0")
    fireFX:SetKeyValue("framerate", "15.0")
    fireFX:SetKeyValue("spawnflags", "0")
    fireFX:SetKeyValue("scale", "1")
    fireFX:SetPos(self:GetPos())
    fireFX:Spawn()
    fireFX:SetParent(self)
    fireFX:Fire("SetParentAttachment", "fire")
    self:DeleteOnRemove(fireFX)
    self.fireFX = fireFX

    local fireLight = ents.Create("light_dynamic")
    fireLight:SetKeyValue("brightness", "1")
    fireLight:SetKeyValue("distance", "250")
    fireLight:SetLocalPos(self:GetPos())
    fireLight:SetLocalAngles(self:GetAngles())
    fireLight:Fire("Color", "182 136 11")
    fireLight:SetKeyValue("style", "1")
    fireLight:SetParent(self)
    fireLight:Spawn()
    fireLight:Activate()
    fireLight:Fire("SetParentAttachment", "fire")
    fireLight:Fire("TurnOn", "", 0)
    self:DeleteOnRemove(fireLight)
    self.fireLight = fireLight
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status, enemy)
    if status == "Init" then
        if self:GetBodygroup(0) == 0 then
            self.AnimTbl_MeleeAttack = "vjseq_attack"
            self.MeleeAttackDamage = self.MeleeAttackDamage_Hands
            self.HasMeleeAttackMissSounds = false
            self.SoundTbl_MeleeAttackExtra = {
                "vj_cofr/aom/addiction/david_hurt.wav",
                "vj_cofr/aom/addiction/david_hurt2.wav",
                "vj_cofr/aom/addiction/david_hurt3.wav"
            }
        elseif self:GetBodygroup(0) == 1 then
            self.AnimTbl_MeleeAttack = "vjseq_attack_axe"
            self.MeleeAttackDamage = self.MeleeAttackDamage_Axe
            self.HasMeleeAttackMissSounds = true
            self.SoundTbl_MeleeAttackExtra =
                "vj_cofr/aom/weapons/axe/Axe_hitbody.wav"

            self.SoundTbl_MeleeAttackMiss =
                "vj_cofr/aom/weapons/axe/Axe_swing.wav"
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
    if status == "PreDamage" then
        if self.Addiction_OnFire then ent:Ignite(4) end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        local ent = self:GetEnemy()
        if IsValid(ent) && self:Visible(ent) && ent:WaterLevel() != 3 then
            VJ.EmitSound(ent, {"vj_cofr/aom/addiction/thunder_attack1.wav", "vj_cofr/aom/addiction/thunder_attack2.wav", "vj_cofr/aom/addiction/thunder_attack3.wav"}, 100, 100)
            local color = Color(0, 161, 255, 255) -- The shock wave color
            local dmg = 10 -- How much damage should the shock wave do?
            local enePos = ent:GetPos()

            timer.Simple(1, function()
                if IsValid(self) && IsValid(ent) then
                    VJ.ApplyRadiusDamage(self, self, enePos, 200, dmg, DMG_SHOCK, true, true, {DisableVisibilityCheck = true, Force = 80})
                    -- flags 0 = No fade!
                    effects.BeamRingPoint(enePos, 0.3, 2, 400, 16, 0, color, {material = "vj_cofr/sprites/shockwave", framerate = 20, flags = 0})
                    effects.BeamRingPoint(enePos, 0.3, 2, 200, 16, 0, color, {material = "vj_cofr/sprites/shockwave", framerate = 20, flags = 0})

                    local lightningFX = ents.Create("env_sprite")
                    lightningFX:SetKeyValue("model", "vj_cofr/sprites/lightning.vmt")
                    lightningFX:SetKeyValue("rendercolor", "0 161 255")
                    lightningFX:SetKeyValue("GlowProxySize", "2.0")
                    lightningFX:SetKeyValue("HDRColorScale", "1.0")
                    lightningFX:SetKeyValue("renderfx", "14")
                    lightningFX:SetKeyValue("rendermode", "5")
                    lightningFX:SetKeyValue("renderamt", "255")
                    lightningFX:SetKeyValue("disablereceiveshadows", "0")
                    lightningFX:SetKeyValue("mindxlevel", "0")
                    lightningFX:SetKeyValue("maxdxlevel", "0")
                    lightningFX:SetKeyValue("framerate", "15.0")
                    lightningFX:SetKeyValue("spawnflags", "0")
                    lightningFX:SetKeyValue("scale", "1")
                    lightningFX:SetPos(enePos + ent:GetUp() * 60)
                    lightningFX:Spawn()
                    lightningFX:Activate()
                    lightningFX:Fire("Kill", "", 0.2)
                    self:DeleteOnRemove(lightningFX)
                    self.lightningFX = lightningFX

                    VJ.EmitSound(ent, "vj_cofr/aom/addiction/thunder_hit.wav", 90, 100)
                end
            end)
        end
    end
    return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" && GetConVar("VJ_COFR_Addiction_SelfDamage"):GetInt() == 0 then
        dmginfo:ScaleDamage(0.5)
    end
    if status == "PreDamage" && GetConVar("VJ_COFR_Addiction_SelfDamage"):GetInt() == 1 then
        local eneVictim = dmginfo:GetAttacker(), dmginfo:GetInflictor()
        if dmginfo:IsDamageType(DMG_SLASH) or dmginfo:IsDamageType(DMG_CLUB) then
            dmginfo:ScaleDamage(0.5)
        else
            dmginfo:SetDamage(0)

        if IsValid(eneVictim) && eneVictim.VJ_ID_Living && eneVictim:GetClass() != "npc_stalker" then -- For some reason GMod crashes if killing a HL2 Stalker via reflecting damage.
            eneVictim:TakeDamage(math_random(5,10), self, self)
            VJ.DamageSpecialEnts(self, eneVictim, dmginfo)
        end
        if eneVictim:IsPlayer() then
            net.Start("VJ_COFR_Addiction_ScreenEffect")
                net.WriteEntity(eneVictim)
            net.Send(eneVictim)
        end
    end
    if !dmginfo:IsDamageType(DMG_SLASH) && !dmginfo:IsDamageType(DMG_CLUB) then
        self:SpawnBloodParticles(dmginfo, hitgroup)
        self:SpawnBloodDecals(dmginfo, hitgroup)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        if self.Addiction_OnFire then
            self.Addiction_OnFire = false
            if IsValid(self.fireFX) then self.fireFX:Remove() end
            self.Addiction_FireOff = VJ.CreateSound(self, self.SoundTbl_FireOff, 75, 100)
            VJ.STOPSOUND(self.Addiction_FireLoop)
            timer.Remove("VJ_COFR_Addiction_Fire")
        end
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
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
function ENT:OnFootstepSound(moveType, sdFile)
    if !self:OnGround() then return end
    local tr = util.TraceLine({
        start = self:GetPos(),
        endpos = self:GetPos() +Vector(0, 0, -150),
        filter = {self}
    })
    if tr.Hit && self.FootSteps[tr.MatType] then
        VJ.EmitSound(self, VJ.PICK(self.FootSteps[tr.MatType]), self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
    if self:WaterLevel() > 0 && self:WaterLevel() < 3 then
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math_random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/