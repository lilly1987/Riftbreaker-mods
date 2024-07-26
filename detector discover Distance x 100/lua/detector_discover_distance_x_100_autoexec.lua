-- fail
local Setup1=function (blueprintName,key ,multi ,d)

	LogService:Log("blueprintName : " .. blueprintName)
	
	--local EntityIds = FindService:FindEntitiesByBlueprint( blueprintName )
	--LogService:Log("EntityIds : " .. tostring(#EntityIds))
	
	local database = EntityService:GetBlueprintDatabase( blueprintName )
    if ( database == nil ) then
        LogService:Log("no database")
        return
    end
	
	local v=0
	if database:HasFloat( key ) then
		v=database:GetFloat( key )*multi
	else
		LogService:Log("no key : " .. key)		
		v=d
	end
	LogService:Log("v : " .. tostring(v))	
	database:SetFloat( key ,v)
	
end

-- fail
local Setup2=function (blueprintName,key ,multi ,d)

	LogService:Log("blueprintName : " .. blueprintName)
	
	--local Entities = FindService:FindEntitiesByBlueprint( blueprintName )
	--LogService:Log("Entities : " .. tostring(#Entities))
	
	local Entity = FindService:FindEntityByBlueprint( blueprintName )
	LogService:Log("Entity : " .. tostring(Entity))
	
	local database = EntityService:GetDatabase( Entity )
    if ( database == nil ) then
        LogService:Log("no database")
        return
    end
	
	local v=0
	if database:HasFloat( key ) then
		v=database:GetFloat( key )*multi
	else
		LogService:Log("no key : " .. key)		
		v=d
	end
	LogService:Log("v : " .. tostring(v))	
	database:SetFloat( key ,v)
	
end


local Setup3=function (blueprintName,key ,multi ,d)

	LogService:Log("blueprintName : " .. blueprintName)
	
	--local Entities = FindService:FindEntitiesByBlueprint( blueprintName )
	--LogService:Log("Entities : " .. tostring(#Entities))
	
	local Entity = FindService:FindEntityByBlueprint( blueprintName )
	LogService:Log("Entity : " .. tostring(Entity))
	
	local Component= EntityService:GetComponent(Entity,"LuaComponent")
    if ( Component == nil ) then
        LogService:Log("no Component")
        return
    end
	
	--local refl_Component = reflection_helper(Component)
	--LogService:Log( tostring(refl_Component)  )
	--{
	--	script = [LuaScriptHolder]
	--	database = [Database]
	--	snapshot = [LuaEntityPackedObject]
	--	is_initialized = true
	--	object = [LuaEntityObject]
	--}
	
	--for _,FieldName in pairs( Component:GetFieldNames() ) do
	--	LogService:Log( _ .. " : " .. FieldName )
	--end
	-- 1 : script
	-- 2 : database
	-- 3 : snapshot
	-- 4 : is_initialized
	-- 5 : object
	
	local object=Component:GetField("object")
	-- LogService:Log( "type : " .. type(object )) -- userdata
	-- LogService:Log( "GetTypeName : " .. object:GetTypeName()) -- LuaEntityObject
	local LuaEntityObject= object:GetValue()
    if ( LuaEntityObject == nil ) then
        LogService:Log("no LuaEntityObject")
        return
    end
	
	LogService:Log( "type : " .. type(LuaEntityObject ))
	
end


--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--end)
--
--RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
--	Setup1("items/interactive/detector_item","discovery_distance",100,1000)
--	Setup1("items/interactive/detector_item","radius",100,5000)
--end)

-- detector:OnInit() 직후 PlayerControlledEntityChangeEvent 발생
RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
	Setup3("items/interactive/detector_item","discovery_distance",100,1000)
	Setup3("items/interactive/detector_item","radius",100,5000)
end)

