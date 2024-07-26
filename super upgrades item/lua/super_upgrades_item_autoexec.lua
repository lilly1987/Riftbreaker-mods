--RegisterGlobalEventHandler("PlayerCreatedEvent", function(evt)
--	LogService:Log(" PlayerCreatedEvent ".. tostring(evt:GetPlayerId()) )
--end)

RegisterGlobalEventHandler("PlayerInitializedEvent", function(evt)
	LogService:Log(" run : " .. tostring(evt:GetPlayerId()) )
	
	-----------------------------------------------
	local database1 = CampaignService:GetCampaignData()
    if ( database1 == nil ) then
        LogService:Log("NOT EXISTS database ")
        return
    end
	local k1="super_upgrades_item_autoexec.lua/" 
	if database1:HasInt( k1) then
		LogService:Log(" Already applied " )
		return
	else
		database1:SetInt( k1,1)
		LogService:Log(" database set " )
	end
	-----------------------------------------------
	
	local items = {
		"items/weapons/aa_missile_launcher_extreme_item",
		"items/weapons/aa_plasma_gun_extreme_item",
		"items/weapons/acid_spitter_extreme_item",
		"items/weapons/atom_bomb_extreme_item",
		"items/weapons/blaster_extreme_item",
		"items/weapons/bouncing_blades_extreme_item",
		"items/weapons/burst_rifle_extreme_item",
		"items/weapons/chainsaw_extreme_item",
		"items/weapons/charged_bomb_extreme_item",
		"items/weapons/corrosive_gun_extreme_item",
		"items/weapons/cryo_spitter_extreme_item",
		"items/weapons/cryogenic_atomizer_extreme_item",
		"items/weapons/crystal_gun_extreme_item",
		"items/weapons/debug_rifle_extreme_item",
		"items/weapons/fire_spitter_extreme_item",
		"items/weapons/flame_blade_extreme_item",
		"items/weapons/flamer_extreme_item",
		"items/weapons/floating_mines_acid_extreme_item",
		"items/weapons/floating_mines_cryo_extreme_item",
		"items/weapons/floating_mines_extreme_item",
		"items/weapons/floating_mines_gravity_extreme_item",
		"items/weapons/floating_mines_incendiary_extreme_item",
		"items/weapons/grenade_launcher_extreme_item",
		"items/weapons/hammer_extreme_item",
		"items/weapons/heavy_plasma_extreme_item",
		"items/weapons/insect_gun_extreme_item",
		"items/weapons/laser_extreme_item",
		"items/weapons/laser_sword_extreme_item",
		"items/weapons/lava_gun_extreme_item",
		"items/weapons/lightning_gun_extreme_item",
		"items/weapons/minigun_extreme_item",
		"items/weapons/mortar_extreme_item",
		"items/weapons/pickaxe_extreme_item",
		"items/weapons/plasma_gun_extreme_item",
		"items/weapons/power_fist_extreme_item",
		"items/weapons/railgun_extreme_item",
		"items/weapons/rocket_launcher_extreme_item",
		"items/weapons/root_gun_extreme_item",
		"items/weapons/semi_auto_extreme_item",
		"items/weapons/shotgun_extreme_item",
		"items/weapons/small_machinegun_extreme_item",
		"items/weapons/sniper_rifle_extreme_item",
		"items/weapons/sonic_fist_extreme_item",
		"items/weapons/spear_extreme_item",
		"items/weapons/swarm_missiles_extreme_item",
		"items/weapons/sword_extreme_item",
		"items/weapons/trident_extreme_item",
		"items/upgrades/anti_corrosive_armor_extreme_item",
		"items/upgrades/armor_plating_extreme_item",
		"items/upgrades/attack_gear_extreme_item",
		"items/upgrades/defense_gear_extreme_item",
		"items/upgrades/defensive_equipment_extreme_item",
		"items/upgrades/discovery_tools_extreme_item",
		"items/upgrades/energy_armor_extreme_item",
		"items/upgrades/energy_sensors_extreme_item",
		"items/upgrades/fireproof_armor_extreme_item",
		"items/upgrades/fusion_core_extreme_item",
		"items/upgrades/gathering_tools_extreme_item",
		"items/upgrades/magnetic_pistons_extreme_item",
		"items/upgrades/maintenance_tools_extreme_item",
		"items/upgrades/offensive_equipment_extreme_item",
		"items/upgrades/plasma_engine_extreme_item",
		"items/upgrades/reflective_armor_extreme_item",
		"items/upgrades/repair_tools_extreme_item",
		"items/upgrades/sonic_sensors_extreme_item",
		"items/upgrades/titanium_machinery_extreme_item",
	}	
	
	local items2 = {
		"items/loot/weapon_mods/mod_ammo_cost_extreme_item",
		"items/loot/weapon_mods/mod_ammo_spread_add_extreme_item",
		"items/loot/weapon_mods/mod_ammo_spread_sub_extreme_item",
		"items/loot/weapon_mods/mod_autoaim_extreme_item",
		"items/loot/weapon_mods/mod_cluster_projectiles_extreme_item",
		"items/loot/weapon_mods/mod_critical_chance_extreme_item",
		"items/loot/weapon_mods/mod_damage_extreme_item",
		"items/loot/weapon_mods/mod_damage_over_time_extreme_item",
		"items/loot/weapon_mods/mod_damage_penetration_extreme_item",
		"items/loot/weapon_mods/mod_fire_per_burst_extreme_item",
		"items/loot/weapon_mods/mod_fire_per_shot_extreme_item",
		"items/loot/weapon_mods/mod_fire_rate_extreme_item",
		"items/loot/weapon_mods/mod_homing_extreme_item",
		"items/loot/weapon_mods/mod_lifesteal_extreme_item",
		"items/loot/weapon_mods/mod_range_extreme_item",
		"items/loot/weapon_mods/mod_splash_damage_extreme_item",
		"items/loot/weapon_mods/mod_stun_chance_extreme_item",
	}	

	
	local player_id = evt:GetPlayerId()
	--local players = PlayerService:GetAllPlayers()
	--for player_id in Iter(players) do
		--LogService:Log(" player_id : " .. tostring(player_id))

		for _, item in ipairs(items) do			
			PlayerService:AddItemToInventory(player_id, item)
			PlayerService:AddItemToInventory(player_id, item)
		end
		
		for _, item in ipairs(items2) do			
			for i = 1, 10, 1 do
				PlayerService:AddItemToInventory(player_id, item)
			end
		end
		
		local item_entity = PlayerService:AddItemToInventory(player_id, "items/upgrades/lilly_extreme_item")
		PlayerService:EquipItemInSlot(player_id, item_entity, "UPGRADE_4")
	--end
end)