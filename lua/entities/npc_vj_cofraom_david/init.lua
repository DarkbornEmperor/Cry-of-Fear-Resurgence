AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_cofr/aom/david.mdl"
ENT.StartHealth = 200
ENT.HealthRegenParams = {
    Enabled = false,
    Amount = 2,
    Delay = VJ.SET(0.5,0.5),
}
ENT.HullType = HULL_HUMAN
ENT.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
ENT.AlliedWithPlayerAllies = true
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.BloodParticle = {"vj_cofr_blood_red"}
ENT.BloodDecal = {"VJ_COFR_Blood_Red"}
ENT.PoseParameterLooking_InvertPitch = true
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjges_shoot_crowbar"
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextAnyAttackTime_Melee = 1.5
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 60
ENT.Weapon_FindCoverOnReload = false
ENT.Weapon_OcclusionDelayTime = VJ.SET(0,0.2)
ENT.Weapon_OcclusionDelay = false
ENT.HasCallForHelpAnimation = false
ENT.Weapon_IgnoreSpawnMenu = true
ENT.Medic_TimeUntilHeal = 0.4
ENT.Medic_SpawnPropOnHeal = false
ENT.Medic_HealAmount = 15
ENT.AnimTbl_Medic_GiveHealth = "vjges_shoot_wrench"
ENT.Medic_SpawnPropOnHealModel = "models/vj_cofr/aom/weapons/w_pills.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "rhand"
//ENT.AnimTbl_WeaponAttackSecondary = "shoot_m203"
ENT.Weapon_SecondaryFireTime = 0.05
ENT.HasExtraMeleeAttackSounds = true
ENT.DamageResponse = "OnlySearch"
ENT.HasDeathAnimation = true
ENT.DeathAnimationDecreaseLengthAmount = -1
ENT.DeathCorpseEntityClass = "prop_vj_animatable"
ENT.DropDeathLoot = false
ENT.DisableFootStepSoundTimer = true
ENT.MainSoundPitch = 100
ENT.BreathSoundLevel = 40
ENT.DefaultSoundTbl_MeleeAttack = false
    -- ====== Controller Data ====== --
ENT.ControllerParams = {
    CameraMode = 1,
    ThirdP_Offset = Vector(30, 25, -50),
    FirstP_Bone = "Bip01 Head",
    FirstP_Offset = Vector(5, 0, 5),
}
    -- ====== Sound File Paths ====== --
ENT.SoundTbl_FootStep =
    "common/null.wav"

ENT.SoundTbl_MeleeAttack =
    "common/null.wav"

ENT.SoundTbl_MeleeAttackExtra =
    "vj_cofr/cof/weapons/melee_hit.wav"

ENT.SoundTbl_MeleeAttackMiss =
"vj_cofr/cof/weapons/melee_swing.wav"

/*ENT.SoundTbl_MedicBeforeHeal =
    "vj_cofr/aom/weapons/pills/pills_pickup.wav"*/

ENT.SoundTbl_MedicOnHeal =
    "vj_cofr/aom/weapons/pills/pills_use.wav"

ENT.SoundTbl_Impact = {
    "vj_cofr/fx/flesh1.wav",
    "vj_cofr/fx/flesh2.wav",
    "vj_cofr/fx/flesh3.wav",
    "vj_cofr/fx/flesh5.wav",
    "vj_cofr/fx/flesh6.wav",
    "vj_cofr/fx/flesh7.wav"
}
-- Custom
ENT.Simon_French = false
ENT.Simon_Branch = false
ENT.CoFR_Crouching = false
ENT.CoFR_NextMeleeAnimT = 0
ENT.CoFR_NextMeleeSoundT = 0
ENT.CoFR_NextWepSwitchT = 0
ENT.CoFR_NextLowHPSoundT = 0
ENT.CoFR_NextSelfHealT = 0
ENT.Human_Type = 0
    -- 0 = David & Assistor
    -- 1 = Simon
    -- 2 = Police
    -- 3 = David (Classic)
