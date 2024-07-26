-- AI Hub Storage x100 by Lilly
-- AI Hub Storage x100
-- use ai_hub_storage_x100_by_lilly_autoexec.lua
-- Does not conflict with other mods
local ResourceStorageDescSetup=function (name1,t ,multi )

	LogService:Log(" run : " .. name1)
	-----------------------------------------------
	local my="player/character_base"
	
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("NOT EXISTS database : " .. my)
        return
    end
	local k="energy_connector_radius_10_autoexec.lua/" .. name1
	if database:HasFloat( k) then
		LogService:Log(" Already has : " .. name1)
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
    local Component = Blueprint:GetComponent("ResourceStorageComponent")
    if ( Component == nil ) then
        LogService:Log("NOT EXISTS 2 : " .. "ResourceStorageComponent")
        return
    end
    local Container = Component:GetField("Storages"):ToContainer()
    if ( Container == nil ) then
        LogService:Log("NOT EXISTS 3 : " .. "Storages")
        return
    end

	local f=nil
	local item=nil
	local n=0
    for i=0,Container:GetItemCount()-1 do	
        item = Container:GetItem(i)
		if ( item == nil ) then	goto continue end
		
		f=item:GetField(t)
		n=tonumber(f:GetValue())
		LogService:Log(name1 .. " : " .. t .. " : " .. n)
		f:SetValue(tostring(n*multi))

		::continue::	
    end
end

	ResourceStorageDescSetup("buildings/energy/energy_connector"		,"distribution_radius",2)

--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--end)
	