-- Script Hash: nil
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "FlingController";
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
	p1.Name = "FlingController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v3.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local l__Character__5 = l__Players__3.LocalPlayer.Character;
		if l__Character__5 then
			l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
			l__Character__5.HumanoidRootPart:ApplyImpulse(p3.force);
			task.delay(1, function()
				l__Character__5.Humanoid:ChangeState(Enum.HumanoidStateType.Running);
			end);
		end;
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v3.new());
return nil;
