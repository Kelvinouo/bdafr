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
	for v10, v11 in ipairs(p2) do
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
		rpjzb = v2.Definitions.ServerFunction(), 
		tuhmcsicjhz = v2.Definitions.ClientToServerEvent(), 
		AutoTurretFired = v2.Definitions.ClientToServerEvent(), 
		lhzNppzgOMrHaxkiyyjivkWjvfmslBsks = v2.Definitions.ClientToServerEvent(), 
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
		OhIUEapBfwVlewJgfa = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.interface({
				weapon = l__t__3.Instance
			})) }), 
		aecgFZlxahdg = v2.Definitions.ServerFunction({ l__WrappedTypechecker__5(l__t__3.Instance) }), 
		Bounce = v2.Definitions.ServerToClientEvent(), 
		GroundHit = v2.Definitions.ClientToServerEvent(), 
		lyltgzcj = v2.Definitions.ClientToServerEvent(), 
		qzyjspwmeiOpwyvjwscqqqbuSk = v2.Definitions.ServerFunction(), 
		jlltscbsnrlsikggqou = v2.Definitions.ServerFunction(), 
		LoadMissionData = v2.Definitions.ServerFunction(), 
		InviteToParty = v2.Definitions.ServerFunction(), 
		RemoveFromParty = v2.Definitions.ServerFunction(), 
		JoinParty = v2.Definitions.ServerFunction(), 
		LeaveParty = v2.Definitions.ServerFunction(), 
		RequestPartyInfo = v2.Definitions.ClientToServerEvent(), 
		LeaveQueue = v2.Definitions.ServerFunction(), 
		TeleportToLobby = v2.Definitions.ClientToServerEvent(), 
		lvzzsdkirauywugoiewise = v2.Definitions.ClientToServerEvent(), 
		bggExgkbojookqH = v2.Definitions.ServerFunction(), 
		uflqEivgosmLqneuM = v2.Definitions.ServerFunction(), 
		kDokymmbVNIqlbydakimhetpj = v2.Definitions.ClientToServerEvent({ v2.Middleware.RateLimit({
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
		zzjWdfgoaP = v2.Definitions.ClientToServerEvent(), 
		suQecgekqMiMoi = v2.Definitions.ServerFunction(), 
		jhgyqLlCVcVjttFrbiwnwlpjdnxgjadujujtuuqq = v2.Definitions.ServerFunction(), 
		dimczdQeHxc = v2.Definitions.ClientToServerEvent(), 
		qB = v2.Definitions.ClientToServerEvent(), 
		xyqcvtaxuSH = v2.Definitions.ClientToServerEvent(), 
		rlocdedxjlsocFtsnfVlLjleq = v2.Definitions.ClientToServerEvent(), 
		bgwPslcwgdqmswscoqmetgiBjZjcwdhlc = v2.Definitions.ServerFunction(), 
		iEKdfvtwawuphmylbsi = v2.Definitions.ClientToServerEvent(), 
		swttufabjLwtrqafoozczwtqHVrhlvd = v2.Definitions.ClientToServerEvent(), 
		aNzePHgpmpabLn = v2.Definitions.ClientToServerEvent(), 
		imihcHEDSacobw = v2.Definitions.ServerFunction(), 
		pTfzVzuzpfmmhyziVxb = v2.Definitions.ClientToServerEvent(), 
		amhtvbroybfgUglcoWkbaz = v2.Definitions.ClientToServerEvent(), 
		kqroJrjgjnbrzTKKi = v2.Definitions.ClientToServerEvent(), 
		Oeguaz = v2.Definitions.ClientToServerEvent(), 
		wcrjqmchfmrxvbtawDnt = v2.Definitions.ServerFunction(), 
		pDuvesxoHvgsscA = v2.Definitions.ServerFunction(), 
		dbxQaeenzsJ = v2.Definitions.ServerFunction(), 
		adPnfrkapbizFqjovXrvsBhctesxzyImK = v2.Definitions.ServerFunction(), 
		lyeyvfokstpwvrcrbufdgNhD = v2.Definitions.ServerFunction(), 
		snwfrcaiywggzAblAdhFcbh = v2.Definitions.ServerFunction(), 
		cpgjbpctoaweozShxhoihJabvwgjJmeaeadplglmut = v2.Definitions.ServerFunction(), 
		cofrlmscafru = v2.Definitions.ServerFunction(), 
		movzIfmbLmgpVQrwffpw = v2.Definitions.ServerFunction(), 
		AutetVBvbWvywqelzyowInqggls = v2.Definitions.ServerFunction(), 
		dguejtwxfmywRcmGkmchlb = v2.Definitions.ServerFunction(), 
		fllihfqvavhhdxvyCimgeDjiwecnHdqgsG = v2.Definitions.ClientToServerEvent(), 
		mdlpyldqgzjzohxvwhjov = v2.Definitions.ServerToClientEvent(), 
		cihzstxsrotpgj = v2.Definitions.ServerToClientEvent(), 
		clrmepefUwZHcnpnsiewPdw = v2.Definitions.ServerToClientEvent(), 
		ozfcmplpmmgygimfpxv = v2.Definitions.ClientToServerEvent(), 
		tomGvyoJkvuloqw = v2.Definitions.ClientToServerEvent(), 
		AnalyticsReportEvent = v2.Definitions.ClientToServerEvent({ l__WrappedTypechecker__5(l__t__3.literal("ClientReady", "UIButtonPress", "ScreenPress", "DeviceType")) }), 
		xynksmfiloutW = v2.Definitions.ClientToServerEvent(), 
		muhMwcbznUDwpz = v2.Definitions.ClientToServerEvent(), 
		MhoruQJnzvyajyp = v2.Definitions.ClientToServerEvent(), 
		pwniTptzcqtipdvAtthlbreDnr = v2.Definitions.ClientToServerEvent(), 
		qsm = v2.Definitions.ClientToServerEvent(), 
		wjhsgYoljlgimpdbyrtvfopcuLwg = v2.Definitions.ClientToServerEvent(), 
		ppjmgrmIboavpyrzxfpizowqXhOvwbxa = v2.Definitions.ClientToServerEvent(), 
		ymgujwqtxFx = v2.Definitions.ClientToServerEvent(), 
		BmtpmadxxjwzmTa = v2.Definitions.ClientToServerEvent(), 
		pxrgaOoPrfdxwqaFOakayU = v2.Definitions.ClientToServerEvent(), 
		egkeysunwbxdevlrfcvaaIiXwyzjrvq = v2.Definitions.ClientToServerEvent(), 
		IdvdMtrSgsapuvcHieqvepbcidhqgpJf = v2.Definitions.ServerFunction(), 
		dmLyocafhpiBynvjliwte = v2.Definitions.ClientToServerEvent(), 
		pgxRpcswj = v2.Definitions.ServerFunction(), 
		tyRigmlfvsyq = v2.Definitions.ClientToServerEvent(), 
		IpdsmnsbkjqgnlzlpUzzzrwohiHoemxjtgzhyvmjf = v2.Definitions.ClientToServerEvent(), 
		udiakvP = v2.Definitions.ClientToServerEvent(), 
		rpabDX = v2.Definitions.ClientToServerEvent(), 
		fjyltlddmztvfo = v2.Definitions.ClientToServerEvent(), 
		NscwozgakiforqGqsvaauapdYesyhrzsk = v2.Definitions.ClientToServerEvent(), 
		qlbIscxnogmnwxfcqnqcrqgcipxDbpnzu = v2.Definitions.ServerFunction(), 
		mpscxpOytlcbtih = v2.Definitions.ClientToServerEvent(), 
		uwogm = v2.Definitions.ServerFunction(), 
		HangGliderUse = v2.Definitions.ClientToServerEvent(), 
		HangGliderClose = v2.Definitions.ClientToServerEvent(), 
		HangGliderStateChanged = v2.Definitions.ServerToClientEvent(), 
		xyivtgzerxEm = v2.Definitions.ServerFunction(), 
		iGhxHzRdRozideqk = v2.Definitions.ServerFunction(), 
		dXnzLhqweqdzBhqwiOrxcjnZz = v2.Definitions.ServerFunction(), 
		rdnxkajbfinc = v2.Definitions.ClientToServerEvent(), 
		zuuwLdU = v2.Definitions.ClientToServerEvent(), 
		dvneFPFssohleAllybfslwXqfntifpbsAbm = v2.Definitions.ClientToServerEvent(), 
		eSkiiimqxdav = v2.Definitions.ClientToServerEvent(), 
		tAiZGgsikEghzVm = v2.Definitions.ClientToServerEvent(), 
		ushlouuyezwvlliYatqWEa = v2.Definitions.ClientToServerEvent(), 
		fwmoypdq = v2.Definitions.ClientToServerEvent(), 
		hmOXnmlbvmNOFhi = v2.Definitions.ClientToServerEvent(), 
		zfLiahfBuusvgOorpmdborhcuyafkcQhuikqn = v2.Definitions.ClientToServerEvent(), 
		RequestStatusUpdate = v2.Definitions.ClientToServerEvent(), 
		dCutvTyrdUyfjqGiBveqif = v2.Definitions.ClientToServerEvent(), 
		xbmjtnBqjkXhIwud = v2.Definitions.ClientToServerEvent(), 
		dwpunynnblWwegvxnQa = v2.Definitions.ClientToServerEvent(), 
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
		qgweqmgcxwnBtboUaRzyBc = v2.Definitions.ServerToClientEvent(), 
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
		SpawnSpiritOrb = v2.Definitions.ServerToClientEvent(), 
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
		nPhhtsseolkdglVnpyqgahzuvjKbafrzLO = v2.Definitions.ServerToClientEvent(), 
		VoidArmorShieldTrigger = v2.Definitions.ServerToClientEvent(), 
		AngelProgress = v2.Definitions.ServerToClientEvent(), 
		AngelOrb = v2.Definitions.ServerToClientEvent(), 
		LumenProgress = v2.Definitions.ServerToClientEvent(), 
		EmberProgress = v2.Definitions.ServerToClientEvent(), 
		PiggyBankIncrement = v2.Definitions.ServerToClientEvent(), 
		PiggyBankPop = v2.Definitions.ServerToClientEvent(), 
		DodoBirdInteraction = v2.Definitions.ServerToClientEvent(), 
		Nuke = v2.Definitions.ServerToClientEvent(), 
		irCzwvaddCJp = v2.Definitions.ServerToClientEvent(), 
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
		wWnzPztyufiXihguauXcenzzszAornkzgbaDtra = v2.Definitions.ServerToClientEvent(), 
		rxpudrSxxnfphe = v2.Definitions.ServerToClientEvent(), 
		kabjqebuhgxlgZciM = v2.Definitions.ServerToClientEvent(), 
		Petrified = v2.Definitions.ServerToClientEvent(), 
		PetrifiedPlayerDestroyed = v2.Definitions.ServerToClientEvent(), 
		MerchantItems = v2.Definitions.ServerToClientEvent(), 
		ActivateBeast = v2.Definitions.ServerToClientEvent(), 
		RPSEmotePlayed = v2.Definitions.ServerToClientEvent(), 
		wnkbNjiqglmzlwghTubujlhtbHuktombod = v2.Definitions.ServerToClientEvent(), 
		etjmeRmzIupjpsseYlreJbplzgm = v2.Definitions.ServerToClientEvent(), 
		wnkbNjiqglmzlwghTubujlhtbHuktombod = v2.Definitions.ServerToClientEvent(), 
		ucJWUvlcgjUcpawcukk = v2.Definitions.ServerToClientEvent(), 
		yvlvlnkofeu = v2.Definitions.ServerToClientEvent(), 
		yoNddFcgobydjvh = v2.Definitions.ServerToClientEvent(), 
		qwdFh = v2.Definitions.ServerToClientEvent(), 
		nmiSnysoennd = v2.Definitions.ClientToServerEvent(), 
		yZiwfyukblKcypXjFehlet = v2.Definitions.ServerToClientEvent(), 
		mnuzlokKsaogjsicjopqqohhfzmyVGc = v2.Definitions.ServerToClientEvent(), 
		yspqyvnnjuajlevnm = v2.Definitions.ServerToClientEvent(), 
		feooPhyNtkknsYhvpWWkapyojlzxjNlzO = v2.Definitions.ClientToServerEvent(), 
		fsbkfooqexuHewakbeirpvpmsRqteUi = v2.Definitions.ServerToClientEvent(), 
		ykjcwytboWpffOfvDarghggncubadNufufgza = v2.Definitions.ServerToClientEvent(), 
		zviudfoQcMnipVSAIxkfh = v2.Definitions.ServerToClientEvent(), 
		trUqkylekgcoKW = v2.Definitions.ServerToClientEvent(), 
		bhygewu = v2.Definitions.ServerToClientEvent(), 
		egtwkptaawdgrnijdnDcjAWcihpxakDzx = v2.Definitions.ServerToClientEvent(), 
		loxFpgzacVGpisMz = v2.Definitions.ServerToClientEvent(), 
		pnilsjyqpoUcaqbusqRlkkybszja = v2.Definitions.ServerToClientEvent(), 
		kaqyxFzlHxeasacrIzsityvglmFosuqfzjx = v2.Definitions.ServerToClientEvent(), 
		irLeiwoasfnuqf = v2.Definitions.ServerToClientEvent(), 
		xpsvJzynrvZuhzxhmntjmqWUvkdjzio = v2.Definitions.ServerToClientEvent(), 
		GrchUffpgkytahclifbzsZlrfpdipbegkblzvmksK = v2.Definitions.ServerToClientEvent(), 
		eRdcljPNhgzcsvnlmGlzlnYMyPtcvD = v2.Definitions.ServerToClientEvent(), 
		iiyTUsAphgrylosbcIEqzklBwaglBPR = v2.Definitions.ServerToClientEvent(), 
		ookvlqdwvnwijObimomcbndalannlcrrwHmnqUekk = v2.Definitions.ServerToClientEvent(), 
		lazyeqhx = v2.Definitions.ServerToClientEvent(), 
		FbbxGrhyssqfdxrnTohnanhpstjvDZhvwobknDcyReuG = v2.Definitions.ServerToClientEvent(), 
		zaqpivjmoianVqpkHmmg = v2.Definitions.ServerToClientEvent(), 
		yknyfuvlunptkoOpquC = v2.Definitions.ServerToClientEvent(), 
		trdoimttvaqrxiUmAmjtrabzcnw = v2.Definitions.ServerToClientEvent(), 
		tsyquyyR = v2.Definitions.ServerToClientEvent(), 
		ivdWhlgSscstyalhpwbvx = v2.Definitions.ServerToClientEvent(), 
		oblparoueafil = v2.Definitions.ClientToServerEvent(), 
		zrQtstl = v2.Definitions.ServerToClientEvent(), 
		dLzcrrNlxsygxiv = v2.Definitions.ServerToClientEvent(), 
		azyzcet = v2.Definitions.ServerToClientEvent(), 
		irruopgJkzhcwwfqnH = v2.Definitions.ServerToClientEvent()
	}, v7)
};
