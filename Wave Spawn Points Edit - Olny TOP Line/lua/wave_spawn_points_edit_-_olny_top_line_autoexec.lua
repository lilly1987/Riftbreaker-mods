
local GetNonPlayableRegionsMy=function(t)
    return
    {
		-- Due to camera rotation -x,x is not left right and -z,z is not down up
        [ "spawn_enemy_border_north" ] = --북
        {
            min = t.n.min,
            max = t.n.max 
        },
        [ "spawn_enemy_border_east" ] = --동
        {
            min = t.e.min,
            max = t.e.max 
        },
        [ "spawn_enemy_border_south" ] = --남
        {
			min = t.s.min,
            max = t.s.max 
        },
        [ "spawn_enemy_border_west" ] = --서
        {
            min = t.w.min,
            max = t.w.max 
        },
    };
end

local RadarPulse=function (position)
    local radarPulseEffect = EntityService:SpawnEntity( "items/consumables/radar_pulse", position.x,position.y,position.z, "")

	local radarRevealer = EntityService:GetComponent(radarPulseEffect, "FogOfWarRevealerComponent" )
	if ( radarRevealer == nil ) then
		Assert( false, "ERROR: No fog of war revealer component:" )
	end
	
	local helper = reflection_helper( radarRevealer ) 	
	helper.radius = 128
	EntityService:CreateOrSetLifetime( radarPulseEffect, 60, "normal" )
	
end

local RemoveFindEntitiesByGroup=function (t)

	LogService:Log("RemoveFindEntitiesByGroup : " .. t )
	local entities=FindService:FindEntitiesByGroup(t)
	for entity in Iter( entities ) do
		LogService:Log("RemoveFindEntitiesByGroup : " .. tostring(entity) )
		EntityService:SetName( entity, "logic/spawn_enemy" );
		EntityService:SetGroup( entity, "" );
	end
end

