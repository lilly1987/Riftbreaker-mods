-----
--layout: default
--title: HealthComponent
--has_children: false
--parent: Component
--grand_parent: Game Reflection
-----
--# HealthComponent
--Description 
--
--## Fields
--
--| Type | Name |
--|:----------|:--------------|
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | health |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | max_health |
--| [uint](/riftbreaker-wiki/docs/game-reflection/components/uint/) | immortal_counter |
--| [int](/riftbreaker-wiki/docs/game-reflection/enums/int/) | status |
--
-----
--layout: default
--title: HealthDesc
--has_children: false
--parent: Component
--grand_parent: Game Reflection
-----
--# HealthDesc
--Description 
--
--## Fields
--
--| Type | Name |
--|:----------|:--------------|
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | health |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | max_health |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | is_dead |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | is_immortal |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | is_manual |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | override_only_first_submesh |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | update_health_uniform |
--| Container< [DestructionLevel](/riftbreaker-wiki/docs/game-reflection/classes/destruction_level/) > | DestructionLevels |


RegisterGlobalEventHandler("StartBuildingEvent", function(evt)
	-- LogService:Log("StartBuildingEvent : " .. tostring(evt:GetEntity() ))
	-- local currentDifficultyName = DifficultyService:GetCurrentDifficultyName() 
	local entity=evt:GetEntity() 
	HealthService:SetMaxHealth( entity, HealthService:GetMaxHealth( entity) * 100 )
end)

RegisterGlobalEventHandler("MissionFlowDeactivatedEvent", function(evt)
	-----------------------------------------------
	local database = CampaignService:GetCampaignData()
    if ( database == nil ) then
        LogService:Log("database no")
        return
    end
	local k1="lilly_building_health_x_100_autoexec.lua/" 
	if database:HasInt( k1) then
		LogService:Log(" database has " )
		return
	else
		database:SetInt( k1,1)
		LogService:Log(" database set " )
	end
	-----------------------------------------------
	local entities = FindService:FindEntitiesByType( "building" )
	for _,entity in pairs( entities ) do
		HealthService:SetMaxHealth( entity, HealthService:GetMaxHealth( entity) * 100 )
	end
end)

local setup=function(blueprint_name)
	LogService:Log(blueprint_name)
	
	local blueprint = ResourceManager:GetBlueprint(blueprint_name)
	
	--local buildingComponent = blueprint:GetComponent("BuildingComponent")		
	--local type = buildingComponent:GetField("type"):GetValue())
	--LogService:Log(" type : " .. type)
	
	local TypeComponent = blueprint:GetComponent("TypeComponent")		
	local type = TypeComponent:GetField("type"):GetValue()
	LogService:Log(" type : " .. type)
	
	local max_health=0
	local health=0
	
	local HealthDesc = blueprint:GetComponent("HealthDesc")	
	if ( HealthDesc == nil ) then
		LogService:Log(" HealthDesc no ")
	else
		max_health = HealthDesc:GetField("max_health"):GetValue()
		LogService:Log(" max_health : " .. max_health)
	end
	
	local HealthComponent = blueprint:GetComponent("HealthComponent")	
	if ( HealthComponent == nil ) then
		LogService:Log(" HealthComponent no ")
	else
		max_health = HealthComponent:GetField("max_health"):GetValue()
		LogService:Log(" max_health : " .. max_health)
	end
end