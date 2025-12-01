AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/sicksimon.mdl"
ENT.StartHealth = 500
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = {"vjseq_bossmove1", "vjseq_bossmove2"}
ENT.RangeAttackMaxDistance = 1500
ENT.RangeAttackMinDistance = 0
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = VJ.PICK(10,15)
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasSoundTrack = false
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cof/sicksimon/bossmusic.mp3"

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
    "models/props_wasteland/dockplank01a.mdl"
}

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SickSimon_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:SickSimon_Init()
    self.Twisters = {}
    self.Props = {}

    if GetConVar("vj_npc_snd_track"):GetInt() == 0 or GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then return end
    self.SickSimon_Intro = VJ.CreateSound(self, "vj_cofr/cof/sicksimon/bossstart.mp3", 100, 100)
    timer.Create("VJ_SickSimon_Intro" .. self:EntIndex(), 15, 1, function()
        if IsValid(self) then
            if GetConVar("vj_npc_snd_track"):GetInt() == 1 && GetConVar("VJ_COFR_Boss_Music"):GetInt() == 1 then self.HasSoundTrack = true self:StartSoundTrack() end
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "range_prepare" then
        self:LiftProps()
    elseif key == "range" then
        self:ExecuteRangeAttack()
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    ply:ChatPrint("JUMP: Summon Twisters")
    ply:ChatPrint("NOTE: Summoning Twisters will cause a 20 second delay until able to spawn more and the current Twisters are dead.")
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
    for _,v in ipairs(ents.FindInSphere(self:GetPos(), 500)) do
        local propPhy = v:GetPhysicsObject()
        if IsValid(v) && v:GetClass() == "prop_physics" && (!IsValid(ent) or !IsValid(self) or self.Dead) then
            propPhy:EnableGravity(true)
        end
    end
    if !IsValid(ent) or self.Dead then return end
    if IsValid(ent) && CurTime() > self.SickSimon_NextTwisterSpawnT && !IsValid(self.twister1) && !IsValid(self.twister2) && !IsValid(self.twister3) && !IsValid(self.twister4) && !IsValid(self.twister5) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
        local twister1 = ents.Create("npc_vj_cofr_faceless_twister")
        twister1:SetPos(self:GetPos() + self:GetRight()*40 + self:GetUp()*10)
        twister1:SetAngles(self:GetAngles())
        twister1.VJ_NPC_Class = self.VJ_NPC_Class
        twister1:Spawn()
        self.Twisters[#self.Twisters + 1] = twister1 -- Register the Twisters
        self.twister1 = twister1

        local twister2 = ents.Create("npc_vj_cofr_faceless_twister")
        twister2:SetPos(self:GetPos() + self:GetRight()*-40 + self:GetUp()*10)
        twister2:SetAngles(self:GetAngles())
        twister2.VJ_NPC_Class = self.VJ_NPC_Class
        twister2:Spawn()
        self.Twisters[#self.Twisters + 1] = twister2 -- Register the Twisters
        self.twister2 = twister2

        local twister3 = ents.Create("npc_vj_cofr_faceless_twister")
        twister3:SetPos(self:GetPos() + self:GetRight()*80 + self:GetUp()*10)
        twister3:SetAngles(self:GetAngles())
        twister3.VJ_NPC_Class = self.VJ_NPC_Class
        twister3:Spawn()
        self.Twisters[#self.Twisters + 1] = twister3 -- Register the Twisters
        self.twister3 = twister3

        local twister4 = ents.Create("npc_vj_cofr_faceless_twister")
        twister4:SetPos(self:GetPos() + self:GetRight()*-80 + self:GetUp()*10)
        twister4:SetAngles(self:GetAngles())
        twister4.VJ_NPC_Class = self.VJ_NPC_Class
        twister4:Spawn()
        self.Twisters[#self.Twisters + 1] = twister4 -- Register the Twisters
        self.twister4 = twister4

        local twister5 = ents.Create("npc_vj_cofr_faceless_twistervalve")
        twister5:SetPos(self:GetPos() + self:GetForward()*-90 + self:GetUp()*10)
        twister5:SetAngles(self:GetAngles())
        twister5.VJ_NPC_Class = self.VJ_NPC_Class
        twister5:Spawn()
        self.Twisters[#self.Twisters + 1] = twister5 -- Register the Twisters
        self.twister5 = twister5

        self.SickSimon_NextTwisterSpawnT = CurTime() + 20
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:LiftProps()
    local ent = self:GetEnemy()
    for _,v in ipairs(ents.FindInSphere(self:GetPos(), 500)) do
        local propPhy = v:GetPhysicsObject()
        if IsValid(self) && IsValid(v) && v:GetClass() == "prop_physics" && IsValid(ent) && !self.Dead then
            propPhy:SetVelocity(v:GetUp() * 100)
            propPhy:EnableGravity(false)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status, enemy)
    if status == "Init" then
        if CurTime() > self.SickSimon_NextPropT /*&& !IsValid(self.prop) && !IsValid(self.prop2)*/ then
            local prop = ents.Create("prop_physics")
            prop:SetModel(VJ.PICK(self.PropstoThrow))
            prop:SetPos(self:GetPos() + self:GetForward() * 90 + self:GetRight() * -200 + self:GetUp() * 60)
            prop:SetAngles(self:GetAngles())
            prop:SetOwner(self)
            prop:Spawn()
            self.Props[#self.Props + 1] = prop -- Register the Props
            self.prop = prop

            local prop2 = ents.Create("prop_physics")
            prop2:SetModel(VJ.PICK(self.PropstoThrow))
            prop2:SetPos(self:GetPos() + self:GetForward() * 90 + self:GetRight() * 200 + self:GetUp() * 60)
            prop2:SetAngles(self:GetAngles())
            prop2:SetOwner(self)
            prop2:Spawn()
            self.Props[#self.Props + 1] = prop2 -- Register the Props
            self.prop2 = prop2

            self.SickSimon_NextPropT = CurTime() + self.NextRangeAttackTime

            SafeRemoveEntityDelayed(self.prop, 15)
            SafeRemoveEntityDelayed(self.prop2, 15)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        for _,v in ipairs(ents.FindInSphere(self:GetPos(), 500)) do
            local propPhy = v:GetPhysicsObject()
            if IsValid(self) && IsValid(v) && v:GetClass() == "prop_physics" && IsValid(enemy) && !self.Dead then
                propPhy:EnableGravity(true)
                propPhy:SetVelocity((enemy:GetPos() + enemy:OBBCenter() - v:GetPos()) * 8 + v:GetUp() * 200)
            end
        end
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local vec = Vector(0, 0, 0)
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" && hitgroup != 8 then
        dmginfo:ScaleDamage(0.5)
    end
    -- Make a metal ricochet effect
    if status == "PreDamage" && hitgroup == 8 then
        if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self, "vj_cofr/cof/faster/faster_headhit" .. math_random(1,4) .. ".wav", 75, 100) end
        dmginfo:SetDamage(0)
        if dmginfo:GetDamagePosition() != vec then
            local rico = EffectData()
            rico:SetOrigin(dmginfo:GetDamagePosition())
            rico:SetScale(4) -- Size
            rico:SetMagnitude(2) -- Effect type | 1 = Animated | 2 = Basic
            util.Effect("VJ_COFR_Rico", rico)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
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
    timer.Remove("VJ_SickSimon_Intro" .. self:EntIndex())
    VJ.STOPSOUND(self.SickSimon_Intro)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/