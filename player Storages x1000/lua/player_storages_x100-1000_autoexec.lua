--require("lua/utils/reflection.lua")

local ResourceStorageDescSetup=function ()
	-----------------------------------------------
	
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log(" database no : " .. my)
        return
    end
	
	local name1="player/player"
	local k="player_storages_x1000_autoexec.lua/" .. name1
	if database:HasFloat( k) then
		LogService:Log(" database has : " .. k)
		return
	else
		database:SetFloat( k,1)
		LogService:Log(" database set : " .. k)
	end
	-----------------------------------------------

    local Blueprint = ResourceManager:GetBlueprint( name1 )
    if ( Blueprint == nil ) then
        LogService:Log(" Blueprint no : " .. name1)
        return
    end
    local Component = Blueprint:GetComponent("ResourceStorageComponent")
    if ( Component == nil ) then
        LogService:Log(" Component no : " .. "ResourceStorageComponent")
        return
    end
    local Container = Component:GetField("Storages"):ToContainer()
    if ( Container == nil ) then
        LogService:Log(" Container no : " .. "Storages")
        return
    end
	
	-----------------------------------------------
	
	local f=nil
	local r=nil
	local g=nil
	local s=nil
	local a=nil
	local item=nil
	local m=0
	--LogService:Log( " cnt : " .. Container:GetItemCount() )		
    for i=Container:GetItemCount()-1,0,-1 do
		--LogService:Log(" item : " .. tostring(i))
        item = Container:GetItem(i)
		if ( item == nil ) then	
			LogService:Log(" item nil : " .. tostring(i))
		else
			-- fail
			--local itemRef = reflection_helper(item)
			--LogService:Log( itemRef )		
			
			-- nil
			--a=item:GetField("attachment"):GetValue()--fail
			--if ( a == nil ) then	
			--	LogService:Log( " attachment nil")
			--else
			--	LogService:Log( " attachment ")
			--	a=a:ToContainer()
			--	for j=a:GetItemCount()-1,0,-1 do
			--		LogService:Log(a:GetItem(i):GetValue())
			--	end
			--end
			
			-- 12 ??
			--g=item:GetField("group"):GetValue()--fail
			--if ( g == nil ) then	
			--	LogService:Log( " group nil")
			--else
			--	LogService:Log( " group : ".. g)
			--end
			
			-- ""
			--s=item:GetField("subgroup"):GetValue()--fail
			--if ( s == nil ) then	
			--	LogService:Log( " subgroup nil")
			--else
			--	LogService:Log( " subgroup : ".. s)
			--end
			
			-- nil
			--r=item:GetField("resource"):GetValue()--fail
			--if ( r == nil ) then	
			--	LogService:Log( " resource nil")
			--else
			--	LogService:Log( " resource : ".. type(r))
			--end		
			
			f=item:GetField("max")
			if ( f == nil ) then	
				LogService:Log( " max nil")
			else
				m=tonumber(f:GetValue())*1000
				f:SetValue(tostring(m))
				LogService:Log( tostring(i) .. " : " .. m)						
			end		
			
		end
		

		
    end
end

ResourceStorageDescSetup()