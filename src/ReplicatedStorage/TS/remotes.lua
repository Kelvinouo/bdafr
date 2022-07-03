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
		qwsefxcVM = v2.Definitions.ServerFunction(), 
		hlmwenzWbnkfxuGugaVdkjdmCkatsp = v2.Definitions.ClientToServerEvent(), 
		nvijlmwNGqk = v2.Definitions.ClientToServerEvent(), 
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
		dbJczd = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		mwpCtyebethjoljcxqH = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		tpRmkozLWkzffhs = v2.Definitions.ClientToServerEvent(), 
		sdbxaadlhiaPl = v2.Definitions.ServerFunction(), 
		agqiearhnTv = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		jesqdXvqfJrcjcfa = v2.Definitions.ClientToServerEvent(), 
		txyZzt = v2.Definitions.ServerFunction(), 
		donnbzezSwwuLCxqmaZxiXxpgsrzaZtrPgkkFdoluuvmo = v2.Definitions.ServerFunction(), 
		zjpn = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
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
		AkdKLZfeycdwi = v2.Definitions.ClientToServerEvent(), 
		HascmxcnxuNRltoGudjHfkqDLUQz = v2.Definitions.ServerFunction(), 
		hCybeahxlSysbgdxuaeTwxbhyzsodrxs = v2.Definitions.ServerFunction(), 
		HiqegbbtBlbdxmyyuvmgivkmvcwcabeiQhfigsYkd = v2.Definitions.ClientToServerEvent(), 
		hNOgcfhNursoadibmnxqugjld = v2.Definitions.ClientToServerEvent(), 
		etybgguu = v2.Definitions.ClientToServerEvent(), 
		gkeop = v2.Definitions.ClientToServerEvent(), 
		qokhdRfrqqkcspkme = v2.Definitions.ServerFunction(), 
		MhnvmhwxolvempJrjlpjeMwWpxA = v2.Definitions.ClientToServerEvent(), 
		vCyhdGhilfe = v2.Definitions.ClientToServerEvent(), 
		pyxAleulnxLxqcflgjlbiaqjfZvgruenEu = v2.Definitions.ClientToServerEvent(), 
		zyopbxXBsuYm = v2.Definitions.ServerFunction(), 
		wqaqbjivKhkdqbtaVFsvOnkw = v2.Definitions.ClientToServerEvent(), 
		ueioubyYeNamPwWmQctllrKlspirjcdgoqqb = v2.Definitions.ClientToServerEvent(), 
		aehqglilIvZQqysmqvlomiAdB = v2.Definitions.ClientToServerEvent(), 
		bbmpzyd = v2.Definitions.ClientToServerEvent(), 
		eIoGKrk = v2.Definitions.ServerFunction(), 
		watuiwizlhpvxusSkdqGd = v2.Definitions.ServerFunction(), 
		xskdNuHUgcRdVyshpn = v2.Definitions.ServerFunction(), 
		lycfxZMmykfBzPwgpWcfwhysfigVnsQ = v2.Definitions.ServerFunction(), 
		jRmxwdtlaqd = v2.Definitions.ServerFunction(), 
		rdlthahygcltoqnwqqasqshdyqjEU = v2.Definitions.ServerFunction(), 
		SpjjirvkuzkGaQvbOytwoElpqSmylbiiysggyg = v2.Definitions.ServerFunction(), 
		hKvzklboJzRsglmy = v2.Definitions.ServerFunction(), 
		mxeazLhebzujbygcxdgLwdOcjruhKio = v2.Definitions.ServerFunction(), 
		YosyaxhW = v2.Definitions.ClientToServerEvent(), 
		sgButfYrruk = v2.Definitions.ServerToClientEvent(), 
		ihjuhjaF = v2.Definitions.ServerToClientEvent(), 
		oBuzseDpsbJthbMcHtldB = v2.Definitions.ServerToClientEvent(), 
		qeDrldrutzczeltloussvve = v2.Definitions.ClientToServerEvent(), 
		jsuultzrz = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		qawj = v2.Definitions.ClientToServerEvent(), 
		hwzmkPzfe = v2.Definitions.ClientToServerEvent(), 
		rlitvsd = v2.Definitions.ClientToServerEvent(), 
		okmwtmtgiUqsC = v2.Definitions.ClientToServerEvent(), 
		WlizVkKoafsSywtfjan = v2.Definitions.ClientToServerEvent(), 
		mycvFIxdjaYtbn = v2.Definitions.ClientToServerEvent(), 
		lGymHteqzdpaQqvhluCrajnpKp = v2.Definitions.ClientToServerEvent(), 
		tedy = v2.Definitions.ClientToServerEvent(), 
		sNOGiztauqcwknyIncFUWwxuzalyznkziIpwiFfr = v2.Definitions.ClientToServerEvent(), 
		dftanopxmonmNUsqpHyonqLcR = v2.Definitions.ClientToServerEvent(), 
		ibUpkxwxrcuCzzzqqTv = v2.Definitions.ClientToServerEvent(), 
		nqwjlrqfyptm = v2.Definitions.ServerFunction(), 
		cehuRp = v2.Definitions.ClientToServerEvent(), 
		gbbjj = v2.Definitions.ServerFunction(), 
		miwgmJJbkkoZkqbuyaokudMtVakjwlmlrbH = v2.Definitions.ClientToServerEvent(), 
		xaacyraeHiafoljxyldyglzsabzzlls = v2.Definitions.ClientToServerEvent(), 
		xtjvvew = v2.Definitions.ClientToServerEvent(), 
		qutmEfDgqvvnzeipbqcpjsxahcpxqhxjmxjryvDpj = v2.Definitions.ClientToServerEvent(), 
		iqRdnlszacfyevjzfjqlkBnamsuefkcncacaqfgu = v2.Definitions.ClientToServerEvent(), 
		ItcvwWydupvrkcEamwuhJ = v2.Definitions.ClientToServerEvent(), 
		ygmhrrqreOizykdySuwr = v2.Definitions.ServerFunction(), 
		GmcgymcNqoruGkhHevXUclGOrYx = v2.Definitions.ClientToServerEvent(), 
		fhhkYkgezXqp = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		swkaPbP = v2.Definitions.ServerFunction(), 
		uznwxTnycmvvtqNgnltYzBgllv = v2.Definitions.ServerFunction(), 
		bibmLtmfpotzgig = v2.Definitions.ServerFunction(), 
		gWfdXoimiqgLTjjSzb = v2.Definitions.ClientToServerEvent(), 
		bprduwbsfgwbqyh = v2.Definitions.ClientToServerEvent(), 
		yvnoqfVybekay = v2.Definitions.ClientToServerEvent(), 
		djckconBihtycjbhvspklrhipnmuit = v2.Definitions.ClientToServerEvent(), 
		dlzqgkCkroQqYibbdr = v2.Definitions.ClientToServerEvent(), 
		nhpuiUvcaakqjEgfcJAssh = v2.Definitions.ClientToServerEvent(), 
		ymWngjueHpuaxr = v2.Definitions.ClientToServerEvent(), 
		utcJ = v2.Definitions.ClientToServerEvent(), 
		zsxezgmOjWlflafmfiqxeeXpeh = v2.Definitions.ClientToServerEvent(), 
		RequestStatusUpdate = v2.Definitions.ClientToServerEvent(), 
		QkCmoqLvvmryhFkbxlgZbfdspybucYvwxdzuq = v2.Definitions.ClientToServerEvent(), 
		yvfqn = v2.Definitions.ClientToServerEvent(), 
		wJtzdgrepnhEhqimybkfvsCmfGq = v2.Definitions.ClientToServerEvent(), 
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
		vcwftkm = v2.Definitions.ServerToClientEvent(), 
		CarrotRocketExplode = v2.Definitions.ServerToClientEvent(), 
		BobaStickEvent = v2.Definitions.ServerToClientEvent(), 
		FireworkStickEvent = v2.Definitions.ServerToClientEvent(), 
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
		uhlTjciXzlazwvk = v2.Definitions.ServerToClientEvent(), 
		VoidArmorShieldTrigger = v2.Definitions.ServerToClientEvent(), 
		AngelProgress = v2.Definitions.ServerToClientEvent(), 
		AngelOrb = v2.Definitions.ServerToClientEvent(), 
		LumenProgress = v2.Definitions.ServerToClientEvent(), 
		EmberProgress = v2.Definitions.ServerToClientEvent(), 
		PiggyBankIncrement = v2.Definitions.ServerToClientEvent(), 
		PiggyBankPop = v2.Definitions.ServerToClientEvent(), 
		DodoBirdInteraction = v2.Definitions.ServerToClientEvent(), 
		Nuke = v2.Definitions.ServerToClientEvent(), 
		enfbQbfpImczqeig = v2.Definitions.ServerToClientEvent(), 
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
		LaunchPadUsed = v2.Definitions.ServerToClientEvent(), 
		VoidAxeLeap = v2.Definitions.ServerToClientEvent(), 
		PlayGameMusic = v2.Definitions.ServerToClientEvent(), 
		FireworkArrowExplode = v2.Definitions.ServerToClientEvent(), 
		OpenLuckyBlock = v2.Definitions.ServerToClientEvent(), 
		TwirlbladeSpin = v2.Definitions.ServerToClientEvent(), 
		HellBladeSpin = v2.Definitions.ServerToClientEvent(), 
		PlunderProc = v2.Definitions.ServerToClientEvent(), 
		MerchantDiscountApplied = v2.Definitions.ServerToClientEvent(), 
		egJhddrqjhlrgsdpX = v2.Definitions.ServerToClientEvent(), 
		hLGjxxdicjizuVzr = v2.Definitions.ServerToClientEvent(), 
		eniOKdclylnnyPcyEsvPMcqdkuaaZrDrAt = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		MerchantItems = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		RPSEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		nnekvmOpCueicwpudhjqhtxeIyanDvwU = v2.Definitions.ServerToClientEvent(), 
		gzjegrgmTuotBrl = v2.Definitions.ServerToClientEvent(), 
		nnekvmOpCueicwpudhjqhtxeIyanDvwU = v2.Definitions.ServerToClientEvent(), 
		sdbuxvvblOvylGWq = v2.Definitions.ServerToClientEvent(), 
		cuydXgHxpnvatfulwaxpwsmdUkRyrzg = v2.Definitions.ServerToClientEvent(), 
		FgjnhnVtJct = v2.Definitions.ServerToClientEvent(), 
		ffdNxk = v2.Definitions.ServerToClientEvent(), 
		fiplwUmdeHqz = v2.Definitions.ClientToServerEvent(), 
		fvatrhhziwfaygqqqmpNnRhmJeyqdslc = v2.Definitions.ServerToClientEvent(), 
		SkQzhyto = v2.Definitions.ServerToClientEvent(), 
		vnrkkugszQpjyBTGcWgojscnuodvtezpmloTyj = v2.Definitions.ServerToClientEvent(), 
		daHbuWqaDmawxo = v2.Definitions.ClientToServerEvent(), 
		szfwmmyiie = v2.Definitions.ServerToClientEvent(), 
		Envrirqyrzjssgcpbb = v2.Definitions.ServerToClientEvent(), 
		qiSwvPokganbnisSLgv = v2.Definitions.ServerToClientEvent(), 
		pEkmfQAojinitIKHgqhe = v2.Definitions.ServerToClientEvent(), 
		ovdOizkqqqrOgujyAlTdPcdjzMlvfcbyfz = v2.Definitions.ServerToClientEvent(), 
		ptbijryDpkzjjZpXtvewvzgvih = v2.Definitions.ServerToClientEvent(), 
		oocksxrmgyjrnhcfONnxdboFtxqavvn = v2.Definitions.ServerToClientEvent(), 
		xxlqIgvywjrtuxxQ = v2.Definitions.ServerToClientEvent(), 
		qijkzhhglmvfVydj = v2.Definitions.ServerToClientEvent(), 
		CkxnGvicnkcwdkslSsJujqwemtoaogla = v2.Definitions.ServerToClientEvent(), 
		rswfgiaIqcchwkisbwlkcyryuRff = v2.Definitions.ServerToClientEvent(), 
		dLeyPctzcwn = v2.Definitions.ServerToClientEvent(), 
		swikhitnqjIihmVtwvCdBkvbYIwkmnbttcl = v2.Definitions.ServerToClientEvent(), 
		jkggxqhascchwbKfa = v2.Definitions.ServerToClientEvent(), 
		viwgV = v2.Definitions.ServerToClientEvent(), 
		zedfgwnsspbgoaq = v2.Definitions.ServerToClientEvent(), 
		isbvgqyBGukMcsrmizwcwz = v2.Definitions.ServerToClientEvent(), 
		ccyDpyWpmepVnCvjotTbcgvhi = v2.Definitions.ServerToClientEvent(), 
		jqnzrIgdqxyxonUy = v2.Definitions.ServerToClientEvent(), 
		vrtYytGlqrw = v2.Definitions.ServerToClientEvent()
	}, {})
};
