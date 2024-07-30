-- test_autoexec.lua

-- morphium
-- * BlueprintComponent
--   blueprint : nil
-- * GridMarkerComponent
--   mode : 1
--   indexes : nil
--   pos : nil
--   Layers : nil
--   terrain_type : morphium
--   layers_template : nil
--   indexes_ents : nil
--   extend : 0.000
-- * TypeComponent
--   type : 16384
-- * LocalAabbDesc
--   local_aabb : nil

-- 이런 함수를 쓸려면 반드시 RegisterGlobalEventHandler 사용 필수. 자동으로 호출됨
--require("lua/utils/reflection.lua")

-- unsigned int SpawnEntity(EntityService&,custom [class Exor::Math::Vector3<float>] const&)
-- unsigned int SpawnEntity(EntityService&,unsigned int)
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,unsigned int,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [struct Exor::TeamId])
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,unsigned int,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&)
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,unsigned int,custom [struct Exor::TeamId])
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,unsigned int,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&)
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&)
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [float],custom [float],custom [float],custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&)
-- unsigned int SpawnEntity(EntityService&,custom [class Exor::UtfString<char,class Exor::utf_traits<char>,class Exor::StlAllocatorProxy<char> >] const&,custom [class Exor::Math::Vector3<float>] const&,custom [struct Exor::TeamId])stack traceback:

--     position.y = EnvironmentService:GetTerrainHeight(position)
    
	--local players = PlayerService:GetPlayersFromTeam( EntityService:GetTeam( "player") );
    --for player in Iter(players) do
    --    PlayerService:AddItemToInventory( player, missionDefHelper.mission_award )
    --end

	--local Blueprint = ResourceManager:GetBlueprint( item[1] )
	--local Component = Blueprint:GetComponent("BuildingDesc")
	--local Component = EntityService:GetBlueprintComponent(item[1], "BuildingDesc")
		
-- local mech = PlayerService:GetPlayerControlledEnt( player)
-- local items = PlayerService:GetAllEquippedItemsInSlot( "LEFT_HAND" , player)
-- local entities =  FindService:FindEntitiesByTypeInRadius( self.entity , "player", 10)
-- local mech = entities[1]
-- local player = PlayerService:GetPlayerByMech( mech )
-- local pos = PlayerService:GetWeaponLookPoint( self.owner )
-- self.foundPos = PlayerService:FindPositionForTeleport( self.owner, pos, self.maxDistance )
-- result = FindService:FindEmptySpotInRadius( owner, self.plant_radius, "vegetation", "floor,desert_floor,acid_floor,magma_floor");
-- local pos = FindService:FindEmptySpotForBuildingRadius( self.owner, 6.0, self.bp, "", "")
-- local ent = ResourceService:FindEmptySpace( minDistanceFromPlayer, maxDistanceFromPlayer );

