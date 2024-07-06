AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/drowned.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = "Red"
ENT.CustomBlood_Particle = {"vj_cofr_blood_red"}
ENT.CustomBlood_Decal = {"VJ_COFR_Blood_Red"}
ENT.HasMeleeAttack = false
ENT.AnimTbl_MeleeAttack = "vjseq_attack"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 14
ENT.MeleeAttackDistance = 25
ENT.MeleeAttackDamageDistance = 50
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.AnimTbl_RangeAttack = "vjseq_point"
ENT.RangeDistance = 500
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 15
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 500
ENT.NoChaseAfterCertainRange_CloseDistance = 200
ENT.NoChaseAfterCertainRange_Type = "Regular"
ENT.DisableFootStepSoundTimer = true
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.HideOnUnknownDamage = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
    -- ====== Controller Data ====== --
ENT.VJC_Data = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(0, 0, 5),
}
    -- ====== Sound File Paths ====== --
    -- Leave blank if you don't want any sounds to play
ENT.SoundTbl_MeleeAttackExtra = {
"vj_cofr/cof/crazylady/knife_hitbody1.wav",
"vj_cofr/cof/crazylady/knife_hitbody2.wav"
}
ENT.SoundTbl_MeleeAttackMiss = {
"vj_cofr/cof/crazylady/knife_swing.wav"
}
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
ENT.SoundTbl_Drowned_Suicide = {
"vj_cofr/cof/crazylady/suicide_attempt.wav"
}
-- Custom
ENT.Drowned_Baby = false
ENT.Drowned_DamageDistance = 500
ENT.Drowned_NextEnemyDamageT = 0

util.AddNetworkString("VJ_COFR_Drowned_Damage")

local nwName = "VJ_COFR_Drowned_Controller"
util.AddNetworkString(nwName)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_CustomOnInitialize()
    self.SoundTbl_Alert = {
    "vj_cofr/cof/crazylady/lady_alert10.wav",
    "vj_cofr/cof/crazylady/lady_alert20.wav",
    "vj_cofr/cof/crazylady/lady_alert30.wav"
}
    self.SoundTbl_BeforeMeleeAttack = {
    "vj_cofr/cof/crazylady/lady_attack1.wav",
    "vj_cofr/cof/crazylady/lady_attack2.wav"
}
    self.SoundTbl_BeforeRangeAttack = {
    "vj_cofr/cof/crazylady/lady_attack1.wav",
    "vj_cofr/cof/crazylady/lady_attack2.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/cof/crazylady/lady_pain1.wav",
    "vj_cofr/cof/crazylady/lady_pain2.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/cof/crazylady/lady_pain1.wav",
    "vj_cofr/cof/crazylady/lady_pain2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
 if math.random(1,3) == 1 then
    self.NoChaseAfterCertainRange = false
end
    self:SetCollisionBounds(Vector(13, 13, 78), Vector(-13, -13, 0))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Drowned_CustomOnInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
    if key == "attack" then
        self:MeleeAttackCode()
    elseif key == "attack_range" then
        self:RangeAttackCode()
    elseif key == "baby_appear" then
        VJ.EmitSound(self,"vj_cofr/cof/crazylady/baby_burst.wav", 75, 100)
        ParticleEffect("vj_cofr_blood_red_large",self:GetAttachment(self:LookupAttachment("baby")).Pos,self:GetAngles())
        self:SetBodygroup(0,1)
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
function ENT:Controller_Initialize(ply,controlEnt)
    ply:ChatPrint("JUMP: Baby Burst")
    local opt1, opt2, opt3 = self, self:GetClass(), self.VJ_TheControllerEntity
    net.Start(nwName)
        net.WriteBool(false)
        net.WriteEntity(opt1)
        net.WriteString(opt2)
        net.WriteEntity(ply)
        net.WriteEntity(opt3)
        net.Send(ply)

    function self.VJ_TheControllerEntity:CustomOnStopControlling()
        net.Start(nwName)
            net.WriteBool(true)
            net.WriteEntity(opt1)
            net.WriteString(opt2)
            net.WriteEntity(ply)
            net.WriteEntity(opt3)
            net.Send(ply)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Drowned_Damage()
    net.Start("VJ_COFR_Drowned_Damage")
    net.WriteEntity(self)
    net.WriteEntity(self:GetEnemy())
    net.Broadcast()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
    if GetConVar("vj_npc_norange"):GetInt() == 1 or self.Dead then return end
    local ent = self:GetEnemy()
    local cont = self.VJ_TheController
    if IsValid(cont) then
        for _,v in pairs(ents.FindInSphere(ent:GetPos(),10)) do
            if v != self && v != ent && (v:IsNPC() or v:IsPlayer()) then
                ent = v
            break
        end
    end
end
    if self:GetPos():Distance(ent:GetPos()) > self.Drowned_DamageDistance or !IsValid(ent) or !self:Visible(ent) then return end
    if CurTime() > self.Drowned_NextEnemyDamageT then
    if self.HasSounds then self.Drowned_Suicide = VJ.CreateSound(ent, self.SoundTbl_Drowned_Suicide, self.RangeAttackSoundLevel, self:VJ_DecideSoundPitch(self.RangeAttackPitch.a, self.RangeAttackPitch.b)) end
    if ent:IsPlayer() then
        net.Start("VJ_COFR_Drowned_ScreenEffect")
            net.WriteEntity(ent)
        net.Send(ent)
end
    timer.Simple(5,function() if IsValid(self) && IsValid(ent) && ent:Visible(self) && !self.Dead then
        if ent.IsVJBaseSNPC_Human then ent:TakeDamage(ent:Health(),self,self) elseif ent:IsPlayer() then ent:TakeDamage(ent:Health()+ent:Armor(),self,self) else ent:TakeDamage(200,self,self) end
        self:Drowned_Damage()
        self.Drowned_NextEnemyDamageT = CurTime() + self.NextRangeAttackTime
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
    if !IsValid(self:GetEnemy()) or self.Dead or self.Drowned_Baby then return end
    if !self.Drowned_Baby && self:GetPos():Distance(self:GetEnemy():GetPos()) <= 70 && !self.VJ_IsBeingControlled or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP)) then
        self.Drowned_Baby = true
        self.HasMeleeAttack = true
        self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,false,false)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
    VJ_COFR_DeathCode(self)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    VJ.STOPSOUND(self.Drowned_Suicide)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2024 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/