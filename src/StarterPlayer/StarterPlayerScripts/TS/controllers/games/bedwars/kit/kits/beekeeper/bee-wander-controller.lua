
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BeeWanderController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
local u1 = v4;
function u1.new(...)
	local v5 = setmetatable({}, u1);
	return v5:constructor(...) and v5;
end;
local u2 = l__KnitController__3;
function u1.constructor(p1)
	u2.constructor(p1);
	p1.Name = "BeeWanderController";
	p1.random = Random.new();
end;
local l__RunService__3 = v2.RunService;
local l__CollectionService__4 = v2.CollectionService;
local l__BlockEngine__5 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local u6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ConstantManager.registerConstants(script, {
	ReturnBackHome = true
});
function u1.KnitStart(p2)
	l__RunService__3.Heartbeat:Connect(function()
		for v6, v7 in ipairs(l__CollectionService__4:GetTagged("bee")) do
			local v8 = v7:GetAttribute("BeeOrigin");
			if v7:GetAttribute("NextUpdateDirection") < time() then
				v7:SetAttribute("NextUpdateDirection", time() + 0.5);
				local v9 = Vector3.new(0, 0, 0);
				local v10 = l__BlockEngine__5:getBlockPosition(v7.Root.Position + Vector3.new(0, 0, 0));
				if l__BlockEngine__5:getStore():getBlockAt(v10) then
					local l__Unit__11 = (v7.Root.Position - l__BlockEngine__5:getWorldPosition(v10)).Unit;
					if l__Unit__11.Magnitude > 0 then
						v9 = l__Unit__11 * 10;
					else
						v9 = Vector3.new(0, 0, 0);
					end;
				end;
				if v7:GetAttribute("MaxDistanceFromOrigin") < (v7.Root.Position - v8).Magnitude and u6.ReturnBackHome == true then
					v7.Root.BodyGyro.CFrame = CFrame.lookAt(v7.Root.Position, v8 + v9);
				else
					local v12 = v7.Root.CFrame.LookVector + Vector3.new(p2.random:NextNumber(-2, 2), p2.random:NextNumber(-2, 2), p2.random:NextNumber(-2, 2)) + v9;
					local v13 = v12.Unit:Cross(Vector3.new(0, 1, 0));
					v7.Root.BodyGyro.CFrame = CFrame.fromMatrix(v7.Root.Position, v13, (v13:Cross(v12.Unit)));
				end;
			end;
			v7.Root.BodyVelocity.Velocity = v7.Root.CFrame.LookVector.Unit * 5 + Vector3.new(0, math.sin(time() * 6) / 1.5, 0);
		end;
	end);
end;
u2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1.new;
u2 = u2(u1());
u1 = nil;
return u1;

