
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "DroneLobbyController";
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
	p1.Name = "DroneLobbyController";
end;
local l__WatchCollectionTag__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCollectionTag;
local l__RunService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__WatchCollectionTag__2("LobbyDrone", function(p3)
		local v5 = math.random();
		local v6 = p3:GetPrimaryPartCFrame();
		local u4 = v5 * 5;
		l__RunService__3.RenderStepped:Connect(function(p4)
			u4 = u4 + p4;
			p3:SetPrimaryPartCFrame(v6 + Vector3.new(0, math.sin(2 * math.pi * u4 * 0.2) * (v5 * 0.8 + 0.2), 0));
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;

