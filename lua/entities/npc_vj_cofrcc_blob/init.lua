AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cofcc/blob.mdl"
ENT.StartHealth = 2000
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.VJ_ID_Boss = true
ENT.CanTurnWhileMoving = false
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = "vj_cofr_blood_red"
ENT.BloodDecal = "VJ_COFR_Blood_Red"
ENT.SightAngle = 360
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.RangeAttackMaxDistance = 3000
ENT.RangeAttackMinDistance = 0
ENT.TimeUntilRangeAttackProjectileRelease = 0
ENT.NextRangeAttackTime = VJ.PICK(5,10)
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_SMALL_FLINCH
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.HasSoundTrack = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(-100, 25, -300),
    FirstP_Bone = "bone006",
    FirstP_Offset = Vector(0, 0, 60),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cofcc/blob/final2.mp3"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
ENT.Tentacles = {}

local math_random = math.random
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Blob_Init() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:Blob_Init()
    self:SetCollisionBounds(Vector(350, 350, 620), Vector(-350, -350, 0))
    self:SetSurroundingBounds(Vector(800, 800, 700), Vector(-800, -800, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    controlEnt.VJC_Player_DrawHUD = false
    function controlEnt:OnThink()
        self.VJCE_NPC:SetArrivalSpeed(9999)
        self.VJC_NPC_CanTurn = self.VJC_Camera_Mode == 2
        self.VJC_BullseyeTracking = (self.VJCE_NPC:IsMoving() && self.VJC_Camera_Mode == 1) or self.VJC_Camera_Mode == 2
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
    if status == "Init" then
        if enemy:OnGround() or self.VJ_IsBeingControlled then
            local tentacle = ents.Create("sent_vj_cofrcc_tentacle")
            tentacle:SetPos(enemy:GetPos() + self:GetForward() * -35 + self:GetUp() * -40 + self:GetRight() * math_random(35,-35))
            tentacle:SetAngles(self:GetAngles())
            tentacle.Assignee = self
            tentacle.VJ_NPC_Class = self.VJ_NPC_Class
            tentacle:Spawn()
            self.Tentacles[#self.Tentacles + 1] = tentacle -- Register the Tentacles
            self.Tentacle = tentacle
            SafeRemoveEntityDelayed(tentacle, 25)
        end
        return true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo, hitgroup, status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.5)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
    VJ_COFR_ApplyCorpse(self, corpse)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    for _, v in pairs(self.Tentacles) do
        if IsValid(v) then v:Remove() end
    end
end