-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "CharacterController";
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
	p1.Name = "CharacterController";
end;
local l__WatchCharacter__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).WatchCharacter;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function u1.KnitStart(p2)
	l__WatchCharacter__2(function(p3, p4)
		if p3 == l__Players__3.LocalPlayer then
			local l__Humanoid__5 = p4:WaitForChild("Humanoid");
			l__Humanoid__5:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
			l__Humanoid__5:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
