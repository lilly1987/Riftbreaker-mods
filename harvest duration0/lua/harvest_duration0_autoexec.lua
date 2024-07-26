-----
--layout: default
--title: HarvestStartEvent
--nav_order: 1
--has_children: true
--parent: Lua services
-----
--### GetEntity
-- * (): [Entity const&](riftbreaker-wiki/docs/reflection/Entity const&)
  

RegisterGlobalEventHandler("HarvestStartEvent", function(evt)
	local entity=evt:GetEntity()
	LogService:Log("HarvestStartEvent : " .. tostring(entity) )
	local database = EntityService:GetDatabase( entity )
	if ( database ) then
		database:SetFloat("harvest_duration", 0.0 )
		LogService:Log(" harvest_duration set : " .. tostring(entity))
	else
		LogService:Log(" database no : " .. tostring(entity))			
	end
end)

--RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
--	LogService:Log(" PlayerControlledEntityChangeEvent ")
--	----------------
--	local controlledEntity=evt:GetControlledEntity()
--    local database = EntityService:GetDatabase( controlledEntity )			
--    if ( database == nil ) then
--        LogService:Log(" no database GetControlledEntity")
--        return
--	else
--		LogService:Log(" has database GetControlledEntity")
--		
--		local k="harvest_duration0_autoexec.lua"
--		if database:HasInt( k) then
--			LogService:Log(" Already has : " .. k)
--			return
--		else
--			database:SetInt( k,1)
--			LogService:Log(" database set : " .. k)
--		end
--    end
--	----------------
--		
--	local entities = FindService:FindEntitiesByBlueprint("items/interactive/harvester")
--	LogService:Log(" #entities : " ..tostring(#entities))
--	for entity in Iter( entities ) do
--		local database = EntityService:GetDatabase( entity )
--		if ( database ) then
--			database:SetFloat("harvest_duration", 0.0 )
--			LogService:Log(" harvest_duration set : " .. tostring(entity))
--		else
--			LogService:Log(" database no : " .. tostring(entity))			
--		end
--	end
--end)