-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "LobbyMapController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
local u2 = l__KnitController__2;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "LobbyMapController";
end;
local l__WatchPlayerCharacter__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayerCharacter;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.KnitStart(p2)
	l__WatchPlayerCharacter__3(l__Players__4.LocalPlayer, function(p3, p4)
		for v5, v6 in ipairs((p3:GetDescendants())) do
			if v6:IsA("BasePart") then
				v6.CastShadow = false;
			end;
		end;
		p4:GiveTask(p3.DescendantAdded:Connect(function(p5)
			if p5:IsA("BasePart") then
				p5.CastShadow = false;
			end;
		end));
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = {
	LobbyMapController = u2
};
return u1;
