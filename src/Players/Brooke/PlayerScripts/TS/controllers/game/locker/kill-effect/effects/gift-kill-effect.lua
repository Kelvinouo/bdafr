-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__3 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v4 = setmetatable({}, {
	__tostring = function()
		return "GiftKillEffect";
	end, 
	__index = l__KillEffect__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1, ...)
	l__KillEffect__3.constructor(p1, ...);
end;
local l__Workspace__1 = v2.Workspace;
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.onKill(p2, p3, p4, p5)
	local v6 = p2:buildBox(p5);
	v6.Parent = l__Workspace__1;
	l__SoundManager__2:playSound(l__GameSound__3.GIFT_KILL_EFFECT, {
		position = p5.Position, 
		rollOffMaxDistance = 80
	});
	p2:animateBox(v6, p4);
end;
local l__Players__4 = v2.Players;
local l__TweenService__5 = v2.TweenService;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.animateBox(p6, p7, p8)
	if p8 == l__Players__4.LocalPlayer.Character then
		p8:BreakJoints();
		for v7, v8 in ipairs(p8:GetDescendants()) do
			if v8:IsA("BasePart") then
				v8.CanCollide = false;
			end;
		end;
	end;
	local u7 = p7:FindFirstChild("Particle"):FindFirstChildOfClass("ParticleEmitter");
	local v9 = {};
	local v10 = 0;
	local v11, v12, v13 = ipairs((p7:GetChildren()));
	while true do
		local v14, v15 = v11(v12, v13);
		if not v14 then
			break;
		end;
		local v16 = false;
		if v15.Name ~= "Lid" then
			v16 = false;
			if v15.Name ~= "Bow" then
				v16 = v15 ~= u7;
			end;
		end;
		if v16 == true then
			v10 = v10 + 1;
			v9[v10] = v15;
		end;	
	end;
	table.sort(v9, function(p9, p10)
		return p9.Name < p10.Name;
	end);
	local v17 = { p7:FindFirstChild("Lid"), p7:FindFirstChild("Bow") };
	for v18, v19 in ipairs(v17) do
		v19.Transparency = 1;
	end;
	for v20, v21 in ipairs(v9) do
		v21.Transparency = 1;
	end;
	for v22, v23 in ipairs(v9) do
		v23.CFrame = v23.CFrame * CFrame.new(0, -4, 0);
		local v24 = l__TweenService__5:Create(v23, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CFrame = v23.CFrame, 
			Transparency = 0
		});
		v24:Play();
		v24.Completed:Wait();
	end;
	for v25, v26 in ipairs(v17) do
		v26.CFrame = v26.CFrame * CFrame.new(0, 4, 0);
		local v27 = l__TweenService__5:Create(v26, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			CFrame = v26.CFrame, 
			Transparency = 0
		});
		v27:Play();
		v27.Completed:Wait();
	end;
	p6:hideCharacter(p8);
	local l__Bottom__28 = p7:FindFirstChild("Bottom");
	for v29, v30 in ipairs(p7:GetChildren()) do
		if v30:IsA("BasePart") and v30 ~= l__Bottom__28 then
			u6("WeldConstraint", {
				Part0 = l__Bottom__28, 
				Part1 = v30, 
				Parent = l__Bottom__28
			});
			v30.Anchored = false;
		end;
	end;
	local v31 = l__TweenService__5:Create(l__Bottom__28, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = l__Bottom__28.CFrame * CFrame.Angles(0, math.pi, 0)
	});
	v31:Play();
	v31.Completed:Wait();
	local v32 = l__TweenService__5:Create(l__Bottom__28, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__28.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, math.pi, 0)
	});
	v32:Play();
	v32.Completed:Wait();
	l__TweenService__5:Create(l__Bottom__28, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__28.CFrame * CFrame.new(0, -2, 0)
	}):Play();
	for v33, v34 in ipairs(p7:GetChildren()) do
		if v34:IsA("BasePart") then
			v34.Anchored = true;
		end;
	end;
	l__Bottom__28:ClearAllChildren();
	p6:scaleModel(p7, 0, (TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)));
	u7:Emit(100);
	task.wait(5);
	p7:Destroy();
end;
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
function v4.buildBox(p11, p12)
	local v35 = l__ReplicatedStorage__8.Assets.Misc.GiftBox:Clone();
	local v36 = RaycastParams.new();
	v36.FilterDescendantsInstances = { l__Workspace__1.Map };
	v36.FilterType = Enum.RaycastFilterType.Whitelist;
	local v37 = l__Workspace__1:Raycast(p12.Position, Vector3.new(0, -10, 0), v36);
	if v37 ~= nil then
		v37 = v37.Position;
	end;
	v35:PivotTo(CFrame.new(v37 or p12.Position) * CFrame.Angles(0, math.rad(Random.new():NextNumber(-360, 360)), 0));
	return v35;
end;
return v4;
