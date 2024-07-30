

--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [Vector3](/riftbreaker-wiki/docs/game-reflection/classes/vector3/) | WorldPosition |
--| [uchar](/riftbreaker-wiki/docs/game-reflection/enums/uchar/) | MinimapType |
RegisterGlobalEventHandler("MinimapClickedEvent", function(evt)
	LogService:Log(" MinimapClickedEvent ")
	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))-- player_respawner.lua INVALID_ID==PlayerSpawnRequest.SpawnPoint
	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))-- nil
	
	local MinimapType=evt:GetMinimapType() -- 0,1
	--LogService:Log(" MinimapType : " .. MinimapType)
	if ( MinimapType ~= 1 ) then
		return
	end
	
	--local GetPosition=EntityService:GetPosition(evt:GetEntity())--0,0,0
	--LogService:Log(" GetPosition : x : " .. GetPosition.x .. " , y : " .. GetPosition.y .. " , z : " .. GetPosition.z)
	
	local WorldPosition=evt:GetWorldPosition()
	LogService:Log(" WorldPosition : x : " .. WorldPosition.x .. " , y : " .. WorldPosition.y .. " , z : " .. WorldPosition.z)
	--local player_id = PlayerService:GetPlayerForEntity( evt:GetEntity() )==evt:GetEntity()
	--LogService:Log(" player_id : " .. player_id)
	
	local controlledEntity=FindService:FindEntityByBlueprint("player/character")
	LogService:Log(" controlledEntity : " .. (controlledEntity))
	--GetPosition=EntityService:GetPosition(controlledEntity)--0,0,0
	--LogService:Log(" GetPosition : x : " .. GetPosition.x .. " , y : " .. GetPosition.y .. " , z : " .. GetPosition.z)
	
	--local playable_min = MissionService:GetPlayableRegionMin();
	--local playable_max = MissionService:GetPlayableRegionMax();
	WorldPosition.y=8
	PlayerService:TeleportPlayer( controlledEntity, WorldPosition , 0.125, 0.0625, 0.125 )
	--QueueEvent( "TeleportEntityToPosRequest", controlledEntity , 0, WorldPosition , 0.125, 0.0625, 0.125)
end)


--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [uchar](/riftbreaker-wiki/docs/game-reflection/enums/uchar/) | Type |
--| [uint](/riftbreaker-wiki/docs/game-reflection/components/uint/) | PlayerId |
-- QueueEvent("ChangeActiveMinimapRequest", event_sink, 1, player )
--RegisterGlobalEventHandler("ChangeActiveMinimapRequest", function(evt)
--	LogService:Log(" ChangeActiveMinimapRequest ")
--	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))-- player_respawner.lua INVALID_ID
--	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))-- nil
--	local Type = evt:GetType() --0
--	LogService:Log(" Type : " .. Type)
--	local PlayerId = evt:GetPlayerId() --0
--	LogService:Log(" PlayerId : " .. PlayerId)
--end)

-- 이건 의미 없음
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Owner |
--RegisterGlobalEventHandler("InteractWithEntityRequest", function(evt)
--	LogService:Log(" InteractWithEntityRequest ")
--	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))
--	LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))
--	local Owner = PlayerService:GetPlayerByMech( evt:GetOwner() )
--	LogService:Log(" Owner : " .. Owner)
--end)

--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Target |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | DisappearTime |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | WaitTime |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | AppearTime |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | LeavePortal |
--| [bool](/riftbreaker-wiki/docs/game-reflection/components/bool/) | CheckSpace |
--RegisterGlobalEventHandler("TeleportEntityRequest", function(evt)
--	LogService:Log(" TeleportEntityRequest ")
--	LogService:Log(" Entity : " .. tostring(evt:GetEntity())) --controlledEntity
--	LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))-- player/character
--	local Target = PlayerService:GetPlayerByMech( evt:GetTarget() )
--	LogService:Log(" Target : " .. Target)-- player_respawner.lua INVALID_ID ==PlayerSpawnRequest.SpawnPoint
--	--LogService:Log(" Target : " .. EntityService:GetBlueprintName(Target))-- nil
--	LogService:Log(" DisappearTime : " .. evt:GetDisappearTime()) --0.60000002384186
--	LogService:Log(" WaitTime : " .. evt:GetWaitTime())--0.10000000149012
--	LogService:Log(" AppearTime : " .. evt:GetAppearTime())--0.60000002384186
--end)

--| [Entity](/riftbreaker-wiki/docs/game-reflection/classes/entity/) | Entity |
--| [Vector3](/riftbreaker-wiki/docs/game-reflection/classes/vector3/) | Target |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | DisappearTime |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | WaitTime |
--| [float](/riftbreaker-wiki/docs/game-reflection/components/float/) | AppearTime |
--RegisterGlobalEventHandler("TeleportEntityToPosRequest", function(evt)
--	LogService:Log(" TeleportEntityToPosRequest ")
--	LogService:Log(" Entity : " .. tostring(evt:GetEntity()))
--	--LogService:Log(" Entity : " .. EntityService:GetBlueprintName(evt:GetEntity()))
--	local Target=evt:GetTarget()
--	LogService:Log(" Target : x : " .. Target.x .. " , y : " .. Target.y .. " , z : " .. Target.z)
--end)

