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
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "LobbyMapController";
end;
local l__WatchPlayerCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchPlayerCharacter;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.KnitStart(p2)
	l__WatchPlayerCharacter__2(l__Players__3.LocalPlayer, function(p3, p4)
		local v5, v6, v7 = ipairs((p3:GetDescendants()));
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			v7 = v5;
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
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return {
	LobbyMapController = u1
};