-- local Entity=MapGenerator:GetInitialSpawnPoint()
-- local Position=EntityService:GetPosition(Entity)
-- local spot=FindService:FindEmptySpotInRadius(Entity,  512,"","")
-- local f=spot.first
-- local Position=spot.second
local test4=function ()
	local playable_min = MissionService:GetPlayableRegionMin();
    local playable_max = MissionService:GetPlayableRegionMax();
	
	local Entities = FindService:FindEntitiesByPredicateInBox( playable_min, playable_max, {
		type="",
		signature="ResourceComponent,GridMarkerComponent",		
		filter = function(entity) 
			--if string.find(EntityService:GetBlueprintName(entity), resources) ~=nil then
			if EntityService:GetResourceAmount(entity).first ~= "morphium" then
                return false
            end
			--LogService:Log( " resources : " .. resources .. " ; " .. make .. " , " .. (EntityService:GetResourceAmount(entity).first))
			--local Position=EntityService:GetPosition(entity)
			--LogService:Log(" Position : x : " .. Position.x .. " , y : " .. Position.y .. " , z : " .. Position.z .. " , " .. tostring(FindService:IsGridMarkedWithLayer(Position, "OwnerLayerComponent")) .. " , " .. tostring(EntityService:GetResourceAmount(entity).first))
			return true
		end
	});

	local blueprint = ResourceManager:GetBlueprint(EntityService:GetBlueprintName(Entities[ math.random( #Entities ) ]))
	for _,componentName in pairs( blueprint:GetComponentNames() ) do
		LogService:Log(" * " .. componentName)
		local Component = blueprint:GetComponent(componentName)
		for _,FieldName in pairs( Component:GetFieldNames() ) do
			LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
		end
	end
end

local setup6=function(blueprint_name)
	LogService:Log(" run : " .. blueprint_name)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("database no : " .. my)
        return
    end
	local k="enemy_unit_hp_up_by_lilly_autoexec.lua/" .. blueprint_name
	if database:HasInt( k) then
		LogService:Log(" database has : " .. blueprint_name)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. blueprint_name)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(blueprint_name)

	--for _,componentName in pairs( blueprint:GetComponentNames() ) do
	--	LogService:Log(" * " .. componentName)
	--	local Component = blueprint:GetComponent(componentName)
	--	for _,FieldName in pairs( Component:GetFieldNames() ) do
	--		LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	--	end
	--end
	
end

local test=function (entity)
    local database = EntityService:GetDatabase( entity )			
    if ( database == nil ) then
        LogService:Log(" no database")
        --return
	else
		LogService:Log(" has database")
		
		local k="test"
		if database:HasInt( k) then
			LogService:Log(" Already has : " .. k)
			return
		else
			database:SetInt( k,1)
			LogService:Log(" database set : " .. k)
		end
    end
	
	local databaseComponent = nil
	if EntityService:HasComponent(entity,"DatabaseComponent") then
        LogService:Log(" has DatabaseComponent")
		databaseComponent = reflection_helper( EntityService:GetComponent(entity,"DatabaseComponent") );
	else
        LogService:Log(" no DatabaseComponent")
		databaseComponent = reflection_helper( EntityService:CreateComponent(entity,"DatabaseComponent") );
	end
	LogService:Log( tostring(databaseComponent)  )
	
	-- err
	-- reflection_helper를 통해서 나온 database 는 table 타입
	--database=databaseComponent.database
	--if database:HasInt( k) then
	--	LogService:Log(" Already has : " .. k)
	--	return
	--else
	--	database:SetInt( k,1)
	--	LogService:Log(" database set : " .. k)
	--end
	
end

local PlayerControlledEntityChangeEventEx=function(evt)
	----------------
	local controlledEntity=evt:GetControlledEntity()
    local database = EntityService:GetDatabase( controlledEntity )			
    if ( database == nil ) then
        LogService:Log(" no database")
        return
	else
		LogService:Log(" has database")
		
		local k="pickup_range_x100_autoexec.lua"
		if database:HasInt( k) then
			LogService:Log(" Already has : " .. k)
			return
		else
			database:SetInt( k,1)
			LogService:Log(" database set : " .. k)
		end
    end
	------------------
	
	local playerId=evt:GetPlayerId()
	LogService:Log(" playerId : " .. tostring(playerId)) 
	PlayerService:SetPickupRange(playerId,PlayerService:GetPickupRange(playerId)*100)
end
-- local ref = require("lua/utils/reflection.lua")
local logBlueprint=function(name1)
	-----------------------------------------------
	--local database = EntityService:GetBlueprintDatabase( name1 )
    --if ( database == nil ) then
    --    LogService:Log("database no : " .. name1)
    --else
    --    LogService:Log("database has : " .. name1)
    --end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(name1)
	--for _,componentName in pairs( blueprint:GetComponentNames() ) do
	--	LogService:Log(" * " .. componentName)
	--end
	for _,componentName in pairs( blueprint:GetComponentNames() ) do
		--LogService:Log(" * " .. componentName)
		local Component = blueprint:GetComponent(componentName)
		
		--출력됨
		--for _,FieldName in pairs( Component:GetFieldNames() ) do
		--	LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
		--end
		
		local refl_Component = reflection_helper(Component)
		LogService:Log( tostring(refl_Component)  )
		local database = refl_Component.database
		if ( database == nil ) then
			LogService:Log("database no1 : " .. name1)
		else
			LogService:Log("database has1 : " .. name1)
			LogService:Log("type : " .. type(database)) -- table
			-- 안됨
			--if database:HasFloat( "radius") then
			--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database:GetFloat( "radius")))
			--	database:SetFloat( "radius",database:GetFloat( "radius")*10)
			--else
			--	LogService:Log(" radius no : " .. name1)
			--	database:SetFloat( "radius",1000)
			--end
		end
		
		--database = Component:GetField( "database" )
		--reflection_helper(database)
		
		--if ( database == nil ) then
		--	LogService:Log("database no1 : " .. name1)
		--else
		--	LogService:Log("type : " .. type(database))
		--	database = database:GetValue()
		--	LogService:Log("type : " .. type(database))
		--	if ( database == nil ) then
		--		LogService:Log("database no2 : " .. name1)
		--	else
		--		LogService:Log("database has : " .. name1)
		--		if database:HasFloat( "radius") then
		--			LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database:GetFloat( "radius")))
		--			database:SetFloat( "radius",database:GetFloat( "radius")*10)
		--		else
		--			LogService:Log(" radius no : " .. name1)
		--			database:SetFloat( "radius",1000)
		--		end
		--	end
		--end
		
		--database = refl_Component.database
		--if ( database == nil ) then
		--	LogService:Log("no database : " .. name1)
		--else
		--	-- err
		--	--local ref_database=reflection_helper(database)
		--	--LogService:Log("database : " .. tostring(ref_database))
		--	
		--	-- __ptr : class Exor::TypeValueView:0000020D8D20DAF0
		--	--for k,v in pairs(database) do
		--	--	LogService:Log(tostring(k) .. " : " .. tostring(v))
		--	--end
		--	
		--	-- 안됨
		--	--LogService:Log("type : " .. type(database))
		--	--if database["radius"] then
		--	--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database["radius"]))
		--	--	database["radius"]=database["radius"]*10
		--	--else
		--	--	LogService:Log(" radius no : " .. name1)
		--	--	database["radius"]=1000
		--	--end
		--end
	end
	-----------------------------------------------
