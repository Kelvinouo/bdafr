
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__3 = v2.Workspace;
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SnowmanKillEffect";
	end, 
	__index = l__KillEffect__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1, ...)
	l__KillEffect__4.constructor(p1, ...);
end;
function v5.onKill(p2, p3, p4, p5)
	local v7 = p2:buildSnowman(p5);
	v7.Parent = l__Workspace__3;
	p2:animateSnowman(v7, p4);
end;
local l__Players__1 = v2.Players;
local u2 = { { "SnowmanBottom" }, { "SnowmanTorso" }, { "SnowmanLeftArm", "SnowmanRightArm", "SnowmanMitten" }, { "SnowmanScarf" }, { "SnowmanHead", "SnowmanLeftEye", "SnowmanRightEye", "SnowmanNose" }, { "SnowmanHat" } };
local l__TweenService__3 = v2.TweenService;
local u4 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.animateSnowman(p6, p7, p8)
	local l__SnowmanBottom__8 = p7.SnowmanBottom;
	if p8 == l__Players__1.LocalPlayer.Character then
		p8:BreakJoints();
		for v9, v10 in ipairs(p8:GetDescendants()) do
			if v10:IsA("BasePart") then
				v10.CanCollide = false;
			end;
		end;
	end;
	local v11 = {};
	local v12 = p7:GetChildren();
	for v13, v14 in ipairs(v12) do
		local l__CFrame__15 = v14.CFrame;
		v11[v14] = l__CFrame__15;
		v14.CFrame = l__CFrame__15 * CFrame.new(0, 5, 0);
		v14.Transparency = 1;
	end;
	for v16, v17 in ipairs(u2) do
		local v18, v19, v20 = ipairs(v17);
		while true do
			local v21, v22 = v18(v19, v20);
			if not v21 then
				break;
			end;
			local function v23(p9)
				return p9.Name == v22;
			end;
			local v24 = nil;
			for v25, v26 in ipairs(v12) do
				if v23(v26, v25 - 1, v12) == true then
					v24 = v26;
					break;
				end;
			end;
			if v24 then
				local v27 = v11[v24];
				if v27 then
					l__TweenService__3:Create(v24, u4, {
						CFrame = v27, 
						Transparency = 0
					}):Play();
				end;
			end;		
		end;
		task.wait(0.2);
	end;
	for v28, v29 in ipairs(p7:GetChildren()) do
		if v29:IsA("BasePart") and v29 ~= l__SnowmanBottom__8 then
			u5("WeldConstraint", {
				Part0 = l__SnowmanBottom__8, 
				Part1 = v29, 
				Parent = l__SnowmanBottom__8
			});
			v29.Anchored = false;
		end;
	end;
	local v30 = l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.Angles(0, math.pi, 0)
	});
	v30:Play();
	v30.Completed:Wait();
	local v31 = l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, math.pi, 0)
	});
	v31:Play();
	v31.Completed:Wait();
	l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.new(0, -2, 0)
	}):Play();
	task.delay(0.1, function()
		p7.SnowmanBottom.Attachment.ParticleEmitter:Emit(300);
	end);
	task.wait(1);
	local v32 = nil;
	local v33 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
	for v34, v35 in ipairs(p7:GetChildren()) do
		if v35:IsA("BasePart") then
			v32 = l__TweenService__3:Create(v35, v33, {
				Transparency = 1
			});
			v32:Play();
		end;
	end;
	v32.Completed:Wait();
	p7:Destroy();
end;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__CurrentCamera__7 = l__Workspace__3.CurrentCamera;
function v5.buildSnowman(p10, p11)
	local v36 = l__ReplicatedStorage__6.Assets.Misc.Snowman:Clone();
	local v37 = RaycastParams.new();
	v37.FilterDescendantsInstances = { l__Workspace__3.Map };
	v37.FilterType = Enum.RaycastFilterType.Whitelist;
	local v38 = l__Workspace__3:Raycast(p11.Position, Vector3.new(0, -10, 0), v37);
	if v38 ~= nil then
		v38 = v38.Position;
	end;
	local v39 = v38 or p11.Position;
	v36:PivotTo(CFrame.new(v39, v39 + (v39 - l__CurrentCamera__7.CFrame.Position).Unit * Vector3.new(1, 0, 1)) * CFrame.Angles(0, math.pi, 0));
	return v36;
end;
return v5;

