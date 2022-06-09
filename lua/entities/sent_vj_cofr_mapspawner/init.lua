/* Note: All credits go to Cpt. Hazama. I take no credit for this. */
AddCSLuaFile("shared.lua")
include('shared.lua')

local table_insert = table.insert
local table_remove = table.remove

ENT.Monster = {
	{class="npc_vj_cofr_slower1",chance=1},
	{class="npc_vj_cofr_crawler",chance=8},
	{class="npc_vj_cofr_slower3",chance=4},
	{class="npc_vj_cofr_slower10",chance=4},	
	{class="npc_vj_cofr_croucher",chance=5},
	{class="npc_vj_cofr_baby",chance=3},
	{class="npc_vj_cofr_children",chance=3},
	{class="npc_vj_cofr_faster",chance=4},
	{class="npc_vj_cofr_faster_male",chance=6},	
	{class="npc_vj_cofr_crazyrunner",chance=5},
	{class="npc_vj_cofr_citalopram",chance=10}, 
	{class="npc_vj_cofr_dreamer_runner",chance=15},
	{class="npc_vj_cofr_faceless",chance=8},
	{class="npc_vj_cofr_faceless_crawler",chance=15},
	{class="npc_vj_cofr_krypandenej",chance=15},	
	{class="npc_vj_cofr_drowned",chance=15},
	{class="npc_vj_cofr_sewmo",chance=15},
	{class="npc_vj_cofr_suicider",chance=20},
	{class="npc_vj_cofr_psycho",chance=20},	
	{class="npc_vj_cofr_stranger",chance=20},
	{class="npc_vj_cofr_flygare",chance=20},	
	{class="npc_vj_cofr_faceless_faced",chance=30},	
	{class="npc_vj_cofr_faceless_twister",chance=30},
	{class="npc_vj_cofr_faceless_twisterv",chance=30},
	{class="npc_vj_cofr_taller",chance=50},
	{class="npc_vj_cofr_upper",chance=60},
	{class="npc_vj_cofr_slowerno",chance=60},	
	{class="npc_vj_cofrc_faster_clown",chance=70},	
	{class="npc_vj_cofrc_crazyrumpel",chance=70},	
	{class="npc_vj_cofrc_baby_ooi",chance=70},	
	{class="npc_vj_cofrc_faster_ooi",chance=70},
	{class="npc_vj_cofrc_slower3_ooi",chance=70}, 	
	{class="npc_vj_cofrc_patrick",chance=70},
	{class="npc_vj_cofrc_genome_soldier",chance=70},	
	{class="npc_vj_cofrc_genome_generic",chance=70},
	{class="npc_vj_cofrc_pedoslow",chance=70}, 	
	{class="npc_vj_cofrc_slower1_mummy",chance=70},
	{class="npc_vj_cofrc_cutter",chance=70},
	{class="npc_vj_cofrc_psycho_le",chance=70},	
	{class="npc_vj_cofrc_faceless_mummy",chance=70},	
	{class="npc_vj_cofrc_faceless_mummycrawl",chance=70},
	{class="npc_vj_cofrc_faceless_stone",chance=70}, 	
	{class="npc_vj_cofrc_faceless_mummytwister",chance=70},
	{class="npc_vj_cofrc_shaimoon_gold",chance=70},	
	{class="npc_vj_cofrc_sicksophie",chance=70},
	{class="npc_vj_cofrc_zombie",chance=70},  
	{class="npc_vj_cofrc_crazyrunner_mummy",chance=70},	
}

