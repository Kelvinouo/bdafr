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
		local v9, v10, v11 = ipairs(p8:GetDescendants());
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			v11 = v9;
			if v10:IsA("BasePart") then
				v10.CanCollide = false;
			end;		
		end;
	end;
	local v12 = {};
	local v13 = p7:GetChildren();
	local v14, v15, v16 = ipairs(v13);
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		local l__CFrame__17 = v15.CFrame;
		v12[v15] = l__CFrame__17;
		v15.CFrame = l__CFrame__17 * CFrame.new(0, 5, 0);
		v15.Transparency = 1;	
	end;
	local v18, v19, v20 = ipairs(u2);
	while true do
		v18(v19, v20);
		if not v18 then
			break;
		end;
		v20 = v18;
		local v21, v22, v23 = ipairs(v19);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			local v24 = nil;
			local v25, v26, v27 = ipairs(v13);
			while true do
				v25(v26, v27);
				if not v25 then
					break;
				end;
				v27 = v25;
				if v26.Name == v22 == true then
					v24 = v26;
					break;
				end;			
			end;
			if v24 then
				local v28 = v12[v24];
				if v28 then
					l__TweenService__3:Create(v24, u4, {
						CFrame = v28, 
						Transparency = 0
					}):Play();
				end;
			end;		
		end;
		task.wait(0.2);	
	end;
	local v29, v30, v31 = ipairs(p7:GetChildren());
	while true do
		v29(v30, v31);
		if not v29 then
			break;
		end;
		v31 = v29;
		if v30:IsA("BasePart") and v30 ~= l__SnowmanBottom__8 then
			u5("WeldConstraint", {
				Part0 = l__SnowmanBottom__8, 
				Part1 = v30, 
				Parent = l__SnowmanBottom__8
			});
			v30.Anchored = false;
		end;	
	end;
	local v32 = l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.Angles(0, math.pi, 0)
	});
	v32:Play();
	v32.Completed:Wait();
	local v33 = l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, math.pi, 0)
	});
	v33:Play();
	v33.Completed:Wait();
	l__TweenService__3:Create(l__SnowmanBottom__8, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		CFrame = l__SnowmanBottom__8.CFrame * CFrame.new(0, -2, 0)
	}):Play();
	task.delay(0.1, function()
		p7.SnowmanBottom.Attachment.ParticleEmitter:Emit(300);
	end);
	task.wait(1);
	local v34 = nil;
	local v35 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
	local v36, v37, v38 = ipairs(p7:GetChildren());
	while true do
		v36(v37, v38);
		if not v36 then
			break;
		end;
		v38 = v36;
		if v37:IsA("BasePart") then
			v34 = l__TweenService__3:Create(v37, v35, {
				Transparency = 1
			});
			v34:Play();
		end;	
	end;
	v34.Completed:Wait();
	p7:Destroy();
end;
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__CurrentCamera__7 = l__Workspace__3.CurrentCamera;
function v5.buildSnowman(p9, p10)
	local v39 = l__ReplicatedStorage__6.Assets.Misc.Snowman:Clone();
	local v40 = RaycastParams.new();
	v40.FilterDescendantsInstances = { l__Workspace__3.Map };
	v40.FilterType = Enum.RaycastFilterType.Whitelist;
	local v41 = l__Workspace__3:Raycast(p10.Position, Vector3.new(0, -10, 0), v40);
	if v41 ~= nil then
		v41 = v41.Position;
	end;
	local v42 = v41 or p10.Position;
	v39:PivotTo(CFrame.new(v42, v42 + (v42 - l__CurrentCamera__7.CFrame.Position).Unit * Vector3.new(1, 0, 1)) * CFrame.Angles(0, math.pi, 0));
	return v39;
end;
return v5;
