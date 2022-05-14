-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__GetTarmacAsset__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local l__MapType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "map", "map-type").MapType;
local u1 = {
	Aztec = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapAztec"), 
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapAztec_to30")
		}
	}, 
	Blossom = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapBlossom"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapBlossom_to2"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapBlossom_duels")
		}
	}, 
	Forest = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapForest")
		}
	}, 
	Park = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapPark")
		}
	}, 
	Western = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapWestern"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapWestern_to2")
		}
	}, 
	Autumn = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapAutumn")
		}
	}, 
	Pinefall = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapPinefall"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapPinefall_to2")
		}
	}, 
	Candyland = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapCandyland"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapCandyland_to2")
		}
	}, 
	Castle = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapCastle")
		}
	}, 
	Campsite = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapCampsite")
		}
	}, 
	Construction = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapConstruction")
		}
	}, 
	Factory = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapFactory")
		}
	}, 
	Glacier = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapGlacier"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapGlacier_to2"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapGlacier_duels")
		}, 
		lighting = {
			Brightness = 2
		}
	}, 
	Sandstorm = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapSandstorm")
		}, 
		lighting = {
			Brightness = 2.2
		}
	}, 
	Dome = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapDome"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapDome")
		}, 
		lighting = {
			Brightness = 2.6
		}
	}, 
	SandTemple = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapSandTemple"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapSandTemple_to2"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapSandTemple_duels")
		}, 
		lighting = {
			Brightness = 2.2
		}
	}, 
	Volcano = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapVolcano"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapVolcano")
		}
	}, 
	Farm = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapFarm")
		}
	}, 
	ShipsAhoy = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapShipsAhoy")
		}
	}, 
	Spring = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapSpring_to30")
		}
	}, 
	TeaTime = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapTeaTime")
		}
	}, 
	Airship = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapAirship")
		}
	}, 
	MegaPlains = {
		mapImage = {
			[l__MapType__3.ROYALE] = l__GetTarmacAsset__2("MapMegaPlains")
		}
	}, 
	Gorge = {
		mapImage = {
			[l__MapType__3.ROYALE] = l__GetTarmacAsset__2("MapGorge_royale")
		}
	}, 
	MegaTundra = {
		mapImage = {
			[l__MapType__3.ROYALE] = l__GetTarmacAsset__2("MapMegaTundra_royale")
		}
	}, 
	Launch = {
		lighting = {
			Brightness = 2.2
		}
	}, 
	ChristmasSquare = {
		lighting = {
			Brightness = 1
		}
	}, 
	Bank = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapBank")
		}
	}, 
	Citadel = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapCitadel"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapCitadel_to2")
		}
	}, 
	Crypt = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapCrypt"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapCrypt")
		}
	}, 
	FootballField = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapFootballField")
		}
	}, 
	Highschool = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapHighschool")
		}
	}, 
	Irongate = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapIrongate")
		}
	}, 
	MilitaryBase = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapMilitaryBase")
		}
	}, 
	MiniGolf = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapMiniGolf"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapMiniGolf")
		}
	}, 
	Mystic = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapMystic"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapMystic_to2")
		}
	}, 
	Oriental = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapOriental"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapOriental_to2")
		}
	}, 
	Pond = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapPond"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapPond_to2")
		}
	}, 
	Quarry = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapQuarry")
		}
	}, 
	Shrine = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapShrine"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapShrine")
		}
	}, 
	Swamp = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapSwamp"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapSwamp")
		}
	}, 
	Windfall = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapWindfall"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapWindfall")
		}
	}, 
	Coast = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapCoast_to4"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapCoast_to2")
		}
	}, 
	Grotto = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapGrotto_to4"), 
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapGrotto_to2")
		}
	}, 
	Colosseum = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapColosseum")
		}
	}, 
	Fortress = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapFortress")
		}
	}, 
	Reservoir = {
		mapImage = {
			[l__MapType__3.BEDWARS_THIRTY_VS_THIRTY] = l__GetTarmacAsset__2("MapReservoir")
		}
	}, 
	BambooGarden = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapBambooGarden"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapBambooGarden")
		}
	}, 
	Bloom = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapBloom")
		}
	}, 
	Cistern = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapCistern"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapCistern")
		}
	}, 
	Glade = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapGlade"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapGlade"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapGlade_duels")
		}
	}, 
	Tundra = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapTundra"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapTundra")
		}
	}, 
	Volatile = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapVolatile"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapVolatile"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapVolatile_duels")
		}
	}, 
	Wasteland = {
		mapImage = {
			[l__MapType__3.SKYWARS] = l__GetTarmacAsset__2("MapWasteland"), 
			[l__MapType__3.SKYWARS_SQUADS] = l__GetTarmacAsset__2("MapWasteland")
		}
	}, 
	Arch = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapArch")
		}
	}, 
	Mineshaft = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapMineshaft")
		}
	}, 
	Plaza = {
		mapImage = {
			[l__MapType__3.BEDWARS_DOUBLES] = l__GetTarmacAsset__2("MapPlaza")
		}
	}, 
	Canyon = {
		mapImage = {
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapCanyon")
		}
	}, 
	Ruins = {
		mapImage = {
			[l__MapType__3.BEDWARS_SQUADS] = l__GetTarmacAsset__2("MapRuins"), 
			[l__MapType__3.BEDWARS_DUELS] = l__GetTarmacAsset__2("MapRuins_duels"), 
			[l__MapType__3.GUN_GAME] = l__GetTarmacAsset__2("MapRuins_gg")
		}
	}, 
	Siege = {
		mapImage = {
			[l__MapType__3.GUN_GAME] = l__GetTarmacAsset__2("MapSiege_gg")
		}
	}, 
	Treetop = {
		mapImage = {
			[l__MapType__3.GUN_GAME] = l__GetTarmacAsset__2("MapTreetop_gg")
		}
	}, 
	Industry = {
		mapImage = {
			[l__MapType__3.INFECTED] = l__GetTarmacAsset__2("MapIndustry_infected")
		}
	}, 
	FrostSite = {
		mapImage = {
			[l__MapType__3.INFECTED] = l__GetTarmacAsset__2("MapFrostSite_infected")
		}
	}, 
	Iceberg = {
		mapImage = {
			[l__MapType__3.PVE] = l__GetTarmacAsset__2("MapIceberg_pve")
		}
	}
};
return {
	getMapMeta = function(p1)
		local v4 = string.gsub(string.split(p1, "_")[2], "-", "");
		if not u1[v4] then
			return {};
		end;
		return u1[v4];
	end
};
