RegisterGlobalEventHandler("PlayerControlledEntityChangeEvent", function(evt)
	LogService:Log("PlayerControlledEntityChangeEvent")
	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super"       , -4 , 1 , 8 , "")	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super_cryo"  , -4 , 1 , 0 , "")	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super_energy", -4 , 1 , -8 , "")	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super_fire"  , 4 , 1 , -8 , "")	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super_acid"  , 4 , 1 , 0  , "")	
	EntityService:SpawnEntity("buildings/defense/tower_portal_super_area"  , 4 , 1 , 8  , "")	
	
	--local blueprint = ResourceManager:GetBlueprint("buildings/defense/tower_portal_super_acid" )
	--local Component = blueprint:GetComponent("ResistanceComponent")
	--LogService:Log( Component:GetField("reflect_damage_max_percent"):GetValue()  )
	--local resistances = Component:GetField("resistances"):GetValue()
	--LogService:Log( type(resistances)  )
	--for _,FieldName in pairs( Component:GetFieldNames() ) do
	--	LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	--end
end)