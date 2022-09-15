-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
local v6 = setmetatable({}, {
	__tostring = function()
		return "RockPaperScissorsHandlerController";
	end, 
	__index = l__KnitController__4
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
function v6.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "RockPaperScissorsHandlerController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__2 = v3.KnitClient;
local l__EmoteType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__6 = v3.KnitClient;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__RPSResult__8 = v1.import(script, script.Parent, "rps-result").RPSResult;
local l__Players__9 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__EmoteHandler__10 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local l__Character__8 = p3.sourcePlayer.Character;
		if not l__Character__8 then
			return nil;
		end;
		local l__sourcePlayer__12 = p3.sourcePlayer;
		task.delay(2.35, function()
			if l__KnitClient__2.Controllers.EmoteController:getPlayingEmote(l__sourcePlayer__12) ~= l__EmoteType__3.ROCK_PAPER_SCISSORS then
				return nil;
			end;
			l__SoundManager__4:playSound(l__GameSound__5.EMOTE_OPEN, {
				parent = l__Character__8.PrimaryPart
			});
			l__KnitClient__6.Controllers.RockPaperScissorsHandlerController.rpsTree = u7.mount(u7.createElement(l__RPSResult__8, {
				Character = l__Character__8, 
				ResultImage = p3.result
			}), l__Players__9.LocalPlayer:WaitForChild("PlayerGui"));
		end);
	end);
	local l__EmoteHandlerController__9 = l__KnitClient__2.Controllers.EmoteHandlerController;
	local v10 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__10
	});
	v10.__index = v10;
	function v10.new(...)
		local v11 = setmetatable({}, v10);
		return v11:constructor(...) and v11;
	end;
	local u13 = l__EmoteHandler__10;
	function v10.constructor(p4, ...)
		u13.constructor(p4, ...);
		p4.maid = u11.new();
	end;
	function v10.onEnable(p5, p6, p7, p8)
		if p7.PrimaryPart then
			return;
		end;
		return nil;
	end;
	function v10.onDisable(p9, p10, p11, p12)
		p9.maid:DoCleaning();
	end;
	u13 = l__EmoteHandlerController__9.registerHandler;
	u13(l__EmoteHandlerController__9, l__EmoteType__3.ROCK_PAPER_SCISSORS, v10);
end;
local v12 = l__KnitClient__2.CreateController(v6.new());
return nil;
