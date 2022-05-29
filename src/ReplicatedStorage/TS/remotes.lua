-- Script Hash: 3ee7b4d24a002a922d9dee0a226eae7eb42797bde60ff1be9f45750d9df09017d84d118c588b0dc61dacad9f28eb68c9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
local l__t__3 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "ratelimit");
local l__WrappedTypechecker__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "net-middleware", "wrapped-typechecker").WrappedTypechecker;
local v6 = {};
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
		Lcu = v2.Definitions.ServerFunction(), 
		QbfswnpkhaCir = v2.Definitions.ClientToServerEvent(), 
		jsnLpxmlShjH = v2.Definitions.ClientToServerEvent(), 
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
		htzxzilhkhy = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		tEtrBmqlirvqGak = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		kCreofeiooqnvgNfsNyqliGvmUemwnzkdygtibce = v2.Definitions.ClientToServerEvent(), 
		yrctrolenck = v2.Definitions.ServerFunction(), 
		ttcwzepTgycjpdDP = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		vysmlWcfmeenv = v2.Definitions.ClientToServerEvent(), 
		uoEkbuvlzt = v2.Definitions.ServerFunction(), 
		jjojwpvqKweujmrgglpxP = v2.Definitions.ServerFunction(), 
		gTbqneruowUIppwLjufHppliqkty = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
				MaxRequestsPerMinute = 30, 
				ErrorHandler = v4
			}) }), 
		BedwarsUpgradeGenerator = v2.Definitions.ServerFunction(), 
		BedwarsPurchaseItem = v2.Definitions.ServerFunction(), 
		BedwarsPurchaseTeamUpgrade = v2.Definitions.ServerFunction(), 
		BedwarsHarvestCrop = v2.Definitions.ServerFunction(), 
		TeleportToGame = v2.Definitions.ClientToServerEvent(), 
		RequestKitUpdate = v2.Definitions.ClientToServerEvent(), 
		BedwarsActivateKit = v2.Definitions.ServerFunction(), 
		BedwarsSetUseKitSkin = v2.Definitions.ServerFunction(), 
		BedwarsEquipKitSkin = v2.Definitions.ServerFunction(), 
		iJgmmjokkepWpYMwcval = v2.Definitions.ClientToServerEvent(), 
		iqsuadqrzOexLdvrdj = v2.Definitions.ServerFunction(), 
		tagncufpROojjde = v2.Definitions.ServerFunction(), 
		xiwecgvvasvwuwkd = v2.Definitions.ClientToServerEvent(), 
		gzvslebtlssSotJk = v2.Definitions.ClientToServerEvent(), 
		tyssbfXYbvx = v2.Definitions.ClientToServerEvent(), 
		lrajdgfoFkbm = v2.Definitions.ClientToServerEvent(), 
		mojecbssEYqexGAmocvcrycQpW = v2.Definitions.ServerFunction(), 
		glpnzEysoprbr = v2.Definitions.ClientToServerEvent(), 
		qyrujwxm = v2.Definitions.ClientToServerEvent(), 
		chmbcEckbxrigitZfo = v2.Definitions.ClientToServerEvent(), 
		fbljheiBlIcdjdzkQglrgjeumsfcXg = v2.Definitions.ServerFunction(), 
		pnNxkddiSXiUeqldvadb = v2.Definitions.ClientToServerEvent(), 
		xznbvtkw = v2.Definitions.ClientToServerEvent(), 
		oXikzfurGgzoptddzzutbrgGfvdoaiIhv = v2.Definitions.ClientToServerEvent(), 
		wUtfteqtpjk = v2.Definitions.ClientToServerEvent(), 
		rkolkuzulhSajasaqcFb = v2.Definitions.ServerFunction(), 
		dtcnoxwQbdsuaybagfIyaoxj = v2.Definitions.ServerFunction(), 
		nydsmfgQywryriffxp = v2.Definitions.ServerFunction(), 
		qyyqUCSgrfPnajbgEoC = v2.Definitions.ServerFunction(), 
		oJByRtfo = v2.Definitions.ServerFunction(), 
		jktkacbeklmcdd = v2.Definitions.ServerFunction(), 
		cebkvjltX = v2.Definitions.ServerFunction(), 
		kxwqfplbHumjJjGcjknrpts = v2.Definitions.ServerFunction(), 
		tQgthiQgkNrUhroTeOxstskronvbXaspjm = v2.Definitions.ServerFunction(), 
		tigHzdgjtRGzdnnnOmeyptmzZhvkRptilaublpd = v2.Definitions.ClientToServerEvent(), 
		bxfhryyz = v2.Definitions.ServerToClientEvent(), 
		jvvrlniQjardqiflgzbz = v2.Definitions.ServerToClientEvent(), 
		dkywtbhroineghtVmgsGdiUmGhygrnjwCzgxnpdbuzv = v2.Definitions.ServerToClientEvent(), 
		jurk = v2.Definitions.ClientToServerEvent(), 
		BvurPeiztlymZjwqykqbmccwRpwbjLk = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		mnwbwMf = v2.Definitions.ClientToServerEvent(), 
		gaOzDUubong = v2.Definitions.ClientToServerEvent(), 
		mxMqkjcokmoqtjycQvjtnhYWolrG = v2.Definitions.ClientToServerEvent(), 
		armQikmorspgsMFYeajVRwxeUdcxsYrngy = v2.Definitions.ClientToServerEvent(), 
		AksbjCARyUrFzoPbVvksNryeieMqnpk = v2.Definitions.ClientToServerEvent(), 
		Wwlsoqnlsygd = v2.Definitions.ClientToServerEvent(), 
		zzZXGymxiekDgjhbcy = v2.Definitions.ClientToServerEvent(), 
		vbyimnrpipzb = v2.Definitions.ClientToServerEvent(), 
		lmlueoscAfzsltcuHbs = v2.Definitions.ClientToServerEvent(), 
		xqTgzqYwgpttmlcsa = v2.Definitions.ClientToServerEvent(), 
		euCldNwxc = v2.Definitions.ServerFunction(), 
		LjeDlitrXsZhqEFy = v2.Definitions.ClientToServerEvent(), 
		xZscoirpacncIm = v2.Definitions.ServerFunction(), 
		VUvdFumvbogqryS = v2.Definitions.ClientToServerEvent(), 
		clihwkkGhodXygvoptepwcYzdhFfwz = v2.Definitions.ClientToServerEvent(), 
		DGmfsroyzeHtjlkcfHBkerpqOxsa = v2.Definitions.ClientToServerEvent(), 
		xVZqs = v2.Definitions.ClientToServerEvent(), 
		jgpckgflykuqqrmwmnSoucuerfpYkmvjsFzOiXYubwDwc = v2.Definitions.ClientToServerEvent(), 
		slUmefxoJNztjyneNzmn = v2.Definitions.ClientToServerEvent(), 
		bmeupzYpzfxeidVdrcGmzvGuebDs = v2.Definitions.ServerFunction(), 
		zysfheircvhzoWlvterexpxkiswpbzGafeodYTtqO = v2.Definitions.ClientToServerEvent(), 
		yDmmurpzilJuvAsdpfbmFlq = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		ehXtecxiVgthzuclxnVToiCitGyfb = v2.Definitions.ServerFunction(), 
		sWveBmyijjdLNqqEudaGioxo = v2.Definitions.ServerFunction(), 
		fsfflamhmcmG = v2.Definitions.ClientToServerEvent(), 
		wykuMrbkqcrnl = v2.Definitions.ClientToServerEvent(), 
		Vnijwhr = v2.Definitions.ClientToServerEvent(), 
		LcEjjvxQfSzcorj = v2.Definitions.ClientToServerEvent(), 
		plcdlbmwuwdyvdkc = v2.Definitions.ClientToServerEvent(), 
		xodxpairdicdp = v2.Definitions.ClientToServerEvent(), 
		iXxseklEuxkycwiyvfpmknmdygmQzbmb = v2.Definitions.ClientToServerEvent(), 
		yvYvnSukuySsbxjxeaLBlfsbfzr = v2.Definitions.ClientToServerEvent(), 
		zsXoXlzruoPunFB = v2.Definitions.ClientToServerEvent(), 
		crrht = v2.Definitions.ClientToServerEvent(), 
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
		utygcpiftYiFAhznrdqsuWrh = v2.Definitions.ServerToClientEvent(), 
		CarrotRocketExplode = v2.Definitions.ServerToClientEvent(), 
		BobaStickEvent = v2.Definitions.ServerToClientEvent(), 
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
		EntityHeal = v2.Definitions.ServerToClientEvent(), 
		CannonFired = v2.Definitions.ServerToClientEvent(), 
		BalloonInflated = v2.Definitions.ServerToClientEvent(), 
		BalloonPopped = v2.Definitions.ServerToClientEvent(), 
		BedwarsBedBreak = v2.Definitions.ServerToClientEvent(), 
		BedwarsSuddenDeath = v2.Definitions.ServerToClientEvent(), 
		TreeOrbSpawn = v2.Definitions.ServerToClientEvent(), 
		FireballExplode = v2.Definitions.ServerToClientEvent(), 
		SpawnGrimReaperSoul = v2.Definitions.ServerToClientEvent(), 
		EntityConsumeGrimReaperSoul = v2.Definitions.ServerToClientEvent(), 
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
		aGsTnfxp = v2.Definitions.ServerToClientEvent(), 
		AngelProgress = v2.Definitions.ServerToClientEvent(), 
		AngelOrb = v2.Definitions.ServerToClientEvent(), 
		LumenProgress = v2.Definitions.ServerToClientEvent(), 
		EmberProgress = v2.Definitions.ServerToClientEvent(), 
		DodoBirdInteraction = v2.Definitions.ServerToClientEvent(), 
		Nuke = v2.Definitions.ServerToClientEvent(), 
		Distraction = v2.Definitions.ServerToClientEvent(), 
		SnapTrapSnared = v2.Definitions.ServerToClientEvent(), 
		SnapTrapMarkConsumed = v2.Definitions.ServerToClientEvent(), 
		FishFound = v2.Definitions.ServerToClientEvent(), 
		FishCaught = v2.Definitions.ServerToClientEvent(), 
		SpearImpactEffect = v2.Definitions.ServerToClientEvent(), 
		OilSpill = v2.Definitions.ServerToClientEvent(), 
		SantaStrafeEffect = v2.Definitions.ServerToClientEvent(), 
		ShowPremiumPlayerRestriction = v2.Definitions.ServerToClientEvent(), 
		StopwatchActivated = v2.Definitions.ServerToClientEvent(), 
		StopwatchExpired = v2.Definitions.ServerToClientEvent(), 
		MatchRankReport = v2.Definitions.ServerToClientEvent(), 
		Tase = v2.Definitions.ServerToClientEvent(), 
		ForcePlayAnimation = v2.Definitions.ServerToClientEvent(), 
		GuidedProjectileDetonated = v2.Definitions.ServerToClientEvent(), 
		Fling = v2.Definitions.ServerToClientEvent(), 
		ParachuteDrop = v2.Definitions.ServerToClientEvent(), 
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
		LaunchPadUsed = v2.Definitions.ServerToClientEvent(), 
		VoidAxeLeap = v2.Definitions.ServerToClientEvent(), 
		PlayGameMusic = v2.Definitions.ServerToClientEvent(), 
		FireworkArrowExplode = v2.Definitions.ServerToClientEvent(), 
		OpenLuckyBlock = v2.Definitions.ServerToClientEvent(), 
		TwirlbladeSpin = v2.Definitions.ServerToClientEvent(), 
		HellBladeSpin = v2.Definitions.ServerToClientEvent(), 
		PlunderProc = v2.Definitions.ServerToClientEvent(), 
		fozfsvxKrniqzygtteYl = v2.Definitions.ServerToClientEvent(), 
		rGsfymgnuqyvflwbIceidllwVlubXvfjermu = v2.Definitions.ServerToClientEvent(), 
		myzzhvcfvlrqxQKkBolRkTzizpRtmvzbszpvpgx = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		frrckxhtvmdNy = v2.Definitions.ServerToClientEvent(), 
		IosqpthrahaGoqdb = v2.Definitions.ServerToClientEvent(), 
		frrckxhtvmdNy = v2.Definitions.ServerToClientEvent(), 
		OvPyzqSwgawwWshv = v2.Definitions.ServerToClientEvent(), 
		ogxphuhpkdzrjjyjHsfdQxrky = v2.Definitions.ServerToClientEvent(), 
		iiwmwbujmLbcd = v2.Definitions.ServerToClientEvent(), 
		meolyrApGqvchdmrrzcrdgFqcDg = v2.Definitions.ServerToClientEvent(), 
		ABrajmozflzEdcKrbvrXqxygk = v2.Definitions.ClientToServerEvent(), 
		PrpxffyborsixtErSYHnwaNFlbycvxnzTdylmhqQoimxrl = v2.Definitions.ServerToClientEvent(), 
		eaJjibgoOmFBhdajnqOdsk = v2.Definitions.ServerToClientEvent(), 
		pyosoycpKtbflt = v2.Definitions.ServerToClientEvent(), 
		npexSrzkjwllkGcxbdzkjXgz = v2.Definitions.ClientToServerEvent(), 
		iwcrmabkQjhPyUhlszuueyyeLmdGLfgamw = v2.Definitions.ServerToClientEvent(), 
		jvdplila = v2.Definitions.ServerToClientEvent(), 
		ulbecmKvi = v2.Definitions.ServerToClientEvent(), 
		andsomunvhnFvpfEzVqTyxcooglyzsacgepa = v2.Definitions.ServerToClientEvent(), 
		jRitdpktbpwpDfK = v2.Definitions.ServerToClientEvent(), 
		ywaTxxabusvgZhIRapswnmuuiDvbfciA = v2.Definitions.ServerToClientEvent(), 
		dQsxtpvnum = v2.Definitions.ServerToClientEvent(), 
		yWclndhjskyaaMaetqfdindgmstwM = v2.Definitions.ServerToClientEvent(), 
		gyBdQiXUfkqhrVmg = v2.Definitions.ServerToClientEvent(), 
		rvjwryccufprnTytOyi = v2.Definitions.ServerToClientEvent(), 
		fhiwYunacnpSFFdixiasbyeihIBjfs = v2.Definitions.ServerToClientEvent(), 
		hVzrupjfyNtfnfadVJ = v2.Definitions.ServerToClientEvent(), 
		IgsonssvZZhlcyxgcqqm = v2.Definitions.ServerToClientEvent(), 
		oXorxehHniZjwfnMh = v2.Definitions.ServerToClientEvent(), 
		WufnthmwfndvOvffuipduqauyu = v2.Definitions.ServerToClientEvent(), 
		xFMopfvfmxohpqkaiwxieCr = v2.Definitions.ServerToClientEvent()
	}, {})
};
