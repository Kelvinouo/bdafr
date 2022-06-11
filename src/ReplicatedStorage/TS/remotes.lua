-- Script Hash: 736abb0a44ffefaf3075509471a74c9ad66f0c4f5d40dcb5f8ee0fbe6b6ddc19a849e5a4e9fc382c106d063371a12695
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
		wgjhcdokysugelvjdmnYEiEjlzhwluvUohsmT = v2.Definitions.ServerFunction(), 
		draneqhnSWtljSv = v2.Definitions.ClientToServerEvent(), 
		CpuaKnqhBlmvLlrHtmjyvpabzny = v2.Definitions.ClientToServerEvent(), 
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
		VoidPortalUsed = v2.Definitions.ServerToClientEvent(), 
		iyuraph = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		qhczzGukkdxv = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		pumnaadwBzlmhvRaaadAflbuvwVbpkirjUb = v2.Definitions.ClientToServerEvent(), 
		ywTicskqkCskhpzo = v2.Definitions.ServerFunction(), 
		bQhnErx = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		piyumne = v2.Definitions.ClientToServerEvent(), 
		vvszbraCMdyn = v2.Definitions.ServerFunction(), 
		AdKwIrbkelu = v2.Definitions.ServerFunction(), 
		SIjzwaofyRaGzpjsikwlwhuuLmv = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
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
		qSgmpMSjttgyzbtiof = v2.Definitions.ClientToServerEvent(), 
		nqQibbclmApcpumxl = v2.Definitions.ServerFunction(), 
		pnsEnmbm = v2.Definitions.ServerFunction(), 
		zukbTfeapbdcxlltvkpow = v2.Definitions.ClientToServerEvent(), 
		fufinpJbuyLyocslnhFnKbxhEmflhxstsez = v2.Definitions.ClientToServerEvent(), 
		stsbghpxxtsvsrwnen = v2.Definitions.ClientToServerEvent(), 
		qbskxQemsTkpENLkBMcpW = v2.Definitions.ClientToServerEvent(), 
		OqmSobrfexbtPwEn = v2.Definitions.ServerFunction(), 
		wmlikrTfdjikkdBrwtczutxsgexorIpwwhe = v2.Definitions.ClientToServerEvent(), 
		orrdrpxqlsabaanccFcdyAjcjuJ = v2.Definitions.ClientToServerEvent(), 
		chgusjozch = v2.Definitions.ClientToServerEvent(), 
		lsedRsuidwugzRxojTpx = v2.Definitions.ServerFunction(), 
		gjvtsAPvkwfxckhilnvfhiql = v2.Definitions.ClientToServerEvent(), 
		NgApbDwdmj = v2.Definitions.ClientToServerEvent(), 
		pjqmcrksjYBdfieayuamedtzi = v2.Definitions.ClientToServerEvent(), 
		cgQldkpkneQvhjgmJgtMjh = v2.Definitions.ClientToServerEvent(), 
		IihsphfSggdfSqlnmsrlgthlNrxjt = v2.Definitions.ServerFunction(), 
		RzeqofXhdxqmbrjgwCkMchgpcPohQivuytqOocechiuh = v2.Definitions.ServerFunction(), 
		nymppgZomwxleqvcladivjyqdmjcirwjeitvi = v2.Definitions.ServerFunction(), 
		npkwt = v2.Definitions.ServerFunction(), 
		NSlcrPcffVrpotwfGjfjvg = v2.Definitions.ServerFunction(), 
		kjnquknGTLckbniMdrnrnUffab = v2.Definitions.ServerFunction(), 
		yyigNueotxPqnbcUkkedtqqdlyxvbxTrlllfIzaos = v2.Definitions.ServerFunction(), 
		cBwgvncitoqosliwmglmehasnElenptbikTzudm = v2.Definitions.ServerFunction(), 
		yIYcloxdRfw = v2.Definitions.ServerFunction(), 
		vbjzTlvaHVnlylEph = v2.Definitions.ClientToServerEvent(), 
		hglIuIxkxreuos = v2.Definitions.ServerToClientEvent(), 
		uZuUEmcygs = v2.Definitions.ServerToClientEvent(), 
		aStqsmxfuiqqccbmfskppytfxflduYnyjuSrvnuvd = v2.Definitions.ServerToClientEvent(), 
		Bgdgl = v2.Definitions.ClientToServerEvent(), 
		vsItawgwvjOlxnol = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		WcrnexuwmjQnjhWyybxyriOoZwf = v2.Definitions.ClientToServerEvent(), 
		jbfUdhqwhffafhNplMslqRHorerukaExmzkkipDswteF = v2.Definitions.ClientToServerEvent(), 
		kbrktpkxbVNzzptemkpdNxeNNi = v2.Definitions.ClientToServerEvent(), 
		ppdGipfnbxbniaftoygm = v2.Definitions.ClientToServerEvent(), 
		dhjoqXgjOvIkiUccrhclh = v2.Definitions.ClientToServerEvent(), 
		DZooiNdckIsxPunylxwtqiggwRUrKHjtf = v2.Definitions.ClientToServerEvent(), 
		aigvqdzubgry = v2.Definitions.ClientToServerEvent(), 
		ptroqtntB = v2.Definitions.ClientToServerEvent(), 
		injumAecjlehaGYpbwQTngjsOOay = v2.Definitions.ClientToServerEvent(), 
		glitig = v2.Definitions.ClientToServerEvent(), 
		aatwdvdfeyulyG = v2.Definitions.ServerFunction(), 
		wdkLsmxscaBepirbwwgd = v2.Definitions.ClientToServerEvent(), 
		rigguoqImchhaneeozbmsdOvoAyMJ = v2.Definitions.ServerFunction(), 
		vxhzzrtkajzwssmrmhgyxpRjlguuyr = v2.Definitions.ClientToServerEvent(), 
		zauiSkljbq = v2.Definitions.ClientToServerEvent(), 
		nzsltmGqllgtizuwawKfaugvEkudbyJ = v2.Definitions.ClientToServerEvent(), 
		ehocbdIplhddidgpbxkpsCpltsg = v2.Definitions.ClientToServerEvent(), 
		aohsxwtkkbpTw = v2.Definitions.ClientToServerEvent(), 
		vWpimtu = v2.Definitions.ClientToServerEvent(), 
		hbonuqxwvdfcxzaEoveedLcxXrqpPaoE = v2.Definitions.ServerFunction(), 
		dnzvzhvwFbJ = v2.Definitions.ClientToServerEvent(), 
		czvwBBFDsfwvsjajsrtlavjmu = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		vttrdkyjMPljxdaiuwiv = v2.Definitions.ServerFunction(), 
		xSPwnUwchk = v2.Definitions.ServerFunction(), 
		wbntkiWnk = v2.Definitions.ClientToServerEvent(), 
		imydxuytgbmNtvg = v2.Definitions.ClientToServerEvent(), 
		PobwghWiskvvbvApkagriwcysGkPdnjjrjpmlhnqv = v2.Definitions.ClientToServerEvent(), 
		GmjarNwNhrxnPrnkSbpfaepeyknavrin = v2.Definitions.ClientToServerEvent(), 
		mQPzcOnvjhgFfdnlZqswZkdlmymnNBojbErmo = v2.Definitions.ClientToServerEvent(), 
		gpyhKxcthdQOxaodpeqkotjihEovaeqOhxgnvr = v2.Definitions.ClientToServerEvent(), 
		CnpxnpvZqyofurwdwhcRzd = v2.Definitions.ClientToServerEvent(), 
		wrmlmxkwocZnDLIeE = v2.Definitions.ClientToServerEvent(), 
		gmjyWmSabIqOmrNtHwfa = v2.Definitions.ClientToServerEvent(), 
		YoVhilpNjzYlaz = v2.Definitions.ClientToServerEvent(), 
		dtFtuzyuhdrhyi = v2.Definitions.ClientToServerEvent(), 
		njaWlzuqbjkcUaovqoQdpal = v2.Definitions.ClientToServerEvent(), 
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
		emdaOaUcsnnbocst = v2.Definitions.ServerToClientEvent(), 
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
		SpawnWindWalkerOrb = v2.Definitions.ServerToClientEvent(), 
		WindWalkerSpeedUpdate = v2.Definitions.ServerToClientEvent(), 
		WindWalkerSpawned = v2.Definitions.ServerToClientEvent(), 
		WindWalkerEffect = v2.Definitions.ServerToClientEvent(), 
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
		zrcUzvZbtk = v2.Definitions.ServerToClientEvent(), 
		VoidArmorShieldTrigger = v2.Definitions.ServerToClientEvent(), 
		AngelProgress = v2.Definitions.ServerToClientEvent(), 
		AngelOrb = v2.Definitions.ServerToClientEvent(), 
		LumenProgress = v2.Definitions.ServerToClientEvent(), 
		EmberProgress = v2.Definitions.ServerToClientEvent(), 
		DodoBirdInteraction = v2.Definitions.ServerToClientEvent(), 
		Nuke = v2.Definitions.ServerToClientEvent(), 
		wbOkoMzur = v2.Definitions.ServerToClientEvent(), 
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
		MerchantDiscountApplied = v2.Definitions.ServerToClientEvent(), 
		lRnlbdstrZyidymuddjhnfkyudQqYOmaKsgTDtnqe = v2.Definitions.ServerToClientEvent(), 
		tbnilDbfT = v2.Definitions.ServerToClientEvent(), 
		fbcgWfyMhCFHrusfhVKjxyqqvJsummngecyiRmYvtmkoj = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		MerchantItems = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		RPSEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		BuoVzh = v2.Definitions.ServerToClientEvent(), 
		qjmhyuufvtroLkwrfaAFhoSwdV = v2.Definitions.ServerToClientEvent(), 
		BuoVzh = v2.Definitions.ServerToClientEvent(), 
		AmhumailHUxkyn = v2.Definitions.ServerToClientEvent(), 
		bvfMjmxxqvvadjqKKfrlNnlskwdmyh = v2.Definitions.ServerToClientEvent(), 
		ZOdrVdbxpzsexnELAgDwrbhnqqsonlxT = v2.Definitions.ServerToClientEvent(), 
		rylynmqiuojrJruCoLxalywpsvfK = v2.Definitions.ServerToClientEvent(), 
		sebhqaqflONljwjmpZotexlbjpzbsrWgfyhisYlnE = v2.Definitions.ClientToServerEvent(), 
		hypbbnawoCkncdYiGsaloaeyuzihfDPdmARsGiFiI = v2.Definitions.ServerToClientEvent(), 
		xMJm = v2.Definitions.ServerToClientEvent(), 
		eyZartfiejxKoKDbGrhfvdBpfbfcinhtqigoemrT = v2.Definitions.ServerToClientEvent(), 
		xciKadtkzohaLboOh = v2.Definitions.ClientToServerEvent(), 
		aiXfpmgqwck = v2.Definitions.ServerToClientEvent(), 
		kLyhkczc = v2.Definitions.ServerToClientEvent(), 
		ajjkpkajkj = v2.Definitions.ServerToClientEvent(), 
		fdtpsjvCvsiutVwoasFmanrpdyDsp = v2.Definitions.ServerToClientEvent(), 
		tbqptoCiehRatiaRqIwIvUbzwofacqnIsbqU = v2.Definitions.ServerToClientEvent(), 
		pcvqQciehPqlJswkXwupq = v2.Definitions.ServerToClientEvent(), 
		zqfvuzJGeSiwhdefccluMkoySMM = v2.Definitions.ServerToClientEvent(), 
		cimwJVtyaDkznZqsojvlFguiilshdduEbTeyrdwpP = v2.Definitions.ServerToClientEvent(), 
		mzrWrilntDdvhlTl = v2.Definitions.ServerToClientEvent(), 
		MuzfuvJfaggxasi = v2.Definitions.ServerToClientEvent(), 
		gymszXRckpzIxsllwkGCfyc = v2.Definitions.ServerToClientEvent(), 
		akfayzhh = v2.Definitions.ServerToClientEvent(), 
		Tbnhyy = v2.Definitions.ServerToClientEvent(), 
		qxeubmAcmmxAklfyn = v2.Definitions.ServerToClientEvent(), 
		umhaxyoiFqkf = v2.Definitions.ServerToClientEvent(), 
		gdiewkpmbkU = v2.Definitions.ServerToClientEvent(), 
		zTkAxurrUjyhVtxlnJbl = v2.Definitions.ServerToClientEvent(), 
		lgFbMzuPexcznctzwHl = v2.Definitions.ServerToClientEvent(), 
		vpzyWQlVgoQlfTafUybbXu = v2.Definitions.ServerToClientEvent(), 
		iytsvjqvoaawhxjqjkncyuxccfejdqlnewDeengkesV = v2.Definitions.ServerToClientEvent()
	}, {})
};
