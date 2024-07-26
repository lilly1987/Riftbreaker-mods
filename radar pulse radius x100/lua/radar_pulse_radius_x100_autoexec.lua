-- solid material storage x100
--require("lua/utils/reflection.lua")
local ResourceStorageDescSetup=function(name1 )
	LogService:Log(" run : " .. name1)
	
	-----------------------------------------------
	local database = EntityService:GetBlueprintDatabase( name1 )
    if ( database == nil ) then
        LogService:Log("no database : " .. name1)
        return
    end
	local k="radar_pulse_radius_x100_autoexec.lua/" .. name1
	if database:HasFloat( k) then
		LogService:Log(" Already applied : " .. name1)
		return
	else
		database:SetFloat( k,1)
		LogService:Log(" database set : " .. name1)
		-- 실제론 반영 안됨
		--if database:HasFloat( "radius") then
		--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database:GetFloat( "radius")))
		--	database:SetFloat( "radius",database:GetFloat( "radius")*10)
		--else
		--	LogService:Log(" radius no : " .. name1)
		--	database:SetFloat( "radius",1000)
		--end
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(name1)
	--for _,componentName in pairs( blueprint:GetComponentNames() ) do
	--	LogService:Log("  *" .. componentName)
	--end
	-----------------------------------------------
	-- *InventoryItemRuntimeDataComponent
	-- *BlueprintComponent
	-- *LuaComponent
	-- *InventoryItemComponent
	-- *DatabaseComponent
	-- *CostDesc
	-----------------------------------------------
    local Component = blueprint:GetComponent("LuaComponent")
    if ( Component == nil ) then
        LogService:Log("no Component : " .. name1)
	else
		local refl_Component = reflection_helper(Component)
		
		database = Component:GetField( "database" ):GetValue()
		if ( database == nil ) then
			LogService:Log("no database : " .. name1)
		else
			LogService:Log("type : " .. type(database))
			if database:HasFloat( "radius") then
				LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database:GetFloat( "radius")))
				database:SetFloat( "radius",database:GetFloat( "radius")*10)
			else
				LogService:Log(" radius no : " .. name1)
				database:SetFloat( "radius",1000)
			end
			
			-- err
			--local ref_database=reflection_helper(database)
			--LogService:Log("database : " .. tostring(ref_database))
			
			-- __ptr : class Exor::TypeValueView:0000020D8D20DAF0
			--for k,v in pairs(database) do
			--	LogService:Log(tostring(k) .. " : " .. tostring(v))
			--	if v:HasFloat( "radius") then
			--		LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(v:GetFloat( "radius")))
			--		v:SetFloat( "radius",v:GetFloat( "radius")*10)
			--	else
			--		LogService:Log(" radius no : " .. name1)
			--		v:SetFloat( "radius",1000)
			--	end
			--end
			
			--if database["radius"] then
			--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database["radius"]))
			--	database["radius"]=database["radius"]*10
			--else
			--	LogService:Log(" radius no : " .. name1)
			--	database["radius"]=1000
			--end
		end
    end
	
    Component = blueprint:GetComponent("DatabaseComponent")
    if ( Component == nil ) then
        LogService:Log("no Component : " .. name1)
	else
		local refl_Component = reflection_helper(Component)
		
		database = refl_Component.database
		if ( database == nil ) then
			LogService:Log("no database : " .. name1)
		else
			for k,v in pairs(database) do
				LogService:Log(tostring(k) .. " : " .. tostring(v))
			end
			--LogService:Log("type : " .. type(database))
			--if database["radius"] then
			--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database["radius"]))
			--	database["radius"]=database["radius"]*10
			--else
			--	LogService:Log(" radius no : " .. name1)
			--	database["radius"]=1000
			--end
			--if database:HasFloat( "radius") then
			--	LogService:Log(" radius apply : " .. name1 .. " ; " .. tostring(database:GetFloat( "radius")))
			--	database:SetFloat( "radius",database:GetFloat( "radius")*10)
			--else
			--	LogService:Log(" radius no : " .. name1)
			--	database:SetFloat( "radius",1000)
			--end
		end
    end
end
RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
	LogService:Log(" PlayerCreatedEvent")
	ResourceStorageDescSetup("items/skills/radar_pulse_item"         )
--ResourceStorageDescSetup("items/skills/radar_pulse_advanced_item")
--ResourceStorageDescSetup("items/skills/radar_pulse_superior_item")
--ResourceStorageDescSetup("items/skills/radar_pulse_extreme_item" )
end)