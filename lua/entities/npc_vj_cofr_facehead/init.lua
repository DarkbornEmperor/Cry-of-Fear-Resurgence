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
ENT.FaceHead_NextFacelessSpawnT = CurTime()
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
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:FaceHead_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply,controlEnt)
 if GetConVar("VJ_COFR_FaceHead_SummonFaceless"):GetInt() == 0 then return end
    ply:ChatPrint("JUMP: Summon Faceless")
    ply:ChatPrint("NOTE: Summoning Faceless will cause a 20 second delay until able to spawn more and the current Faceless are dead.")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    if GetConVar("VJ_COFR_FaceHead_SummonFaceless"):GetInt() == 0 then return end
    if IsValid(self:GetEnemy()) && CurTime() > self.FaceHead_NextFacelessSpawnT && !IsValid(self.Faceless1) && !IsValid(self.Faceless2) && !IsValid(self.Faceless3) && !IsValid(self.Faceless4) && !IsValid(self.Faceless5) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
        local Faceless1 = ents.Create("npc_vj_cofr_faceless")
        Faceless1:SetPos(self:GetPos() + self:GetRight()*60 + self:GetUp()*10)
        Faceless1:SetAngles(self:GetAngles())
        Faceless1.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless1:Spawn()
        self.Faceless1 = Faceless1
        self:DeleteOnRemove(self.Faceless1)

        local Faceless2 = ents.Create("npc_vj_cofr_faceless")
        Faceless2:SetPos(self:GetPos() + self:GetRight()*-60 + self:GetUp()*10)
        Faceless2:SetAngles(self:GetAngles())
        Faceless2.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless2:Spawn()
        self.Faceless2 = Faceless2
        self:DeleteOnRemove(self.Faceless2)

        local Faceless3 = ents.Create("npc_vj_cofr_faceless")
        Faceless3:SetPos(self:GetPos() + self:GetRight()*100 + self:GetUp()*10)
        Faceless3:SetAngles(self:GetAngles())
        Faceless3.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless3:Spawn()
        self.Faceless3 = Faceless3
        self:DeleteOnRemove(self.Faceless3)

        local Faceless4 = ents.Create("npc_vj_cofr_faceless")
        Faceless4:SetPos(self:GetPos() + self:GetRight()*-100 + self:GetUp()*10)
        Faceless4:SetAngles(self:GetAngles())
        Faceless4.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless4:Spawn()
        self.Faceless4 = Faceless4
        self:DeleteOnRemove(self.Faceless4)

        local Faceless5 = ents.Create("npc_vj_cofr_faceless_crawler")
        Faceless5:SetPos(self:GetPos() + self:GetForward()*-90 + self:GetUp()*10)
        Faceless5:SetAngles(self:GetAngles())
        Faceless5.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless5:Spawn()
        self.Faceless5 = Faceless5
        self:DeleteOnRemove(self.Faceless5)

        local Faceless6 = ents.Create("npc_vj_cofr_faceless_crawler")
        Faceless6:SetPos(self:GetPos() + self:GetForward()*90 + self:GetUp()*10)
        Faceless6:SetAngles(self:GetAngles())
        Faceless6.VJ_NPC_Class = self.VJ_NPC_Class
        Faceless6:Spawn()
        self.Faceless6 = Faceless6
        self:DeleteOnRemove(self.Faceless6)

        self.FaceHead_NextFacelessSpawnT = CurTime() + 20
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/