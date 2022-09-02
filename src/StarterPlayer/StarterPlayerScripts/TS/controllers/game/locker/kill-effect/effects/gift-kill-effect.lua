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
		local v7, v8, v9 = ipairs(p8:GetDescendants());
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			if v8:IsA("BasePart") then
				v8.CanCollide = false;
			end;		
		end;
	end;
	local u7 = p7:FindFirstChild("Particle"):FindFirstChildOfClass("ParticleEmitter");
	local v10 = {};
	local v11 = 0;
	local v12, v13, v14 = ipairs((p7:GetChildren()));
	while true do
		v12(v13, v14);
		if not v12 then
			break;
		end;
		local v15 = false;
		if v13.Name ~= "Lid" then
			v15 = false;
			if v13.Name ~= "Bow" then
				v15 = v13 ~= u7;
			end;
		end;
		if v15 == true then
			v11 = v11 + 1;
			v10[v11] = v13;
		end;	
	end;
	table.sort(v10, function(p9, p10)
		return p9.Name < p10.Name;
	end);
	local v16 = { p7:FindFirstChild("Lid"), p7:FindFirstChild("Bow") };
	local v17, v18, v19 = ipairs(v16);
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		v18.Transparency = 1;	
	end;
	local v20, v21, v22 = ipairs(v10);
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		v21.Transparency = 1;	
	end;
	local v23, v24, v25 = ipairs(v10);
	while true do
		v23(v24, v25);
		if not v23 then
			break;
		end;
		v25 = v23;
		v24.CFrame = v24.CFrame * CFrame.new(0, -4, 0);
		local v26 = l__TweenService__5:Create(v24, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			CFrame = v24.CFrame, 
			Transparency = 0
		});
		v26:Play();
		v26.Completed:Wait();	
	end;
	local v27, v28, v29 = ipairs(v16);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		v28.CFrame = v28.CFrame * CFrame.new(0, 4, 0);
		local v30 = l__TweenService__5:Create(v28, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			CFrame = v28.CFrame, 
			Transparency = 0
		});
		v30:Play();
		v30.Completed:Wait();	
	end;
	p6:hideCharacter(p8);
	local l__Bottom__31 = p7:FindFirstChild("Bottom");
	local v32, v33, v34 = ipairs(p7:GetChildren());
	while true do
		v32(v33, v34);
		if not v32 then
			break;
		end;
		v34 = v32;
		if v33:IsA("BasePart") and v33 ~= l__Bottom__31 then
			u6("WeldConstraint", {
				Part0 = l__Bottom__31, 
				Part1 = v33, 
				Parent = l__Bottom__31
			});
			v33.Anchored = false;
		end;	
	end;
	local v35 = l__TweenService__5:Create(l__Bottom__31, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		CFrame = l__Bottom__31.CFrame * CFrame.Angles(0, math.pi, 0)
	});
	v35:Play();
	v35.Completed:Wait();
	local v36 = l__TweenService__5:Create(l__Bottom__31, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__31.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, math.pi, 0)
	});
	v36:Play();
	v36.Completed:Wait();
	l__TweenService__5:Create(l__Bottom__31, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		CFrame = l__Bottom__31.CFrame * CFrame.new(0, -2, 0)
	}):Play();
	local v37, v38, v39 = ipairs(p7:GetChildren());
	while true do
		v37(v38, v39);
		if not v37 then
			break;
		end;
		v39 = v37;
		if v38:IsA("BasePart") then
			v38.Anchored = true;
		end;	
	end;
	l__Bottom__31:ClearAllChildren();
	p6:scaleModel(p7, 0, (TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)));
	u7:Emit(100);
	task.wait(5);
	p7:Destroy();
end;
local l__ReplicatedStorage__8 = v2.ReplicatedStorage;
function v4.buildBox(p11, p12)
	local v40 = l__ReplicatedStorage__8.Assets.Misc.GiftBox:Clone();
	local v41 = RaycastParams.new();
	v41.FilterDescendantsInstances = { l__Workspace__1.Map };
	v41.FilterType = Enum.RaycastFilterType.Whitelist;
	local v42 = l__Workspace__1:Raycast(p12.Position, Vector3.new(0, -10, 0), v41);
	if v42 ~= nil then
		v42 = v42.Position;
	end;
	v40:PivotTo(CFrame.new(v42 or p12.Position) * CFrame.Angles(0, math.rad(Random.new():NextNumber(-360, 360)), 0));
	return v40;
end;
return v4;
