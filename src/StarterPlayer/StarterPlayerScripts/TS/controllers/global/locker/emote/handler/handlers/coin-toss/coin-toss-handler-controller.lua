-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
local v7 = setmetatable({}, {
	__tostring = function()
		return "CoinTossHandlerController";
	end, 
	__index = l__KnitController__5
});
v7.__index = v7;
function v7.new(...)
	local v8 = setmetatable({}, v7);
	return v8:constructor(...) and v8;
end;
function v7.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "CoinTossHandlerController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__2 = v3.KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__6 = v3.KnitClient;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__CoinTossResult__8 = v1.import(script, script.Parent, "coin-toss-result").CoinTossResult;
local l__Players__9 = v4.Players;
local l__EmoteHandler__10 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__12 = v4.ReplicatedStorage;
local l__GameQueryUtil__13 = v2.GameQueryUtil;
local u14 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v7.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local l__Character__9 = p3.sourcePlayer.Character;
		if not l__Character__9 then
			return nil;
		end;
		local l__sourcePlayer__15 = p3.sourcePlayer;
		task.delay(1.3, function()
			if l__KnitClient__2.Controllers.EmoteController:getPlayingEmote(l__sourcePlayer__15) ~= l__EmoteType__3.COIN_TOSS then
				return nil;
			end;
			l__SoundManager__4:playSound(l__GameSound__5.EMOTE_OPEN, {
				parent = l__Character__9.PrimaryPart
			});
			l__KnitClient__6.Controllers.CoinTossHandlerController.guiTree = u7.mount(u7.createElement(l__CoinTossResult__8, {
				Character = l__Character__9, 
				ResultImage = p3.result
			}), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
		end);
	end);
	local l__EmoteHandlerController__10 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v11 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__10
	});
	v11.__index = v11;
	function v11.new(...)
		local v12 = setmetatable({}, v11);
		return v12:constructor(...) and v12;
	end;
	local u16 = l__EmoteHandler__10;
	function v11.constructor(p4, ...)
		u16.constructor(p4, ...);
		p4.maid = u11.new();
	end;
	function v11.onEnable(p5, p6, p7, p8)
		if not p7.PrimaryPart then
			return nil;
		end;
		local v13 = l__ReplicatedStorage__12.Assets.Misc.Coin:Clone();
		v13.Parent = p7;
		v13:PivotTo(p7.RightHand.CFrame);
		l__GameQueryUtil__13:setQueryIgnored(v13, true);
		v13.CanCollide = false;
		p5.maid:GiveTask(v13);
		p5.maid:GiveTask((u14("Motor6D", {
			Parent = v13, 
			Part0 = p7.RightHand, 
			Part1 = v13
		})));
	end;
	function v11.onDisable(p9, p10, p11, p12)
		p9.maid:DoCleaning();
	end;
	u16 = l__EmoteHandlerController__10.registerHandler;
	u16(l__EmoteHandlerController__10, l__EmoteType__3.COIN_TOSS, v11);
end;
local v14 = l__KnitClient__2.CreateController(v7.new());
return nil;
