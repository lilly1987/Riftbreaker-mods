local setup3=function(name,m,v)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("no database : " .. my)
        return
    end
	local k="cryo_station_radius_autoexec.lua/" .. name
	if database:HasInt( k) then
		LogService:Log(" Already Has : " .. k)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. k)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(name)
	
	local Component = blueprint:GetComponent("GridMarkerComponent")
	-- for _,FieldName in pairs( Component:GetFieldNames() ) do
	-- 	LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	-- end
	-- mode : 1
	-- indexes : nil
	-- pos : nil
	-- Layers : nil
	-- terrain_type : cryo_ground
	-- layers_template : nil
	-- indexes_ents : nil
	-- extend : 30.000
	
	local extend=Component:GetField( "extend" )
	local n=tonumber(extend:GetValue())
	LogService:Log(" n : " .. n)
	extend:SetValue(tostring(n*m))
end

setup3("effects/buildings_main/cryo_station_energy",2,60)
--RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
--end)