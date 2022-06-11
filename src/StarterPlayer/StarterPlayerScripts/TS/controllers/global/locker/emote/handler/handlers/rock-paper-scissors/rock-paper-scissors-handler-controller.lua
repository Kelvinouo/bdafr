-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v2.ConstantManager.registerConstants(script, {
	PlayerAnimStartTime = 0.5
});
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "RockPaperScissorsHandlerController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = l__KnitController__5;
function v6.constructor(p1)
	u1.constructor(p1);
	p1.Name = "RockPaperScissorsHandlerController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__KnitClient__3 = v3.KnitClient;
local l__EmoteType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__KnitClient__7 = v3.KnitClient;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__RPSResult__9 = v1.import(script, script.Parent, "rps-result").RPSResult;
local l__Players__10 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__EmoteHandler__11 = v1.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__Character__8 = p3.sourcePlayer.Character;
		if not l__Character__8 then
			return nil;
		end;
		local l__sourcePlayer__13 = p3.sourcePlayer;
		task.delay(2.35, function()
			if l__KnitClient__3.Controllers.EmoteController:getPlayingEmote(l__sourcePlayer__13) ~= l__EmoteType__4.ROCK_PAPER_SCISSORS then
				return nil;
			end;
			l__SoundManager__5:playSound(l__GameSound__6.EMOTE_OPEN, {
				parent = l__Character__8.PrimaryPart
			});
			l__KnitClient__7.Controllers.RockPaperScissorsHandlerController.rpsTree = u8.mount(u8.createElement(l__RPSResult__9, {
				Character = l__Character__8, 
				ResultImage = p3.result
			}), l__Players__10.LocalPlayer:WaitForChild("PlayerGui"));
		end);
	end);
	local l__EmoteHandlerController__9 = l__KnitClient__3.Controllers.EmoteHandlerController;
	local v10 = setmetatable({}, {
		__tostring = function()
			return "Anonymous";
		end, 
		__index = l__EmoteHandler__11
	});
	v10.__index = v10;
	function v10.new(...)
		local v11 = setmetatable({}, v10);
		return v11:constructor(...) and v11;
	end;
	local u14 = l__EmoteHandler__11;
	function v10.constructor(p4, ...)
		u14.constructor(p4, ...);
		p4.maid = u12.new();
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
	u14 = l__EmoteHandlerController__9.registerHandler;
	u14(l__EmoteHandlerController__9, l__EmoteType__4.ROCK_PAPER_SCISSORS, v10);
end;
u1 = l__KnitClient__3.CreateController;
u1 = u1(v6.new());
return nil;