end

RegisterGlobalEventHandler("CheatUsedEvent", function(evt)
	LogService:Log("CheatUsedEvent : " .. evt:GetCheatName())
end)

RegisterGlobalEventHandler("MissionFlowActivatedEvent", function(evt)
LogService:Log("MissionFlowActivatedEvent")
end)

RegisterGlobalEventHandler("MissionFlowDeactivatedEvent", function(evt)
	LogService:Log("MissionFlowDeactivatedEvent")
end)

-----
--layout: default
--title: PlayerCreatedEvent
--nav_order: 1
--has_children: true
--parent: Lua services
-----
--### GetEntity
-- * (): [Entity const&](riftbreaker-wiki/docs/reflection/Entity const&)
--  
--### GetPlayerId
-- * (): [unsigned int const&](riftbreaker-wiki/docs/reflection/unsigned int const&)
--  
--### GetPlayerInfo
-- * (): [PlayerInfo const&](riftbreaker-wiki/docs/reflection/PlayerInfo const&)
-- 맵마다, 세이브 로드시에도 호출됨
RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
	LogService:Log("PlayerCreatedEvent")
	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))
	LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))
	LogService:Log(" playerId : " .. evt:GetPlayerId())
	--logBlueprint("items/skills/radar_pulse_item")
	
	-- critical
	--local playerInfo=evt:GetPlayerInfo()
    --if ( playerInfo == nil ) then
    --    LogService:Log(" no playerInfo")
    --    --return
	--else
	--	LogService:Log(" user_name : " .. playerInfo.user_name)
    --end
	
	--local playerId=evt:GetPlayerId()
	--LogService:Log(" playerId : " .. tostring(playerId)) 
	--
	--local entity=evt:GetEntity()
	--LogService:Log(" entity : " .. tostring(entity)) 
		
	-- no database
	-- test(entity)	
	
end)

