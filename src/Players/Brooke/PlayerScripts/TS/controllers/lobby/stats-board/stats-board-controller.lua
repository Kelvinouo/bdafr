-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "StatsBoardController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "StatsBoardController";
end;
local l__Workspace__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__StatsBoardUIWrapper__4 = v1.import(script, script.Parent, "ui", "stats-board-app").StatsBoardUIWrapper;
function u1.KnitStart(p2)
	local u5 = nil;
	v1.Promise.defer(function()
		u5 = l__CreateRoduxApp__3("StatsBoard", l__StatsBoardUIWrapper__4, {}, {}, {
			Parent = l__Workspace__2:WaitForChild("Lobby"):WaitForChild("Boards"):WaitForChild("StatsBoard"):WaitForChild("Board")
		});
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
