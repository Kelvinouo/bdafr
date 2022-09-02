-- Decompiled with the Synapse X Luau decompiler.

return {
	CheckIcon = function(p1)
		if p1 >= 2 then
			return {
				Image = "rbxassetid://7844324651", 
				ImageRectOffset = Vector2.new(0, 255), 
				ImageRectSize = Vector2.new(45, 34)
			};
		end;
		return {
			Image = "rbxassetid://9369198273", 
			ImageRectOffset = Vector2.new(129, 258), 
			ImageRectSize = Vector2.new(23, 17)
		};
	end, 
	CloseIcon = function(p2)
		if p2 >= 2 then
			return {
				Image = "rbxassetid://7844324651", 
				ImageRectOffset = Vector2.new(255, 84), 
				ImageRectSize = Vector2.new(24, 24)
			};
		end;
		return {
			Image = "rbxassetid://9369198273", 
			ImageRectOffset = Vector2.new(389, 129), 
			ImageRectSize = Vector2.new(12, 12)
		};
	end, 
	CrownIcon = function(p3)
		if p3 >= 2 then
			return {
				Image = "rbxassetid://7844324651", 
				ImageRectOffset = Vector2.new(329, 0), 
				ImageRectSize = Vector2.new(32, 26)
			};
		end;
		return {
			Image = "rbxassetid://9369198273", 
			ImageRectOffset = Vector2.new(0, 386), 
			ImageRectSize = Vector2.new(16, 13)
		};
	end, 
	Explode1 = "rbxassetid://7843586735", 
	Explode2 = "rbxassetid://7843594723", 
	Explode3 = "rbxassetid://7843594957", 
	Explode4 = "rbxassetid://7843595020", 
	Explode5 = "rbxassetid://7843624755", 
	Explode6 = "rbxassetid://7843624866", 
	Explode7 = "rbxassetid://7843632261", 
	FunnyShape1 = "rbxassetid://10013935436", 
	FunnyShape2 = "rbxassetid://10013935610", 
	FunnyShape3 = "rbxassetid://10085259365", 
	Indicator = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(258, 129), 
		ImageRectSize = Vector2.new(130, 107)
	}, 
	InteractionPromptBackground = function(p4)
		if p4 >= 2 then
			return {
				Image = "rbxassetid://7844324651", 
				ImageRectOffset = Vector2.new(0, 0), 
				ImageRectSize = Vector2.new(254, 254)
			};
		end;
		return {
			Image = "rbxassetid://9369198273", 
			ImageRectOffset = Vector2.new(0, 258), 
			ImageRectSize = Vector2.new(127, 127)
		};
	end, 
	InteractionPromptHand = function(p5)
		if p5 >= 2 then
			return {
				Image = "rbxassetid://7844324651", 
				ImageRectOffset = Vector2.new(255, 0), 
				ImageRectSize = Vector2.new(73, 83)
			};
		end;
		return {
			Image = "rbxassetid://9369198273", 
			ImageRectOffset = Vector2.new(387, 0), 
			ImageRectSize = Vector2.new(37, 42)
		};
	end, 
	MapAirship = "rbxassetid://7843635776", 
	MapArch = "rbxassetid://9558003432", 
	MapAutumn = "rbxassetid://7843635915", 
	MapAztec = "rbxassetid://7843637535", 
	MapAztec_to30 = "rbxassetid://9593019617", 
	MapBambooGarden = "rbxassetid://9558003798", 
	MapBank = "rbxassetid://9558003971", 
	MapBloom = "rbxassetid://9558004163", 
	MapBlossom = "rbxassetid://7843640670", 
	MapBlossom_duels = "rbxassetid://9593019722", 
	MapBlossom_to2 = "rbxassetid://9592948983", 
	MapCampsite = "rbxassetid://7843645383", 
	MapCandyland = "rbxassetid://7843645512", 
	MapCandyland_to2 = "rbxassetid://9592949094", 
	MapCanyon = "rbxassetid://9558004380", 
	MapCastle = "rbxassetid://7843649209", 
	MapCistern = "rbxassetid://9558004562", 
	MapCitadel = "rbxassetid://9558004717", 
	MapCitadel_to2 = "rbxassetid://9592949196", 
	MapCoast_to2 = "rbxassetid://9592949271", 
	MapCoast_to4 = "rbxassetid://9593092250", 
	MapColosseum = "rbxassetid://9558004951", 
	MapConstruction = "rbxassetid://7843649329", 
	MapCrypt = "rbxassetid://9558005207", 
	MapDome = "rbxassetid://7843649404", 
	MapFactory = "rbxassetid://7843649516", 
	MapFarm = "rbxassetid://7843649605", 
	MapFootballField = "rbxassetid://9590518143", 
	MapForest = "rbxassetid://7843652580", 
	MapFortress = "rbxassetid://9558005641", 
	MapFrostSite_infected = "rbxassetid://9593131201", 
	MapGlacier = "rbxassetid://7843653990", 
	MapGlacier_duels = "rbxassetid://9593019852", 
	MapGlacier_to2 = "rbxassetid://9592949398", 
	MapGlade = "rbxassetid://9558005980", 
	MapGlade_duels = "rbxassetid://9592858040", 
	MapGorge_royale = "rbxassetid://9593038125", 
	MapGrotto_to2 = "rbxassetid://9592949563", 
	MapGrotto_to4 = "rbxassetid://9593092383", 
	MapHighschool = "rbxassetid://9558006286", 
	MapIceberg_pve = "rbxassetid://9593131324", 
	MapIndustry_infected = "rbxassetid://9593131420", 
	MapIrongate = "rbxassetid://9558006526", 
	MapMegaPlains = "rbxassetid://7843654122", 
	MapMegaTundra_royale = "rbxassetid://9593038292", 
	MapMilitaryBase = "rbxassetid://9590518386", 
	MapMineshaft = "rbxassetid://9558007116", 
	MapMiniGolf = "rbxassetid://9590518506", 
	MapMystic = "rbxassetid://9558007479", 
	MapMystic_to2 = "rbxassetid://9592949698", 
	MapOriental = "rbxassetid://9558007649", 
	MapOriental_to2 = "rbxassetid://9592949805", 
	MapPark = "rbxassetid://7843657295", 
	MapPinefall = "rbxassetid://7843657388", 
	MapPinefall_to2 = "rbxassetid://9592949913", 
	MapPlaza = "rbxassetid://9558007853", 
	MapPond = "rbxassetid://9558008141", 
	MapPond_to2 = "rbxassetid://9592979977", 
	MapQuarry = "rbxassetid://9558008396", 
	MapReservoir = "rbxassetid://9558008563", 
	MapRuins = "rbxassetid://9558008860", 
	MapRuins_duels = "rbxassetid://9593020068", 
	MapRuins_gg = "rbxassetid://9593061325", 
	MapSandTemple = "rbxassetid://7843662340", 
	MapSandTemple_duels = "rbxassetid://9593020139", 
	MapSandTemple_to2 = "rbxassetid://9592980131", 
	MapSandstorm = "rbxassetid://7843664086", 
	MapShipsAhoy = "rbxassetid://7843668447", 
	MapShrine = "rbxassetid://9558009078", 
	MapSiege_gg = "rbxassetid://9593061450", 
	MapSpring_to30 = "rbxassetid://9592858242", 
	MapSwamp = "rbxassetid://9558009254", 
	MapTeaTime = "rbxassetid://7843671362", 
	MapTreetop_gg = "rbxassetid://9593061537", 
	MapTundra = "rbxassetid://9558009451", 
	MapVolatile = "rbxassetid://9558009649", 
	MapVolatile_duels = "rbxassetid://9593092625", 
	MapVolcano = "rbxassetid://7843678932", 
	MapWasteland = "rbxassetid://9558009782", 
	MapWestern = "rbxassetid://7843679023", 
	MapWestern_to2 = "rbxassetid://9592980292", 
	MapWindfall = "rbxassetid://9558009935", 
	NoImage = "rbxassetid://7843680216", 
	Shard1 = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(0, 0), 
		ImageRectSize = Vector2.new(128, 128)
	}, 
	Shard2 = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(129, 0), 
		ImageRectSize = Vector2.new(128, 128)
	}, 
	Shard3 = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(0, 129), 
		ImageRectSize = Vector2.new(128, 128)
	}, 
	Shard4 = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(258, 0), 
		ImageRectSize = Vector2.new(128, 128)
	}, 
	ShardOutline = {
		Image = "rbxassetid://9369198273", 
		ImageRectOffset = Vector2.new(129, 129), 
		ImageRectSize = Vector2.new(128, 128)
	}, 
	blocks = {
		andesite = {
			icon = "rbxassetid://9072552631", 
			s = "rbxassetid://9072525162"
		}, 
		andesite_polished = {
			icon = "rbxassetid://9072552793", 
			s = "rbxassetid://9072552916"
		}, 
		barrier = {
			icon = "rbxassetid://10569969807", 
			s = "rbxassetid://10569969967"
		}, 
		bedrock = {
			icon = "rbxassetid://9207283973", 
			s = "rbxassetid://9207284200"
		}, 
		birch_log = {
			icon = "rbxassetid://7884365859", 
			s = "rbxassetid://7843683271", 
			td = "rbxassetid://7884366353"
		}, 
		brick = {
			icon = "rbxassetid://7884366460", 
			s = "rbxassetid://7843690742"
		}, 
		ceramic = {
			icon = "rbxassetid://7884366622", 
			s = "rbxassetid://7852095211"
		}, 
		clay = {
			icon = "rbxassetid://7884366829", 
			s = "rbxassetid://7861526072"
		}, 
		clay_black = {
			icon = "rbxassetid://7884367004", 
			s = "rbxassetid://7872903497"
		}, 
		clay_blue = {
			icon = "rbxassetid://7884367119", 
			s = "rbxassetid://7872903756"
		}, 
		clay_cyan = {
			icon = "rbxassetid://7884367212", 
			s = "rbxassetid://7872904181"
		}, 
		clay_dark_brown = {
			icon = "rbxassetid://7884367299", 
			s = "rbxassetid://7872904623"
		}, 
		clay_dark_green = {
			icon = "rbxassetid://7884367424", 
			s = "rbxassetid://7844417777"
		}, 
		clay_gray = {
			icon = "rbxassetid://7884367563", 
			s = "rbxassetid://7872905160"
		}, 
		clay_green = {
			icon = "rbxassetid://7884367698", 
			s = "rbxassetid://7872905387"
		}, 
		clay_light_brown = {
			icon = "rbxassetid://7884367792", 
			s = "rbxassetid://7872905675"
		}, 
		clay_light_green = {
			icon = "rbxassetid://7884367872", 
			s = "rbxassetid://7872906008"
		}, 
		clay_orange = {
			icon = "rbxassetid://7884367973", 
			s = "rbxassetid://7872906273"
		}, 
		clay_pink = {
			icon = "rbxassetid://7884368035", 
			s = "rbxassetid://7872906593"
		}, 
		clay_purple = {
			icon = "rbxassetid://7884368099", 
			s = "rbxassetid://7872906885"
		}, 
		clay_red = {
			icon = "rbxassetid://7884368246", 
			s = "rbxassetid://7872907119"
		}, 
		clay_tan = {
			icon = "rbxassetid://7884368312", 
			s = "rbxassetid://7872907469"
		}, 
		clay_white = {
			icon = "rbxassetid://7884368439", 
			s = "rbxassetid://7872907773"
		}, 
		clay_yellow = {
			icon = "rbxassetid://7884368673", 
			s = "rbxassetid://7872908082"
		}, 
		cobblestone = {
			icon = "rbxassetid://8296848529", 
			s = "rbxassetid://8296848659"
		}, 
		concrete_green = {
			icon = "rbxassetid://8537949134", 
			s = "rbxassetid://8537949581"
		}, 
		diamond_block = {
			icon = "rbxassetid://7884368860", 
			s = "rbxassetid://7861529819"
		}, 
		diorite = {
			icon = "rbxassetid://9072525407", 
			s = "rbxassetid://9072525496"
		}, 
		diorite_polished = {
			icon = "rbxassetid://9072553104", 
			s = "rbxassetid://9072553173"
		}, 
		dirt = {
			icon = "rbxassetid://7884368936", 
			s = "rbxassetid://7852097294"
		}, 
		emerald_block = {
			icon = "rbxassetid://7884369019", 
			s = "rbxassetid://7843773857"
		}, 
		fisherman_coral = {
			icon = "rbxassetid://7884369108", 
			s = "rbxassetid://7843775572"
		}, 
		galactite = {
			icon = "rbxassetid://9839887907", 
			s = "rbxassetid://9839888622"
		}, 
		galactite_brick = {
			icon = "rbxassetid://9839888714", 
			s = "rbxassetid://9839888790"
		}, 
		granite = {
			icon = "rbxassetid://9072553261", 
			s = "rbxassetid://9072525939"
		}, 
		granite_polished = {
			icon = "rbxassetid://9072553350", 
			s = "rbxassetid://9072553427"
		}, 
		grass = {
			d = "rbxassetid://7843778275", 
			icon = "rbxassetid://7911370722", 
			s = "rbxassetid://7911371120", 
			t = "rbxassetid://7911371279"
		}, 
		hickory_log = {
			icon = "rbxassetid://7884369330", 
			s = "rbxassetid://7843782693", 
			td = "rbxassetid://7843787701"
		}, 
		ice = {
			icon = "rbxassetid://7884369431", 
			s = "rbxassetid://7873314621"
		}, 
		ice_frost_1 = {
			s = "rbxassetid://8221158413"
		}, 
		ice_frost_2 = {
			s = "rbxassetid://8221571608"
		}, 
		iron_block = {
			icon = "rbxassetid://7884369517", 
			s = "rbxassetid://7852098030"
		}, 
		kobblak = {
			icon = "rbxassetid://9859002988", 
			s = "rbxassetid://9859003106", 
			td = "rbxassetid://9859003198"
		}, 
		kresh = {
			icon = "rbxassetid://9839889168", 
			s = "rbxassetid://9839889255", 
			t = "rbxassetid://9839889319"
		}, 
		log_maple = {
			icon = "rbxassetid://7884369649", 
			s = "rbxassetid://7843802302", 
			td = "rbxassetid://7884369818"
		}, 
		lucky_block = {
			icon = "rbxassetid://7884369916", 
			s = "rbxassetid://7843804042"
		}, 
		lucky_block_trap = {
			icon = "rbxassetid://7884370012", 
			s = "rbxassetid://7843813175"
		}, 
		magma_block = {
			icon = "rbxassetid://9439108582", 
			s = "rbxassetid://9439108691"
		}, 
		marble = {
			icon = "rbxassetid://7884370119", 
			s = "rbxassetid://7861531930"
		}, 
		marble_pillar = {
			icon = "rbxassetid://7884370206", 
			s = "rbxassetid://7843819529", 
			td = "rbxassetid://7843830538"
		}, 
		oak_log = {
			icon = "rbxassetid://7884370279", 
			s = "rbxassetid://7843832942", 
			td = "rbxassetid://7884370351"
		}, 
		obsidian = {
			icon = "rbxassetid://8105569883", 
			s = "rbxassetid://8105570170"
		}, 
		pumpkin = {
			f = "rbxassetid://7843844110", 
			icon = "rbxassetid://7884370541", 
			s = "rbxassetid://7843844205", 
			td = "rbxassetid://7843849779"
		}, 
		purple_lucky_block = {
			icon = "rbxassetid://8105570365", 
			s = "rbxassetid://8105570571"
		}, 
		red_sand = {
			icon = "rbxassetid://9072732616", 
			s = "rbxassetid://9072732694"
		}, 
		red_sandstone = {
			icon = "rbxassetid://7884370687", 
			s = "rbxassetid://7843853920"
		}, 
		sand = {
			icon = "rbxassetid://7884370902", 
			s = "rbxassetid://7843856590"
		}, 
		sandstone = {
			icon = "rbxassetid://7884371048", 
			s = "rbxassetid://7872908360"
		}, 
		slate_brick = {
			icon = "rbxassetid://9072553631", 
			s = "rbxassetid://9072526507"
		}, 
		slime_block = {
			icon = "rbxassetid://7884371303", 
			s = "rbxassetid://7843866346"
		}, 
		smoke_block = {
			icon = "rbxassetid://8538034673", 
			s = "rbxassetid://8538034808"
		}, 
		snow = {
			icon = "rbxassetid://7884371442", 
			s = "rbxassetid://7843870529"
		}, 
		spruce_log = {
			icon = "rbxassetid://7884371618", 
			s = "rbxassetid://7843877369", 
			td = "rbxassetid://7884371731"
		}, 
		stone = {
			icon = "rbxassetid://7884371892", 
			s = "rbxassetid://7861533820"
		}, 
		stone_brick = {
			icon = "rbxassetid://7884372079", 
			s = "rbxassetid://7843883344"
		}, 
		stone_slab = {
			icon = "rbxassetid://8105570787", 
			s = "rbxassetid://8105570960"
		}, 
		tnt = {
			icon = "rbxassetid://7884372237", 
			s = "rbxassetid://7843883483", 
			td = "rbxassetid://7843883559"
		}, 
		void_block = {
			icon = "rbxassetid://9871961934", 
			s = "rbxassetid://9871962545", 
			t = "rbxassetid://9871962653"
		}, 
		wood_plank_birch = {
			icon = "rbxassetid://7884372418", 
			s = "rbxassetid://7884372538"
		}, 
		wood_plank_hickory = {
			icon = "rbxassetid://7884372677", 
			s = "rbxassetid://7844302747"
		}, 
		wood_plank_maple = {
			icon = "rbxassetid://7884372787", 
			s = "rbxassetid://7884372866"
		}, 
		wood_plank_oak = {
			icon = "rbxassetid://7884372987", 
			s = "rbxassetid://7884373088"
		}, 
		wood_plank_spruce = {
			icon = "rbxassetid://7884373190", 
			s = "rbxassetid://7884373345"
		}, 
		wool_black = {
			icon = "rbxassetid://7923576966", 
			s = "rbxassetid://7861535149"
		}, 
		wool_blue = {
			icon = "rbxassetid://7923577182", 
			s = "rbxassetid://7884373711"
		}, 
		wool_cyan = {
			icon = "rbxassetid://7923577311", 
			s = "rbxassetid://7861535702"
		}, 
		wool_dark_brown = {
			icon = "rbxassetid://7923577434", 
			s = "rbxassetid://7861535961"
		}, 
		wool_gray = {
			icon = "rbxassetid://7923577537", 
			s = "rbxassetid://7861536309"
		}, 
		wool_green = {
			icon = "rbxassetid://7923577655", 
			s = "rbxassetid://7923577768"
		}, 
		wool_light_brown = {
			icon = "rbxassetid://7923577894", 
			s = "rbxassetid://7861537039"
		}, 
		wool_light_green = {
			icon = "rbxassetid://7923578022", 
			s = "rbxassetid://7923578149"
		}, 
		wool_orange = {
			icon = "rbxassetid://7923578297", 
			s = "rbxassetid://7923578418"
		}, 
		wool_pink = {
			icon = "rbxassetid://7923578533", 
			s = "rbxassetid://7923578642"
		}, 
		wool_purple = {
			icon = "rbxassetid://7923578762", 
			s = "rbxassetid://7923578873"
		}, 
		wool_red = {
			icon = "rbxassetid://7923579098", 
			s = "rbxassetid://7852365915"
		}, 
		wool_white = {
			icon = "rbxassetid://7923579263", 
			s = "rbxassetid://7923579370"
		}, 
		wool_yellow = {
			icon = "rbxassetid://7923579520", 
			s = "rbxassetid://7923579645"
		}
	}, 
	emotes = {
		hannah_fear = "rbxassetid://10733652820", 
		hannah_fired_up = "rbxassetid://10733621576", 
		hannah_ghost_moment = "rbxassetid://10707558462", 
		hannah_ghosted = "rbxassetid://10729114155", 
		hannah_sorry_not = "rbxassetid://10707558734", 
		season3 = {
			angry_builder = "rbxassetid://9122597567", 
			archer = "rbxassetid://9122597665", 
			arson = "rbxassetid://9122597799", 
			axolotl_sleeping = "rbxassetid://9122597964", 
			axolotls = "rbxassetid://9122598110", 
			baker_thumbs_up = "rbxassetid://9122598218", 
			balloons = "rbxassetid://9122598368", 
			bee = "rbxassetid://9122598507", 
			boo = "rbxassetid://9122598598", 
			christmas_dodo = "rbxassetid://9122598699", 
			christmas_rocket = "rbxassetid://9122598784", 
			christmas_tree = "rbxassetid://9122598897", 
			duo = "rbxassetid://9122599001", 
			eldertree_gg = "rbxassetid://9122599072", 
			emerald_armor = "rbxassetid://9122599150", 
			freiya = "rbxassetid://9122599233", 
			freiya_2 = "rbxassetid://9122599332", 
			freiya_3 = "rbxassetid://9122599459", 
			freiya_snowman = "rbxassetid://9122599583", 
			heart = "rbxassetid://9122599758", 
			lucky_gift = "rbxassetid://9122599958", 
			pyro_coal = "rbxassetid://9122600089", 
			raven_sketch = "rbxassetid://9122600228", 
			reaper_gift = "rbxassetid://9122600302", 
			reindeer_rider = "rbxassetid://9122600382", 
			sad_gompy = "rbxassetid://9122600479", 
			selfie = "rbxassetid://9122600576", 
			stocking = "rbxassetid://9122600678", 
			teamwork = "rbxassetid://9122600769", 
			winstreak = "rbxassetid://9122600853", 
			worm_farmer = "rbxassetid://9122600904"
		}, 
		season4 = {
			academy_aery_gl = "rbxassetid://9122600993", 
			academy_aery_read = "rbxassetid://9122601118", 
			aery_killer_instinct = "rbxassetid://9122601258", 
			aery_pro = "rbxassetid://9122601390", 
			aery_winstreak = "rbxassetid://9122601467", 
			amy_no = "rbxassetid://9122601557", 
			archer_thumbs_down = "rbxassetid://9122601604", 
			barbarian_enraged = "rbxassetid://9122601682", 
			barbarian_wave = "rbxassetid://9122601797", 
			bounty_mad = "rbxassetid://9197100743", 
			builder_speechless = "rbxassetid://9122601912", 
			clan_invite = "rbxassetid://9122601993", 
			de_vanessa_speechless = "rbxassetid://9122602062", 
			dont_rush_me_pls = "rbxassetid://9122845965", 
			duck_celebration = "rbxassetid://9122602237", 
			elder_tree_injured = "rbxassetid://9122602355", 
			farmer_angry = "rbxassetid://9122602436", 
			freiya_surprised = "rbxassetid://9122602541", 
			grim_reaper_gg = "rbxassetid://9122602657", 
			grim_reaper_sticker = "rbxassetid://9122602760", 
			jade_gg = "rbxassetid://9122602876", 
			jade_heart = "rbxassetid://9122603021", 
			lassy_celebration = "rbxassetid://9122603187", 
			lassy_grab = "rbxassetid://9122603327", 
			miner_laugh = "rbxassetid://9122603492", 
			miner_uwu = "rbxassetid://9122603673", 
			nice = "rbxassetid://9134804330", 
			slay = "rbxassetid://9134804516", 
			space_miner_rage = "rbxassetid://9122603768", 
			spirit_catcher_lol = "rbxassetid://9122603870", 
			spirit_teamwork = "rbxassetid://9122603945", 
			to_battle = "rbxassetid://9122604025", 
			vulcan_loading = "rbxassetid://9122604141", 
			warrior_update_day = "rbxassetid://9122604241", 
			yuzi_hype = "rbxassetid://9122604360"
		}, 
		season5 = {
			baker_item_prot = "rbxassetid://9869089454", 
			baker_piece_of_cake = "rbxassetid://9869089602", 
			barb_u_shall_not_pass = "rbxassetid://9869104689", 
			builder_help = "rbxassetid://9869090079", 
			cletus_troll = "rbxassetid://9869090233", 
			cyber_dab = "rbxassetid://9869090487", 
			cyber_defense = "rbxassetid://9869090746", 
			cyber_mad = "rbxassetid://9869090944", 
			dino_hai = "rbxassetid://9869091312", 
			dino_rawr = "rbxassetid://9869091636", 
			dino_yipeee = "rbxassetid://9869091840", 
			freiya_hearts = "rbxassetid://9877587705", 
			jade_im_the_best = "rbxassetid://9877587939", 
			lumen_pain = "rbxassetid://9869092095", 
			lv50_duo_wombo_combo = "rbxassetid://9877588265", 
			melody_you_rock = "rbxassetid://9869092278", 
			metal_detector = "rbxassetid://9869092543", 
			oh_my_stars = "rbxassetid://9869092705", 
			raining_gems = "rbxassetid://9869092943", 
			raven_rip = "rbxassetid://9869093163", 
			reaper_got_em = "rbxassetid://9869093287", 
			smoke_wave = "rbxassetid://9869093445", 
			spirit_duo_ez = "rbxassetid://9877588501", 
			star_collector_fun = "rbxassetid://9869093655", 
			tesla_danger = "rbxassetid://9869093778", 
			tiger_well_played = "rbxassetid://9869094059", 
			vulcan_overheat = "rbxassetid://9877588678"
		}, 
		smoke_again = "rbxassetid://10707560478", 
		victorious_beta = "rbxassetid://9197101063", 
		zephyr_begone = "rbxassetid://10707560648", 
		zephyr_going_fast = "rbxassetid://10707560892"
	}, 
	healthbarfill = "rbxassetid://10013722579", 
	healthbarstroke = "rbxassetid://10013722726"
};