--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [TeamId](/riftbreaker-wiki/docs/game-reflection/classes/team_id/) | TeamId |
RegisterGlobalEventHandler("PlayerTeamCreatedEvent", function(evt)
	LogService:Log("PlayerTeamCreatedEvent ")
	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))
	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity())) --nil
	LogService:Log(" TeamId : " .. evt:GetTeamId()) -- 1
	-- evt:GetEntity() 사용시 database 없음
	--local players = PlayerService:GetPlayersFromTeam( team)
	--for player in Iter(players ) do
	--	local playerEntity = PlayerService:GetPlayerControlledEnt( player )
	--	LogService:Log("playerEntity : " .. playerEntity)
	--end
end)



--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [uint](/riftbreaker-wiki/docs/game-reflection/components/uint/) | PlayerId |
-- 미션 시작후 . 재시작. 
RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
	LogService:Log("PlayerInitializedEvent ")
	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))
	LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))
	LogService:Log(" playerId : " .. evt:GetPlayerId())
	--logBlueprint("items/skills/radar_pulse_item")
	
	--local playerId=evt:GetPlayerId()
	--LogService:Log(" playerId : " .. tostring(playerId)) 
	--
	--local entity=evt:GetEntity()
	--LogService:Log(" entity : " .. tostring(entity)) 
	
	-- no database 
	-- test(entity)
	
	LogService:Log("GetCurrentCampaignType : " .. CampaignService:GetCurrentCampaignType()) -- survival
	LogService:Log("GetCurrentMissionId : " .. CampaignService:GetCurrentMissionId()) -- Headquarters
	LogService:Log("GetCurrentBiomeName : " .. MissionService:GetCurrentBiomeName()) -- 	
end)

-- player_respawner.lua
--    local player_id = PlayerService:GetPlayerForEntity( self.entity )
--    QueueEvent( "PlayerSpawnRequest", INVALID_ID, player_id, self.entity )
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [uint](/riftbreaker-wiki/docs/game-reflection/components/uint/) | PlayerId |
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | SpawnPoint |
RegisterGlobalEventHandler("PlayerSpawnRequest", function(evt)
	LogService:Log("PlayerSpawnRequest ")
	LogService:Log(" Entity : " .. tostring(evt:GetEntity())) --player_respawner.lua INVALID_ID --4294967295
	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity())) -- nil
	local PlayerId=evt:GetPlayerId()
	LogService:Log(" PlayerId : " .. PlayerId)
	-- local player_id = PlayerService:GetPlayerForEntity( evt:GetEntity() )
	-- LogService:Log(" player_id : " .. player_id)	--4294967295==PlayerSpawnRequest.Entity
	local SpawnPoint=evt:GetSpawnPoint()
	LogService:Log(" SpawnPoint : " .. SpawnPoint)	
end)


RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
	LogService:Log("PlayerControlledEntityChangeEvent")
	--logBlueprint("items/skills/radar_pulse_item")
	
	--local playerId=evt:GetPlayerId()
	--LogService:Log(" playerId : " .. tostring(playerId)) 
	--
	local entity=evt:GetEntity()
	LogService:Log(" entity : " .. tostring(entity)) 
	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))
	
	-- 맵마다 달라짐
	local controlledEntity=evt:GetControlledEntity()
	LogService:Log(" controlledEntity : " .. tostring(controlledEntity)) 
	LogService:Log(" GetTeam : " .. EntityService:GetTeam( controlledEntity )) 
	
	-- no database
	-- test(entity)
	
	-- yes database
	-- test(controlledEntity)
	
	-- test4()
end)



-- 스크립트 종료시마다
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | argName1 |
--| [String](/riftbreaker-wiki/docs/game-reflection/components/string/) | argName2 |
--| [Database](/riftbreaker-wiki/docs/game-reflection/components/database/) | argName3 |
RegisterGlobalEventHandler("LuaGlobalEvent", function(evt)
	local text=evt:GetEvent()
	if text =="ShowBuildingDisplayRadius" or text =="HideBuildingDisplayRadius" then
		return
	end
	LogService:Log("LuaGlobalEvent : ".. text)
end)

