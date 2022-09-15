-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "TNTWarsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "TNTWarsController";
	p1.cores = {};
	p1.coreMap = {};
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__MatchState__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local l__QueueType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__1.Client:WaitFor("RemoteName"):expect():Connect(function(p3)
		if p3.matchState == l__MatchState__3.RUNNING and l__ClientStore__2:getState().Game.queueType == l__QueueType__4.TNT_WARS then
			p2:handleCores();
		end;
	end);
end;
local l__WatchCollectionTag__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
function v4.handleCores(p4)
	l__WatchCollectionTag__5("tnt-wars-core", function(p5)
		p4:animateCore(p5);
		p4:handleCoreSpawned(p5);
		p4:handleCoreDamaged(p5);
	end);
end;
local l__TweenService__6 = v2.TweenService;
local u7 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, math.huge, true, 0);
local u8 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, math.huge, false, 0);
function v4.animateCore(p6, p7)
	l__TweenService__6:Create(p7, u7, {
		Position = p7.Position + Vector3.new(0, 1, 0)
	}):Play();
	l__TweenService__6:Create(p7, u8, {
		Orientation = p7.Orientation + Vector3.new(360, 0, 0)
	}):Play();
end;
local l__CORE_HP__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").CORE_HP;
function v4.handleCoreSpawned(p8, p9)
	local v6 = p9:GetAttribute("TeamId");
	local v7 = p8.coreMap[v6];
	local v8 = {
		hp = l__CORE_HP__9, 
		teamId = v6, 
		position = p9.Position, 
		coreUUID = p9:GetAttribute("CoreUUID"), 
		corePart = p9
	};
	table.insert(p8.cores, v8);
	if v7 then
		table.insert(v7, v8);
	else
		p8.coreMap[v6] = { v8 };
	end;
	if #p8.cores == 4 then
		p8:onCoresSpawned();
	end;
end;
function v4.handleCoreDamaged(p10, p11)
	local u10 = p11:GetAttribute("CoreUUID");
	p11:GetAttributeChangedSignal("Hp"):Connect(function()
		local v9 = p10:getCoreByUUID(u10);
		if not v9 then
			return nil;
		end;
		local v10 = p11:GetAttribute("Hp");
		v9.hp = v10;
		p10:showDamageNumber(v9, (math.abs(v9.hp - v10)));
	end);
end;
local l__KnitClient__11 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.showDamageNumber(p12, p13, p14)
	l__KnitClient__11.Controllers.DamageIndicatorController:spawnDamageIndicator(p13.position, p14, {
		color = Color3.fromRGB(255, 0, 0), 
		infiniteRange = true
	});
end;
local l__Players__12 = v2.Players;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TNTWarsHud__14 = v1.import(script, script.Parent, "ui", "tnt-wars-hud").TNTWarsHud;
function v4.onCoresSpawned(p15)
	local u15 = l__Players__12.LocalPlayer:GetAttribute("Team");
	local u16 = {};
	local u17 = {};
	local v11, v12, v13 = pairs(p15.coreMap);
	while true do
		local v14 = nil;
		local v15 = nil;
		v15, v14 = v11(v12, v13);
		if not v15 then
			break;
		end;
		v13 = v15;
		if u15 == v15 then
			u16 = v14;
		else
			u17 = v14;
		end;	
	end;
	u13.mount(u13.createElement(l__TNTWarsHud__14, {
		enemyCores = u17, 
		friendlyCores = u16
	}), l__Players__12.LocalPlayer:WaitForChild("PlayerGui"));
end;
function v4.getCoreByUUID(p16, p17)
	local v16, v17, v18 = ipairs(p16.cores);
	while true do
		v16(v17, v18);
		if not v16 then
			break;
		end;
		v18 = v16;
		if v17.coreUUID == p17 == true then
			return v17;
		end;	
	end;
	return nil;
end;
local v19 = l__KnitClient__11.CreateController(v4.new());
return nil;
