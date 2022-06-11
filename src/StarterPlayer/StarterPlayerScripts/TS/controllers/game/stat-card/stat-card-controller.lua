-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StatCardController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
function v3.new(...)
	local v4 = setmetatable({}, v3);
	return v4:constructor(...) and v4;
end;
local u1 = l__KnitController__2;
function v3.constructor(p1)
	u1.constructor(p1);
	p1.Name = "StatCardController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Flamework__3 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatCardContainer__5 = v1.import(script, script.Parent, "ui", "stat-card-container").StatCardContainer;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__cards__7 = p3.cards;
		task.spawn(function()
			l__Flamework__3.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController"):waitUntilDisplay(3);
			u4.mount(u4.createElement(l__StatCardContainer__5, {
				cards = l__cards__7
			}), l__Players__6.LocalPlayer:WaitForChild("PlayerGui"));
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
