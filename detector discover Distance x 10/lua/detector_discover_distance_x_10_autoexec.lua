--local ref =require("lua/utils/reflection.lua")

function DatabaseComponentSetup(name1,t ,multi )

	LogService:Log("name : " .. name1)
	
    local Blueprint = ResourceManager:GetBlueprint( name1 )
    if ( Blueprint == nil ) then
        LogService:Log("NOT EXISTS 1 : " .. name1)
        return
    end
	
    local Component = Blueprint:GetComponent("DatabaseComponent")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 2 : " .. "DatabaseComponent")
        return
    end
	
	local refComponent =reflection_helper(Component)
	LogService:Log( tostring(refComponent)  )
	
    local Container = Component:GetField("database"):ToContainer()
    if ( Container == nil ) then
        LogService:Log("NOT EXISTS 3 : " .. "database")
        return
    end
	
	local refContainer =reflection_helper(Container)
	LogService:Log( tostring(refContainer)  )
	
	local f=nil
	local n=0
	
	
	--f=Container:GetField(t)
    --if ( f == nil ) then
    --    LogService:Log("NOT EXISTS 4 : " .. t)
    --    return
    --end
	--n=tonumber(f:GetValue())
	--LogService:Log(name1 .. " : " .. t .. " : " .. n)
	--f:SetValue(tostring(n*multi))
end

DatabaseComponentSetup("items/interactive/detector_item"		,"discovery_distance",100)

--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--
--end)

