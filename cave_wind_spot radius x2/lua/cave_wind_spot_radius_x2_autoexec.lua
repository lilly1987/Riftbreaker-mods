local lua_name="cave_wind_spot_radius_x2_autoexec"

local change=function(name1,name2,evt)
	LogService:Log(" run : " .. name1)
	
	-----------------------------------------------
	local controlledEntity=evt:GetControlledEntity()
    local database = EntityService:GetDatabase( controlledEntity )			
    if ( database == nil ) then
        LogService:Log(" no database")
        return
	else
		LogService:Log(" has database")
		
		local k=lua_name .. name1
		if database:HasInt( k) then
			LogService:Log(" Already has : " .. k)
			return
		else
			database:SetInt( k,1)
			LogService:Log(" database set : " .. k)
		end
    end
	-----------------------------------------------

	local entities = FindService:FindEntitiesByBlueprint(name1);
	if #entities == 0 then
		LogService:Log(" no cnt : " .. name1)
		return
	end
	LogService:Log(" cnt : " .. tostring(#entities))
	local position =nil
	for entity in Iter( entities ) do
		LogService:Log(" entity : " .. tostring(entity))
		position = EntityService:GetPosition( entity ) 
		EntityService:SpawnEntity( name2,position.x,position.y,position.z,"" ) 
	end
end

--RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
	change("weather/cave_wind_spot_small"	,"weather/cave_wind_spot_lilly",evt)
	--ResourceStorageDescSetup("weather/cave_wind_spot"		,"radius",2)
end)