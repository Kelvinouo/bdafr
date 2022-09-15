-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "JellyKillEffect";
	end, 
	__index = l__KillEffect__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, p2)
	l__KillEffect__3.constructor(p1, p2);
	l__KillEffect__3.setPlayDefaultKillEffect(p1, false);
end;
local l__default__1 = v1.import(script, v1.getModule(script, "@rbxts", "log").out).default;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__3 = v2.Workspace;
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__RunService__6 = v2.RunService;
function v4.onKill(p3, p4, p5, p6)
	l__default__1.Debug("Jelly kill effect");
	local v6 = u2.new();
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.HumanoidRootPart.Anchored = true;
	v6:GiveTask(v7);
	v7.Parent = l__Workspace__3;
	local v8 = v7:GetPrimaryPartCFrame();
	l__KillEffect__3.hideCharacter(p3, p5);
	local v9 = l__ReplicatedStorage__4.Assets.Effects.JellyMonster:Clone();
	v9:SetPrimaryPartCFrame(v8);
	v6:GiveTask(v9);
	v9.Parent = l__Workspace__3;
	local u7 = u5.GroupMotor.new({
		x = v8.X, 
		y = v8.Y - 200, 
		z = v8.Z
	});
	local u8 = u5.GroupMotor.new({
		x = v8.X, 
		y = v8.Y - 200 + 5, 
		z = v8.Z
	});
	local u9 = u5.GroupMotor.new({
		x = v9.jelly.Size.X, 
		y = v9.jelly.Size.Y, 
		z = v9.jelly.Size.Z
	});
	v6:GiveTask(function()
		u7:destroy();
		u8:destroy();
		u9:destroy();
	end);
	local u10 = u7:onStep(function(p7)
		v9.RootPart["master_bone.001"].WorldCFrame = CFrame.new(p7.x, p7.y, p7.z);
	end);
	local u11 = u8:onStep(function(p8)
		v9.RootPart["master_bone.001"]["jelly.V"].WorldCFrame = CFrame.new(p8.x, p8.y, p8.z);
	end);
	local u12 = u9:onStep(function(p9)
		v9.jelly.Size = Vector3.new(p9.x, p9.y, p9.z);
	end);
	v6:GiveTask(function()
		u10:disconnect();
		u11:disconnect();
		u12:disconnect();
	end);
	local l__HipHeight__13 = v7.Humanoid.HipHeight;
	v6:GiveTask(l__RunService__6.Heartbeat:Connect(function()
		v7:SetPrimaryPartCFrame(v9.RootPart["master_bone.001"].TransformedWorldCFrame * CFrame.new(0, l__HipHeight__13, 0) * (p6 - p6.Position));
	end));
	local v10 = {
		frequency = 6, 
		dampingRatio = 0.6
	};
	local v11 = {
		frequency = 4, 
		dampingRatio = 0.3
	};
	u7:setGoal({
		x = u5.Spring.new(v8.X, v10), 
		y = u5.Spring.new(v8.Y - l__HipHeight__13 - 1, v10), 
		z = u5.Spring.new(v8.Z, v10)
	});
	u8:setGoal({
		x = u5.Spring.new(v8.X, v11), 
		y = u5.Spring.new(v8.Y + 5 - l__HipHeight__13 - 1, v11), 
		z = u5.Spring.new(v8.Z, v11)
	});
	local u14 = nil;
	local u15 = {
		frequency = 2, 
		dampingRatio = 0.6
	};
	u14 = u8:onComplete(function()
		u14:disconnect();
		u7:setGoal({
			x = u5.Spring.new(v8.X, v10), 
			y = u5.Spring.new(v8.Y + 18, v10), 
			z = u5.Spring.new(v8.Z, v10)
		});
		u8:setGoal({
			x = u5.Spring.new(v8.X, v11), 
			y = u5.Spring.new(v8.Y + 18 + 5, v11), 
			z = u5.Spring.new(v8.Z, v11)
		});
		u9:setGoal({
			x = u5.Spring.new(0.1, u15), 
			y = u5.Spring.new(0.1, u15), 
			z = u5.Spring.new(0.1, u15)
		});
		local u16 = nil;
		u16 = u8:onComplete(function()
			u16:disconnect();
			v6:DoCleaning();
		end);
	end);
end;
return v4;
