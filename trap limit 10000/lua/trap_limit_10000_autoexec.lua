--require("lua/utils/reflection.lua")

local ResourceStorageDescSetup=function (name1,t ,v )
	LogService:Log(" run : " .. name1)
	
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
	
    local Blueprint = ResourceManager:GetBlueprint( name1 )
    if ( Blueprint == nil ) then
        LogService:Log("NOT EXISTS 1 : " .. name1)
        return
    end
	LogService:Log(" Blueprint : " .. name1)
	
	--local desc = reflection_helper(BuildingService:GetBuildingDesc( Blueprint ))
    --if ( desc == nil ) then
    --    LogService:Log("NOT EXISTS 2 : " .. name1)
    --    return
    --end
	--LogService:Log(" Blueprint : " .. desc[t])
	--
	--desc[t]=tostring(v)
	
    local Component = Blueprint:GetComponent("BuildingDesc")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 2 : " .. name1)
        return
    end
	LogService:Log(" Component : " .. name1)
	LogService:Log(" value : " .. Component:GetField( t ):GetValue())
	
	Component:GetField( t ):SetValue(tostring(v))
end

RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
	ResourceStorageDescSetup("buildings/defense/trap_acid"		,"limit",10000)
	ResourceStorageDescSetup("buildings/defense/trap_area"		,"limit",10000)
	ResourceStorageDescSetup("buildings/defense/trap_cryo"		,"limit",10000)
	ResourceStorageDescSetup("buildings/defense/trap_energy"	,"limit",10000)
	ResourceStorageDescSetup("buildings/defense/trap_fire"		,"limit",10000)
	ResourceStorageDescSetup("buildings/defense/trap_physical"	,"limit",10000)
end)