RegisterGlobalEventHandler("MissionStatusChangedEvent", function(evt)
LogService:Log("MissionStatusChangedEvent")
end)

RegisterGlobalEventHandler("ObjectiveFinishedEvent", function(evt)
LogService:Log("ObjectiveFinishedEvent")
end)

RegisterGlobalEventHandler("GameStreamingActionEvent", function(evt)
LogService:Log("GameStreamingActionEvent")
end)

-- 하베스터 사용후 작동
RegisterGlobalEventHandler("SpawnFromLootContainerRequest", function(evt)
	--LogService:Log("SpawnFromLootContainerRequest")
	local rarity=evt:GetRarity()
	LogService:Log("SpawnFromLootContainerRequest rarity : " .. (rarity)) 
end)

RegisterGlobalEventHandler("TeamSpawnFromLootContainerRequest", function(evt)
	--LogService:Log("TeamSpawnFromLootContainerRequest")
	local rarity=evt:GetRarity()
	LogService:Log("TeamSpawnFromLootContainerRequest rarity : " .. (rarity)) 
end)

RegisterGlobalEventHandler("ForceLootContainerTypeRequest", function(evt)
	--LogService:Log("ForceLootContainerTypeRequest")
	local containerType=evt:GetContainerType()
	LogService:Log("ForceLootContainerTypeRequest containerType : " .. (containerType)) 
end)

-----
--layout: default
--title: AnimationStateChangedEvent
--nav_order: 1
--has_children: true
--parent: Lua services
-----
--### GetEntity
-- * (): [Entity const&](riftbreaker-wiki/docs/reflection/Entity const&)
--  
--### GetNewStateName
-- * (): [string](riftbreaker-wiki/docs/reflection/string)
--  
--### GetOldStateName
-- * (): [string](riftbreaker-wiki/docs/reflection/string)
--
-- 로그 부하 심함
--RegisterGlobalEventHandler("AnimationStateChangedEvent", function(evt)
--	LogService:Log("AnimationStateChangedEvent : ".. tostring(evt:GetEntity()))
--	LogService:Log("AnimationStateChangedEvent GetOldStateName : ".. tostring(evt:GetOldStateName()))
--	LogService:Log("AnimationStateChangedEvent GetNewStateName : ".. tostring(evt:GetNewStateName()))
--end)

RegisterGlobalEventHandler("HarvestStartEvent", function(evt)
	LogService:Log("HarvestStartEvent : " .. tostring(evt:GetEntity()) )
end)

local Already=false

local setup2=function(name1,t ,multi ,v)
	if ( Already == true ) then
		return
    end
	Already=true
	
	-----------------------------------------------
	local CurrentCampaignType=CampaignService:GetCurrentCampaignType() -- survival
	LogService:Log("CampaignType : " .. CurrentCampaignType )
    if CurrentCampaignType ~= "survival" then
        return
    end
	-----------------------------------------------
	local database = CampaignService:GetCampaignData()
    if ( database == nil ) then
        LogService:Log("database no")
        return
    end
	local k1="test.lua/" 
	if database:HasInt( k1) then
		LogService:Log(" database has " )
		return
	else
		database:SetInt( k1,1)
		LogService:Log(" database set " )
	end
	-----------------------------------------------
	

end

local setup3=function(name,m,v)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("no database : " .. my)
        return
    end
	local k="test.lua/" .. name
	if database:HasInt( k) then
		LogService:Log(" Already Has : " .. k)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. k)
	end
	-----------------------------------------------
end


local lua_name="test"
local setup4=function(name1,t ,multi ,v)
	-----------------------------------------------
	local entitie=nil
	local entities1 = FindService:FindEntitiesByBlueprint(lua_name);
	if #entities1 > 0 then
		LogService:Log(" Already have : " .. lua_name)
		entitie=entities1[0]
	else
		entitie=EntityService:SpawnEntity(lua_name,0,0,0,"")
		LogService:Log(" SpawnEntity : " .. lua_name)
	end
	
    local database1 = EntityService:GetDatabase( entitie )			
    if ( database1 == nil ) then
        LogService:Log("no database : " .. lua_name)
        return
    end
	
	local k1=lua_name .. "/" .. name1 
	if database1:HasInt( k1) then
		LogService:Log(" Already applied : " .. name1)
		return
	else
		database1:SetInt( k1,1)
		LogService:Log(" database set : " .. name1)
	end	
	-----------------------------------------------
