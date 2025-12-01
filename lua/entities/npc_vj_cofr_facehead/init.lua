AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/cof/facehead.mdl"
ENT.GodMode = true
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
ENT.CallForHelp = false
ENT.SightAngle = 360
ENT.HasMeleeAttack = true
ENT.TimeUntilMeleeAttackDamage = 0
ENT.NextMeleeAttackTime = 0.5
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackAngleRadius = 180
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackDamageAngleRadius = 180
ENT.DisableMeleeAttackAnimation = true
ENT.HasSoundTrack = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 75
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 10, -60),
    FirstP_Bone = "joint2",
    FirstP_Offset = Vector(10, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_SoundTrack =
    "vj_cofr/cof/facehead/sirensfromhell2.mp3"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.FaceHead_NextFacelessSpawnT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if GetConVar("VJ_COFR_Boss_Music"):GetInt() == 0 then
        self.HasSoundTrack = false
    end
end
 ---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FaceHead_Init()
    self.SoundTbl_Breath =
        "vj_cofr/cof/facehead/facehead.wav"
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self:AddFlags(FL_NOTARGET)
    self:SetCollisionBounds(Vector(30, 30, 90), Vector(-30, -30, 0))
    self:SetSurroundingBounds(Vector(60, 60, 90), Vector(-60, -60, 0))
    self:FaceHead_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
    if GetConVar("VJ_COFR_FaceHead_SummonFaceless"):GetInt() == 1 then
        ply:ChatPrint("JUMP: Summon Faceless")
        ply:ChatPrint("NOTE: Summoning Faceless will cause a 20 second delay until able to spawn more and the current Faceless are dead.")
    end
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
    if GetConVar("VJ_COFR_FaceHead_SummonFaceless"):GetInt() == 0 then return end
    if IsValid(self:GetEnemy()) && CurTime() > self.FaceHead_NextFacelessSpawnT && !IsValid(self.faceless1) && !IsValid(self.faceless2) && !IsValid(self.faceless3) && !IsValid(self.faceless4) && !IsValid(self.faceless5) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
        local faceless1 = ents.Create("npc_vj_cofr_faceless")
        faceless1:SetPos(self:GetPos() + self:GetRight() * 60 + self:GetUp() * 10)
        faceless1:SetAngles(self:GetAngles())
        faceless1.VJ_NPC_Class = self.VJ_NPC_Class
        faceless1:Spawn()
        self.faceless1 = faceless1
        self:DeleteOnRemove(self.faceless1)

        local faceless2 = ents.Create("npc_vj_cofr_faceless")
        faceless2:SetPos(self:GetPos() + self:GetRight() * -60 + self:GetUp() * 10)
        faceless2:SetAngles(self:GetAngles())
        faceless2.VJ_NPC_Class = self.VJ_NPC_Class
        faceless2:Spawn()
        self.faceless2 = faceless2
        self:DeleteOnRemove(self.faceless2)

        local faceless3 = ents.Create("npc_vj_cofr_faceless")
        faceless3:SetPos(self:GetPos() + self:GetRight() * 100 + self:GetUp() * 10)
        faceless3:SetAngles(self:GetAngles())
        faceless3.VJ_NPC_Class = self.VJ_NPC_Class
        faceless3:Spawn()
        self.faceless3 = faceless3
        self:DeleteOnRemove(self.faceless3)

        local faceless4 = ents.Create("npc_vj_cofr_faceless")
        faceless4:SetPos(self:GetPos() + self:GetRight() * -100 + self:GetUp() * 10)
        faceless4:SetAngles(self:GetAngles())
        faceless4.VJ_NPC_Class = self.VJ_NPC_Class
        faceless4:Spawn()
        self.faceless4 = faceless4
        self:DeleteOnRemove(self.faceless4)

        local faceless5 = ents.Create("npc_vj_cofr_faceless_crawler")
        faceless5:SetPos(self:GetPos() + self:GetForward() * -90 + self:GetUp() * 10)
        faceless5:SetAngles(self:GetAngles())
        faceless5.VJ_NPC_Class = self.VJ_NPC_Class
        faceless5:Spawn()
        self.faceless5 = faceless5
        self:DeleteOnRemove(self.faceless5)

        local faceless6 = ents.Create("npc_vj_cofr_faceless_crawler")
        faceless6:SetPos(self:GetPos() + self:GetForward() * 90 + self:GetUp() * 10)
        faceless6:SetAngles(self:GetAngles())
        faceless6.VJ_NPC_Class = self.VJ_NPC_Class
        faceless6:Spawn()
        self.faceless6 = faceless6
        self:DeleteOnRemove(self.faceless6)

        self.FaceHead_NextFacelessSpawnT = CurTime() + 20
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/