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
		yhkmtavfhietDdpaubtvrhnOppxgHmzett = v2.Definitions.ServerFunction(), 
		dsjnkqeqdfTqobrreIpnuo = v2.Definitions.ClientToServerEvent(), 
		xhflenOQpEKvVutdkyqueqestdnlbuymyggbpbjA = v2.Definitions.ClientToServerEvent(), 
		fnopMIMsnkwwdFAsaifmvwSfV = v2.Definitions.ClientToServerEvent(), 
		UkLshlqvt = v2.Definitions.ClientToServerEvent(), 
		kibwllJYvq = v2.Definitions.ClientToServerEvent(), 
		hpbCwTskcezgPvnhfaFdltfekx = v2.Definitions.ClientToServerEvent(), 
		fTcbcrsDsclnw = v2.Definitions.ClientToServerEvent(), 
		AutoTurretFired = v2.Definitions.ClientToServerEvent(), 
		vpixWoflscrydaiyhmj = v2.Definitions.ClientToServerEvent(), 
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
		xSnthwiezlosa = v2.Definitions.ServerToClientEvent(), 
		bhcttouoB = v2.Definitions.ServerToClientEvent(), 
		BombExplosion = v2.Definitions.ServerToClientEvent(), 
		xupczdwwgbqabtzthvxKymQQrwvk = v2.Definitions.ServerToClientEvent(), 
		HealthDropBelowThresholdHannah = v2.Definitions.ServerToClientEvent(), 
		HealthHealAboveThresholdHannah = v2.Definitions.ServerToClientEvent(), 
		HannahTeleport = v2.Definitions.ServerToClientEvent(), 
		agzpjuwOclDqrbuaoIoUviaU = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		ahasNbrchfZGmazUsqzy = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		kpccunwyApmnaD = v2.Definitions.ClientToServerEvent(), 
		hnQhbeftrfrTfavknerbtdiIvxhSih = v2.Definitions.ServerFunction(), 
		hugavwii = v2.Definitions.ServerFunction(), 
		acuu = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		ashLifxfZwBUBzyZepsfRhewW = v2.Definitions.ClientToServerEvent(), 
		dymvbmzojkphxaz = v2.Definitions.ServerFunction(), 
		zmcbvmwNbjhD = v2.Definitions.ServerFunction(), 
		BuShhWohnnc = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
				MaxRequestsPerMinute = 30, 
				ErrorHandler = v4
			}) }), 
		vFixh = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
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
		heOfY = v2.Definitions.ClientToServerEvent(), 
		lynWSxptbztZyenesgpvgz = v2.Definitions.ServerFunction(), 
		xTwPkggdokkxiaguOmuSspfBrnq = v2.Definitions.ServerFunction(), 
		oogtfhvsv = v2.Definitions.ClientToServerEvent(), 
		mXobvzzeqkazIjjrzwogIeyzygjbT = v2.Definitions.ClientToServerEvent(), 
		vrydwhZOoiU = v2.Definitions.ClientToServerEvent(), 
		qRutsRklDzasfiruLfummramoxglpq = v2.Definitions.ClientToServerEvent(), 
		mxMjjuykyeedParmxlzpQohmtiTxueg = v2.Definitions.ServerFunction(), 
		AgferlsobiuhjvcfknBhaugxjdKxapjx = v2.Definitions.ServerFunction(), 
		gjWyZvulzfnjFntznwmfepxMeeZjojvv = v2.Definitions.ServerFunction(), 
		zxdiinsTjvbtlqsw = v2.Definitions.ClientToServerEvent(), 
		NiFeygpcnFlejzi = v2.Definitions.ClientToServerEvent(), 
		evfdfeyiFriuTwBQurqg = v2.Definitions.ClientToServerEvent(), 
		gdrzzRijsoGtgibbyiptmvqqbwqqpimromz = v2.Definitions.ServerFunction(), 
		tbftoUwgkdFylsnwsPhaBtfwlkcdxpcecabeomanhn = v2.Definitions.ClientToServerEvent(), 
		kvcfllmfaWh = v2.Definitions.ClientToServerEvent(), 
		vxfmcXunuarjrrGsbwe = v2.Definitions.ClientToServerEvent(), 
		eKcWlkggyusjqsakWycpb = v2.Definitions.ClientToServerEvent(), 
		ccbxitbVadrudkZogthwrtgexyehsIvP = v2.Definitions.ServerFunction(), 
		rEseMLzRFakkhs = v2.Definitions.ServerFunction(), 
		twKnofikpazojftzvvzjngRtzwwujihRLosxS = v2.Definitions.ServerFunction(), 
		iiktzlBdCUlsgSyrlymbxqrzTrxdtTQfHwfQjNwfk = v2.Definitions.ServerFunction(), 
		fvrahvpPryo = v2.Definitions.ServerFunction(), 
		ztrSutcBiW = v2.Definitions.ServerFunction(), 
		ubqueoyzWolhucpoddydilcbwSBxl = v2.Definitions.ServerFunction(), 
		uhevKjaMMxrqnjsqdnrlcthtdhhkxzxpubwdtmoWJlcq = v2.Definitions.ServerFunction(), 
		oabeMklOaqndh = v2.Definitions.ServerFunction(), 
		lascoq = v2.Definitions.ServerFunction(), 
		qaunsrmkOxanDrvpabEnsn = v2.Definitions.ServerFunction(), 
		etjyakqmmgwJmwhclsdaq = v2.Definitions.ServerFunction(), 
		qahogzpRktvrfXOpmdid = v2.Definitions.ServerFunction(), 
		mhzkakpmpglyLwlKpZOftD = v2.Definitions.ServerFunction(), 
		kyJnziyj = v2.Definitions.ClientToServerEvent(), 
		uhrkFmsjcwngebSuRXJdupa = v2.Definitions.ServerToClientEvent(), 
		tyzvWpaqQJiznbpebxgkdsiK = v2.Definitions.ServerToClientEvent(), 
		myCnzDhgcKkiwkR = v2.Definitions.ServerToClientEvent(), 
		inbhllakzNpmogNQfjk = v2.Definitions.ClientToServerEvent(), 
		enKncpxdidfgqYvXGaAlhiq = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		dqvhfyZhrdjuczfyltb = v2.Definitions.ClientToServerEvent(), 
		bduicqrureuy = v2.Definitions.ClientToServerEvent(), 
		orcxkrdbXgRJihplbea = v2.Definitions.ClientToServerEvent(), 
		dvwkvbeugpvgzuyibrcWpttgexVHztt = v2.Definitions.ClientToServerEvent(), 
		tsHAgrmlygddPftKpg = v2.Definitions.ClientToServerEvent(), 
		ewYszlvaKvcpzg = v2.Definitions.ClientToServerEvent(), 
		wivZkysawiiyaybXsytEVlwro = v2.Definitions.ClientToServerEvent(), 
		cvctnmfxxCck = v2.Definitions.ClientToServerEvent(), 
		olpvfmrUfj = v2.Definitions.ClientToServerEvent(), 
		qwxmJ = v2.Definitions.ClientToServerEvent(), 
		xjmhbxcnklziczfruabwaNyqGrhG = v2.Definitions.ClientToServerEvent(), 
		covbxzdwvqRutoycolUrisHutx = v2.Definitions.ServerFunction(), 
		fQagdiyWox = v2.Definitions.ClientToServerEvent(), 
		wugjGnffKzqrubufoasvuv = v2.Definitions.ServerFunction(), 
		waqatogcjoPvln = v2.Definitions.ClientToServerEvent(), 
		nqqlVBhChoVPkvgy = v2.Definitions.ClientToServerEvent(), 
		iffdjsGlwmjxyqabilltezs = v2.Definitions.ClientToServerEvent(), 
		gaiqbitflZEgfodprckx = v2.Definitions.ClientToServerEvent(), 
		brsy = v2.Definitions.ClientToServerEvent(), 
		ggddtirwWumfuopGYYwboqfvp = v2.Definitions.ClientToServerEvent(), 
		NqzbDpouzkCuvuqhsYvkxpmbqkJrxmfgganzitua = v2.Definitions.ServerFunction(), 
		vCeamjgnOLxrg = v2.Definitions.ClientToServerEvent(), 
		pcrYmlaqavjNprraslmnxyyNam = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		vkjdqmthecaO = v2.Definitions.ServerFunction(), 
		hBtdjvtoHBxwltOfngfra = v2.Definitions.ServerFunction(), 
		xytCydwzmhdmhu = v2.Definitions.ServerFunction(), 
		lwZWnpxwinwRaj = v2.Definitions.ClientToServerEvent(), 
		gJdFcmmFklcCjbkFavhvfpCMsfikiwcnszdtkohffe = v2.Definitions.ClientToServerEvent(), 
		cmgfrqtdoblGawjurxemLj = v2.Definitions.ClientToServerEvent(), 
		ymqqxraqoSqdesjaqe = v2.Definitions.ClientToServerEvent(), 
		xmaiRtcigqoccmmehwexzzp = v2.Definitions.ClientToServerEvent(), 
		EAmDerlvvbwzmpdqdxjnMs = v2.Definitions.ClientToServerEvent(), 
		ucwnbOSyb = v2.Definitions.ClientToServerEvent(), 
		rhfpsrwghk = v2.Definitions.ClientToServerEvent(), 
		YmjriXmcyXutbkzBaliEvQbph = v2.Definitions.ClientToServerEvent(), 
		RequestStatusUpdate = v2.Definitions.ClientToServerEvent(), 
		nlsGmjizVz = v2.Definitions.ClientToServerEvent(), 
		gylbqeoibIguHreumktwnv = v2.Definitions.ClientToServerEvent(), 
		mlprtEIsdybdsghhcNpzd = v2.Definitions.ClientToServerEvent(), 
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
		AyavncdamDnjWgyhgcGuggeobQiytgrJLkPlFvrtltxp = v2.Definitions.ServerToClientEvent(), 
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
		itWvb = v2.Definitions.ServerToClientEvent(), 
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
		jwPawg = v2.Definitions.ServerToClientEvent(), 
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
		jyhpomsAaYmbes = v2.Definitions.ServerToClientEvent(), 
		UvtyjoIjbzeupzjupSsaps = v2.Definitions.ServerToClientEvent(), 
		dglUDmyzkauHx = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		MerchantItems = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		RPSEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		CoinTossEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		srzjavwWfzufrgnt = v2.Definitions.ServerToClientEvent(), 
		uplxAcsbkecmApmvuxusuxligMLjckspzabedzrlK = v2.Definitions.ServerToClientEvent(), 
		srzjavwWfzufrgnt = v2.Definitions.ServerToClientEvent(), 
		disyEakwnhuuOchlbwhoonqtwujqAroNeC = v2.Definitions.ServerToClientEvent(), 
		ybblhcczhapOpqlurxyqqgImhhcnhwPgbb = v2.Definitions.ServerToClientEvent(), 
		otbhoCjceaQbdszfxmioaiivobphmDyoxn = v2.Definitions.ServerToClientEvent(), 
		sflylajLvnqbQ = v2.Definitions.ServerToClientEvent(), 
		wcqrpduzbIt = v2.Definitions.ClientToServerEvent(), 
		uOtnkk = v2.Definitions.ServerToClientEvent(), 
		tpkqSpvKAdwv = v2.Definitions.ServerToClientEvent(), 
		tywrhvKqmsNouclkanineIywkFnzc = v2.Definitions.ServerToClientEvent(), 
		katQyyyBwxedbtOwsvlelmlfCszbsty = v2.Definitions.ClientToServerEvent(), 
		awvfyuiRJp = v2.Definitions.ServerToClientEvent(), 
		qsxFyrUfqyxtfasbXddbeHcalkghtosH = v2.Definitions.ServerToClientEvent(), 
		cywyqInUeBkdopwu = v2.Definitions.ServerToClientEvent(), 
		gngbYpaczsdgHzNdi = v2.Definitions.ServerToClientEvent(), 
		arEGvymNnaovgK = v2.Definitions.ServerToClientEvent(), 
		qavigcgjqdcNsp = v2.Definitions.ServerToClientEvent(), 
		uWeeBblflctwDiwtmRpoohkzdhkttPil = v2.Definitions.ServerToClientEvent(), 
		nbvtqoBrshhsqwcefICirfkwd = v2.Definitions.ServerToClientEvent(), 
		xseyucsdqsgjVsrhRowzzitXtyCM = v2.Definitions.ServerToClientEvent(), 
		nasxqabXzboqp = v2.Definitions.ServerToClientEvent(), 
		riuQytFWcrfpujda = v2.Definitions.ServerToClientEvent(), 
		wfvqxlrvdkoHePcofvlVscfcns = v2.Definitions.ServerToClientEvent(), 
		rbtgmdmPzxroqwLtvWqektYne = v2.Definitions.ServerToClientEvent(), 
		tlbsjDxujDbicyzjgjizdpNcobkoflzkMdnZb = v2.Definitions.ServerToClientEvent(), 
		DbBmwanFbmewxoj = v2.Definitions.ServerToClientEvent(), 
		SHoNavxgIVmffsvItgjzSbblmk = v2.Definitions.ServerToClientEvent(), 
		cjqimebgsssnyerI = v2.Definitions.ServerToClientEvent(), 
		iuwpzsiipkjyghFnSosndgFevedknad = v2.Definitions.ServerToClientEvent(), 
		chikqpglbstalhevjxrxdmRxbiHhxwk = v2.Definitions.ServerToClientEvent(), 
		vjbvkcgbbai = v2.Definitions.ServerToClientEvent(), 
		PFkcqvokrxjdpvunjluefxmlx = v2.Definitions.ServerToClientEvent(), 
		wwuoGHbDhjlMdufmzkTbnWweZznsmfJnwBza = v2.Definitions.ServerToClientEvent(), 
		XqatZkaqRzBaxkexTkkEbkdln = v2.Definitions.ClientToServerEvent(), 
		RdKkcngntxfoyYa = v2.Definitions.ServerToClientEvent(), 
		euwkqSeNsusbuhgjeeuDBBrsTy = v2.Definitions.ServerToClientEvent(), 
		CzTHBnJdetnNadhmcUcwhwsscVMo = v2.Definitions.ServerFunction(), 
		cphsUbpxeqRabv = v2.Definitions.ServerFunction(), 
		YzfpEGlykdpnrNuybulwjvk = v2.Definitions.ServerToClientEvent(), 
		udjobtP = v2.Definitions.ServerToClientEvent(), 
		ufwaxrxcbwgYdvFstYQswnojkbYaOgsjaim = v2.Definitions.ServerToClientEvent(), 
		qelqivsy = v2.Definitions.ServerToClientEvent(), 
		hJHgtWyfFmqamgidniXnvUieej = v2.Definitions.ServerToClientEvent(), 
		JtNxqotanyxzrp = v2.Definitions.ServerToClientEvent(), 
		chiyooazoktkhlzlowdzslxfz = v2.Definitions.ServerToClientEvent()
	}, v7)
};
