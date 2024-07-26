local setup3=function(blueprint_name)
	LogService:Log(" run : " .. blueprint_name)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("database no : " .. my)
        return
    end
	local k="build_on_water_wall_gate_autoexec.lua/" .. blueprint_name
	if database:HasInt( k) then
		LogService:Log(" database has : " .. blueprint_name)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. blueprint_name)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(blueprint_name)
	local Component = blueprint:GetComponent("BuildingDesc")
    if ( Component == nil ) then
        LogService:Log("BuildingDesc no : " .. blueprint_name)
        return
    end
	--for _,FieldName in pairs( Component:GetFieldNames() ) do
	--	LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	--end
	local Field=Component:GetField( "building_functionality" )
	LogService:Log("building_functionality : " .. Field:GetValue())
	Field:SetValue("10")
	LogService:Log("building_functionality set : " .. blueprint_name)
		
end

local list={
"buildings/defense/wall_crystal_corner_01"
,"buildings/defense/wall_crystal_corner_01_lvl_2"
,"buildings/defense/wall_crystal_corner_01_lvl_3"
,"buildings/defense/wall_crystal_straight_01"
,"buildings/defense/wall_crystal_straight_01_lvl_2"
,"buildings/defense/wall_crystal_straight_01_lvl_3"
,"buildings/defense/wall_crystal_t_01"
,"buildings/defense/wall_crystal_t_01_lvl_2"
,"buildings/defense/wall_crystal_t_01_lvl_3"
,"buildings/defense/wall_crystal_x_01"
,"buildings/defense/wall_crystal_x_01_lvl_2"
,"buildings/defense/wall_crystal_x_01_lvl_3"
,"buildings/defense/wall_energy_corner_01"
,"buildings/defense/wall_energy_corner_01_lvl_2"
,"buildings/defense/wall_energy_corner_01_lvl_3"
,"buildings/defense/wall_energy_straight_01"
,"buildings/defense/wall_energy_straight_01_lvl_2"
,"buildings/defense/wall_energy_straight_01_lvl_3"
,"buildings/defense/wall_energy_t_01"
,"buildings/defense/wall_energy_t_01_lvl_2"
,"buildings/defense/wall_energy_t_01_lvl_3"
,"buildings/defense/wall_energy_x_01"
,"buildings/defense/wall_energy_x_01_lvl_2"
,"buildings/defense/wall_energy_x_01_lvl_3"
,"buildings/defense/wall_gate"
,"buildings/defense/wall_gate_crystal"
,"buildings/defense/wall_gate_crystal_lvl_2"
,"buildings/defense/wall_gate_crystal_lvl_3"
,"buildings/defense/wall_gate_energy"
,"buildings/defense/wall_gate_energy_lvl_2"
,"buildings/defense/wall_gate_energy_lvl_3"
,"buildings/defense/wall_gate_lvl_2"
,"buildings/defense/wall_gate_lvl_3"
,"buildings/defense/wall_small_corner_01"
,"buildings/defense/wall_small_corner_01_lvl_2"
,"buildings/defense/wall_small_corner_01_lvl_3"
,"buildings/defense/wall_small_floor_01"
,"buildings/defense/wall_small_floor_01_lvl_2"
,"buildings/defense/wall_small_floor_01_lvl_3"
,"buildings/defense/wall_small_straight_01"
,"buildings/defense/wall_small_straight_01_lvl_2"
,"buildings/defense/wall_small_straight_01_lvl_3"
,"buildings/defense/wall_small_tile_01"
,"buildings/defense/wall_small_t_01"
,"buildings/defense/wall_small_t_01_lvl_2"
,"buildings/defense/wall_small_t_01_lvl_3"
,"buildings/defense/wall_small_x_01"
,"buildings/defense/wall_small_x_01_lvl_2"
,"buildings/defense/wall_small_x_01_lvl_3"
,"buildings/defense/wall_vine_straight_01"
,"buildings/defense/wall_vine_straight_01_lvl_2"
,"buildings/defense/wall_vine_straight_01_lvl_3"
,"buildings/defense/wall_vine_straight_02"
,"buildings/defense/wall_vine_straight_02_lvl_2"
,"buildings/defense/wall_vine_straight_02_lvl_3"
,"buildings/defense/wall_vine_straight_03"
,"buildings/defense/wall_vine_straight_03_lvl_2"
,"buildings/defense/wall_vine_straight_03_lvl_3"
--,"buildings/resources/pipe_corner"
--,"buildings/defense/tower_water_basic"
}

for k,v in pairs(list) do
	--print(k,v)
	setup3(v)
end