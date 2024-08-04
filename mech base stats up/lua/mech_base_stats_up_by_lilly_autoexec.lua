RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
	LogService:Log("PlayerCreatedEvent")
	
	local name1="player/character_base"
	
	local database = EntityService:GetBlueprintDatabase( name1 )
    if ( database == nil ) then
        LogService:Log("NOT EXISTS database : " .. name1)
        return
    end
	
	if database:HasFloat( "ResourceStorageDescSetup" ) then
		LogService:Log(" Already applied : " .. name1)
		return
	else
		database:SetFloat( "ResourceStorageDescSetup" ,1)
		LogService:Log(" database set : " .. name1)
	end

    local character_base = ResourceManager:GetBlueprint( "player/character_base" )
    if ( character_base == nil ) then
        LogService:Log("character_base NOT EXISTS.")
        return
    end
	--LogService:Log("character_base ok")
	
    local entityStatComponent = character_base:GetComponent("EntityStatComponent")
    if ( entityStatComponent == nil ) then
        LogService:Log("entityStatComponent NOT EXISTS.")
        return
    end
	--LogService:Log("entityStatComponent ok")
	
    local base_stats = entityStatComponent:GetField("base_stats"):ToContainer()
    if ( base_stats == nil ) then
        LogService:Log("base_stats NOT EXISTS.")
        return
    end
	--LogService:Log("base_stats ok" )
	
	-- only number
	--for i=0,base_stats:GetItemCount()-1 do		
	--	LogService:Log(base_stats:GetItem(i):GetField("key"):GetValue() )
	--end

	local item=nil
	local key=nil
    for i=0,base_stats:GetItemCount()-1 do	
        item = base_stats:GetItem(i)
        key = tonumber(item:GetField("key"):GetValue())
            if ( key == EntityModType.health 			) then item:GetField("value"):SetValue("2000")
        elseif ( key == EntityModType.health_regen 		) then item:GetField("value"):SetValue("10")
        elseif ( key == EntityModType.movement_speed 	) then item:GetField("value"):SetValue("30")
        elseif ( key == EntityModType.forcefield 		) then item:GetField("value"):SetValue("1000")
        elseif ( key == EntityModType.radar_range 		) then item:GetField("value"):SetValue("80")
        end
    end

end)