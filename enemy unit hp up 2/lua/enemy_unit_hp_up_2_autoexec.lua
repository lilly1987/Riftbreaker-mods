

local setup2=function(blueprint,componentName)
	local Component = blueprint:GetComponent(componentName)
    if ( Component == nil ) then
        LogService:Log("Component no : " .. componentName)
        return
    end
	
	local Field=Component:GetField( "max_health" )
	local hp=tonumber(Field:GetValue())
	local hp2=math.floor((10000-hp)/50+hp*2)
	--LogService:Log("max_health get : " .. tostring(hp) .. " , set : " .. tostring(hp2))
	Field:SetValue(tostring(hp2))
	
	Field=Component:GetField( "health" )
	hp=tonumber(Field:GetValue())
	hp2=math.floor((10000-hp)/50+hp*2)
	--LogService:Log("health get : " .. tostring(hp) .. " , set : " .. tostring(hp2))
	Field:SetValue(tostring(hp2))	
end

local setup3=function(blueprint_name)
	--LogService:Log(" run : " .. blueprint_name)
	-----------------------------------------------
	local my="player/character_base"
	local database = EntityService:GetBlueprintDatabase( my )
    if ( database == nil ) then
        LogService:Log("database no : " .. my)
        return
    end
	local k="enemy_unit_hp_up_2_autoexec.lua/" .. blueprint_name
	if database:HasInt( k) then
		LogService:Log(" database has : " .. blueprint_name)
		return
	else
		database:SetInt( k,1)
		LogService:Log(" database set : " .. blueprint_name)
	end
	-----------------------------------------------
	local blueprint = ResourceManager:GetBlueprint(blueprint_name)
	
	setup2(blueprint,"HealthComponent")
	setup2(blueprint,"HealthDesc")
	--for _,componentName in pairs( blueprint:GetComponentNames() ) do
	--	LogService:Log(" * " .. componentName)
	--	local Component = blueprint:GetComponent(componentName)
	--	for _,FieldName in pairs( Component:GetFieldNames() ) do
	--		LogService:Log("   " .. FieldName .. " : " .. tostring(Component:GetField( FieldName ):GetValue()	))
	--	end
	--end
	
end

