AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/controller.mdl"
ENT.StartHealth = 170
ENT.HullType = HULL_HUMAN
ENT.MovementType = VJ_MOVETYPE_AERIAL
ENT.Aerial_FlyingSpeed_Calm = 120
ENT.Aerial_FlyingSpeed_Alerted = 300
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.ConstantlyFaceEnemy = true
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.RangeAttackProjectiles = "obj_vj_cofraom_soul"
ENT.RangeAttackMaxDistance = 2048
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = VJ.PICK(3,4)
ENT.LimitChaseDistance = true
ENT.LimitChaseDistance_Max = "UseRangeDistance"
ENT.LimitChaseDistance_Min = "UseRangeDistance"
ENT.DamageResponse = "OnlySearch"
ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -60),
    FirstP_Bone = "bip01 neck",
    FirstP_Offset = Vector(10, 0, -3),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_Impact = {
"vj_cofr/fx/flesh1.wav",
"vj_cofr/fx/flesh2.wav",
"vj_cofr/fx/flesh3.wav",
"vj_cofr/fx/flesh5.wav",
"vj_cofr/fx/flesh6.wav",
"vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Screamer_HomingAttack = false -- false = Regular, true = Homing
ENT.Screamer_NumFired = 0 -- Used to make sure range attack sound only plays once
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Screamer_Init()
    self.SoundTbl_Alert = {
    "vj_cofr/aom/screamer/con_alert1.wav",
    "vj_cofr/aom/screamer/con_alert2.wav",
    "vj_cofr/aom/screamer/con_alert3.wav"
}
    self.SoundTbl_RangeAttack = {
    "vj_cofr/aom/screamer/con_attack1.wav",
    "vj_cofr/aom/screamer/con_attack2.wav",
    "vj_cofr/aom/screamer/con_attack3.wav"
}
    self.SoundTbl_Pain = {
    "vj_cofr/aom/screamer/con_pain1.wav",
    "vj_cofr/aom/screamer/con_pain2.wav",
    "vj_cofr/aom/screamer/con_pain3.wav"
}
    self.SoundTbl_Death = {
    "vj_cofr/aom/screamer/con_die1.wav",
    "vj_cofr/aom/screamer/con_die2.wav"
}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    self.Screamer_FlyAnim_Forward  = self:GetSequenceActivity(self:LookupSequence("forward"))
    self.Screamer_FlyAnim_Backward  = self:GetSequenceActivity(self:LookupSequence("backward"))
    self.Screamer_FlyAnim_Right  = self:GetSequenceActivity(self:LookupSequence("right"))
    self.Screamer_FlyAnim_Left  = self:GetSequenceActivity(self:LookupSequence("left"))
    self.Screamer_FlyAnim_Up  = self:GetSequenceActivity(self:LookupSequence("up"))
    self.Screamer_FlyAnim_Down  = self:GetSequenceActivity(self:LookupSequence("down"))

    local soul1 = ents.Create("env_sprite")
    soul1:SetKeyValue("model","vj_cofr/sprites/soul.vmt")
    soul1:SetKeyValue("scale","1")
    soul1:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
    soul1:SetKeyValue("renderfx","14")
    soul1:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
    soul1:SetKeyValue("renderamt","255") -- Transparency
    soul1:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
    soul1:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
    soul1:SetKeyValue("spawnflags","0")
    soul1:SetParent(self)
    soul1:Fire("SetParentAttachment","rhand")
    soul1:Spawn()
    soul1:Activate()
    soul1:SetNoDraw(true)
    self:DeleteOnRemove(soul1)
    self.soul1 = soul1

    local soul2 = ents.Create("env_sprite")
    soul2:SetKeyValue("model","vj_cofr/sprites/soul.vmt")
    soul2:SetKeyValue("scale","1")
    soul2:SetKeyValue("GlowProxySize","2.0") -- Size of the glow to be rendered for visibility testing.
    soul2:SetKeyValue("renderfx","14")
    soul2:SetKeyValue("rendermode","3") -- Set the render mode to "3" (Glow)
    soul2:SetKeyValue("renderamt","255") -- Transparency
    soul2:SetKeyValue("disablereceiveshadows","0") -- Disable receiving shadows
    soul2:SetKeyValue("framerate","10.0") -- Rate at which the sprite should animate, if at all.
    soul2:SetKeyValue("spawnflags","0")
    soul2:SetParent(self)
    soul2:Fire("SetParentAttachment","lhand")
    soul2:Spawn()
    soul2:Activate()
    soul2:SetNoDraw(true)
    self:DeleteOnRemove(soul2)
    self.soul2 = soul2

    self:DrawShadow(false)
    self:SetCollisionBounds(Vector(20, 20, 70), Vector(-20, -20, -10))
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:Screamer_Init()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
 if key == "attack_range" or key == "attack_rangeclose" then
 if IsValid(self.soul1) then
    self.soul1:SetNoDraw(true)
end
 if IsValid(self.soul2) then
    self.soul2:SetNoDraw(true)
end
 self.Screamer_HomingAttack = key == "attack_rangeclose"
 self:ExecuteRangeAttack()
 elseif key == "sprite" && !self.Screamer_HomingAttack && self.AttackType == VJ.ATTACK_TYPE_RANGE then
 if IsValid(self.soul1) then
    self.soul1:SetNoDraw(false)
end
 if IsValid(self.soul2) then
    self.soul2:SetNoDraw(false)
end
 -- Backup timer to make sure the sprites are hidden in case event doesn't run!
 timer.Simple(2, function()
 if IsValid(self) then
 if IsValid(self.soul1) then
    self.soul1:SetNoDraw(true)
end
    if IsValid(self.soul2) then
        self.soul2:SetNoDraw(true) end end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
 if act == ACT_FLY then
 if self.AA_CurrentMovePosDir then
 local moveDir = self.AA_CurrentMovePosDir:GetNormal()
 -- Up-down
 local dotUp = moveDir:Dot(self:GetUp())
 if dotUp > 0.60 then
    return self.Screamer_FlyAnim_Up
 elseif dotUp < -0.60 then
    return self.Screamer_FlyAnim_Down
end
 -- Forward-backward
 local dotForward = moveDir:Dot(self:GetForward())
 if dotForward > 0.5 then
    return self.Screamer_FlyAnim_Forward
 elseif dotForward < -0.5 then
    return self.Screamer_FlyAnim_Backward
end
    -- Right-left
    local dotRight = moveDir:Dot(self:GetRight())
    if dotRight > 0.5 then
        return self.Screamer_FlyAnim_Right
    elseif dotRight < -0.5 then
        return self.Screamer_FlyAnim_Left
    end
end
    return self.Screamer_FlyAnim_Up -- Fallback animation
end
    return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status,enemy)
 if status == "Init" then
 if (math.random(1,2) == 1 && self.EnemyData.DistanceNearest < 850) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_DUCK)) then
    self.AnimTbl_RangeAttack = "vjseq_shoot"
    self.Screamer_HomingAttack = true
 else
    self.AnimTbl_RangeAttack = {"vjseq_attack1","vjseq_attack2"}
    self.Screamer_HomingAttack = false
end
        self.Screamer_NumFired = 0
        self.HasRangeAttackSounds = true
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status,enemy,projectile)
 if status == "PostSpawn" then
 local ene = self:GetEnemy()
 if self.Screamer_HomingAttack && IsValid(ene) then
    projectile.Track_Enemy = ene
    timer.Simple(10, function() if IsValid(projectile) then projectile:Remove() end end)
end
    if self.Screamer_NumFired < 1 then
        self.Screamer_NumFired = self.Screamer_NumFired + 1
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
    return self:GetPos() + self:GetUp() * (self.Screamer_HomingAttack and 80 or 20)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
    local projPos = projectile:GetPos()
    return VJ.CalculateTrajectory(self, self:GetEnemy(), "Line", projPos, 1, 700)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup)
    if dmginfo:GetDamage() > 30 then
        self.AnimTbl_Flinch = ACT_BIG_FLINCH
    else
        self.AnimTbl_Flinch = ACT_SMALL_FLINCH
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo,hitgroup,status)
    if status == "Init" then
        self:DoChangeMovementType(VJ_MOVETYPE_GROUND)
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,hitgroup,corpseEnt)
    corpseEnt:DrawShadow(false)
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self,corpseEnt)
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