ENT.BossMonster = {
	{class="npc_vj_cofr_sawer",max=1},
	{class="npc_vj_cofr_sawrunner",max=1},
	{class="npc_vj_cofr_mace",max=1},
	{class="npc_vj_cofr_carcass",max=1},
	{class="npc_vj_cofr_sawcrazy",max=1},
	{class="npc_vj_cofr_craig",max=1},
	{class="npc_vj_cofr_simonbook",max=1},
	{class="npc_vj_cofr_simonbook_mh",max=1},
	{class="npc_vj_cofr_purnell",max=1},
	{class="npc_vj_cofr_simonsick_sui",max=1},	
	{class="npc_vj_cofrc_duorunner",max=1},
	{class="npc_vj_cofrc_slowerno_boss",max=1},
	{class="npc_vj_cofrc_faceless_boss",max=1},
	{class="npc_vj_cofrc_mace_ooi",max=1}, 	
	{class="npc_vj_cofrc_patrick_boss",max=1},	
	{class="npc_vj_cofrc_craigrunner",max=1},
	{class="npc_vj_cofrc_jeffrunner",max=1}, 	
	{class="npc_vj_cofrc_psycho_pumpkin",max=1},
	{class="npc_vj_cofrc_mother",max=1},
	{class="npc_vj_cofrc_mummy",max=1}, 
	{class="npc_vj_cofrc_shaimoon",max=1},
	{class="npc_vj_cofrc_dasubergator2",max=1}, 	
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	local i = 0
	for k, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "sent_vj_cofr_mapspawner" then
			i = i + 1
			if i > 1 then PrintMessage(HUD_PRINTTALK, "Only one Map Spawner is allowed on the map.") self.SkipOnRemove = true self:Remove() return end
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
		local msg = "Low node/nav-area count detected! The Map Spawner may find it difficult to process with such low nodes/nav-areas...removing..."
		if count <= 0 then
			msg = "No nodes or nav-mesh detected! The Map Spawner relies on nodes/nav-areas for many things. Without any, the Map Spawner will not work! The Map Spawner will now remove itself..."
		end
		MsgN(msg)
		if IsValid(self:GetCreator()) then
			self:GetCreator():ChatPrint(msg)
		end
		SafeRemoveEntity(self)
		return
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
	self.NextBossMonsterSpawnTime = CurTime() +math.random(4,20)
	self.NextHordeSpawnTime = CurTime() +math.Rand(self.COFR_HordeCooldownMin,self.COFR_HordeCooldownMax)
	self.DidStartMusic = false
	self.NextMusicSwitchT = CurTime() +1
	self.NextAIBossCheckTime = CurTime() +5
	self.HordeSpawnRate = 0.19
	self.MaxBossMonster = 2
	self.CanSpawnBossMonster = false --GetConVarNumber("VJ_COFR_MapSpawner_Boss")
	
	for _,v in ipairs(player.GetAll()) do
		   //v:ChatPrint("The book has been unleashed")
		if GetConVarNumber("VJ_COFR_MapSpawner_Music") == 1 then
		   self.COFR_Music = VJ_CreateSound(v,"vj_cofr/cof/mapspawner/music" .. math.random(1,6) .. ".mp3",GetConVarNumber("VJ_COFR_MapSpawner_MusicVolume"), 100)		
		end
	end	
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
		local testPos = VJ_PICK(hidingSpots)
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
		local testPos = getHidden && VJ_PICK(v:GetHidingSpots()) or v:GetRandomPoint()
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
		if (v:IsPlayer() || v:IsNPC()) && v:Health() > 0 && !v:IsFlagSet(65536) && (v.VJ_NPC_Class && !VJ_HasValue(v.VJ_NPC_Class,"CLASS_CRY_OF_FEAR","CLASS_AOM_DC") or true) then
			table_insert(tbl,v)
		end
	end
	return tbl
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetRandomEnemy()
	return VJ_PICK(self:FindEnemy())
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
		
		-- Checks for inactive AI, this code is quite bulky and might be able to be optimized better
		if CurTime() > self.NextAICheckTime then
			if #self.tbl_SpawnedNPCs > 0 then
				for i,v in ipairs(self.tbl_SpawnedNPCs) do
					if IsValid(v) then
						local enemy = v:GetEnemy()
						self:CheckEnemyDistance(v)
						if IsValid(enemy) && !VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
							table_insert(self.tbl_NPCsWithEnemies,v)
						elseif !IsValid(enemy) then
							if VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
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
						if IsValid(enemy) && !VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
							table_insert(self.tbl_NPCsWithEnemies,v)
						elseif !IsValid(enemy) then
							if VJ_HasValue(self.tbl_NPCsWithEnemies,v) then
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

		-- Spawns AI
		if CurTime() > self.NextMonsterSpawnTime then
			if #self.tbl_SpawnedNPCs >= self.COFR_MaxMonster -self.COFR_MaxHordeSpawn then return end -- Makes sure that we can at least spawn a mob when it's time
			self:SpawnMonster(self:PickMonster(self.Monster),self:FindSpawnPosition(false))
			self.NextMonsterSpawnTime = CurTime() +math.Rand(GetConVarNumber("VJ_COFR_MapSpawner_DelayMin"),GetConVarNumber("VJ_COFR_MapSpawner_DelayMax"))
		end

		if GetConVarNumber("VJ_COFR_MapSpawner_Boss") == 1 then
		    self.CanSpawnBossMonster = true
			if CurTime() > self.NextBossMonsterSpawnTime then
				self:SpawnBossMonster(self:PickMonster(self.BossMonster),self:FindSpawnPosition(true))
				self.NextBossMonsterSpawnTime = CurTime() +math.Rand(4,20)
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
		Monster.FindEnemy_UseSphere = true
		Monster.FindEnemy_CanSeeThroughWalls = true
		Monster:DrawShadow(false)
		timer.Simple(0,function()
			if IsValid(Monster) then
				Monster:DrawShadow(false)
			end
		end)
	end
	Monster.MapSpawner = self
	Monster.EntitiesToNoCollide = {}
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
	Boss.FindEnemy_UseSphere = true
	Boss.FindEnemy_CanSeeThroughWalls = true
	table_insert(self.tbl_SpawnedBossMonster,Boss)
	Boss.MapSpawner = self
	Boss.EntitiesToNoCollide = {}
	for _,v in pairs(self.BossMonster) do
		table_insert(Boss.EntitiesToNoCollide,v.class)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRemove()
    VJ_STOPSOUND(self.CoF_Music)
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