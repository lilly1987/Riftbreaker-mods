-- energy storage x100 by Lilly
local ResourceStorageDescSetup=function (name1,t ,multi )

	LogService:Log(" run : " .. name1)
	
	-----------------------------------------------
	local my=name1
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("NOT EXISTS database : " .. my)
        return
    end
	local k="energy_storage_x100_autoexec.lua/" .. my
	if database:HasInt( k) then
		LogService:Log(" Already applied : " .. my)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. my)
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

ResourceStorageDescSetup("buildings/energy/energy_storage"		,"max",100)
ResourceStorageDescSetup("buildings/energy/energy_storage_lvl_2" ,"max",100)
ResourceStorageDescSetup("buildings/energy/energy_storage_lvl_3" ,"max",100)
	
--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--end)