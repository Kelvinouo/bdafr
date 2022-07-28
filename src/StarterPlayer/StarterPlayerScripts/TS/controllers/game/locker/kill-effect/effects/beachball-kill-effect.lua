-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "BeachballKillEffect";
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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v2.Workspace;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "flipper").src);
local l__ReplicatedStorage__4 = v2.ReplicatedStorage;
local l__RunService__5 = v2.RunService;
local l__ModelUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InExpo__7 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InExpo;
function v4.onKill(p3, p4, p5, p6)
	local v6 = u1.new();
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.HumanoidRootPart.Anchored = true;
	v7:SetPrimaryPartCFrame(p6);
	v7.Parent = l__Workspace__2;
	l__KillEffect__3.hideCharacter(p3, p5);
	v6:GiveTask(v7);
	local v8 = u3.SingleMotor.new(p6.Position.Y);
	v8:onStep(function(p7)
		v7:SetPrimaryPartCFrame(p6 * CFrame.new(0, -p7, 0));
	end);
	v6:GiveTask(function()
		v8:destroy();
	end);
	local v9 = l__ReplicatedStorage__4.Assets.Misc.Beachball:Clone();
	v9.Parent = l__Workspace__2;
	v6:GiveTask(v9);
	local u8 = 0.632;
	local u9 = nil;
	local u10 = CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)));
	v6:GiveTask(l__RunService__5.Heartbeat:Connect(function(p8)
		u8 = u8 + p8;
		local v10 = 0.3 ^ math.floor(u8 / 1.2649110640673518) * (40 - 100 * (u8 % 1.2649110640673518 - 0.6324555320336759) ^ 2);
		local v11 = 40 * 0.3 ^ ((u8 - 1) / 1.2649110640673518);
		local v12 = u9;
		if v12 ~= 0 and v12 == v12 and v12 then
			v12 = v11 < 0.5;
		end;
		if v12 == 0 or v12 ~= v12 or not v12 then
			v8:setGoal(u3.Spring.new((1 - 0.5 ^ math.floor(u8 / 1.2649110640673518)) * 6, {
				dampingRatio = 0.35, 
				frequency = 4
			}));
		end;
		if v11 < 3 and ((u9 == 0 or u9 ~= u9 or not u9) and v10 < 0.5) then
			u9 = v10;
		end;
		if u9 ~= nil then
			local v13 = u9;
		else
			v13 = v10;
		end;
		v9:SetPrimaryPartCFrame(p6 * CFrame.new(0, v13, 0) * u10);
	end));
	task.delay(4, function()
		l__ModelUtil__6.tweenModelSize(v9, 2, l__InExpo__7, 0):andThen(function()
			v6:DoCleaning();
		end);
	end);
	return v6;
end;
return v4;