local SelectWaveSpawnPointsMy=function (t)
    local groupBounds = GetNonPlayableRegionsMy(t)	
	
    for group1,bounds in pairs( groupBounds ) do
	
        local entities = FindService:FindEntitiesByBlueprintInBox("logic/spawn_enemy", bounds.min, bounds.max );
        if Assert( #entities > 0, "Failed to find entities for: `" .. group1 .. "` in bounds:\nMin: " .. tostring(bounds.min.x) .. "," ..tostring(bounds.min.y) .."," ..tostring(bounds.min.z) .. "\nMax: " .. tostring(bounds.max.x) .. "," ..tostring(bounds.max.y) .."," ..tostring(bounds.max.z) ) then
			
			LogService:Log("SelectWaveSpawnPointsMy #entities: " .. tostring(#entities) )
			LogService:Log("SelectWaveSpawnPointsMy group1: " .. group1 )
			
			local position1={
			x=(bounds.min.x+bounds.max.x)/2,
			y=(bounds.min.y+bounds.max.y)/2,
			z=(bounds.min.z+bounds.max.z)/2,
			}
			
			RadarPulse( position1 )
			
			RemoveFindEntitiesByGroup("spawn_enemy_border_south")
			RemoveFindEntitiesByGroup("spawn_enemy_border_north")
			RemoveFindEntitiesByGroup("spawn_enemy_border_east")
			RemoveFindEntitiesByGroup("spawn_enemy_border_west")

			for entity1 in Iter( entities ) do
			
				local position = EntityService:GetPosition( entity1 ) 
				LogService:Log("SelectWaveSpawnPointsMy entity1: " .. tostring(entity1) .. " ; x : " .. tostring(position.x) .. " ; z : " .. tostring(position.z)  )

				for group,bounds1 in pairs( groupBounds ) do
				
					local entity = EntityService:SpawnEntity( "logic/spawn_enemy",position.x,position.y,position.z,"" ) 
					LogService:Log("SelectWaveSpawnPointsMy entity: " .. tostring(entity) )
					
					EntityService:SetName( entity, group .. "/" .. tostring(entity) );
					EntityService:SetGroup( entity, group );
					EntityService:SpawnAndAttachEntity("logic/spawn_enemy_grid_culler", entity)
					
				end
				
			end

			return 0
		end
    end
	return 1
end

-- 게임 시작후 항상 공유됨
local database = PlayerService:GetOrCreateGlobalDatabase( "wave_spawn_points_edit_-_olny_top_line_autoexec.lua")

-- 스크립트 종료시마다
RegisterGlobalEventHandler("LuaGlobalEvent", function(evt)
	local text=evt:GetEvent()
	if text ~="change_world_bounds" then
		return
	end
	LogService:Log("LuaGlobalEvent : ".. text)
	
	
end)

RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
	LogService:Log(" PlayerControlledEntityChangeEvent ")
	----------------
	local controlledEntity=evt:GetControlledEntity()
    local database = EntityService:GetDatabase( controlledEntity )			
    if ( database == nil ) then
        LogService:Log(" no database")
        return
	else
		LogService:Log(" has database")
		
		local k="wave_spawn_points_edit_-_olny_top_line_autoexec.lua"
		if database:HasInt( k) then
			LogService:Log(" Already has : " .. k)
			return
		else
			database:SetInt( k,1)
			LogService:Log(" database set : " .. k)
		end
    end
	----------------
	--local entities = FindService:FindEntitiesByBlueprint("Already/SelectWaveSpawnPointsMy");
	--if #entities > 0 then
	--	LogService:Log(" Already applied ")
	--	return
	--end
	--EntityService:SpawnEntity( "Already/SelectWaveSpawnPointsMy",0,0,0,"" ) 
	----------------
    local playable_min = MissionService:GetPlayableRegionMin();
    local playable_max = MissionService:GetPlayableRegionMax();
	local margin = tonumber(ConsoleService:GetConfig("map_non_playable_margin"));
	local rt=1
	local ar={}		
	
	local margin1=4
	
	EntityService:SpawnEntity( "buildings/defense/portal",0,2,0,"player" ) 
	
	EntityService:SpawnEntity( "buildings/defense/portal",playable_min.x+margin*margin1,2,playable_max.z-margin*margin1,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",playable_min.x+margin*margin1,2,playable_min.z+margin*margin1,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",playable_max.x-margin*margin1,2,playable_min.z+margin*margin1,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",playable_max.x-margin*margin1,2,playable_max.z-margin*margin1,"player" ) 
	
	EntityService:SpawnEntity( "buildings/defense/portal",0,2,playable_max.z-margin*margin1,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",0,2,playable_min.z+margin*margin1,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",playable_max.x-margin*margin1,2,0,"player" ) 
	EntityService:SpawnEntity( "buildings/defense/portal",playable_max.x-margin*margin1,2,0,"player" ) 

	-- TOP Center
	--if rt>0 then
	--	rt=SelectWaveSpawnPointsMy({
	--	-- z:가로 x:세로
    --    n = --북
    --    {
    --        min = { x = playable_max.x - margin*1,      y = -10,    z = (playable_max.z+playable_min.z)/2 - margin*2 },
    --        max = { x = playable_max.x + margin,        y = 10,     z = (playable_max.z+playable_min.z)/2 + margin*2 } 
    --    },
    --    e = --동
    --    {
    --        min = { x = (playable_max.x+playable_min.x)/2  + margin*2,  y = -10,    z = playable_max.z - margin*1 },
    --        max = { x = (playable_max.x+playable_min.x)/2  - margin*2,  y = 10,     z = playable_max.z + margin } 
    --    },
    --    s = --남
    --    {
    --        min = { x = playable_min.x - margin,        y = -10,    z = (playable_max.z+playable_min.z)/2 + margin*2 },
    --        max = { x = playable_min.x + margin*1,      y = 10,     z = (playable_max.z+playable_min.z)/2 - margin*2 } 
    --    },
    --    w = --서
    --    {
    --        min = { x = (playable_max.x+playable_min.x)/2  + margin*2,   y = -10,    z = playable_min.z - margin },
    --        max = { x = (playable_max.x+playable_min.x)/2  - margin*2,   y = 10,     z = playable_min.z + margin*1 } 
    --    },
    --})
	--	LogService:Log("[SelectWaveSpawnPointsMy] TOP Corner : " .. tostring(rt) )
	--end
	-- Corner
	--if rt>0 then
	--	rt=SelectWaveSpawnPointsMy({
	--	-- z:가로 x:세로
    --    w = --서북
    --    {
    --        min = { x = playable_max.x - margin*3,      y = -10,    z = playable_min.z - margin },
    --        max = { x = playable_max.x + margin,        y = 10,     z = playable_min.z + margin*3} 
    --    },
    --    n = --북동
    --    {
    --        min = { x = playable_max.x - margin*3,      y = -10,    z = playable_max.z - margin*3 } ,
    --        max = { x = playable_max.x + margin,        y = 10,     z = playable_max.z + margin}
    --    },
    --    e = --동남
    --    {
    --        min = { x = playable_min.x - margin,        y = -10,    z = playable_max.z - margin*3},
    --        max = { x = playable_min.x + margin*3,      y = 10,     z = playable_max.z + margin } 
    --    },
    --    s = --남서
    --    {
    --        min = { x = playable_min.x - margin,        y = -10,    z = playable_min.z - margin} ,
    --        max = { x = playable_min.x + margin*3,      y = 10,     z = playable_min.z + margin*3 }
    --    },
    --})
	--	LogService:Log("[SelectWaveSpawnPointsMy] Corner : " .. tostring(rt) )
	--end
	-- Center
	--if rt>0 then
	--	rt=SelectWaveSpawnPointsMy({w={
	--			min = { x = (playable_max.x+playable_min.x)/2 - margin,        y = -10,    z = (playable_max.z+playable_min.z)/2 - margin },
	--			max = { x = (playable_max.x+playable_min.x)/2 + margin,        y = 10,     z = (playable_max.z+playable_min.z)/2 + margin } 
	--		},e={
	--			min = { x = (playable_max.x+playable_min.x)/2 - margin*1.5,        y = -10,    z = (playable_max.z+playable_min.z)/2 - margin*1.5 },
	--			max = { x = (playable_max.x+playable_min.x)/2 + margin*1.5,        y = 10,     z = (playable_max.z+playable_min.z)/2 + margin*1.5 } 
	--		},s={
	--			min = { x = (playable_max.x+playable_min.x)/2 - margin*2,        y = -10,    z = (playable_max.z+playable_min.z)/2 - margin*2 },
	--			max = { x = (playable_max.x+playable_min.x)/2 + margin*2,        y = 10,     z = (playable_max.z+playable_min.z)/2 + margin*2 } 
	--		},n={
	--			min = { x = (playable_max.x+playable_min.x)/2 - margin*2.5,        y = -10,    z = (playable_max.z+playable_min.z)/2 - margin*2.5 },
	--			max = { x = (playable_max.x+playable_min.x)/2 + margin*2.5,        y = 10,     z = (playable_max.z+playable_min.z)/2 + margin*2.5 } 
	--		},})
	--	LogService:Log("[SelectWaveSpawnPointsMy] Center : " .. tostring(rt) )
	--end
	-- TOP
	if rt>0 then
		rt=SelectWaveSpawnPointsMy({
		n={
            min = { x = playable_max.x,                 y = -10,    z = playable_min.z },
            max = { x = playable_max.x + margin,        y = 10,     z = playable_max.z } 
        },
		e={
            min = { x = playable_min.x,                 y = -10,    z = playable_max.z },
            max = { x = playable_max.x,                 y = 10,     z = playable_max.z + margin} 
        },
		s={
            min = { x = playable_min.x - margin,        y = -10,    z = playable_min.z },
            max = { x = playable_min.x ,                y = 10,     z = playable_max.z } 
        },
		w={
            min = { x = playable_min.x,                 y = -10,    z = playable_min.z - margin },
            max = { x = playable_max.x,                 y = 10,     z = playable_min.z } 
        }
		,})
		LogService:Log("SelectWaveSpawnPointsMy TOP : " .. tostring(rt) )
	end
	-- 
end)