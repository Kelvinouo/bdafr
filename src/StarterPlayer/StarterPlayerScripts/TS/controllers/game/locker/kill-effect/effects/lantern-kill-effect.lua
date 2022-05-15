
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "LanternKillEffect";
	end, 
	__index = l__KillEffect__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, p2)
	l__KillEffect__4.constructor(p1, p2);
	l__KillEffect__4.setPlayDefaultKillEffect(p1, false);
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Workspace__2 = v3.Workspace;
local l__ReplicatedStorage__3 = v3.ReplicatedStorage;
local u4 = Random.new();
local l__scaleModel__5 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__RunService__6 = v3.RunService;
local l__Linear__7 = v2.Linear;
local l__ModelUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local l__InOutExpo__9 = v2.InOutExpo;
function v5.onKill(p3, p4, p5, p6)
	local v7 = u1.new();
	p5.Archivable = true;
	local v8 = p5:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v7:GiveTask(v8);
	v8.Parent = l__Workspace__2;
	l__KillEffect__4.hideCharacter(p3, p5);
	local u10 = false;
	local u11 = table.create(10);
	task.spawn(function()
		local v9 = 0;
		local v10 = false;
		while true do
			if v10 then
				v9 = v9 + 1;
			else
				v10 = true;
			end;
			if not (v9 < 10) then
				break;
			end;
			if u10 == true then
				break;
			end;
			local v11 = l__ReplicatedStorage__3.Assets.Misc.Lantern:Clone();
			v11:SetPrimaryPartCFrame(p6 * CFrame.new(u4:NextNumber(-20, 20), -4, u4:NextNumber(20, -20)));
			l__scaleModel__5(v11, 0.5 - u4:NextNumber(0, 0.15));
			local v12, v13, v14 = v11.Lamp.Color:ToHSV();
			v11.Lamp.Color = Color3.fromHSV(math.clamp(v12 + u4:NextNumber(-0.01, 0.01), 0, 1), math.clamp(v13 + u4:NextNumber(-0.2, 0.2), 0, 1), math.clamp(v14 + u4:NextNumber(-0.2, 0.2), 0, 1));
			v11.Parent = l__Workspace__2;
			table.insert(u11, {
				part = v11, 
				dead = false, 
				origin = v11:GetPrimaryPartCFrame().Position, 
				seed = u4:NextNumber(0, 500), 
				radius = 2 + u4:NextNumber(0, 7), 
				start = u4:NextNumber(0, 0.3) + -4, 
				elapsedTime = 0, 
				speed = 1 + u4:NextNumber(0, 1), 
				goalYPos = 8, 
				offset = u4:NextNumber(0, 500)
			});
			task.wait(0.4);		
		end;
	end);
	v7:GiveTask(l__RunService__6.Heartbeat:Connect(function(p7)
		for v15, v16 in ipairs(u11) do
			v16.elapsedTime = v16.elapsedTime + p7;
			v16.part:SetPrimaryPartCFrame(CFrame.new(p6.Position + Vector3.new(math.sin(v16.elapsedTime * v16.speed + v16.offset) * v16.radius, 0, math.cos(v16.elapsedTime * v16.speed + v16.offset) * v16.radius) + Vector3.new(0, l__Linear__7(v16.elapsedTime, v16.start, v16.goalYPos, 3), 0) + Vector3.new(math.noise(v16.elapsedTime * 0.5, 0, v16.seed) * 3, math.noise(v16.elapsedTime * 0.5, 0, -v16.seed) * 3, math.noise(v16.elapsedTime * 0.5, 0, v16.seed + v16.seed) * 3)) * CFrame.Angles(math.noise(v16.elapsedTime * 2, 0, v16.seed) * 0.3, math.noise(v16.elapsedTime, 0, -v16.seed) * 2, math.noise(v16.elapsedTime * 2, 0, v16.seed + v16.seed) * 0.3));
			if v16.elapsedTime > 4 and v16.dead == false then
				v16.dead = true;
				l__ModelUtil__8.tweenModelSize(v16.part, 0.4, l__InOutExpo__9, 0);
			end;
		end;
	end));
	v7:GiveTask(function()
		for v17, v18 in ipairs(u11) do
			v18.part:Destroy();
		end;
	end);
	v7:GiveTask(function()
		u10 = true;
	end);
	task.delay(8, function()
		v7:DoCleaning();
	end);
	return v7;
end;
return v5;

