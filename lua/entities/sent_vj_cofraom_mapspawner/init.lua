/* Note: All credits go to Cpt. Hazama. I take no credit for this. */
AddCSLuaFile("shared.lua")
include('shared.lua')

local table_insert = table.insert
local table_remove = table.remove

ENT.Monster = {
    {class="npc_vj_cofraom_twitcher1",chance=1},
    {class="npc_vj_cofraom_twitcher2",chance=1},
    {class="npc_vj_cofraom_twitcher3",chance=1},
    {class="npc_vj_cofraom_twitcher4",chance=1},
    {class="npc_vj_cofraom_twitcher_da",chance=2},
    {class="npc_vj_cofraom_handcrab",chance=3},
    {class="npc_vj_cofraom_wheelchair",chance=5},
    {class="npc_vj_cofraom_hellhound",chance=5},
    {class="npc_vj_cofraom_spitter",chance=10},
    {class="npc_vj_cofraom_face",chance=20},
    {class="npc_vj_cofraom_ghost",chance=20},
    {class="npc_vj_cofraom_screamer",chance=20},
    {class="npc_vj_cofraomc_twitcher",chance=1},
    {class="npc_vj_cofraomc_headcrab",chance=3},
    {class="npc_vj_cofraomc_hellhound",chance=5},
    {class="npc_vj_cofraomc_spitter",chance=10},
    {class="npc_vj_cofraomc_face",chance=20},
    {class="npc_vj_cofraomc_ghost",chance=20},
    {class="npc_vj_cofraomc_screamer",chance=20},
}

ENT.BossMonster = {
    {class="npc_vj_cofraom_addiction",max=1},
}

local AmbientSounds = {
    "vj_cofr/aom/mapspawner/4motherbr.wav",
    "vj_cofr/aom/mapspawner/babylaugh12.wav",
    "vj_cofr/aom/mapspawner/brutalskrik.wav",
    "vj_cofr/aom/mapspawner/cagesound.wav",
    "vj_cofr/aom/mapspawner/cover_here.wav",
    "vj_cofr/aom/mapspawner/cry1.wav",
    "vj_cofr/aom/mapspawner/cry2.wav",
    "vj_cofr/aom/mapspawner/cry3.wav",
    "vj_cofr/aom/mapspawner/freakguyscream.wav",
    "vj_cofr/aom/mapspawner/freakguyscream2.wav",
    "vj_cofr/aom/mapspawner/iscareyou1.wav",
    "vj_cofr/aom/mapspawner/karringskrik1.wav",
    "vj_cofr/aom/mapspawner/karringskrik2.wav",
    "vj_cofr/aom/mapspawner/ki5.wav",
    "vj_cofr/aom/mapspawner/ki6.wav",
    "vj_cofr/aom/mapspawner/ki9.wav",
    "vj_cofr/aom/mapspawner/over_here.wav",
    "vj_cofr/aom/mapspawner/scream22.wav",
    "vj_cofr/aom/mapspawner/vaggover.wav",
    "vj_cofr/aom/mapspawner/viskingar.wav",
    "vj_cofr/aom/mapspawner/viskingar2.wav",
    "vj_cofr/aom/mapspawner/child_cryin.wav"
}

