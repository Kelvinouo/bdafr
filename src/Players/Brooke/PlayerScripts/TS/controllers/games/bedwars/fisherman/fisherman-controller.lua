-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "FishermanController";
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
	p1.Name = "FishermanController";
end;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
end;
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__FishermanMinigameApp__3 = v1.import(script, script.Parent, "ui", "fisherman-minigame-app").FishermanMinigameApp;
local l__FishermanDrops__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "fisherman", "fisherman-drops").FishermanDrops;
local l__Players__5 = v2.Players;
local l__RunService__6 = v2.RunService;
local l__ClientSyncEvents__7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__FisherMinigameGameOver__8 = v1.import(script, script.Parent, "ui", "fisherman-minigame-game-over").FisherMinigameGameOver;
function v4.startMinigame(p3, p4, p5)
	p3.appMaid = l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createElement(l__FishermanMinigameApp__3, {
		fishType = p4.fishModel, 
		decaySpeedMultiplier = 1 + (1 - p4.weight / l__FishermanDrops__4:getMaxElementWeight())
	}));
	local v6 = l__Players__5.LocalPlayer.Character;
	if v6 ~= nil then
		v6 = v6:WaitForChild("Humanoid");
	end;
	local v7 = l__Players__5.LocalPlayer.Character;
	if v7 ~= nil then
		v7 = v7.PrimaryPart;
		if v7 ~= nil then
			v7 = v7.CFrame.Position;
		end;
	end;
	local u9 = nil;
	u9 = l__RunService__6.RenderStepped:Connect(function()
		local v8 = not v7;
		if not v8 then
			local v9 = l__Players__5.LocalPlayer.Character;
			if v9 ~= nil then
				v9 = v9.PrimaryPart;
				if v9 ~= nil then
					v9 = (v9.Position - v7).Magnitude;
				end;
			end;
			local v10 = v9;
			if v10 == nil then
				v10 = true;
			end;
			v8 = v10;
		end;
		if v8 ~= 0 and v8 == v8 and v8 then
			p3:cancelMinigame();
			p5({
				gameOver = true, 
				win = false
			});
			u9:Disconnect();
		end;
	end);
	if p3.fishingEndConnection then
		p3.fishingEndConnection:Destroy();
	end;
	p3.fishingEndConnection = l__ClientSyncEvents__7.FishermanMinigameEnd:connect(function(p6)
		u9:Disconnect();
		p5(p6);
		local v11 = {
			win = p6.win, 
			fishType = p4.fishModel
		};
		local v12 = p6.timeElapsed;
		if v12 == nil then
			v12 = 0;
		end;
		v11.elapsedItem = v12;
		p3.gameOverScreenMaid = l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createElement(l__FisherMinigameGameOver__8, v11));
		v1.Promise.delay(3):andThen(function()
			if not p3.gameOverScreenMaid then
				return nil;
			end;
			p3.gameOverScreenMaid:DoCleaning();
		end);
	end);
end;
function v4.cancelMinigame(p7)
	print("Canceling Fishing Minigame");
	p7:closeFishingMinigameApp();
end;
function v4.closeFishingMinigameApp(p8)
	if p8.appMaid then
		local l__appMaid__13 = p8.appMaid;
		if l__appMaid__13 ~= nil then
			l__appMaid__13:DoCleaning();
		end;
	end;
end;
local v14 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
