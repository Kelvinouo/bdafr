
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
	local v9 = p7:GetChildren();
	local u7 = p7:FindFirstChild("Particle"):FindFirstChildOfClass("ParticleEmitter");
	local function v10(p9)
		local v11 = false;
		if p9.Name ~= "Lid" then
			v11 = false;
			if p9.Name ~= "Bow" then
				v11 = p9 ~= u7;
			end;
		end;
		return v11;
	end;
	local v12 = {};
	local v13 = 0;
	for v14, v15 in ipairs(v9) do
		if v10(v15, v14 - 1, v9) == true then
			v13 = v13 + 1;
			v12[v13] = v15;
		end;
	end;
	table.sort(v12, function(p10, p11)
		return p10.Name < p11.Name;
	end);
	local v16 = { p7:FindFirstChild("Lid"), p7:FindFirstChild("Bow") };
	for v17, v18 in ipairs(v16) do
		v18.Transparency = 1;
	end;
	for v19, v20 in ipairs(v12) do
		v20.Transparency = 1;
	end;
	for v21, v22 in ipairs(v12) do
		v22.CFrame = v22.CFrame * CFrame.new(0, -4, 0);
		local v23 = l__TweenService__5:Create(v22, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CFrame = v22.CFrame, 
			Transparency = 0
		});
		v23:Play();
		v23.Completed:Wait();
	end;
	for v24, v25 in ipairs(v16) do
		v25.CFrame = v25.CFrame * CFrame.new(0, 4, 0);
		local v26 = l__TweenService__5:Create(v25, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			CFrame = v25.CFrame, 
			Transparency = 0
		});
		v26:Play();
		v26.Completed:Wait();
	end;
	p6:hideCharacter(p8);
	local l__Bottom__27 = p7:FindFirstChild("Bottom");
	for v28, v29 in ipairs(p7:GetChildren()) do
		if v29:IsA("BasePart") and v29 ~= l__Bottom__27 then
			u6("WeldConstraint", {
				Part0 = l__Bottom__27, 
				Part1 = v29, 
				Parent = l__Bottom__27
			});
			v29.Anchored = false;
		end;
	end;
	local v30 = l__TweenService__5:Create(l__Bottom__27, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = l__Bottom__27.CFrame * CFrame.Angles(0, math.pi, 0)
	});
	v30:Play();
	v30.Completed:Wait();
	local v31 = l__TweenService__5:Create(l__Bottom__27, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__27.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, math.pi, 0)
	});
	v31:Play();
	v31.Completed:Wait();
	l__TweenService__5:Create(l__Bottom__27, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__27.CFrame * CFrame.new(0, -2, 0)
	}):Play();
	for v32, v33 in ipairs(p7:GetChildren()) do
		if v33:IsA("BasePart") then
			v33.Anchored = true;
		end;
	end;
	l__Bottom__27:ClearAllChildren();
	p6:scaleModel(p7, 0, (TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)));
	u7:Emit(100);
	task.wait(5);
	p7:Destroy();
end;
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
function v4.buildBox(p12, p13)
	local v34 = l__ReplicatedStorage__8.Assets.Misc.GiftBox:Clone();
	local v35 = RaycastParams.new();
	v35.FilterDescendantsInstances = { l__Workspace__1.Map };
	v35.FilterType = Enum.RaycastFilterType.Whitelist;
	local v36 = l__Workspace__1:Raycast(p13.Position, Vector3.new(0, -10, 0), v35);
	if v36 ~= nil then
		v36 = v36.Position;
	end;
	v34:PivotTo(CFrame.new(v36 or p13.Position) * CFrame.Angles(0, math.rad(Random.new():NextNumber(-360, 360)), 0));
	return v34;
end;
return v4;

