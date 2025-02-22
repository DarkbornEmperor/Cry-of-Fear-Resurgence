AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/custom/blob.mdl"
ENT.StartHealth = 2000
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.DisableDefaultRangeAttackCode = true
ENT.DisableRangeAttackAnimation = true
ENT.RangeAttackMaxDistance = 3000
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0
ENT.NextRangeAttackTime = VJ.PICK(5,10)
ENT.MainSoundPitch = 100

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_SMALL_FLINCH
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.HasExtraMeleeAttackSounds = true
ENT.HasSoundTrack = true
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(-100, 25, -300),
    FirstP_Bone = "bone006",
    FirstP_Offset = Vector(0, 0, 60),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack = {
"vj_cofr/custom/blob/final2.mp3"
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
ENT.Blob_NextAttackT = 0
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
    self:SetCollisionBounds(Vector(350, 350, 620), Vector(-350, -350, 0))
    self:Blob_Init()
    self.Tentacles = {}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomRangeAttackCode()
    local ent = self:GetEnemy()
    if (IsValid(ent) && ent:IsOnGround()) or self.VJ_IsBeingControlled then
        local Tentacle = ents.Create("sent_vj_cofrc_tentacle")
        Tentacle:SetPos(ent:GetPos() + self:GetForward()*-30 + self:GetUp()*-40 + self:GetRight()*math.random(30,-30))
        Tentacle:SetAngles(self:GetAngles())
        Tentacle.Assignee = self
        Tentacle.VJ_NPC_Class = self.VJ_NPC_Class
        Tentacle:Spawn()
        self.Tentacles[#self.Tentacles + 1] = Tentacle -- Register the Tentacles
        self.Tentacle = Tentacle
        SafeRemoveEntityDelayed(self.Tentacle,25)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDamaged(dmginfo,hitgroup,status)
    if status == "PreDamage" then
        dmginfo:ScaleDamage(0.45)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:SetMoveType(MOVETYPE_NONE)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
    for _, v in pairs(self.Tentacles) do
         if IsValid(v) then v:Remove() end
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/