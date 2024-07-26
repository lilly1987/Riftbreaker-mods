local setup3=function(blueprint_name)
	LogService:Log(" run : " .. blueprint_name)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("database no : " .. my)
        return
    end
	local k="build_on_water_energy_connector_autoexec.lua/" .. blueprint_name
	if database:HasInt( k) then
		LogService:Log(" database has : " .. blueprint_name)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. blueprint_name)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(blueprint_name)
	local Component = blueprint:GetComponent("BuildingDesc")
    if ( Component == nil ) then
        LogService:Log("BuildingDesc no : " .. blueprint_name)
        return
    end
	--for _,FieldName in pairs( Component:GetFieldNames() ) do
	--	LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	--end
	local Field=Component:GetField( "building_functionality" )
	LogService:Log("building_functionality : " .. Field:GetValue())
	Field:SetValue("10")
	LogService:Log("building_functionality set : " .. blueprint_name)
		
end

local list={
"buildings/energy/energy_connector"
}

for k,v in pairs(list) do
	--print(k,v)
	setup3(v)
end