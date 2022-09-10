-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "ratelimit");
local l__WrappedTypechecker__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "wrapped-typechecker").WrappedTypechecker;
local v6 = {};
local v7 = {};
local l__RunService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local l__Metric__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Metric;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
v7[1] = v2.Middleware.Global(function(p1, p2, p3)
	if not p3 then
		return nil;
	end;
	if not l__RunService__1:IsServer() then
		return nil;
	end;
	local u4 = false;
	local function u5(p4)
		if type(p4) == "number" then
			if p4 ~= p4 then
				u4 = true;
			end;
			if math.abs(p4) == math.huge then
				u4 = true;
				return;
			end;
		elseif type(p4) == "table" then
			for v8, v9 in pairs(p4) do
				u5(v9);
			end;
		end;
	end;
	local v10, v11, v12 = ipairs(p2);
	while true do
		v10(v11, v12);
		if not v10 then
			break;
		end;
		v12 = v10;
		u5(v11);	
	end;
	if u4 then
		l__Flamework__3.resolveDependency("@easy-games/game-core:server/services/metrics-service@MetricsService"):publishMetric((l__Metric__2.new("flagged-remote-number-check"):tag("remote-name", p1):tag("place-version", tostring(game.PlaceVersion)):fieldInteger("user", p3.UserId)));
		error("Player " .. p3.Name .. " sent NaN or math.huge over a remote");
	end;
end);
return {
	default = v2.Definitions.Create({
		Leaderboard = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "leaderboard"), 
		CustomMatches = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "custom-matches-remotes"), 
		Locker = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "locker-remotes"), 
		BattlePass = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "battle-pass-remotes").BattlePassRemotesNamespace, 
		SocialConnections = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "social-connections-remotes"), 
		Gift = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "gift-remotes"), 
		ChargeShield = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "charge-shield-remotes"), 
		Update = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "update-remotes").default, 
		Inventory = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "inventory-remotes"), 
		Clans = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "clans-remotes"), 
		VendingMachine = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-remotes"), 
		SheepHerder = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "sheep-herder", "sheep-herder-remotes"), 
		Disaster = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-remotes"), 
		ThemedEvent = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-remotes"), 
		Vehicle = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "vehicle-remotes").VehicleRemotes, 
		Helicopter = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "helicopter-remotes").HelicopterRemotes, 
		Gamemode = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gamemode", "gamemode-remotes"), 
		Event = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "event-remotes").EventRemotes, 
		PirateSceneRemotes = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remote-namespaces", "pirate-scene-remotes"), 
		avelOiWeZnBxYijj = v2.Definitions.ServerFunction(), 
		kobagqctdcrVziqracdrnruh = v2.Definitions.ClientToServerEvent(), 
		QpmeUmuogkekQeIev = v2.Definitions.ClientToServerEvent(), 
		ovmlTlfy = v2.Definitions.ClientToServerEvent(), 
		nEtgskKwtjELgkiHo = v2.Definitions.ClientToServerEvent(), 
		efoddewklqykw = v2.Definitions.ClientToServerEvent(), 
		XgWtHswpQpivsuzcldF = v2.Definitions.ClientToServerEvent(), 
		TwGdllvyg = v2.Definitions.ClientToServerEvent(), 
		AutoTurretFired = v2.Definitions.ClientToServerEvent(), 
		lupmrusimqyGQystnpO = v2.Definitions.ClientToServerEvent(), 
		FetchServerRegion = v2.Definitions.ServerFunction(), 
		GetPlayerPermissions = v2.Definitions.ServerFunction(), 
		BanPlayer = v2.Definitions.ServerAsyncFunction(), 
		SelfReport = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("injection_detected")), v2.Middleware.RateLimit({
				MaxRequestsPerMinute = 1, 
				ErrorHandler = v4
			}) }), 
		PlayerConnect = v2.Definitions.ClientToServerEvent(), 
		PlayerReady = v2.Definitions.ClientToServerEvent(), 
		AnnouncementEvent = v2.Definitions.ServerToClientEvent(), 
		angleChanged = v2.Definitions.ServerToClientEvent(), 
		VoidPortalUsed = v2.Definitions.ServerToClientEvent(), 
		shockWaveRelease = v2.Definitions.ServerToClientEvent(), 
		AutoTurretPlaced = v2.Definitions.ServerToClientEvent(), 
		RocketBeltLaunch = v2.Definitions.ServerToClientEvent(), 
		PirateFlagPlaced = v2.Definitions.ServerToClientEvent(), 
		oynnqeZsTfnFKwocrbzdpnsyygfR = v2.Definitions.ServerToClientEvent(), 
		wtbZhDfzfmfhbaqwmrsHulUQt = v2.Definitions.ServerToClientEvent(), 
		BombExplosion = v2.Definitions.ServerToClientEvent(), 
		iSKgevcFmbimnbmzIyzgnC = v2.Definitions.ServerToClientEvent(), 
		HealthDropBelowThresholdHannah = v2.Definitions.ServerToClientEvent(), 
		HealthHealAboveThresholdHannah = v2.Definitions.ServerToClientEvent(), 
		HannahTeleport = v2.Definitions.ServerToClientEvent(), 
		flDcpswVkv = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		uibmKuVwekauhtnqrsgfmsst = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		Zufirplqvtkf = v2.Definitions.ClientToServerEvent(), 
		piwyffepesu = v2.Definitions.ServerFunction(), 
		zfwqhkgoqmWrm = v2.Definitions.ServerFunction(), 
		tesjziswylxDhhflzviuPpkttqacnuegbc = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		USEypajqrvekplejdnlEkinxxcqpfcpunyyi = v2.Definitions.ClientToServerEvent(), 
		hdvzbfL = v2.Definitions.ServerFunction(), 
		yngisngrpzw = v2.Definitions.ServerFunction(), 
		yAzvpzmdjoSetnaMolmNb = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
				MaxRequestsPerMinute = 30, 
				ErrorHandler = v4
			}) }), 
		KkxTfpqKrUxtygVuiowwmmfoeeeLhqpuvckvlE = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
				MaxRequestsPerMinute = 30, 
				ErrorHandler = v4
			}) }), 
		BedwarsUpgradeGenerator = v2.Definitions.ServerFunction(), 
		BedwarsPurchaseItem = v2.Definitions.ServerFunction(), 
		BedwarsPurchaseTeamUpgrade = v2.Definitions.ServerFunction(), 
		BedwarsPurchaseShopCategoryUnlock = v2.Definitions.ServerFunction(), 
		BedwarsHarvestCrop = v2.Definitions.ServerFunction(), 
		TeleportToGame = v2.Definitions.ClientToServerEvent(), 
		RequestKitUpdate = v2.Definitions.ClientToServerEvent(), 
		BedwarsActivateKit = v2.Definitions.ServerFunction(), 
		BedwarsSetUseKitSkin = v2.Definitions.ServerFunction(), 
		BedwarsEquipKitSkin = v2.Definitions.ServerFunction(), 
		sosrmbzcivgNTsdwyowtpnztoExmqBnvYti = v2.Definitions.ClientToServerEvent(), 
		eqaaMermgoiukeIbuzemBhMOhmwua = v2.Definitions.ServerFunction(), 
		Bld = v2.Definitions.ServerFunction(), 
		fCfvREgvxghcXvOaq = v2.Definitions.ClientToServerEvent(), 
		ZkpwDndknfnjjmcsVhsi = v2.Definitions.ClientToServerEvent(), 
		tdptbOpmrTlnqHvjtcyvxkbGb = v2.Definitions.ClientToServerEvent(), 
		WMcMiwxqiBniwouvmDS = v2.Definitions.ClientToServerEvent(), 
		qfbaGyogkwdVcdtyapakhzRtXzecc = v2.Definitions.ClientToServerEvent(), 
		pzyJcAqIerMpjlmzqctkaKt = v2.Definitions.ClientToServerEvent(), 
		szzbikzKgKxwniqllcujjWwhaVrb = v2.Definitions.ClientToServerEvent(), 
		xMahfslWzZdqQwAxmucut = v2.Definitions.ServerFunction(), 
		PxzZi = v2.Definitions.ServerFunction(), 
		usqgWJvj = v2.Definitions.ServerFunction(), 
		MyZbQvobSqhmcibdeJjiyv = v2.Definitions.ClientToServerEvent(), 
		VabjtaYthkx = v2.Definitions.ClientToServerEvent(), 
		KkrlrspnZjoaxlgMkjfbliILmNiShawkmz = v2.Definitions.ClientToServerEvent(), 
		guFlqQgt = v2.Definitions.ServerFunction(), 
		atroCyipicnaRtdmtfkcSkcqggrRkcRVk = v2.Definitions.ClientToServerEvent(), 
		mimusrtlowohvlpKsezCmwhx = v2.Definitions.ClientToServerEvent(), 
		npkoxNvleZypofsholrGjknb = v2.Definitions.ClientToServerEvent(), 
		ropHpogksaktcDFombbkovzYS = v2.Definitions.ClientToServerEvent(), 
		wdsJxjlJwwzja = v2.Definitions.ServerFunction(), 
		tMytgLqn = v2.Definitions.ServerFunction(), 
		NxuglynfuhhRcsNuqDspvusfpbcoPtwjl = v2.Definitions.ServerFunction(), 
		yyzlldxtrblkraaccbh = v2.Definitions.ServerFunction(), 
		BDndzkBOEqtl = v2.Definitions.ServerFunction(), 
		dvxhocngnfxpuxs = v2.Definitions.ServerFunction(), 
		lAQsbVtcacwdfkfM = v2.Definitions.ServerFunction(), 
		bbihWzsbk = v2.Definitions.ServerFunction(), 
		wHwiziqSbdZuH = v2.Definitions.ServerFunction(), 
		JbrwdzFcMSrxfuhD = v2.Definitions.ServerFunction(), 
		mjxbRob = v2.Definitions.ServerFunction(), 
		xbPll = v2.Definitions.ServerFunction(), 
		bngTJqwaiQMvfivrnlmmjFkabtczkzfmtqwbteeyug = v2.Definitions.ServerFunction(), 
		gvkfXfBfumoLnrn = v2.Definitions.ServerFunction(), 
		OkggtTdcpN = v2.Definitions.ServerFunction(), 
		udjuPxmpxkr = v2.Definitions.ServerFunction(), 
		UuquFKrjrmichff = v2.Definitions.ClientToServerEvent(), 
		yjjv = v2.Definitions.ServerToClientEvent(), 
		cwdlsyanbjjsyXimdvktrntklVKjtyhiFylgYdRzNewoC = v2.Definitions.ServerToClientEvent(), 
		ntuxJgraAem = v2.Definitions.ServerToClientEvent(), 
		fimdtZy = v2.Definitions.ClientToServerEvent(), 
		wwxczukxjxLBhkaFc = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		ddfsgmMcncgiyHw = v2.Definitions.ClientToServerEvent(), 
		UwfenxwkvwluwwiifcmXsadbZowtaik = v2.Definitions.ClientToServerEvent(), 
		oGwyhysfsrjpxfXOozwjhucgkmLk = v2.Definitions.ClientToServerEvent(), 
		xfoDppicquCgwrya = v2.Definitions.ClientToServerEvent(), 
		ndwtgkjcjnvscbjzAv = v2.Definitions.ClientToServerEvent(), 
		wqTTcmiBihftfuudBacpvpUNnJkip = v2.Definitions.ClientToServerEvent(), 
		bEsRkqHtkxbwkFoJmkcfGtlvmeuzbIOczawmigV = v2.Definitions.ClientToServerEvent(), 
		jotWnXnr = v2.Definitions.ClientToServerEvent(), 
		jfnmmbzNdRnnOTfjkzkgkKofsuqkewm = v2.Definitions.ClientToServerEvent(), 
		pfusdqnyujokbnylih = v2.Definitions.ClientToServerEvent(), 
		FhfGbzqcx = v2.Definitions.ClientToServerEvent(), 
		yGhUkqmhaeweoryJfEhi = v2.Definitions.ServerFunction(), 
		nprAusajybEbtoyiDdydExRlCsgs = v2.Definitions.ClientToServerEvent(), 
		ycctflgxpptjgGtlc = v2.Definitions.ServerFunction(), 
		ycnnfsxmjc = v2.Definitions.ClientToServerEvent(), 
		guvoquxzm = v2.Definitions.ClientToServerEvent(), 
		SfobneqqlkxaEtyrEfmfnM = v2.Definitions.ClientToServerEvent(), 
		igheyLtsxizbsnylnqdpnafv = v2.Definitions.ClientToServerEvent(), 
		wlwxdumNvztflEwodfncmHmhAplxna = v2.Definitions.ClientToServerEvent(), 
		duhtgcoksWa = v2.Definitions.ClientToServerEvent(), 
		hsfkzjrpvbpmkrGRrRpdG = v2.Definitions.ServerFunction(), 
		hbbardpcdYuEcmbw = v2.Definitions.ClientToServerEvent(), 
		zfoymiDskzPansAyrfiaRk = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		rwldcQKtZC = v2.Definitions.ServerFunction(), 
		vpRObwaXutdUkUFrci = v2.Definitions.ServerFunction(), 
		AyfgdXkkvfvecLvu = v2.Definitions.ServerFunction(), 
		EnprjwzqrvuujOzIfjycfoe = v2.Definitions.ClientToServerEvent(), 
		vibnevfLjafsSjNmzcGyjbkbjmbuvPj = v2.Definitions.ClientToServerEvent(), 
		iqzcsgfbgfgzYnb = v2.Definitions.ClientToServerEvent(), 
		gbbrocqEySnobBjyxQfojucagS = v2.Definitions.ClientToServerEvent(), 
		krvWxmmcvdaloecQydvsjmfGg = v2.Definitions.ClientToServerEvent(), 
		msNpvsuoHjpmnNvu = v2.Definitions.ClientToServerEvent(), 
		ebnoiapwqmemkjpjzspsxufwTcydCm = v2.Definitions.ClientToServerEvent(), 
		rrvwkfdpUCeTyesjv = v2.Definitions.ClientToServerEvent(), 
		aYKIfrobcrloduzcgEpvMens = v2.Definitions.ClientToServerEvent(), 
		RequestStatusUpdate = v2.Definitions.ClientToServerEvent(), 
		tzxRhpLVCnppjDizsBajxsfuemfiuwZFmBBSmcuqot = v2.Definitions.ClientToServerEvent(), 
		jcpaoddy = v2.Definitions.ClientToServerEvent(), 
		ksjfFwqotmqlmguoplhimnfralrANixgsioCniukjl = v2.Definitions.ClientToServerEvent(), 
		GetServerUnixTime = v2.Definitions.ServerFunction(), 
		DebugGetServerStartedTime = v2.Definitions.ServerFunction(), 
		ChatMakeSystemMessage = v2.Definitions.ServerToClientEvent(), 
		EntityDamageEvent = v2.Definitions.ServerToClientEvent(), 
		EntityDeathEvent = v2.Definitions.ServerToClientEvent(), 
		TeamsUpdateEvent = v2.Definitions.ServerToClientEvent(), 
		RequestTeamsUpdateEvent = v2.Definitions.ClientToServerEvent(), 
		KitsUpdateEvent = v2.Definitions.ServerToClientEvent(), 
		LandmineExplode = v2.Definitions.ServerToClientEvent(), 
		MatchStateEvent = v2.Definitions.ServerToClientEvent(), 
		QueueTypeEvent = v2.Definitions.ServerToClientEvent(), 
		MatchEndEvent = v2.Definitions.ServerToClientEvent(), 
		PlayerEarlyLeaveEvent = v2.Definitions.ServerToClientEvent(), 
		PickupItemEvent = v2.Definitions.ServerToClientEvent(), 
		ExplosionEffect = v2.Definitions.ServerToClientEvent(), 
		RocketLauncherMissileExplode = v2.Definitions.ServerToClientEvent(), 
		PlayTelescopeEffect = v2.Definitions.ServerToClientEvent(), 
		LReuypyfzkusxxtqcdszyjLpI = v2.Definitions.ServerToClientEvent(), 
		CarrotRocketExplode = v2.Definitions.ServerToClientEvent(), 
		BobaStickEvent = v2.Definitions.ServerToClientEvent(), 
		BombStickEvent = v2.Definitions.ServerToClientEvent(), 
		FireworkStickEvent = v2.Definitions.ServerToClientEvent(), 
		BedwarsShopCategoriesUpdate = v2.Definitions.ServerToClientEvent(), 
		BedwarsSetAllTeamUpgrades = v2.Definitions.ServerToClientEvent(), 
		BedwarsSetTeamUpgradeTier = v2.Definitions.ServerToClientEvent(), 
		ProjectileImpact = v2.Definitions.ServerToClientEvent(), 
		ProjectileLaunch = v2.Definitions.ServerToClientEvent(), 
		ProjectileLaunchClient = v2.Definitions.ServerToClientEvent(), 
		KitUpdate = v2.Definitions.ServerToClientEvent(), 
		HarvestCrop = v2.Definitions.ServerToClientEvent(), 
		BlockFortified = v2.Definitions.ServerToClientEvent(), 
		BillboardRiseEffect = v2.Definitions.ServerToClientEvent(), 
		SpectatePlayer = v2.Definitions.ServerToClientEvent(), 
		StopSpectating = v2.Definitions.ServerToClientEvent(), 
		ShieldBlocked = v2.Definitions.ServerToClientEvent(), 
		GuitarHeal = v2.Definitions.ServerToClientEvent(), 
		GuitarDamage = v2.Definitions.ServerToClientEvent(), 
		EntityHeal = v2.Definitions.ServerToClientEvent(), 
		CannonFired = v2.Definitions.ServerToClientEvent(), 
		BalloonInflated = v2.Definitions.ServerToClientEvent(), 
		BalloonPopped = v2.Definitions.ServerToClientEvent(), 
		BedwarsBedBreak = v2.Definitions.ServerToClientEvent(), 
		BedwarsSuddenDeath = v2.Definitions.ServerToClientEvent(), 
		TreeOrbSpawn = v2.Definitions.ServerToClientEvent(), 
		FireballExplode = v2.Definitions.ServerToClientEvent(), 
		SpawnGrimReaperSoul = v2.Definitions.ServerToClientEvent(), 
		SpawnSpiritOrb = v2.Definitions.ServerToClientEvent(), 
		SpawnTreasureChest = v2.Definitions.ServerToClientEvent(), 
		DestroyTreasureChest = v2.Definitions.ServerToClientEvent(), 
		EntityConsumeGrimReaperSoul = v2.Definitions.ServerToClientEvent(), 
		SpawnWindWalkerOrb = v2.Definitions.ServerToClientEvent(), 
		WindWalkerSpeedUpdate = v2.Definitions.ServerToClientEvent(), 
		WindWalkerSpawned = v2.Definitions.ServerToClientEvent(), 
		WindWalkerEffect = v2.Definitions.ServerToClientEvent(), 
		SpiritAssassinSpeedUpdate = v2.Definitions.ServerToClientEvent(), 
		SpiritAssassinUseSpirit = v2.Definitions.ServerToClientEvent(), 
		SpiritAssassinLanded = v2.Definitions.ServerToClientEvent(), 
		LightningStrike = v2.Definitions.ServerToClientEvent(), 
		AttachElectricOrb = v2.Definitions.ServerToClientEvent(), 
		DetachElectricOrb = v2.Definitions.ServerToClientEvent(), 
		BeeSpawn = v2.Definitions.ServerToClientEvent(), 
		BeeRemoved = v2.Definitions.ServerToClientEvent(), 
		CollectableEntitySpawn = v2.Definitions.ServerToClientEvent(), 
		CollectableEntityRemoved = v2.Definitions.ServerToClientEvent(), 
		RavenExploded = v2.Definitions.ServerToClientEvent(), 
		RobuxPurchaseSuccess = v2.Definitions.ServerToClientEvent(), 
		BedAlarmTriggered = v2.Definitions.ServerToClientEvent(), 
		BountyHunterTargetChanged = v2.Definitions.ServerToClientEvent(), 
		BountyHunterRewardClaimed = v2.Definitions.ServerToClientEvent(), 
		SpiritExplosion = v2.Definitions.ServerToClientEvent(), 
		TeslaTrapTargetsChanged = v2.Definitions.ServerToClientEvent(), 
		oKhUnjrktSkejJfsXVwi = v2.Definitions.ServerToClientEvent(), 
		HealingBackpackEffect = v2.Definitions.ServerToClientEvent(), 
		HealingBackpackSound = v2.Definitions.ServerToClientEvent(), 
		VoidArmorShieldTrigger = v2.Definitions.ServerToClientEvent(), 
		AngelProgress = v2.Definitions.ServerToClientEvent(), 
		AngelOrb = v2.Definitions.ServerToClientEvent(), 
		LumenProgress = v2.Definitions.ServerToClientEvent(), 
		EmberProgress = v2.Definitions.ServerToClientEvent(), 
		PiggyBankIncrement = v2.Definitions.ServerToClientEvent(), 
		PiggyBankPop = v2.Definitions.ServerToClientEvent(), 
		DodoBirdInteraction = v2.Definitions.ServerToClientEvent(), 
		Nuke = v2.Definitions.ServerToClientEvent(), 
		skaskklpzlbwdQrCfzfqcc = v2.Definitions.ServerToClientEvent(), 
		Distraction = v2.Definitions.ServerToClientEvent(), 
		SnapTrapSnared = v2.Definitions.ServerToClientEvent(), 
		SnapTrapMarkConsumed = v2.Definitions.ServerToClientEvent(), 
		FishFound = v2.Definitions.ServerToClientEvent(), 
		FishCaught = v2.Definitions.ServerToClientEvent(), 
		SpearImpactEffect = v2.Definitions.ServerToClientEvent(), 
		OilSpill = v2.Definitions.ServerToClientEvent(), 
		SantaStrafeEffect = v2.Definitions.ServerToClientEvent(), 
		ShowRankedRestriction = v2.Definitions.ServerToClientEvent(), 
		StopwatchActivated = v2.Definitions.ServerToClientEvent(), 
		StopwatchExpired = v2.Definitions.ServerToClientEvent(), 
		MatchRankReport = v2.Definitions.ServerToClientEvent(), 
		Tase = v2.Definitions.ServerToClientEvent(), 
		ForcePlayAnimation = v2.Definitions.ServerToClientEvent(), 
		PirateDigTreasure = v2.Definitions.ServerToClientEvent(), 
		GuidedProjectileDetonated = v2.Definitions.ServerToClientEvent(), 
		Fling = v2.Definitions.ServerToClientEvent(), 
		ParachuteDrop = v2.Definitions.ServerToClientEvent(), 
		HugeLuckyBlockEvent = v2.Definitions.ServerToClientEvent(), 
		StatusEffectActivatedEvent = v2.Definitions.ServerToClientEvent(), 
		IceQueenProgress = v2.Definitions.ServerToClientEvent(), 
		IceQueenFreeze = v2.Definitions.ServerToClientEvent(), 
		FireAspectHit = v2.Definitions.ServerToClientEvent(), 
		StaticHit = v2.Definitions.ServerToClientEvent(), 
		LifeStealHit = v2.Definitions.ServerToClientEvent(), 
		AeryGiveButterfly = v2.Definitions.ServerToClientEvent(), 
		EnchantTableRepair = v2.Definitions.ServerToClientEvent(), 
		EnchantTableResearch = v2.Definitions.ServerToClientEvent(), 
		YetiAbility = v2.Definitions.ServerToClientEvent(), 
		PirateFlagRemoved = v2.Definitions.ServerToClientEvent(), 
		LaunchPadUsed = v2.Definitions.ServerToClientEvent(), 
		VoidAxeLeap = v2.Definitions.ServerToClientEvent(), 
		PlayGameMusic = v2.Definitions.ServerToClientEvent(), 
		FireworkArrowExplode = v2.Definitions.ServerToClientEvent(), 
		OpenLuckyBlock = v2.Definitions.ServerToClientEvent(), 
		TwirlbladeSpin = v2.Definitions.ServerToClientEvent(), 
		HellBladeSpin = v2.Definitions.ServerToClientEvent(), 
		PlunderProc = v2.Definitions.ServerToClientEvent(), 
		MerchantDiscountApplied = v2.Definitions.ServerToClientEvent(), 
		orsuFvckfgaeI = v2.Definitions.ServerToClientEvent(), 
		dzsvydltvvvynxdIdtzQzWnzxIiwfsnqdmmHmeG = v2.Definitions.ServerToClientEvent(), 
		rotsnxiujypeugmenDlmpryxikVxcDTx = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		MerchantItems = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		RPSEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		CoinTossEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		kzXRlvnyxi = v2.Definitions.ServerToClientEvent(), 
		niqiUvdqizlqiqmH = v2.Definitions.ServerToClientEvent(), 
		kzXRlvnyxi = v2.Definitions.ServerToClientEvent(), 
		FcHjsidlRJGSlfmzzhhfzaxhNhNrr = v2.Definitions.ServerToClientEvent(), 
		bytIsclzNjqBolqwideLqgQuzGzG = v2.Definitions.ServerToClientEvent(), 
		fluBxuyOxgyUjdazq = v2.Definitions.ServerToClientEvent(), 
		ccjlv = v2.Definitions.ServerToClientEvent(), 
		khqtdeQfpm = v2.Definitions.ClientToServerEvent(), 
		gtmagmWzpmhsstYyykgUrmrEecWspjkC = v2.Definitions.ServerToClientEvent(), 
		aEbadwxTvwshcNPyw = v2.Definitions.ServerToClientEvent(), 
		cffxxKcvVexzt = v2.Definitions.ServerToClientEvent(), 
		eeowdGcuxuksThcwdKAh = v2.Definitions.ClientToServerEvent(), 
		ydyvepgttuvqMidk = v2.Definitions.ServerToClientEvent(), 
		rxdzazmfFmdhoyycbvvxeknk = v2.Definitions.ServerToClientEvent(), 
		tdrvtwtQcoksqbcpjnUmuqhqxppzf = v2.Definitions.ServerToClientEvent(), 
		kaEyNftutiyologsjrpobxbsqo = v2.Definitions.ServerToClientEvent(), 
		wewlBoTlcEbdyncyNCqhoUDtegactje = v2.Definitions.ServerToClientEvent(), 
		ghjvdzvln = v2.Definitions.ServerToClientEvent(), 
		issIpfxlpvnTFGldtOkqyhXMjIlrtCydKJfoBblh = v2.Definitions.ServerToClientEvent(), 
		jhvxsiLJFuskCstaIRocfrlbCnMDIG = v2.Definitions.ServerToClientEvent(), 
		yPsBnahGmXlCcjbqa = v2.Definitions.ServerToClientEvent(), 
		gjzmiafRbozfmr = v2.Definitions.ServerToClientEvent(), 
		odsoMypnnmcbwehijgtressZxpriof = v2.Definitions.ServerToClientEvent(), 
		fxsqwazinmHspkuc = v2.Definitions.ServerToClientEvent(), 
		mkigvzWfytqlVxbisjkwmtnydym = v2.Definitions.ServerToClientEvent(), 
		dvdcabzfbvzxMgbscsOKub = v2.Definitions.ServerToClientEvent(), 
		xllgwameremiRge = v2.Definitions.ServerToClientEvent(), 
		eymdpfcxfktquleglFuDdolubtkbmv = v2.Definitions.ServerToClientEvent(), 
		JnDmraLovivnmtalkonezfaqWwEumgxt = v2.Definitions.ServerToClientEvent(), 
		vadnvkgueiamyqdbtsSqhsqsdjjx = v2.Definitions.ServerToClientEvent(), 
		hJGEyzcglTivSe = v2.Definitions.ServerToClientEvent(), 
		mkLQXxEvbqrB = v2.Definitions.ServerToClientEvent(), 
		vLBdfysddZpf = v2.Definitions.ServerToClientEvent(), 
		tyejtqzojguxbakjvhnqgheimdxl = v2.Definitions.ServerToClientEvent(), 
		pFiadhcqafoKhtqu = v2.Definitions.ServerToClientEvent(), 
		aeuKnFUfwiscdytpkevxvhgouycxbenue = v2.Definitions.ServerToClientEvent(), 
		bczMajvdxa = v2.Definitions.ClientToServerEvent(), 
		kgtpduvvcImmVqtljo = v2.Definitions.ServerToClientEvent(), 
		gkdhrjjVvrxehhn = v2.Definitions.ServerToClientEvent(), 
		dDobzawqhadXtqNycEwwnfGeipexw = v2.Definitions.ServerFunction(), 
		lcgomu = v2.Definitions.ServerFunction(), 
		rhwtSzqaZtcidMjgk = v2.Definitions.ServerToClientEvent(), 
		wosfhjyGsnsLzdAH = v2.Definitions.ServerToClientEvent(), 
		euUfdfseAbctMQSqkafqnmyzofckgscglnmQ = v2.Definitions.ServerToClientEvent(), 
		zlbxQynhmgjsh = v2.Definitions.ServerToClientEvent(), 
		zoXcyHxaNfazYqacUdDcRbkkmb = v2.Definitions.ServerToClientEvent(), 
		KDjfwmtfCntlDdoidY = v2.Definitions.ServerToClientEvent(), 
		ytixqbjlhfsdbV = v2.Definitions.ServerToClientEvent(), 
		qjDVrdxxfehdfiZxjmuzqMsgheQ = v2.Definitions.ServerToClientEvent(), 
		byfraeoimUrfYz = v2.Definitions.ServerToClientEvent(), 
		vIkbvwl = v2.Definitions.ServerToClientEvent(), 
		GlitchExplosion = v2.Definitions.ServerToClientEvent()
	}, v7)
};