end

local setup=function(name1,t ,multi ,v)
	LogService:Log(" run : " .. name1)
	
    local Blueprint = ResourceManager:GetBlueprint( name1 )
    if ( Blueprint == nil ) then
        LogService:Log("NOT EXISTS 1 : " .. name1)
        return
    end
    local Component = Blueprint:GetComponent("BuildingDesc")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 2 : " .. name1)
        return
    end
	local f=Component:GetField( t )
    if ( f == nil ) then
        LogService:Log("NOT EXISTS 3 : " .. t)
        return
    end
	LogService:Log(" Component : " .. name1)
	LogService:Log(" value : " .. f:GetValue())	
	f:SetValue(tostring(v))
end

-- 게임 시작후 항상 공유됨
local database = PlayerService:GetOrCreateGlobalDatabase( "test")
database:SetInt( "test", database:GetIntOrDefault("test", 0) + 1)

local change=function(name1,name2,evt)
	local database = PlayerService:GetOrCreateGlobalDatabase(lua_name )
    if ( database == nil ) then
        LogService:Log("NOT EXISTS database : " .. lua_name)
        return
    end
	local k=name1
	if database:HasInt( k) then
		LogService:Log(" Already applied : " .. name1)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. name1)
	end
end

local test1324=function ( evt )
	-- local params = { target = tostring( EntityService:GetName( self.entity ) ) }
	-- QueueEvent( "LuaGlobalEvent", event_sink, "BuildingActivatorActivated", params )	
	
	-- local component = reflection_helper( EntityService:CreateComponent(self.entity,"InteractiveComponent") );
	local blueprint = ResourceManager:GetBlueprint("player/character_base")
	for _,componentName in pairs( blueprint:GetComponentNames() ) do
		LogService:Log("  *" .. componentName)
	end
	-----------------------------------------------
	-- *InventoryItemRuntimeDataComponent
	-- *BlueprintComponent
	-- *LuaComponent
	-- *InventoryItemComponent
	-- *DatabaseComponent
	-- *CostDesc
	-----------------------------------------------
end

-- BuildingDesc

-- season_only : 
-- instant_build : 0
-- rotate_info : 0
-- build_cost : nil
-- mission_mode : 0
-- description : gui/hud/building_description/wall_energy
-- upgrade : buildings/defense/wall_energy_corner_01_lvl_3
-- current_cost : nil
-- localization_id : gui/hud/building_name/wall_energy_lvl_2
-- buildable : 0
-- block_rotation : 0
-- building_mode : line
-- condition : 0
-- name : wall_energy_corner_01_lvl_2
-- foundation_blueprint : 
-- menu_icon : gui/hud/building_icons/wall_energy
-- require : headquarters
-- is_global : 0
-- order : 0.000
-- connect : nil
-- ghost_bp : buildings/defense/wall_energy_corner_01_lvl_2_ghost
-- difficulty_cost_apply : 1
-- building_time : -0.000
-- level : 2
-- radius_name : 
-- resource_requirement : nil
-- bp : buildings/defense/wall_energy_corner_01_lvl_2
-- category : defense
-- menu_action : 
-- exclude_terrain_types : nil
-- condition_value : 
-- map_limit : 0
-- type : wall
-- going_green_state : 0
-- check_connect : 0
-- costs : nil
-- limit_name : 
-- overrides : nil
-- building_functionality : 1
-- min_radius_effect : 
-- min_radius : 0.000
-- line_connector : 1
-- current_build_cost : nil
-- building_group : 
-- cost : nil
-- limit : 0
-- is_shortcut_bindable : 1
-- sellable : 1
-- erase_type : nil
-- disableable : 1