local list={
"units/ground/alien_tower_artillery_base"
,"units/ground/alien_tower_artillery_spawner"
,"units/ground/alien_tower_artillery_morph"
,"units/ground/alien_tower_artillery"
,"units/ground/alien_tower_artillery/attack_range"
,"units/ground/alien_tower_plasma_base"
,"units/ground/alien_tower_plasma_spawner"
,"units/ground/alien_tower_plasma_morph"
,"units/ground/alien_tower_plasma"
,"units/ground/alien_tower_plasma/attack_range"
,"units/ground/arachnoid_boss/trigger"
,"units/ground/arachnoid_boss/destructor"
,"units/ground/arachnoid_boss/attack_1"
,"units/ground/arachnoid_boss/attack_2"
,"units/ground/anoryxian/attack"
,"units/ground/anoryxian/attack_2"
,"units/ground/anoryxian_boss_tower"
,"units/ground/artigian_alpha"
,"units/ground/artigian_ultra"
,"units/ground/baxmoth_alpha"
,"units/ground/baxmoth_alpha/attack"
,"units/ground/baxmoth_boss_acid"
,"units/ground/artigian"
,"units/ground/artigian_base"
,"units/ground/artigian/projectile"
,"units/ground/baxmoth_boss_cryo"
,"units/ground/baxmoth_base"
,"units/ground/baxmoth"
,"units/ground/baxmoth/attack"
,"units/ground/baxmoth_boss_energy"
,"units/ground/baxmoth_spawner"
,"units/ground/baxmoth_ultra"
,"units/ground/baxmoth_ultra/attack"
,"units/ground/brabit_alpha"
,"units/ground/baxmoth_boss_fire"
,"units/ground/brabit"
,"units/ground/brabit_base"
,"units/ground/brabit_ultra"
,"units/ground/bomogan_ultra"
,"units/ground/bomogan_ultra/attack"
,"units/ground/bomogan_alpha"
,"units/ground/bomogan_alpha/attack"
,"units/ground/bomogan"
,"units/ground/bomogan/attack"
,"units/ground/bomogan_base"
,"units/ground/bradron_alpha"
,"units/ground/bradron_ultra"
,"units/ground/canceroth_alpha"
,"units/ground/canceroth_child_alpha"
,"units/ground/canceroth_ultra"
,"units/ground/canceroth_child_ultra"
,"units/ground/canceroth"
,"units/ground/canceroth_base"
,"units/ground/canceroth/destructor"
,"units/ground/canceroth_child"
,"units/ground/canceroth_child_base"
,"units/ground/canceroth_roots"
,"units/ground/canceroth_child/destructor"
,"units/ground/canceroth_child_veins"
,"units/ground/bradron_base"
,"units/ground/bradron"
,"units/ground/bradron/shockwave"
,"units/ground/canoptrix"
,"units/ground/canoptrix/trigger"
,"units/ground/canoptrix_3"
,"units/ground/canoptrix_base"
,"units/ground/canoptrix_crystal"
,"units/ground/carnicinth_alpha"
,"units/ground/carnicinth"
,"units/ground/carnicinth_base"
,"units/ground/carnicinth_ultra"
,"units/ground/crader"
,"units/ground/crawlog_alpha"
,"units/ground/crawlog_alpha/attack"
,"units/ground/crawlog_alpha_resurrect"
,"units/ground/crawlog_ultra"
,"units/ground/crawlog_ultra/attack"
,"units/ground/crawlog_ultra_resurrect"
,"units/ground/crawlog"
,"units/ground/crawlog/attack"
,"units/ground/crawlog_resurrect"
,"units/ground/crawlog_base"
,"units/ground/crysder"
,"units/ground/crysder_01"
,"units/ground/crysder_02"
,"units/ground/crysder_03"
,"units/ground/crysder_base"
,"units/ground/drexolian_alpha"
,"units/ground/drexolian_alpha/attack_1"
,"units/ground/drexolian_alpha/attack_2"
,"units/ground/creeper_cleaner"
,"units/ground/drexolian_ultra"
,"units/ground/drexolian_ultra/attack_1"
,"units/ground/drexolian_ultra/attack_2"
,"units/ground/egg_anoryxian"
,"units/ground/drillgor_alpha"
,"units/ground/drillgor_alpha/attack"
,"units/ground/drillgor_ultra"
,"units/ground/drillgor_ultra/attack"
,"units/ground/drexolian"
,"units/ground/drexolian/attack_1"
,"units/ground/drexolian/attack_2"
,"units/ground/drexolian/player_slowdown"
,"units/ground/drexolian/attack_range"
,"units/ground/drexolian_base"
,"units/ground/drexolian/wall_debris"
,"units/ground/egg_arachnoid_sentinel"
,"units/ground/egg_arachnoid_sentinel_alpha"
,"units/ground/egg_arachnoid_sentinel_ultra"
,"units/ground/drillgor"
,"units/ground/drillgor/attack"
,"units/ground/drillgor_base"
,"units/ground/drillgor/drill_destructor"
,"units/ground/egg_crawlog"
,"units/ground/egg_crawlog_alpha"
,"units/ground/egg_crawlog_ultra"
,"units/ground/egg_fungor"
,"units/ground/egg_fungor_alpha"
,"units/ground/egg_fungor_ultra"
,"units/ground/egg_canoptrix"
,"units/ground/egg_canoptrix_alpha"
,"units/ground/egg_canoptrix_ultra"
,"units/ground/egg_krocoon"
,"units/ground/egg_krocoon_alpha"
,"units/ground/egg_krocoon_ultra"
,"units/ground/egg_granan"
,"units/ground/egg_granan_alpha"
,"units/ground/egg_granan_ultra"
,"units/ground/egg_morirot"
,"units/ground/egg_morirot_alpha"
,"units/ground/egg_morirot_ultra"
,"units/ground/egg_mushbit"
,"units/ground/egg_mushbit_alpha"
,"units/ground/egg_mushbit_ultra"
,"units/ground/egg_nurglax_drone"
,"units/ground/egg_nurglax_drone_alpha"
,"units/ground/egg_nurglax_drone_ultra"
,"units/ground/egg_nurglax_drone_base"
,"units/ground/egg_elite_canoptrix"
,"units/ground/egg_phirian"
,"units/ground/egg_phirian_alpha"
,"units/ground/egg_phirian_ultra"
,"units/ground/egg_plutrodon"
,"units/ground/egg_plutrodon_alpha"
,"units/ground/egg_plutrodon_ultra"
,"units/ground/egg_stickrid"
,"units/ground/egg_stickrid_alpha"
,"units/ground/egg_stickrid_ultra"
,"units/ground/egg_wingmite"
,"units/ground/egg_wingmite_alpha"
,"units/ground/egg_wingmite_ultra"
,"units/ground/flurian_alpha"
,"units/ground/flurian_alpha/attack"
,"units/ground/flurian_ultra"
,"units/ground/flurian_ultra/attack"
,"units/ground/fungor_alpha"
,"units/ground/fungor_alpha/attack"
,"units/ground/fungor_ultra"
,"units/ground/fungor_ultra/attack"
,"units/ground/geotrupex_alpha"
,"units/ground/flurian_boss_energy"
,"units/ground/flurian_ultra/attack"
,"units/ground/geotrupex"
,"units/ground/geotrupex_base"
,"units/ground/fungor"
,"units/ground/fungor/attack"
,"units/ground/fungor_base"
,"units/ground/flurian_base"
,"units/ground/flurian"
,"units/ground/flurian/attack"
,"units/ground/geotrupex_ultra"
,"units/ground/gnerot/underground_rock_alpha"
,"units/ground/gnerot/underground_rock_damage_alpha"
,"units/ground/gnerot_alpha"
,"units/ground/gnerot_alpha/attack"
,"units/ground/gnerot/underground_rock_acid"
,"units/ground/gnerot/underground_rock_damage_acid"
,"units/ground/gnerot_boss_acid"
,"units/ground/gnerot"
,"units/ground/gnerot/attack"
,"units/ground/gnerot/gnerot_rock_debris"
,"units/ground/gnerot/underground_rock_danger_marker"
,"units/ground/gnerot/underground_rock"
,"units/ground/gnerot/underground_rock_damage"
,"units/ground/gnerot_base"
,"units/ground/gnerot_burning_fight_easy"
,"units/ground/gnerot/underground_rock_cryo"
,"units/ground/gnerot/underground_rock_damage_cryo"
,"units/ground/gnerot_boss_cryo"
,"units/ground/gnerot/underground_rock_energy"
,"units/ground/gnerot/underground_rock_damage_energy"
,"units/ground/gnerot_boss_energy"
,"units/ground/gnerot/underground_rock_burning"
,"units/ground/gnerot_burning_fight"
,"units/ground/gnerot_burning_fight/destructor"
,"units/ground/gnerot_burning_fight/attack"
,"units/ground/gnerot_burning"
,"units/ground/gnerot_ultra/attack"
,"units/ground/granan_alpha"
,"units/ground/granan_alpha/attack"
,"units/ground/granan_ultra"
,"units/ground/granan_ultra/attack"
,"units/ground/granan"
,"units/ground/granan/attack"
,"units/ground/granan_base"
,"units/ground/gnerot/underground_rock_caverns"
,"units/ground/gnerot/underground_rock_damage_caverns"
,"units/ground/gnerot_caverns"
,"units/ground/gnerot_caverns/attack"
,"units/ground/gnerot/underground_rock_damage_ultra"
,"units/ground/gnerot/underground_rock_ultra"
,"units/ground/gnerot_ultra"
,"units/ground/gnerot_ultra/attack"
,"units/ground/gulgor_alpha/attack"
,"units/ground/gulgor_ultra/attack"
,"units/ground/gulgor/attack"
,"units/ground/gulgor/crystal"
,"units/ground/gulgor/grow_crystal"
,"units/ground/gulgor/projectile"
,"units/ground/hedroner_alpha"
,"units/ground/hedroner_alpha/attack"
,"units/ground/hedroner/attack_range_alpha"
,"units/ground/hedroner_morphium"
,"units/ground/hedroner_ultra/attack"
,"units/ground/hedroner/attack_range_morphium"
,"units/ground/hedroner_ultra"
,"units/ground/hedroner_ultra/attack"
,"units/ground/hedroner/attack_range_ultra"
,"units/ground/invigor_ultra"
,"units/ground/invigor_ultra/attack"
,"units/ground/invigor_alpha"
,"units/ground/invigor_alpha/attack"
,"units/ground/jurvine_alpha"
,"units/ground/hedroner_base"
,"units/ground/hedroner"
,"units/ground/hedroner/attack"
,"units/ground/hedroner/attack_range"
,"units/ground/hedroner/teleport_fuse"
,"units/ground/jurvine"
,"units/ground/jurvine_base"
,"units/ground/jurvine_ultra"
,"units/ground/invigor"
,"units/ground/invigor/attack"
,"units/ground/invigor_base"
,"units/ground/kafferroceros_alpha/attack"
,"units/ground/kafferroceros/attack"
,"units/ground/kafferroceros/charge_destructor"
,"units/ground/kafferroceros_ultra/attack"
,"units/ground/kermon"
,"units/ground/kermon/attack"
,"units/ground/kermon_base"
,"units/ground/kermon/trigger"
,"units/ground/kermon_metallic"
,"units/ground/kermon_alpha/attack"
,"units/ground/kermon_spawner_for_nurglax"
,"units/ground/kermon_alpha"
,"units/ground/kermon_alpha/attack"
,"units/ground/kermon_ultra"
,"units/ground/kermon_ultra/attack"
,"units/ground/krocoon_alpha"
,"units/ground/krocoon_alpha/attack"
,"units/ground/krocoon"
,"units/ground/krocoon/attack"
,"units/ground/krocoon_base"
,"units/ground/krocoon_boss_acid"
,"units/ground/krocoon_boss_acid/attack"
,"units/ground/krocoon_spawner"
,"units/ground/krocoon_boss_cryo"
,"units/ground/krocoon_boss_cryo/attack"
,"units/ground/krocoon_ultra"
,"units/ground/krocoon_ultra/attack"
,"units/ground/krocoon_boss_energy"
,"units/ground/krocoon_boss_energy/attack"
,"units/ground/krocoon_boss_fire"
,"units/ground/krocoon_boss_fire/attack"
,"units/ground/lesigian_alpha/lightning_turret"
,"units/ground/lesigian_alpha/attack"
,"units/ground/lesigian/lightning_alpha"
,"units/ground/canoptrix/attack"
,"units/ground/canoptrix_alpha/attack"
,"units/ground/canoptrix_ultra/attack"
,"units/ground/arachnoid_sentinel/attack"
,"units/ground/arachnoid_sentinel_alpha/attack"
,"units/ground/arachnoid_sentinel_ultra/attack"
,"units/ground/lesigian_ultra/lightning_turret"
,"units/ground/lesigian_ultra/attack"
,"units/ground/lesigian/lightning_ultra"
,"units/ground/lurkid"
,"units/ground/lesigian/lightning_turret"
,"units/ground/lesigian/attack"
,"units/ground/lesigian/attack_range"
,"units/ground/lesigian/lightning_danger_marker"
,"units/ground/lesigian/lightning"
,"units/ground/lesigian/teleport_fuse"
,"units/ground/magmoth_alpha"
,"units/ground/magmoth_alpha/attack"
,"units/ground/magmoth/attack_range_alpha"
,"units/ground/magmoth_boss_acid"
,"units/ground/magmoth_ultra/attack"
,"units/ground/magmoth/attack_range_acid"
,"units/ground/magmoth_boss_cryo"
,"units/ground/magmoth/attack_range_cryo"
,"units/ground/magmoth_base"
,"units/ground/magmoth"
,"units/ground/magmoth/attack"
,"units/ground/magmoth/attack_range"
,"units/ground/magmoth_boss_energy"
,"units/ground/magmoth/attack_range_energy"
,"units/ground/magmoth_boss_fire"
,"units/ground/magmoth_ultra"
,"units/ground/magmoth_ultra/attack"
,"units/ground/magmoth/attack_range_ultra"
,"units/ground/moltug_alpha"
,"units/ground/moltug_crystal"
,"units/ground/moltug"
,"units/ground/moltug_base"
,"units/ground/moltug/destructor"
,"units/ground/moltug_crystal_ultra"
,"units/ground/moltug_crystal_alpha"
,"units/ground/moltug_ultra"
,"units/ground/morirot_alpha"
,"units/ground/morirot_alpha/attack"
,"units/ground/morirot_ultra"
,"units/ground/morirot_ultra/attack"
,"units/ground/morirot"
,"units/ground/morirot/attack"
,"units/ground/morirot_base"
,"units/ground/mudroner"
,"units/ground/mudroner/attack_range"
,"units/ground/mudroner_spawner"
,"units/ground/mudroner_boss_cryo"
,"units/ground/mudroner/attack_range_cryo"
,"units/ground/mudroner_boss_acid"
,"units/ground/mudroner/attack_range_acid"
,"units/ground/mudroner_boss_fire"
,"units/ground/mudroner/attack_range_fire"
,"units/ground/mudroner_boss_energy"
,"units/ground/mudroner/attack_range_energy"
,"units/ground/mushbit"
,"units/ground/mushbit/attack"
,"units/ground/mushbit_base"
,"units/ground/mushbit_alpha"
,"units/ground/mushbit_alpha/attack"
,"units/ground/mushbit_ultra"
,"units/ground/mushbit_ultra/attack"
,"units/ground/necrodon_alpha"
,"units/ground/necrodon_alpha/interact"
,"units/ground/necrodon_alpha/attack"
,"units/ground/nerilian_alpha"
,"units/ground/nerilian_alpha/attack"
,"units/ground/necrodon_ultra"
,"units/ground/necrodon_ultra/interact"
,"units/ground/necrodon_ultra/attack"
,"units/ground/necrodon"
,"units/ground/necrodon/interact"
,"units/ground/necrodon/attack"
,"units/ground/necrodon_base"
,"units/ground/nerilian_boss_acid"
,"units/ground/nerilian_boss_cryo"
,"units/ground/nerilian_base"
,"units/ground/nerilian"
,"units/ground/nerilian/attack"
,"units/ground/nerilian_boss_energy"
,"units/ground/nerilian_boss_fire"
,"units/ground/nerilian_ultra"
,"units/ground/nerilian_ultra/attack"
,"units/ground/nurglax_alpha"
,"units/ground/nurglax_alpha/attack"
,"units/ground/nurglax_base"
,"units/ground/nurglax"
,"units/ground/nurglax/attack"
,"units/ground/nurglax_boss_acid"
,"units/ground/nurglax_drone_alpha"
,"units/ground/nurglax_drone_alpha/attack"
,"units/ground/nurglax_drone_ultra"
,"units/ground/nurglax_drone_alpha/attack"
,"units/ground/nurglax_boss_cryo"
,"units/ground/nurglax_drone_base"
,"units/ground/nurglax_drone"
,"units/ground/nurglax_drone/attack"
,"units/ground/nurglax_boss_fire"
,"units/ground/nurglax_boss_energy"
,"units/ground/nurglax_ultra"
,"units/ground/nurglax_ultra/attack"
,"units/ground/octabit"
,"units/ground/octabit_clone_1"
,"units/ground/octabit_clone_2"
,"units/ground/octabit_base"
,"units/ground/octabit_alpha"
,"units/ground/octabit_alpha_clone_1"
,"units/ground/octabit_alpha_clone_2"
,"units/ground/octabit_ultra"
,"units/ground/octabit_ultra_clone_1"
,"units/ground/octabit_ultra_clone_2"
,"units/ground/phirian_ultra"
,"units/ground/phirian_ultra/attack"
,"units/ground/phirian_alpha"
,"units/ground/phirian_alpha/attack"
,"units/ground/plutrodon_alpha"
,"units/ground/plutrodon_alpha/attack"
,"units/ground/poogret_ultra"
,"units/ground/poogret_alpha"
,"units/ground/plutrodon_ultra"
,"units/ground/plutrodon_ultron/attack"
,"units/ground/phirian_base"
,"units/ground/phirian"
,"units/ground/phirian/attack"
,"units/ground/poogret"
,"units/ground/poogret_base"
,"units/ground/plutrodon_base"
,"units/ground/plutrodon"
,"units/ground/plutrodon/attack"
,"units/ground/plutrodon/spikes_spawner"
,"units/ground/plutrodon/spikes"
,"units/ground/plutrodon/trigger"
,"units/ground/rugwig"
,"units/ground/shegret_alpha"
,"units/ground/shegret_alpha/attack"
,"units/ground/shegret_ultra"
,"units/ground/shegret_ultra/attack"
,"units/ground/spawner_flurian"
,"units/ground/spawner_bradron"
,"units/ground/shegret"
,"units/ground/shegret/attack"
,"units/ground/shegret_base"
,"units/ground/spawner_mushbit"
,"units/ground/spawner_canoptrix"
,"units/ground/spawner_octabit"
,"units/ground/spawner_swamp_fungor"
,"units/ground/spawner_swamp_stickrid"
,"units/ground/spawner_morirot"
,"units/ground/spawner_swamp_plutrodon"
,"units/ground/spawner_granan"
,"units/ground/stickrid_alpha"
,"units/ground/stickrid_alpha/attack"
,"units/ground/spawner_swamp_canceroth"
,"units/ground/spawner_swamp_base"
,"units/ground/spawner_wingmite"
,"units/ground/stickrid_ultra"
,"units/ground/stickrid_ultra/attack"
,"units/ground/stickrid"
,"units/ground/stickrid/attack"
,"units/ground/stickrid_base"
,"units/ground/stickrid_projectile"
,"units/ground/stregaros_alpha/attack"
,"units/ground/stonger"
,"units/ground/stonger_base"
,"units/ground/stregaros/attack"
,"units/ground/stregaros_spawner"
,"units/ground/sulphorit_ultra"
,"units/ground/sulphorit_alpha"
,"units/ground/stregaros_ultra/attack"
,"units/ground/sulphorit"
,"units/ground/sulphorit_base"
,"units/ground/venomine"
,"units/ground/viremoth_alpha"
,"units/ground/viremoth"
,"units/ground/viremoth_base"
,"units/ground/viremoth_child_alpha"
,"units/ground/viremoth_child_ultra"
,"units/ground/viremoth_child"
,"units/ground/viremoth_child_base"
,"units/ground/viremoth_ultra"
,"units/ground/wingmite_alpha"
,"units/ground/wingmite_alpha/attack"
,"units/ground/wingmite_ultra"
,"units/ground/wingmite_ultra/attack"
,"units/ground/zorant_ultra"
,"units/ground/zorant_ultra/attack"
,"units/ground/zorant_alpha"
,"units/ground/zorant_alpha/attack"
,"units/ground/wingmite"
,"units/ground/wingmite/attack"
,"units/ground/wingmite_base"
,"units/ground/zorant_base"
,"units/ground/zorant"
,"units/ground/zorant/attack"
,"units/ground/zorant/attack_range"
,"units/ground/zorant/trigger"
}

for k,v in pairs(list) do
	--print(k,v)
	setup3(v)
end