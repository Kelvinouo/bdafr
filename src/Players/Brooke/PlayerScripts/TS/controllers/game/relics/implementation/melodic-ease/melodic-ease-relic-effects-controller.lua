-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MelodicEaseRelicEffectsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "MelodicEaseRelicEffectsController";
	p1.recordPlayerMaid = u1.new();
end;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	p2:listenForRecordPlayers();
end;
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local u4 = TweenInfo.new(0.25, Enum.EasingStyle.Bounce, Enum.EasingDirection.InOut, -1, true, 0);
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
function v4.listenForRecordPlayers(p3)
	l__WatchCollectionTag__2("RecordPlayer", function(p4)
		local v6 = p4:GetAttribute("RelicTeamId");
		local v7 = l__TweenService__3:Create(p4, u4, {
			Size = p4.Size + Vector3.new(-0.1, 0.1, 0)
		});
		v7:Play();
		local u6 = l__default__5.Client:WaitFor("RemoteName"):expect():Connect(function(p5)
			if v6 == p5.brokenBedTeam.id then
				p3.recordPlayerMaid:DoCleaning();
			end;
		end);
		p3.recordPlayerMaid:GiveTask(function()
			v7:Cancel();
			v7:Destroy();
			p4:Destroy();
			u6:Disconnect();
		end);
		p3:playTrack(p4);
	end);
end;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.playTrack(p6, p7)
	local u9 = l__SoundManager__7:playSound(l__GameSound__8.RECORD_PLAYER_LOOP, {
		position = p7.Position, 
		looped = true
	});
	p6.recordPlayerMaid:GiveTask(function()
		if u9 ~= nil then
			u9:Stop();
		end;
		if u9 ~= nil then
			u9:Destroy();
		end;
	end);
end;
local v8 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
