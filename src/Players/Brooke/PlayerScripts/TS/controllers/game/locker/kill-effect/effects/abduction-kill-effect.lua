-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "AbductionKillEffect";
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
local l__Workspace__1 = v3.Workspace;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__RunService__5 = v3.RunService;
local l__default__6 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__7 = v2.OutExpo;
local l__InExpo__8 = v2.InExpo;
local l__Linear__9 = v2.Linear;
local l__t__10 = v1.import(script, v1.getModule(script, "@rbxts", "t").lib.ts).t;
local u11 = Random.new();
local l__InQuart__12 = v2.InQuart;
function v5.onKill(p3, p4, p5, p6)
	p5.Archivable = true;
	local v7 = p5:Clone();
	v7.HumanoidRootPart.Anchored = true;
	v7.Parent = l__Workspace__1;
	l__KillEffect__4.hideCharacter(p3, p5);
	l__SoundManager__2:playSound(l__GameSound__3.UFO_KILL_EFFECT, {
		position = p6.Position, 
		rollOffMaxDistance = 80
	});
	local v8 = l__ReplicatedStorage__4.Assets.Misc.UFO:Clone();
	v8:SetPrimaryPartCFrame(v7:GetPrimaryPartCFrame() * CFrame.new(0, 50, 0));
	v8.Parent = l__Workspace__1;
	local l__Body__9 = v8.Body;
	l__Body__9.Parent = l__Workspace__1;
	local v10 = l__RunService__5.RenderStepped:Connect(function(p7)
		local v11 = l__Body__9:GetPrimaryPartCFrame();
		l__Body__9:SetPrimaryPartCFrame(CFrame.new(v8.Main.Position) * CFrame.new(0, math.sin(time() * 2) / 1.5, 0) * (v11 - v11.Position) * CFrame.Angles(0, 0.05235987755982989, 0));
	end);
	task.wait(0.15);
	l__default__6(0.3, l__OutExpo__7, function(p8)
		return v8:SetPrimaryPartCFrame(p8);
	end, v8:GetPrimaryPartCFrame(), v7:GetPrimaryPartCFrame() * CFrame.new(0, 10, 0)):Wait();
	l__default__6(0.5, l__InExpo__8, function(p9)
		l__Body__9.Beam.Transparency = l__Linear__9(p9, 1, -0.4, 1);
	end, 0, 1):Wait();
	local v12, v13, v14 = ipairs(v7:GetChildren());
	while true do
		local v15 = nil;
		local v16 = nil;
		local v17 = nil;
		local v18 = nil;
		local v19 = nil;
		local v20 = nil;
		local v21 = nil;
		local v22 = nil;
		local v23 = nil;
		local v24 = nil;
		local v25 = nil;
		local u13 = nil;
		local v26 = nil;
		local v27 = nil;
		local v28 = nil;
		local v29 = nil;
		v12(v13, v14);
		if not v12 then
			break;
		end;
		v14 = v12;
		if v13:IsA("Accessory") then
			local l__Handle__30 = v13:FindFirstChild("Handle");
			if l__t__10.instanceIsA("BasePart")(l__Handle__30) then
				local v31 = l__Handle__30;
				v16 = true;
				v15 = "Anchored";
				v17 = v31;
				v18 = v15;
				v19 = v16;
				v17[v18] = v19;
				local v32 = "BreakJoints";
				v20 = v31;
				v23 = v20;
				v21 = v31;
				v22 = v32;
				local v33 = v21[v22];
				v24 = v33;
				v25 = v23;
				v24(v25);
				local v34 = task.spawn;
				u13 = v31;
				local v35 = function()
					l__default__6(u11:NextNumber(0.2, 0.3), l__InExpo__8, function(p10)
						u13.CFrame = p10;
					end, u13.CFrame, v8:GetPrimaryPartCFrame() * CFrame.new(u11:NextNumber(-3, 3), u11:NextNumber(1, 2), u11:NextNumber(-3, 3))):Wait();
					u13:Destroy();
				end;
				v26 = v34;
				v27 = v35;
				v26(v27);
				local v36 = task.wait;
				local v37 = 0.1;
				v28 = v36;
				v29 = v37;
				v28(v29);
			end;
		elseif v13:IsA("BasePart") and v13 ~= v7.PrimaryPart then
			v31 = v13;
			v16 = true;
			v15 = "Anchored";
			v17 = v31;
			v18 = v15;
			v19 = v16;
			v17[v18] = v19;
			v32 = "BreakJoints";
			v20 = v31;
			v23 = v20;
			v21 = v31;
			v22 = v32;
			v33 = v21[v22];
			v24 = v33;
			v25 = v23;
			v24(v25);
			v34 = task.spawn;
			u13 = v31;
			v35 = function()
				l__default__6(u11:NextNumber(0.2, 0.3), l__InExpo__8, function(p11)
					u13.CFrame = p11;
				end, u13.CFrame, v8:GetPrimaryPartCFrame() * CFrame.new(u11:NextNumber(-3, 3), u11:NextNumber(1, 2), u11:NextNumber(-3, 3))):Wait();
				u13:Destroy();
			end;
			v26 = v34;
			v27 = v35;
			v26(v27);
			v36 = task.wait;
			v37 = 0.1;
			v28 = v36;
			v29 = v37;
			v28(v29);
		end;	
	end;
	task.wait(1);
	l__default__6(0.5, l__InExpo__8, function(p12)
		local l__Beam__38 = l__Body__9.Beam;
		l__Beam__38.Transparency = p12;
		return l__Beam__38.Transparency;
	end, l__Body__9.Beam.Transparency, 1):Wait();
	l__default__6(0.2, l__InQuart__12, function(p13)
		return v8:SetPrimaryPartCFrame(p13);
	end, v8:GetPrimaryPartCFrame(), v8:GetPrimaryPartCFrame() * CFrame.new(0, 10, 0)):Wait();
	v10:Disconnect();
	l__Body__9:Destroy();
	v8:Destroy();
	v7:Destroy();
end;
return v5;
