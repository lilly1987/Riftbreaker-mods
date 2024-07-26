
local mySetup=function(name1,t ,multi )
	LogService:Log(" run : " .. name1)
	
	-----------------------------------------------
	local my="player/character_base"
	
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("NOT EXISTS database : " .. my)
        return
    end
	local k="research_speed_10000_autoexec.lua/" .. name1
	if database:HasFloat( k) then
		LogService:Log(" Already applied : " .. name1)
		return
	else
		database:SetFloat( k,1)
		LogService:Log(" database set : " .. name1)
	end
	-----------------------------------------------
	
    local Blueprint = ResourceManager:GetBlueprint( name1 )
    if ( Blueprint == nil ) then
        LogService:Log("NOT EXISTS 1 : " .. name1)
        return
    end
    local Component = Blueprint:GetComponent("ResourceConverterDesc")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 2 : " .. "ResourceConverterDesc")
        return
    end
    local Container = Component:GetField("out"):ToContainer()
    if ( Container == nil ) then
        LogService:Log("NOT EXISTS 3 : " .. "out")
        return
    end

	local f=nil
	local item=nil
	local n=0
    for i=0,Container:GetItemCount()-1 do	
        item = Container:GetItem(i)
		if ( item == nil ) then	goto continue end
		
		f=item:GetField(t)
		if ( f == nil ) then	goto continue end
		n=tonumber(f:GetValue())
		LogService:Log(name1 .. " : " .. t .. " : " .. n)
		f:SetValue(tostring(n*multi))

		::continue::	
    end
	
    local Component = Blueprint:GetComponent("ResourceConverterComponent")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 4 : " .. "ResourceConverterComponent")
        return
    end
	LogService:Log(name1 .. " : " .. tostring(Component.initialized))
end

-- mySetup("buildings/main/laboratory"					,"value",10000)
-- mySetup("buildings/main/laboratory_lvl_2" 			,"value",10000)
-- mySetup("buildings/main/laboratory_lvl_3" 			,"value",10000)
-- mySetup("buildings/main/laboratory_lvl_4" 			,"value",10000)
-- mySetup("buildings/main/laboratory_lvl_5" 			,"value",10000)
-- mySetup("buildings/main/communications_hub"			,"value",10000)
-- mySetup("buildings/main/communications_hub_lvl_2" 	,"value",10000)
-- mySetup("buildings/main/communications_hub_lvl_3" 	,"value",10000)
-- mySetup("buildings/main/communications_hub_lvl_4" 	,"value",10000)
-- mySetup("buildings/main/communications_hub_lvl_5" 	,"value",10000)

--RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
--end)
--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--end)


