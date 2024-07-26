local setup3=function(name1)
	LogService:Log(" run : " .. name1)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("database no : " .. my)
        return
    end
	local k="half_radius_pump_autoexec.lua/" .. name1
	if database:HasInt( k) then
		LogService:Log(" database has : " .. name1)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. name1)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(name1)
	local Component = blueprint:GetComponent("BuildingDesc")
	local min_radius = Component:GetField( "min_radius" )
	LogService:Log("min_radius : " .. min_radius:GetValue())
	min_radius:SetValue( 
		tostring(
			tonumber(min_radius:GetValue())/2
		)
	)
	LogService:Log("min_radius : " .. min_radius:GetValue())
	-----------------------------------------------
	database = EntityService:GetBlueprintDatabase( name1 )
	LogService:Log("range : " .. tostring(database:GetFloat( "range" )) )
	--for _,floatKey in pairs( database:GetFloatKeys() ) do
	--	LogService:Log("   " .. floatKey .. " : " .. tostring(database:GetFloat( floatKey )	))
	--end
	database:SetFloat( "range",database:GetFloat( "range" )/2 )
	LogService:Log("range : " .. tostring(database:GetFloat( "range" )) )
end
--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
	setup3("buildings/resources/liquid_pump")
	setup3("buildings/resources/liquid_pump_lvl_2")
	setup3("buildings/resources/liquid_pump_lvl_3")
--end)