-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KillEffect__4 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local v5 = setmetatable({}, {
	__tostring = function()
		return "PirateShipAttackKillEffect";
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
local l__scaleModel__4 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__6 = v2.OutExpo;
local l__OutSine__7 = v2.OutSine;
local l__RunService__8 = v3.RunService;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__InExpo__10 = v2.InExpo;
local l__SoundManager__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.onKill(p3, p4, p5, p6)
	local v7 = u1.new();
	p5.Archivable = true;
	local v8 = p5:Clone();
	v8.HumanoidRootPart.Anchored = true;
	v8:SetPrimaryPartCFrame(p6);
	v8.Parent = l__Workspace__2;
	local v9, v10, v11 = ipairs((v8:GetDescendants()));
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if v10:IsA("BasePart") then
			v10.CanCollide = false;
			v10.CanQuery = false;
		end;	
	end;
	l__KillEffect__4.hideCharacter(p3, p5);
	v7:GiveTask(v8);
	local v12 = v8:GetPivot();
	local v13 = l__ReplicatedStorage__3.Assets.Misc.PirateShip:Clone();
	v13:SetPrimaryPartCFrame(v12 * (CFrame.new(5, 8, 10) * CFrame.fromOrientation(0.5235987755982988, 1.5707963267948966, 0)));
	local l__RootPart__14 = v13:FindFirstChild("RootPart");
	if l__RootPart__14 ~= nil then
		local l__master_bone__15 = l__RootPart__14:FindFirstChild("master_bone");
		if l__master_bone__15 ~= nil then
			local l__hull__16 = l__master_bone__15:FindFirstChild("hull");
			if l__hull__16 ~= nil then
				l__hull__16:Destroy();
			end;
		end;
	end;
	local v17, v18, v19 = ipairs((v13:GetDescendants()));
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("BasePart") then
			v18.CanCollide = false;
			v18.CanQuery = false;
			v18.Transparency = 1;
		elseif v18:IsA("Decal") then
			v18.Transparency = 1;
		end;	
	end;
	l__scaleModel__4(v13, 0.05);
	v13.Parent = l__Workspace__2;
	v7:GiveTask(v13);
	local v20, v21, v22 = ipairs((v13:GetDescendants()));
	while true do
		v20(v21, v22);
		if not v20 then
			break;
		end;
		v22 = v20;
		if v21:IsA("BasePart") then
			l__default__5(0.75, l__OutExpo__6, function(p7)
				v21.Transparency = p7;
				return v21.Transparency;
			end, 1, 0);
		end;	
	end;
	l__default__5(1, l__OutSine__7, function(p8)
		return v13:SetPrimaryPartCFrame(p8);
	end, v13:GetPrimaryPartCFrame(), v12 * (CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0))):Wait();
	local u13 = v12;
	v7:GiveTask(l__RunService__8.Heartbeat:Connect(function(p9)
		u13 = u13 * CFrame.Angles(0, -0.005, 0);
		v13:SetPrimaryPartCFrame(u13 * CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0));
	end));
	local function v23()
		local v24 = u9("Part", {
			Shape = Enum.PartType.Ball, 
			Color = Color3.fromHex("#353536"), 
			Size = Vector3.new(2, 2, 2), 
			CanCollide = false, 
			CanQuery = false
		});
		v24.CFrame = v13:GetPrimaryPartCFrame();
		v24.Parent = l__Workspace__2;
		v7:GiveTask(v24);
		local v25 = u9("Trail", {
			Attachment0 = u9("Attachment", {
				Position = Vector3.new(0, -0.75, 0), 
				Parent = v24
			}), 
			Attachment1 = u9("Attachment", {
				Position = Vector3.new(0, 0.75, 0), 
				Parent = v24
			}), 
			Parent = v24, 
			Transparency = NumberSequence.new(0.6)
		});
		l__default__5(0.5, l__InExpo__10, function(p10)
			v24.CFrame = p10;
			return v24.CFrame;
		end, v24.CFrame, v12 * CFrame.new(0, -3 + v24.Size.Y / 2, 0)):Wait();
		v24:Destroy();
		local v26 = l__ReplicatedStorage__3.Assets.Effects.GuidedMissileExplosion:Clone();
		v26.Position = p6.Position;
		v26.Parent = l__Workspace__2;
		v26.Debris1.Size = NumberSequence.new(0.25);
		v26.Debris2.Size = NumberSequence.new(0.5);
		v26.Debris2.Lifetime = NumberRange.new(4);
		v26.ExplosionFlames.Size = NumberSequence.new(1.5);
		v26.Debris1:Emit(5);
		v26.Debris2:Emit(5);
		v26.ExplosionFlames:Emit(50);
		v7:GiveTask(v26);
		l__SoundManager__11:playSound(l__GameSound__12.MINICOPTER_EXPLODE, {
			position = p6.Position, 
			rollOffMaxDistance = 160
		});
	end;
	local v27 = Random.new(os.time());
	local v28 = math.round(v27:NextInteger(4, 6));
	local v29 = 0;
	local v30 = false;
	while true do
		if v30 then
			v29 = v29 + 1;
		else
			v30 = true;
		end;
		if not (v29 < v28) then
			break;
		end;
		task.spawn(function()
			return v23();
		end);
		wait(v27:NextNumber(0.3, 0.6));	
	end;
	local v31, v32, v33 = ipairs((v13:GetDescendants()));
	while true do
		v31(v32, v33);
		if not v31 then
			break;
		end;
		v33 = v31;
		if v32:IsA("BasePart") then
			l__default__5(0.75, l__OutExpo__6, function(p11)
				v32.Transparency = p11;
				return v32.Transparency;
			end, 0, 1);
		end;	
	end;
	v8:BreakJoints();
	u9("Explosion", {
		BlastRadius = 1, 
		Position = v8:GetPivot().Position, 
		DestroyJointRadiusPercent = 0, 
		Parent = game.Workspace
	});
	task.delay(1, function()
		v7:DoCleaning();
	end);
	return v7;
end;
return v5;