local MusicList = {
    "vj_cofr/aom/mapspawner/afterforest1.wav",
    "vj_cofr/aom/mapspawner/angforest1.wav",
    "vj_cofr/aom/mapspawner/arforest1.wav",
    "vj_cofr/aom/mapspawner/carforest1.wav",
    "vj_cofr/aom/mapspawner/carforest2.wav",
    "vj_cofr/aom/mapspawner/city2.wav",
    "vj_cofr/aom/mapspawner/cityz22.wav",
    "vj_cofr/aom/mapspawner/cityz45.wav",
    "vj_cofr/aom/mapspawner/darkalley1.wav",
    "vj_cofr/aom/mapspawner/forest21.wav",
    "vj_cofr/aom/mapspawner/forhousemain.wav",
    "vj_cofr/aom/mapspawner/heaven22.wav",
    "vj_cofr/aom/mapspawner/hospital2.wav",
    "vj_cofr/aom/mapspawner/hospital3.wav",
    "vj_cofr/aom/mapspawner/sewer1.wav",
    "vj_cofr/aom/mapspawner/sickfromsick.wav"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
    local i = 0
    for k, v in ipairs(ents.GetAll()) do
    if (v:GetClass() == "sent_vj_cofraom_mapspawner" or v:GetClass() == "sent_vj_cofr_mapspawner") then
        i = i + 1
        if i > 1 then PrintMessage(HUD_PRINTTALK, "WARNING: Only one Map Spawner is allowed on the map!") self.SkipOnRemove = true self:Remove() end
    end
end

 self.nodePositions = {}
 self.navAreas = {}

 for _,pos in pairs(VJ_COFR_NODEPOS) do
    if pos then table_insert(self.nodePositions,{Position = pos, Time = 0}) end
end

 for _,nav in pairs(navmesh.GetAllNavAreas()) do
    if nav then table_insert(self.navAreas,nav) end
end

 local count = #self.nodePositions +#self.navAreas
 if count <= 50 then
 local msg = "WARNING: Low node/nav-area count detected! The Map Spawner may find it difficult to process with such low nodes/nav-areas. The Map Spawner will now remove itself."
 if count <= 0 then
    msg = "WARNING: No nodes or nav-mesh detected! The Map Spawner relies on nodes/nav-areas for many things. Without any, the Map Spawner will not work! The Map Spawner will now remove itself."
end
    MsgN(msg)
    PrintMessage(HUD_PRINTTALK, msg)
    SafeRemoveEntity(self)
end

    self:SetCollisionGroup(COLLISION_GROUP_NONE)
    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_NONE)
    self:SetPos(Vector(0, 0, 0))
    self:SetNoDraw(true)
    self:DrawShadow(false)

    self.IsActivated = tobool(GetConVarNumber("VJ_COFR_MapSpawner_Enabled"))
    self.COFR_SpawnDistance = GetConVarNumber("VJ_COFR_MapSpawner_SpawnMax")
    self.COFR_SpawnDistanceClose = GetConVarNumber("VJ_COFR_MapSpawner_SpawnMin")
    self.COFR_HordeChance = GetConVarNumber("VJ_COFR_MapSpawner_HordeChance")
    self.COFR_HordeCooldownMin = GetConVarNumber("VJ_COFR_MapSpawner_HordeCooldownMin")
    self.COFR_HordeCooldownMax = GetConVarNumber("VJ_COFR_MapSpawner_HordeCooldownMax")
    self.COFR_MaxMonster = GetConVarNumber("VJ_COFR_MapSpawner_MaxMon")
    self.COFR_MaxHordeSpawn = GetConVarNumber("VJ_COFR_MapSpawner_HordeCount")
    self.tbl_SpawnedNPCs = {}
    self.tbl_NPCsWithEnemies = {}
    self.tbl_SpawnedBossMonster = {}
    self.NextAICheckTime = CurTime() +5
    self.NextMonsterSpawnTime = CurTime() +1
    self.NextBossMonsterSpawnTime = CurTime() +math.random(10,20)
    self.NextHordeSpawnTime = CurTime() +math.Rand(self.COFR_HordeCooldownMin,self.COFR_HordeCooldownMax)
    self.DidStartMusic = false
    self.NextMusicSwitchT = CurTime() +1
    self.NextAIBossCheckTime = CurTime() +5
    self.HordeSpawnRate = 0.19
    self.MaxBossMonster = 1
    self.NextAmbientSoundT = CurTime() + math.Rand(1,30)
    self.CanSpawnBossMonster = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckVisibility(pos,ent,mdl)
 local check = ents.Create("prop_vj_animatable")
 check:SetModel(mdl or "models/vj_cofr/cof/slower1.mdl")
 check:SetPos(pos)
 check:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
 check:Spawn()
 check:SetNoDraw(true)
 check:DrawShadow(false)
 self:DeleteOnRemove(check)
 timer.Simple(0,function()
    SafeRemoveEntity(check)
end)
    return ent:Visible(check)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindCenterNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local testPos = v:GetCenter()
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindHiddenNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local hidingSpots = v:GetHidingSpots()
    if !hidingSpots then continue end
    if #hidingSpots <= 0 then continue end
    local testPos = VJ.PICK(hidingSpots)
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNavPoint(ent)
    for _,v in RandomPairs(self.navAreas) do
    local testPos = v:GetRandomPoint()
    local dist = testPos:Distance(ent:GetPos())
    if dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
        return testPos
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNavPosition(ent,getHidden)
    local pos = false
    local closestDist = 999999999
    for i,v in pairs(self.navAreas) do
    local hidingSpots = getHidden && v:GetHidingSpots() or true
    if !hidingSpots then continue end
    if istable(hidingSpots) && #hidingSpots <= 0 then continue end
    local testPos = getHidden && VJ.PICK(v:GetHidingSpots()) or v:GetRandomPoint()
    local dist = ent:GetPos():Distance(testPos)
    if dist < closestDist && (dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
        closestDist = dist
        pos = testPos
    end
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestNodePosition(ent)
    local pos = false
    local closestDist = 999999999
    for i,v in pairs(self.nodePositions) do
    if !self:IsNodeUsable(i) then continue end
    local testPos = self:GetNodePosition(i)
    local dist = ent:GetPos():Distance(testPos)
    if dist < closestDist && (dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
        closestDist = dist
        pos = testPos
    end
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindRandomNodePosition(ent)
    for i,v in RandomPairs(self.nodePositions) do
    if !self:IsNodeUsable(i) then continue end
    local testPos = self:GetNodePosition(i)
    local dist = ent && testPos:Distance(ent:GetPos()) or 0
    if ent then
        return testPos
    else
    if dist <= self.COFR_SpawnDistance && dist >= self.COFR_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
            return testPos
        end
    end
end
    return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindSpawnPosition(getClosest,findHidden)
 local nodes = self.nodePositions
 local navareas = self.navAreas
 local useNav = (#nodes <= 0 && #navareas > 0) or (#navareas > 0 && #nodes > 0 && math.random(1,2) == 1) or false
 local pos = false
 if useNav then
    local getHidden = findHidden or math.random(1,3) == 1
    local testEnt = self:GetRandomEnemy()
    pos = getClosest && self:GetClosestNavPosition(testEnt,getHidden) or getHidden && self:FindHiddenNavPoint(testEnt) or self:FindRandomNavPoint(testEnt)
 else
    local testEnt = self:GetRandomEnemy()
    pos = getClosest && self:GetClosestNodePosition(testEnt) or self:FindRandomNodePosition(testEnt)
end
    return pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNodePosition(i)
    return self.nodePositions[i].Position
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:IsNodeUsable(i)
    return self.nodePositions[i].Time < CurTime()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:FindEnemy()
    local tbl = {}
    for _,v in pairs(ents.GetAll()) do
    if (v:IsPlayer() || v:IsNPC()) && v:Health() > 0 && !v:IsFlagSet(65536) && (v.VJ_NPC_Class && !VJ.HasValue(v.VJ_NPC_Class,"CLASS_CRY_OF_FEAR","CLASS_AOM_DC") or true) then
        table_insert(tbl,v)
    end
end
    return tbl
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetRandomEnemy()
    return VJ.PICK(self:FindEnemy())
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetClosestEnemy(pos)
    local ent = NULL
    local closestDist = 999999999
    for _,v in pairs(self:FindEnemy()) do
    local dist = v:GetPos():Distance(pos)
    if dist < closestDist then
        closestDist = dist
        ent = v
    end
end
    return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CheckEnemyDistance(ent,remove)
 local remove = remove or true
 local closestDist = 999999999
 local visible = false
 for _,v in pairs(self:FindEnemy()) do
 local dist = v:GetPos():Distance(ent:GetPos())
 if dist < closestDist then
    closestDist = dist
end
    if v:Visible(ent) then
        visible = true -- Visible to someone, don't bother removing
    end
end
    if closestDist >= GetConVarNumber("VJ_COFR_MapSpawner_SpawnMax") +1000 && !visible && !remove then
        SafeRemoveEntity(ent)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Think()
    self.IsActivated = GetConVar("VJ_COFR_MapSpawner_Enabled")
    if self.IsActivated then
        -- Manage ConVar data
        self.COFR_SpawnDistance = GetConVarNumber("VJ_COFR_MapSpawner_SpawnMax")
        self.COFR_SpawnDistanceClose = GetConVarNumber("VJ_COFR_MapSpawner_SpawnMin")
        self.COFR_HordeChance = GetConVarNumber("VJ_COFR_MapSpawner_HordeChance")
        self.COFR_HordeCooldownMin = GetConVarNumber("VJ_COFR_MapSpawner_HordeCooldownMin")
        self.COFR_HordeCooldownMax = GetConVarNumber("VJ_COFR_MapSpawner_HordeCooldownMax")
        self.COFR_MaxMonster = GetConVarNumber("VJ_COFR_MapSpawner_MaxMon")
        self.COFR_MaxHordeSpawn = GetConVarNumber("VJ_COFR_MapSpawner_HordeCount")
        self.AI_RefreshTime = GetConVarNumber("VJ_COFR_MapSpawner_RefreshRate")

     if GetConVar("VJ_COFR_MapSpawner_Ambience"):GetInt() == 1 then
     for _,v in ipairs(player.GetAll()) do
     if math.random(1,2) == 1 && self.NextAmbientSoundT < CurTime() then
        self.CoFR_PickAmbient = VJ.PICK(AmbientSounds)
        self.COFR_Ambient = VJ.CreateSound(v,self.CoFR_PickAmbient,GetConVar("VJ_COFR_MapSpawner_AmbienceVolume"):GetInt(),100)
        self.NextAmbientSoundT = CurTime() + ((((SoundDuration(self.CoFR_PickAmbient) > 0) and SoundDuration(self.CoFR_PickAmbient)) or 2) + 1) + math.Rand(20,40)
        end
    end
end
    -- Checks for inactive AI, this code is quite bulky and might be able to be optimized better
    if CurTime() > self.NextAICheckTime then
    if #self.tbl_SpawnedNPCs > 0 then
    for i,v in ipairs(self.tbl_SpawnedNPCs) do
    if IsValid(v) then
    local enemy = v:GetEnemy()
        self:CheckEnemyDistance(v)
    if IsValid(enemy) && !VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_insert(self.tbl_NPCsWithEnemies,v)
    elseif !IsValid(enemy) then
    if VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_remove(self.tbl_NPCsWithEnemies,i)
    end
end
    else
        table_remove(self.tbl_SpawnedNPCs,i)
        end
    end
end
    if #self.tbl_SpawnedBossMonster > 0 then
    for i,v in ipairs(self.tbl_SpawnedBossMonster) do
    if IsValid(v) then
    local enemy = v:GetEnemy()
        self:CheckEnemyDistance(v)
    if IsValid(enemy) && !VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_insert(self.tbl_NPCsWithEnemies,v)
    elseif !IsValid(enemy) then
    if VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
        table_remove(self.tbl_NPCsWithEnemies,i)
    end
end
        else
            table_remove(self.tbl_SpawnedBossMonster,i)
        end
    end
end
    self.NextAICheckTime = CurTime() +5
end

 -- Manages Music
 self:DoMusic(false)

 -- Spawns AI
 if CurTime() > self.NextMonsterSpawnTime then
    if #self.tbl_SpawnedNPCs >= self.COFR_MaxMonster -self.COFR_MaxHordeSpawn then return end -- Makes sure that we can at least spawn a mob when it's time
    self:SpawnMonster(self:PickMonster(self.Monster),self:FindSpawnPosition(false))
    self.NextMonsterSpawnTime = CurTime() +math.Rand(GetConVarNumber("VJ_COFR_MapSpawner_DelayMin"),GetConVarNumber("VJ_COFR_MapSpawner_DelayMax"))
end

 if GetConVar("VJ_COFR_MapSpawner_Boss"):GetInt() == 1 then
    self.CanSpawnBossMonster = true
    if CurTime() > self.NextBossMonsterSpawnTime then
        self:SpawnBossMonster(self:PickMonster(self.BossMonster),self:FindSpawnPosition(true))
        self.NextBossMonsterSpawnTime = CurTime() +math.random(10,20)
    end
end

    -- Spawns Hordes
    if CurTime() > self.NextHordeSpawnTime && math.random(1,self.COFR_HordeChance) == 1 then
    for i = 1,self.COFR_MaxHordeSpawn do
    timer.Simple(self.HordeSpawnRate *i,function() -- Help with lag when spawning
    if IsValid(self) then
            self:SpawnMonster(self:PickMonster(self.Monster),self:FindSpawnPosition(true,true),true)
        end
    end)
end
        self.NextHordeSpawnTime = CurTime() +math.Rand(self.COFR_HordeCooldownMin,self.COFR_HordeCooldownMax)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DoMusic(stop)
    for _,v in ipairs(player.GetAll()) do
    if !stop && !self.DidStartMusic then
        self.DidStartMusic = true
        self.NextMusicSwitchT = CurTime() +1
    if GetConVar("VJ_COFR_MapSpawner_Music"):GetInt() == 1 then
        self.NextAoMMusicT = self.NextAoMMusicT or 0
    if CurTime() > self.NextAoMMusicT then
        self.CoFR_PickTrack = VJ.PICK(MusicList)
        self.CoFR_Track = VJ.CreateSound(v,self.CoFR_PickTrack,GetConVar("VJ_COFR_MapSpawner_MusicVolume"):GetInt(),100)
        self.NextAoMMusicT = CurTime() + ((((SoundDuration(self.CoFR_PickTrack) > 0) and SoundDuration(self.CoFR_PickTrack)) or 2) + 1)

        timer.Simple(((((SoundDuration(self.CoFR_PickTrack) > 0) and SoundDuration(self.CoFR_PickTrack)) or 2) + 1),function() if IsValid(self) then self.DidStartMusic = false VJ.STOPSOUND(self.CoFR_Track) end end)
        end
    end
end
    if stop && self.DidStartMusic then
        self.DidStartMusic = false
        self.NextMusicSwitchT = CurTime() +1
        VJ.STOPSOUND(self.CoFR_Track)
        end
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetBossCount(class)
    local count = 0
    for _,v in pairs(self.tbl_SpawnedBossMonster) do
    if IsValid(v) && v:GetClass() == class then
        count = count +1
    end
end
    return count
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PickMonster(tbl)
    local useMax = tbl == self.BossMonster
    local ent = false
    for _,v in RandomPairs(tbl) do
    if !useMax then
    if math.random(1,v.chance) == 1 then
        ent = v.class
    break
end
        else
        if self:GetBossCount(v.class) < v.max then
            ent = v.class
            break
        end
    end
end
    return ent
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnMonster(ent,pos,isMob)
    if ent == false then return end
    if pos == nil or pos == false then return end
    if #self.tbl_SpawnedNPCs >= self.COFR_MaxMonster then return end
    local Monster = ents.Create(ent)
    Monster:SetPos(pos)
    Monster:SetAngles(Angle(0,math.random(0,360),0))
    Monster:Spawn()
    table_insert(self.tbl_SpawnedNPCs,Monster)
    if isMob then
        Monster.SightAngle = 360
        Monster.EnemyXRayDetection = true
        Monster:DrawShadow(false)
        timer.Simple(0,function()
        if IsValid(Monster) then
            Monster:DrawShadow(false)
        end
    end)
end
 Monster.MapSpawner = self
 Monster.EntitiesToNoCollide = {}
 Monster.CallForHelp = false
 for _,v in pairs(self.Monster) do
    table_insert(Monster.EntitiesToNoCollide,v.class)
end
    for _,v in pairs(self.BossMonster) do
        table_insert(Monster.EntitiesToNoCollide,v.class)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnBossMonster(ent,pos)
    if ent == false then return end
    if pos == nil or pos == false then return end
    if #self.tbl_SpawnedBossMonster >= self.MaxBossMonster then return end

    local Boss = ents.Create(ent)
    Boss:SetPos(pos)
    Boss:SetAngles(Angle(0,math.random(0,360),0))
    Boss:Spawn()
    Boss.SightAngle = 360
    Boss.EnemyXRayDetection = true
    Boss.CallForHelp = false
    Boss.HasSoundTrack = false
    table_insert(self.tbl_SpawnedBossMonster,Boss)
    Boss.MapSpawner = self
    Boss.EntitiesToNoCollide = {}
    for _,v in pairs(self.BossMonster) do
        table_insert(Boss.EntitiesToNoCollide,v.class)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
    self:DoMusic(true)
    VJ.STOPSOUND(self.COFR_Ambient)
    for index,object in ipairs(self.tbl_SpawnedNPCs) do
    if IsValid(object) then
        object:Remove()
    end
end
    for index,object in ipairs(self.tbl_SpawnedBossMonster) do
    if IsValid(object) then
        object:Remove()
        end
    end
end