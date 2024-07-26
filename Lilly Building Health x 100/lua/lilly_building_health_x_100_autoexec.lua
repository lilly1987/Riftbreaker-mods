
RegisterGlobalEventHandler("StartBuildingEvent", function(evt)
	-- LogService:Log("StartBuildingEvent : " .. tostring(evt:GetEntity() ))
	-- local currentDifficultyName = DifficultyService:GetCurrentDifficultyName() 
	local entity=evt:GetEntity() 
	HealthService:SetMaxHealth( entity, HealthService:GetMaxHealth( entity) * 100 )
end)