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
function v3.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "StatCardController";
end;
local l__default__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatCardContainer__4 = v1.import(script, script.Parent, "ui", "stat-card-container").StatCardContainer;
local l__Players__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	l__KnitController__2.KnitStart(p2);
	l__default__1.Client:OnEvent("RemoteName", function(p3)
		local l__cards__6 = p3.cards;
		task.spawn(function()
			l__Flamework__2.resolveDependency("client/controllers/game/match/match-end-screen-controller@MatchEndScreenController"):waitUntilDisplay(3);
			u3.mount(u3.createElement(l__StatCardContainer__4, {
				cards = l__cards__6
			}), l__Players__5.LocalPlayer:WaitForChild("PlayerGui"));
		end);
	end);
end;
local v5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v3.new());
return nil;