ENT.WeaponsList_AoMDC = {
    ["Close"] = {
        "weapon_vj_cofraom_shotgun"
    },
    ["Normal"] = {
        "weapon_vj_cofraom_beretta",
        "weapon_vj_cofraom_glock",
        "weapon_vj_cofraom_p228",
        "weapon_vj_cofraom_deagle",
        "weapon_vj_cofraom_revolver",
        "weapon_vj_cofraom_mp5k",
        "weapon_vj_cofraom_uzi"
    },
    ["Far"] = {
        "weapon_vj_cofraom_l85a1"
    },
}
ENT.WeaponsList_AoMC = {
    ["Close"] = {
        "weapon_vj_cofraomc_shotgun"
    },
    ["Normal"] = {
        "weapon_vj_cofraomc_beretta",
        "weapon_vj_cofraomc_deagle",
        "weapon_vj_cofraomc_ak47",
        "weapon_vj_cofraomc_grenade"
    },
    ["Far"] = {
        "weapon_vj_cofraomc_ak47"
    },
}
ENT.WeaponsList_CoF = {
    ["Close"] = {
        "weapon_vj_cofr_shotgun"
    },
    ["Normal"] = {
        "weapon_vj_cofr_glock",
        "weapon_vj_cofr_p345",
        "weapon_vj_cofr_pt92",
        "weapon_vj_cofr_vp70",
        "weapon_vj_cofr_browning",
        "weapon_vj_cofr_revolver",
        "weapon_vj_cofr_tmp",
        "weapon_vj_cofr_mp5",
        "weapon_vj_cofr_m76",
        "weapon_vj_cofr_m16",
        "weapon_vj_cofr_famas",
        "weapon_vj_cofr_g43",
        "weapon_vj_cofrcc_ak47"
    },
    ["Far"] = {
        "weapon_vj_cofr_rifle"
    },
}
ENT.WeaponsList_CoF_Cont = {
    ["ContWeapons"] = {
        "weapon_vj_cofr_glock",
        "weapon_vj_cofr_p345",
        "weapon_vj_cofr_pt92",
        "weapon_vj_cofr_vp70",
        "weapon_vj_cofr_browning",
        "weapon_vj_cofr_revolver",
        "weapon_vj_cofr_shotgun",
        "weapon_vj_cofr_tmp",
        "weapon_vj_cofr_mp5",
        "weapon_vj_cofr_m76",
        "weapon_vj_cofr_m16",
        "weapon_vj_cofr_famas",
        "weapon_vj_cofr_g43",
        "weapon_vj_cofr_rifle",
        "weapon_vj_cofrcc_ak47"
    },
}
ENT.WeaponsList_AoMDC_Cont = {
    ["ContWeapons"] = {
        "weapon_vj_cofraom_beretta",
        "weapon_vj_cofraom_glock",
        "weapon_vj_cofraom_p228",
        "weapon_vj_cofraom_deagle",
        "weapon_vj_cofraom_revolver",
        "weapon_vj_cofraom_shotgun",
        "weapon_vj_cofraom_mp5k",
        "weapon_vj_cofraom_uzi",
        "weapon_vj_cofraom_l85a1"
    },
}
ENT.WeaponsList_AoMC_Cont = {
    ["ContWeapons"] = {
        "weapon_vj_cofraomc_beretta",
        "weapon_vj_cofraomc_deagle",
        "weapon_vj_cofraomc_ak47",
        "weapon_vj_cofraomc_grenade",
        "weapon_vj_cofraomc_shotgun"
    },
}
VJ_COFR_MELEEWEAPONS_COF = {
    "weapon_vj_cofr_switchblade",
    "weapon_vj_cofr_nightstick",
    "weapon_vj_cofr_sledgehammer",
    "weapon_vj_cofr_branch",
    "weapon_vj_cofraom_axe",
    "weapon_vj_cofrcc_pickaxe",
    "weapon_vj_cofrcc_shovel",
    "weapon_vj_cofrcc_stone"
}
VJ_COFR_MELEEWEAPONS_AOMDC = {
    "weapon_vj_cofraom_knife",
    "weapon_vj_cofraom_hammer",
    //"weapon_vj_cofraomda_hammer",
    "weapon_vj_cofraom_axe",
    "weapon_vj_cofraom_spear"
}
VJ_COFR_MELEEWEAPONS_AOMC =
    "weapon_vj_cofraomc_knife"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
    if math.random(1,2) == 1 && self.Human_Type == 0 then
        self.WeaponInventory_MeleeList = VJ.PICK({VJ_COFR_MELEEWEAPONS_AOMDC})
    elseif math.random(1,2) == 1 && self.Human_Type == 1 then
        self.WeaponInventory_MeleeList = VJ.PICK({VJ_COFR_MELEEWEAPONS_COF})
    elseif math.random(1,2) == 1 && self.Human_Type == 2 then
        self.WeaponInventory_MeleeList = VJ.PICK({VJ_COFR_MELEEWEAPONS_COF})
    elseif math.random(1,2) == 1 && self.Human_Type == 3 then
        self.WeaponInventory_MeleeList = VJ.PICK({VJ_COFR_MELEEWEAPONS_AOMC})
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:David_Init()
    if !self.Weapon_Disabled && self.Human_Type == 0 then
        if !self.WeaponInventory_MeleeList then
            self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_AOMDC))
        else
            self:Give(VJ.PICK(self.WeaponsList_AoMDC_Cont["ContWeapons"]))
        end
    end
    if self.Human_Type == 0 then
        self.SoundTbl_Breath = {
            "vj_cofr/aom/david/breathe1.wav",
            "vj_cofr/aom/david/breathe2.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/aom/david/pl_pain2.wav",
            "vj_cofr/aom/david/pl_pain4.wav",
            "vj_cofr/aom/david/pl_pain5.wav",
            "vj_cofr/aom/david/pl_pain6.wav",
            "vj_cofr/aom/david/pl_pain7.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/aom/david/pl_pain2.wav",
            "vj_cofr/aom/david/pl_pain4.wav",
            "vj_cofr/aom/david/pl_pain5.wav",
            "vj_cofr/aom/david/pl_pain6.wav",
            "vj_cofr/aom/david/pl_pain7.wav"
        }
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Simon_Init()
    if !self.Weapon_Disabled && self.Human_Type == 1 then
        if !self.WeaponInventory_MeleeList then
            self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_COF))
        else
            self:Give(VJ.PICK(self.WeaponsList_CoF_Cont["ContWeapons"]))
        end
    end
    if self.Human_Type == 1 then
        self.SoundTbl_Breath =
            "vj_cofr/cof/simon/breathing.wav"

        self.SoundTbl_BeforeMeleeAttack = {
            "vj_cofr/cof/simon/Swing1.wav",
            "vj_cofr/cof/simon/Swing2.wav",
            "vj_cofr/cof/simon/Swing3.wav",
            "vj_cofr/cof/simon/Swing4.wav",
            "vj_cofr/cof/simon/Swing5.wav",
            "vj_cofr/cof/simon/Swing6.wav",
            "vj_cofr/cof/simon/Swing7.wav",
            "vj_cofr/cof/simon/Swing8.wav",
            "vj_cofr/cof/simon/Swing9.wav",
            "vj_cofr/cof/simon/Swing10.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/cof/simon/Pain1.wav",
            "vj_cofr/cof/simon/Pain2.wav",
            "vj_cofr/cof/simon/Pain3.wav",
            "vj_cofr/cof/simon/Pain4.wav",
            "vj_cofr/cof/simon/Pain5.wav",
            "vj_cofr/cof/simon/Pain6.wav",
            "vj_cofr/cof/simon/Pain7.wav",
            "vj_cofr/cof/simon/Pain8.wav",
            "vj_cofr/cof/simon/Pain9.wav",
            "vj_cofr/cof/simon/Pain10.wav",
            "vj_cofr/cof/simon/Pain11.wav",
            "vj_cofr/cof/simon/Pain12.wav",
            "vj_cofr/cof/simon/Pain13.wav",
            "vj_cofr/cof/simon/Pain14.wav",
            "vj_cofr/cof/simon/Pain15.wav",
            "vj_cofr/cof/simon/Pain16.wav"
        }
        self.SoundTbl_LowHealth = {
            "vj_cofr/cof/simon/lhealth1.wav",
            "vj_cofr/cof/simon/lhealth2.wav",
            "vj_cofr/cof/simon/lhealth3.wav",
            "vj_cofr/cof/simon/lhealth4.wav",
            "vj_cofr/cof/simon/lhealth5.wav"
        }
        self.SoundTbl_MedicReceiveHeal = {
            "vj_cofr/cof/simon/morphine1.wav",
            "vj_cofr/cof/simon/morphine2.wav",
            "vj_cofr/cof/simon/morphine3.wav",
            "vj_cofr/cof/simon/morphine4.wav",
            "vj_cofr/cof/simon/morphine5.wav",
            "vj_cofr/cof/simon/morphine6.wav",
            "vj_cofr/cof/simon/morphine7.wav",
            "vj_cofr/cof/simon/morphine8.wav"
        }
        self.SoundTbl_SuicidePanic = {
            "vj_cofr/cof/simon/suicide_panic1.wav",
            "vj_cofr/cof/simon/suicide_panic2.wav",
            "vj_cofr/cof/simon/suicide_panic3.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/cof/simon/death1.wav",
            "vj_cofr/cof/simon/death2.wav",
            "vj_cofr/cof/simon/death3.wav",
            "vj_cofr/cof/simon/death4.wav",
            "vj_cofr/cof/simon/death5.wav",
            "vj_cofr/cof/simon/death6.wav",
            "vj_cofr/cof/simon/death7.wav"
        }
        if GetConVar("VJ_COFR_Simon_Costumes"):GetInt() == 1 then
            self:SetSkin(math.random(0,13))
        end
        if self:GetSkin() == 8 && math.random(1,10) == 1 && (self:GetModel() == "models/vj_cofr/cof/simon.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_hoodless.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_early.mdl") then
            self:PlaySoundSystem("Speech", "vj_cofr/cof/simon/hellokitty.wav")
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Police_Init()
    if !self.Weapon_Disabled && self.Human_Type == 2 then
        if !self.WeaponInventory_MeleeList then
            self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_COF))
        else
            self:Give(VJ.PICK(self.WeaponsList_CoF_Cont["ContWeapons"]))
        end
    end
    if self.Human_Type == 2 then
        self.SoundTbl_BeforeMeleeAttack = {
            "vj_cofr/cof/police/Swing1.wav",
            "vj_cofr/cof/police/Swing2.wav",
            "vj_cofr/cof/police/Swing3.wav",
            "vj_cofr/cof/police/Swing4.wav",
            "vj_cofr/cof/police/Swing5.wav",
            "vj_cofr/cof/police/Swing6.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/cof/police/Pain1.wav",
            "vj_cofr/cof/police/Pain2.wav",
            "vj_cofr/cof/police/Pain3.wav",
            "vj_cofr/cof/police/Pain4.wav",
            "vj_cofr/cof/police/Pain5.wav",
            "vj_cofr/cof/police/Pain6.wav",
            "vj_cofr/cof/police/Pain7.wav",
            "vj_cofr/cof/police/Pain8.wav",
            "vj_cofr/cof/police/Pain9.wav",
            "vj_cofr/cof/police/Pain10.wav"
        }
        self.SoundTbl_LowHealth = {
            "vj_cofr/cof/police/lhealth1.wav",
            "vj_cofr/cof/police/lhealth2.wav",
            "vj_cofr/cof/police/lhealth3.wav",
            "vj_cofr/cof/police/lhealth4.wav",
        }
        self.SoundTbl_MedicReceiveHeal = {
            "vj_cofr/cof/police/morphine1.wav",
            "vj_cofr/cof/police/morphine2.wav",
            "vj_cofr/cof/police/morphine3.wav",
            "vj_cofr/cof/police/morphine4.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/cof/police/death1.wav",
            "vj_cofr/cof/police/death2.wav",
            "vj_cofr/cof/police/death3.wav",
            "vj_cofr/cof/police/death4.wav",
            "vj_cofr/cof/police/death5.wav"
        }
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DavidClassic_Init()
    if !self.Weapon_Disabled && self.Human_Type == 3 then
        if !self.WeaponInventory_MeleeList then
            self:Give(VJ.PICK(VJ_COFR_MELEEWEAPONS_AOMC))
        else
            self:Give(VJ.PICK(self.WeaponsList_AoMC_Cont["ContWeapons"]))
        end
    end
    if self.Human_Type == 3 then
        self.SoundTbl_Breath = {
            "vj_cofr/aom/david/breathe1.wav",
            "vj_cofr/aom/david/breathe2.wav"
        }
        self.SoundTbl_Pain = {
            "vj_cofr/aom/david/pl_pain2.wav",
            "vj_cofr/aom/david/pl_pain4.wav",
            "vj_cofr/aom/david/pl_pain5.wav",
            "vj_cofr/aom/david/pl_pain6.wav",
            "vj_cofr/aom/david/pl_pain7.wav"
        }
        self.SoundTbl_Death = {
            "vj_cofr/aom/david/pl_pain2.wav",
            "vj_cofr/aom/david/pl_pain4.wav",
            "vj_cofr/aom/david/pl_pain5.wav",
            "vj_cofr/aom/david/pl_pain6.wav",
            "vj_cofr/aom/david/pl_pain7.wav"
        }
        if self:GetModel() == "models/vj_cofr/aom/classic/david_early.mdl" then
            self:SetBodygroup(0, math.random(0,1))
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
    if math.random(1,5) == 1 then self.IsMedic = true end
    if GetConVar("VJ_COFR_Human_ReloadCover"):GetInt() == 1 then
        self.Weapon_FindCoverOnReload = true
    end
    if GetConVar("VJ_COFR_Human_Regen"):GetInt() == 1 then
        self.HealthRegenParams.Enabled = true
    end
    if self:GetModel() == "models/vj_cofr/aom/david.mdl" or self:GetModel() == "models/vj_cofr/aom/da/david_custom.mdl" or self:GetModel() == "models/vj_cofr/aom/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aom/da/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aom/da/assistor_cross.mdl" or self:GetModel() == "models/vj_cofr/aom/da/assistor_question.mdl" or self:GetModel() == "models/vj_cofr/aom/da/assistor_scream.mdl" or self:GetModel() == "models/vj_cofr/aom/da/assistor_two.mdl" or self:GetModel() == "models/vj_cofr/aomr/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aomr/david.mdl" then // Already the default
        self.Human_Type = 0
        self:David_Init()
    elseif self:GetModel() == "models/vj_cofr/cof/simon.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_beta.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_early.mdl" or self:GetModel() == "models/vj_cofr/cof/simon_hoodless.mdl" or self:GetModel() == "models/vj_cofr/cofcc/roderick.mdl" then
        self.Human_Type = 1
        self:Simon_Init()
    elseif self:GetModel() == "models/vj_cofr/cof/police1.mdl" or self:GetModel() == "models/vj_cofr/cof/police2.mdl" or self:GetModel() == "models/vj_cofr/cof/police3.mdl" or self:GetModel() == "models/vj_cofr/cof/police4.mdl" then
        self.Human_Type = 2
        self:Police_Init()
    elseif self:GetModel() == "models/vj_cofr/aom/classic/david.mdl" or self:GetModel() == "models/vj_cofr/aom/classic/david_dead.mdl" or self:GetModel() == "models/vj_cofr/aom/classic/david_early.mdl" then
        self.Human_Type = 3
        self:DavidClassic_Init()
    end

    self.CoFR_NextSelfHealT = CurTime() + math.Rand(10,20)
    self.NextWeaponSwitchT = CurTime() + math.Rand(2,4)
    self:SetSurroundingBounds(Vector(-60, -60, 0), Vector(60, 60, 90))
    self:AssistorFlashlight()

    if GetConVar("VJ_COFR_Human_WepSwitch"):GetInt() == 0 or !self.WeaponInventory_MeleeList then return end
    if self.Human_Type == 0 then
        for _,category in pairs(self.WeaponsList_AoMDC) do
            for _,wep in pairs(category) do
                self:Give(wep)
            end
        end
        local wepList = math.random(1,3)
        if wepList == 1 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Normal"]), true)
        elseif wepList == 2 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Close"]), true)
        elseif wepList == 3 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC["Far"]), true)
        end
    end
    if self.Human_Type == 1 or self.Human_Type == 2 then
        for _,category in pairs(self.WeaponsList_CoF) do
            for _,wep in pairs(category) do
                self:Give(wep)
            end
        end
        local wepList = math.random(1,3)
        if wepList == 1 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Normal"]), true)
        elseif wepList == 2 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Close"]), true)
        elseif wepList == 3 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF["Far"]), true)
        end
    end
    if self.Human_Type == 3 then
        for _,category in pairs(self.WeaponsList_AoMC) do
            for _,wep in pairs(category) do
                self:Give(wep)
            end
        end
        local wepList = math.random(1,3)
        if wepList == 1 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Normal"]), true)
        elseif wepList == 2 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Close"]), true)
        elseif wepList == 3 then
            self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC["Far"]), true)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:AssistorFlashlight() end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
    if key == "step" then
        self:PlayFootstepSound()
    elseif key == "melee" or (key == "melee" && IsValid(self:GetActiveWeapon()) && self.WeaponEntity.IsMeleeWeapon) then
        self:ExecuteMeleeAttack()
    elseif key == "death" then
        VJ.EmitSound(self, "vj_cofr/fx/bodydrop" .. math.random(3,4) .. ".wav", 75, 100)
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
function ENT:TranslateActivity(act)
    if self.CoFR_Crouching && self.Weapon_CanMoveFire && IsValid(self:GetEnemy()) && IsValid(self:GetActiveWeapon()) && !self.WeaponEntity.IsMeleeWeapon then
        if (self.EnemyData.Visible or (self.EnemyData.VisibleTime + 5) > CurTime()) && self.CurrentSchedule != nil && self.CurrentSchedule.CanShootWhenMoving && self:CanFireWeapon(true, false) then
                self.WeaponAttackState = VJ.WEP_ATTACK_STATE_FIRE
            if act == ACT_WALK then
                return self:TranslateActivity(act == ACT_WALK and ACT_WALK_CROUCH_AIM)
            elseif act == ACT_RUN then
                return self:TranslateActivity(act == ACT_RUN and ACT_RUN_CROUCH_AIM)
            end
        end
    end
    if act == ACT_IDLE && !self.AnimationTranslations[ACT_IDLE] then
        return self:TranslateActivity(act == ACT_IDLE and ACT_HL2MP_IDLE)
    elseif act == ACT_IDLE && !self:OnGround() && !self:IsMoving() then
        return self:TranslateActivity(act == ACT_IDLE and ACT_GLIDE)
    elseif act == ACT_IDLE && self:GetNPCState() == NPC_STATE_ALERT then
        return self:TranslateActivity(act == ACT_IDLE and ACT_IDLE_ANGRY)
    end
    return self.BaseClass.TranslateActivity(self,act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
    if GetConVar("VJ_COFR_Human_WepSwitch"):GetInt() == 0 then return end
    local controller = self.VJ_TheController
    if IsValid(controller) then
    if controller:KeyDown(IN_WALK) && CurTime() > self.CoFR_NextWepSwitchT && self.WeaponInventory_MeleeList then
    if self.Human_Type == 1 or self.Human_Type == 2 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF_Cont["ContWeapons"]), true) end
    if self.Human_Type == 0 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC_Cont["ContWeapons"]), true) end
    if self.Human_Type == 3 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC_Cont["ContWeapons"]), true) end
        self.CoFR_NextWepSwitchT = CurTime() + 1
    end
        /*if controller:KeyDown(IN_DUCK) && !self.CoFR_Crouching then
            self.CoFR_Crouching = true
        else
            self.CoFR_Crouching = false
        end*/
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
    if self.IsMedic && !self:IsBusy() && self.MedicData.Status != "Healing" && CurTime() > self.CoFR_NextSelfHealT && (self:Health() < self:GetMaxHealth() * 0.75) && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_USE))) then
        self:OnMedicBehavior("BeforeHeal")
        self:PlayAnim("vjges_shoot_wrench", true, false, false)
        timer.Simple(0.4, function()
            if IsValid(self) && !self.Dead then
                local curHP = self:Health()
                self:SetHealth(math.Clamp(curHP + self.Medic_HealAmount, curHP, self:GetMaxHealth()))
                self:OnMedicBehavior("OnHeal")
                self:PlaySoundSystem("Speech", self.SoundTbl_MedicReceiveHeal)
                VJ.CreateSound(self, self.SoundTbl_MedicOnHeal, 75, 100)
                self:RemoveAllDecals()
            end
        end)
        if IsValid(self:GetEnemy()) then
            self:SCHEDULE_COVER_ORIGIN("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = true x.TurnData = {Type = VJ.FACE_ENEMY} end)
        end
        self.CoFR_NextSelfHealT = CurTime() + math.Rand(10,20)
    end
    if self.HasSounds && !self.Dead then
        if math.random(1,2) == 1 && self:Health() <= (self:GetMaxHealth() / 4) && self.CoFR_NextLowHPSoundT < CurTime() then
            self:PlaySoundSystem("Speech", self.SoundTbl_LowHealth)
            self.CoFR_NextLowHPSoundT = CurTime() + math.random(10,20)
        end
    end
    if self.Human_Type == 1 && IsValid(self:GetActiveWeapon()) then
        local wep = self:GetActiveWeapon()
        if !self.Simon_French && wep:GetClass() == "weapon_vj_cofr_famas" then self:PlaySoundSystem("Speech", "vj_cofr/cof/weapons/famas/french4.wav") self.Simon_French = true
        elseif !self.Simon_Branch && (wep:GetClass() == "weapon_vj_cofr_branch" or wep:GetClass() == "weapon_vj_cofr_stone") then self:PlaySoundSystem("Speech", "vj_cofr/cof/weapons/branch/branch_first_get.wav") self.Simon_Branch = true end
    end
    if GetConVar("VJ_COFR_Human_WepSwitch"):GetInt() == 0 or !self.WeaponInventory_MeleeList or self.Weapon_Disabled or !IsValid(self:GetActiveWeapon()) then return end
    local ent = self:GetEnemy()
    local dist = self.EnemyData.DistanceNearest
    if IsValid(ent) && !self.VJ_IsBeingControlled then
        local wep = self:GetActiveWeapon()
        if self.WeaponInventoryStatus == VJ.WEP_INVENTORY_MELEE then return end
        local selectType = false
        if dist > 2200 then
            selectType = "Far"
        elseif dist <= 2200 && dist > 650 then
            selectType = "Normal"
        else
            selectType = "Close"
        end
        if selectType && !self:IsBusy() && CurTime() > self.NextWeaponSwitchT && (!IsValid(wep) or (IsValid(wep) && math.random(1, wep:Clip1() > 0 && (wep:Clip1() <= wep:GetMaxClip1() * 0.35) && 1 or (selectType == "Close" && 20 or 150)))) == 1 then
            if self.Human_Type == 0 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMDC[selectType]),true) end
            if self.Human_Type == 1 or self.Human_Type == 2 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_CoF[selectType]),true) end
            if self.Human_Type == 3 then self:DoChangeWeapon(VJ.PICK(self.WeaponsList_AoMC[selectType]),true) end
            wep = self:GetActiveWeapon()
            self.NextWeaponSwitchT = CurTime() + math.Rand(6, math.Round(math.Clamp(wep:Clip1() * 0.5, 1, wep:Clip1())))
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMedicBehavior(status, statusData)
    if status == "BeforeHeal" then
        if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(true) end
        local att = self:GetAttachment(self:LookupAttachment("rhand"))
        self.healItem = ents.Create("prop_vj_animatable")
        self.healItem:SetModel(self.Medic_SpawnPropOnHealModel)
        self.healItem:SetPos(att.Pos)
        self.healItem:SetAngles(att.Ang)
        self.healItem:SetParent(self)
        self.healItem:Fire("SetParentAttachment", "rhand")
        self.healItem:Spawn()
        //self.healItem:AddEffects(EF_BONEMERGE)
        self.healItem:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
        self:DeleteOnRemove(self.healItem)
        //SafeRemoveEntityDelayed(self.healItem,1)
    end
    if status == "OnHeal" then
        timer.Simple(0.1, function()
            if IsValid(self) then
                SafeRemoveEntity(self.healItem)
                if IsValid(self:GetActiveWeapon()) then self:GetActiveWeapon():SetNoDraw(false) end
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
    if self.Human_Type == 1 && math.random(1,2) == 1 then
    if ent:GetClass() == "npc_vj_cofr_purnell" then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/simon/simonbossangry.wav")
    elseif ent:GetClass() == "npc_vj_cofr_carcass" then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/simon/simon32.wav")
    elseif ent:GetClass() == "npc_vj_cofr_mace" then
        self:PlaySoundSystem("Alert", "vj_cofr/cof/simon/sub3.wav")
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttack(status, enemy)
    if status == "Init" then
        if IsValid(self:GetActiveWeapon()) && !self.WeaponEntity.IsMeleeWeapon then
            self.MeleeAttackDamage = 15
            self.MeleeAttackDamageType = DMG_CLUB
            self.SoundTbl_MeleeAttackExtra =
                "vj_cofr/cof/weapons/melee_hit.wav"

            self.SoundTbl_MeleeAttackMiss =
                "vj_cofr/cof/weapons/melee_swing.wav"
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
    return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponAttack()
    local wep = self.WeaponEntity
    local finalAnim = self:TranslateActivity(VJ.PICK(self.AnimTbl_WeaponAttackGesture))
    if wep.IsMeleeWeapon && CurTime() > self.CoFR_NextMeleeAnimT && VJ.AnimExists(self, finalAnim) then
        local animDur = VJ.AnimDuration(self, finalAnim)
        self:PlaySoundSystem("BeforeMeleeAttack", self.SoundTbl_BeforeMeleeAttack)
        wep.NPC_NextPrimaryFire = animDur
        wep:NPCShoot_Primary()
        VJ.EmitSound(self, wep.NPC_BeforeFireSound, wep.NPC_BeforeFireSoundLevel, math.Rand(wep.NPC_BeforeFireSoundPitch.a, wep.NPC_BeforeFireSoundPitch.b))
        self.CoFR_NextMeleeAnimT = CurTime() + animDur
        self.WeaponAttackAnim = finalAnim
        self:PlayAnim(finalAnim, "LetAttacks", false, true)
        self.WeaponAttackState = VJ.WEP_ATTACK_STATE_FIRE
    end
    if self.VJ_IsBeingControlled then return end
    if wep.IsMeleeWeapon then self.MeleeAttackAnimationFaceEnemy = false else self.MeleeAttackAnimationFaceEnemy = true end
    if self.Weapon_Strafe && !self.IsGuard && !self.IsFollowing && (wep.IsMeleeWeapon) && self.WeaponAttackState == VJ.WEP_ATTACK_STATE_FIRE && CurTime() > self.NextWeaponStrafeT && (CurTime() - self.EnemyData.TimeAcquired) > 2 then
        timer.Simple(0, function()
            local moveCheck = VJ.PICK(VJ.TraceDirections(self, "Quick", math.random(150,250), true, false, 8, true))
            if moveCheck then
                self:StopMoving()
                self.NextWeaponStrafeT = CurTime() + math.Rand(self.Weapon_StrafeCooldown.a, self.Weapon_StrafeCooldown.b)
                self:SetLastPosition(moveCheck)
                self:SCHEDULE_GOTO_POSITION("TASK_RUN_PATH", function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.TurnData = {Type = VJ.FACE_ENEMY} end)
            end
        end)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponStrafe()
    if self.VJ_IsBeingControlled then self.CoFR_Crouching = false return end
    if math.random(1,2) == 1 && !self.CoFR_Crouching then
        self.CoFR_Crouching = true
    else
        self.CoFR_Crouching  = false
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponReload()
    //if self.Weapon_FindCoverOnReload then self:SCHEDULE_COVER_ORIGIN("TASK_RUN_PATH", function(x) x.CanShootWhenMoving = true x.ConstantlyFaceEnemy_IfVisible = (IsValid(self:GetActiveWeapon()) and true) or false x.DisableChasingEnemy = false end) return end
    if self.IsGuard or self.VJ_IsBeingControlled or !IsValid(self:GetEnemy()) or self.Weapon_FindCoverOnReload or GetConVar("VJ_COFR_Human_ReloadRun"):GetInt() == 0 or self:DoCoverTrace(self:GetPos() + self:OBBCenter(), self:GetEnemy():EyePos(), false, {SetLastHiddenTime=true}) then return end
    timer.Simple(0, function()
    local moveCheck = VJ.PICK(VJ.TraceDirections(self, "Quick", math.random(150,400), true, false, 8, true))
        if moveCheck then
            self:StopMoving()
            self:SetLastPosition(moveCheck)
            self:SCHEDULE_GOTO_POSITION(VJ.PICK({"TASK_RUN_PATH", "TASK_WALK_PATH"}), function(x) x:EngTask("TASK_FACE_ENEMY", 0) x.CanShootWhenMoving = true x.TurnData = {Type = VJ.FACE_ENEMY} end)
        end
    end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAnimationTranslations(h)
    local defIdleAim = ACT_IDLE -- ACT_IDLE_ANGRY
    local defWalkAim = ACT_WALK
    local defRunAim = ACT_RUN
    local defFire = ACT_RANGE_ATTACK1
    local defCrouch = ACT_RANGE_ATTACK1_LOW
    local defCrawl = ACT_RUN_CROUCH
    local defReload = ACT_RELOAD

    if self:GetActiveWeapon().CoFR_HoldType then -- Allow for more than default hold types
        h = self:GetActiveWeapon().CoFR_HoldType
    end
    if h == "crossbow" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_bow")
        defWalkAim = VJ.SequenceToActivity(self,"walk_bow")
        defRunAim = VJ.SequenceToActivity(self,"run_bow")
        defCrouch = VJ.SequenceToActivity(self,"crouch_bow")
        defCrawl = VJ.SequenceToActivity(self,"crawl_bow")
        defFire = "vjges_shoot_bow"
        defReload = "vjges_reload_bow"
    elseif h == "melee" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_crowbar")
        defWalkAim = VJ.SequenceToActivity(self,"walk_crowbar")
        defRunAim = VJ.SequenceToActivity(self,"run_crowbar")
        defCrouch = VJ.SequenceToActivity(self,"crouch_crowbar")
        defCrawl = VJ.SequenceToActivity(self,"crawl_crowbar")
        defFire = "vjges_shoot_crowbar"
        defReload = "vjges_reload_crowbar"
    elseif h == "ar2" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_gauss")
        defWalkAim = VJ.SequenceToActivity(self,"walk_gauss")
        defRunAim = VJ.SequenceToActivity(self,"run_gauss")
        defCrouch = VJ.SequenceToActivity(self,"crouch_gauss")
        defCrawl = VJ.SequenceToActivity(self,"crawl_gauss")
        defFire = "vjges_shoot_gauss"
        defReload = "vjges_reload_gauss"
    elseif h == "physgun" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_hive")
        defWalkAim = VJ.SequenceToActivity(self,"walk_hive")
        defRunAim = VJ.SequenceToActivity(self,"run_hive")
        defCrouch = VJ.SequenceToActivity(self,"crouch_hive")
        defCrawl = VJ.SequenceToActivity(self,"crawl_hive")
        defFire = "vjges_shoot_hive"
        defReload = "vjges_reload_hive"
    elseif h == "smg" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_mp5")
        defWalkAim = VJ.SequenceToActivity(self,"walk_mp5")
        defRunAim = VJ.SequenceToActivity(self,"run_mp5")
        defCrouch = VJ.SequenceToActivity(self,"crouch_mp5")
        defCrawl = VJ.SequenceToActivity(self,"crawl_mp5")
        defFire = "vjges_shoot_mp5"
        defReload = "vjges_reload_mp5"
    elseif h == "pistol" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_onehanded")
        defWalkAim = VJ.SequenceToActivity(self,"walk_onehanded")
        defRunAim = VJ.SequenceToActivity(self,"run_onehanded")
        defCrouch = VJ.SequenceToActivity(self,"crouch_onehanded")
        defCrawl = VJ.SequenceToActivity(self,"crawl_onehanded")
        defFire = "vjges_shoot_onehanded"
        defReload = "vjges_reload_onehanded"
    elseif h == "revolver" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_python")
        defWalkAim = VJ.SequenceToActivity(self,"walk_python")
        defRunAim = VJ.SequenceToActivity(self,"run_python")
        defCrouch = VJ.SequenceToActivity(self,"crouch_python")
        defCrawl = VJ.SequenceToActivity(self,"crawl_python")
        defFire = "vjges_shoot_python"
        defReload = "vjges_reload_python"
    elseif h == "rpg" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_rpg")
        defWalkAim = VJ.SequenceToActivity(self,"walk_rpg")
        defRunAim = VJ.SequenceToActivity(self,"run_rpg")
        defCrouch = VJ.SequenceToActivity(self,"crouch_rpg")
        defCrawl = VJ.SequenceToActivity(self,"crawl_rpg")
        defFire = "vjges_shoot_rpg"
        defReload = "vjges_reload_rpg"
    elseif h == "shotgun" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_shotgun")
        defWalkAim = VJ.SequenceToActivity(self,"walk_shotgun")
        defRunAim = VJ.SequenceToActivity(self,"run_shotgun")
        defCrouch = VJ.SequenceToActivity(self,"crouch_shotgun")
        defCrawl = VJ.SequenceToActivity(self,"crawl_shotgun")
        defFire = "vjges_shoot_shotgun"
        defReload = "vjges_reload_shotgun"
    elseif h == "slam" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_squeak")
        defWalkAim = VJ.SequenceToActivity(self,"walk_squeak")
        defRunAim = VJ.SequenceToActivity(self,"run_squeak")
        defCrouch = VJ.SequenceToActivity(self,"crouch_squeak")
        defCrawl = VJ.SequenceToActivity(self,"crawl_squeak")
        defFire = "vjges_shoot_squeak"
        defReload = "vjges_reload_squeak"
    elseif h == "grenade" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_gren")
        defWalkAim = VJ.SequenceToActivity(self,"walk_gren")
        defRunAim = VJ.SequenceToActivity(self,"run_gren")
        defCrouch = VJ.SequenceToActivity(self,"crouch_gren")
        defCrawl = VJ.SequenceToActivity(self,"crawl_gren")
        defFire = "vjges_shoot_gren"
        defReload = "vjges_reload_onehanded" //vjges_reload_gren
    elseif h == "saw" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_saw")
        defWalkAim = VJ.SequenceToActivity(self,"walk_saw")
        defRunAim = VJ.SequenceToActivity(self,"run_saw")
        defCrouch = VJ.SequenceToActivity(self,"crouch_saw")
        defCrawl = VJ.SequenceToActivity(self,"crawl_saw")
        defFire = "vjges_shoot_saw"
        defReload = "vjges_reload_saw"
    elseif h == "sniper" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_sniper")
        defWalkAim = VJ.SequenceToActivity(self,"walk_sniper")
        defRunAim = VJ.SequenceToActivity(self,"run_sniper")
        defCrouch = VJ.SequenceToActivity(self,"crouch_sniper")
        defCrawl = VJ.SequenceToActivity(self,"crawl_sniper")
        defFire = "vjges_shoot_sniper"
        defReload = "vjges_reload_sniper"
    elseif h == "m16" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_m16")
        defWalkAim = VJ.SequenceToActivity(self,"walk_m16")
        defRunAim = VJ.SequenceToActivity(self,"run_m16")
        defCrouch = VJ.SequenceToActivity(self,"crouch_m16")
        defCrawl = VJ.SequenceToActivity(self,"crawl_m16")
        defFire = "vjges_shoot_m16"
        defReload = "vjges_reload_m16"
    elseif h == "shockrifle" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_m16")
        defWalkAim = VJ.SequenceToActivity(self,"walk_m16")
        defRunAim = VJ.SequenceToActivity(self,"run_m16")
        defCrouch = VJ.SequenceToActivity(self,"crouch_m16")
        defCrawl = VJ.SequenceToActivity(self,"crawl_m16")
        defFire = "vjges_shoot_m16"
        defReload = "vjges_reload_null"
    elseif h == "minigun" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_minigun")
        defWalkAim = VJ.SequenceToActivity(self,"walk_minigun")
        defRunAim = VJ.SequenceToActivity(self,"run_minigun")
        defCrouch = VJ.SequenceToActivity(self,"crouch_minigun")
        defCrawl = VJ.SequenceToActivity(self,"crawl_minigun")
        defFire = "vjges_shoot_minigun"
        defReload = "vjges_reload_minigun"
    elseif h == "uzi" then
        defIdleAim = VJ.SequenceToActivity(self,"aim_hive")
        defWalkAim = VJ.SequenceToActivity(self,"walk_hive")
        defRunAim = VJ.SequenceToActivity(self,"run_hive")
        defCrouch = VJ.SequenceToActivity(self,"crouch_hive")
        defCrawl = VJ.SequenceToActivity(self,"crawl_hive")
        defFire = "vjges_shoot_hive"
        defReload = "vjges_reload_uzis_right"
    end
    self.AnimationTranslations[ACT_IDLE] = defIdleAim
    self.AnimationTranslations[ACT_IDLE_ANGRY] = defIdleAim
    self.AnimationTranslations[ACT_WALK] = defWalkAim
    self.AnimationTranslations[ACT_WALK_AGITATED] = defWalkAim
    self.AnimationTranslations[ACT_WALK_AIM] = defWalkAim
    self.AnimationTranslations[ACT_RUN] = defRunAim
    self.AnimationTranslations[ACT_RUN_AGITATED] = defRunAim
    self.AnimationTranslations[ACT_RUN_AIM] = defRunAim
    self.AnimationTranslations[ACT_RANGE_ATTACK1] = defIdleAim
    self.AnimationTranslations[ACT_RANGE_ATTACK1_LOW] = defCrouch
    self.AnimationTranslations[ACT_COVER_LOW] = defCrouch
    self.AnimationTranslations[ACT_WALK_CROUCH] = defCrawl
    self.AnimationTranslations[ACT_WALK_CROUCH_AIM] = defCrawl
    self.AnimationTranslations[ACT_RUN_CROUCH] = defCrawl
    self.AnimationTranslations[ACT_RUN_CROUCH_AIM] = defCrawl
    self.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK1] = defFire
    self.AnimationTranslations[ACT_GESTURE_RANGE_ATTACK2] = defFire
    self.AnimationTranslations[ACT_RELOAD] = defReload
    self.AnimationTranslations[ACT_RELOAD_LOW] = defReload
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
    if status == "DeathAnim" then
        if hitgroup == HITGROUP_HEAD then
            self.AnimTbl_Death = ACT_DIE_HEADSHOT
        else
            self.AnimTbl_Death = {ACT_DIEBACKWARD, ACT_DIEFORWARD, ACT_DIESIMPLE, ACT_DIE_GUTSHOT}
        end
        self:DeathWeaponDrop(dmginfo,hitgroup)
        local activeWep = self:GetActiveWeapon()
        if IsValid(activeWep) then activeWep:Remove() end
    end
    if status == "Init" then
        VJ_COFR_DeathCode(self)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpseEnt)
    if self.Human_Type == 2 or self.Human_Type == 0 then
        if self.Human_Type == 2 then corpseEnt:SetBodygroup(0,0) end
        corpseEnt:SetSkin(0)
    end
    corpseEnt:SetMoveType(MOVETYPE_STEP)
    VJ_COFR_ApplyCorpse(self, corpseEnt)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeathWeaponDrop(dmginfo, hitgroup, wepEnt)
    wepEnt:SetModelScale(1)
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
        VJ.EmitSound(self, "vj_cofr/fx/wade" .. math.random(1,4) .. ".wav", self.FootstepSoundLevel, self:GetSoundPitch(self.FootStepPitch1, self.FootStepPitch2))
    end
end
/*-----------------------------------------------
    *** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
    No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
    without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/