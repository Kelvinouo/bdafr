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
	l__KillEffect__4.hideCharacter(p3, p5);
	v7:GiveTask(v8);
	local v9 = v8:GetPivot();
	local v10 = l__ReplicatedStorage__3.Assets.Misc.PirateShip:Clone();
	v10:SetPrimaryPartCFrame(v9 * (CFrame.new(5, 8, 10) * CFrame.fromOrientation(0.5235987755982988, 1.5707963267948966, 0)));
	local l__RootPart__11 = v10:FindFirstChild("RootPart");
	if l__RootPart__11 ~= nil then
		local l__master_bone__12 = l__RootPart__11:FindFirstChild("master_bone");
		if l__master_bone__12 ~= nil then
			local l__hull__13 = l__master_bone__12:FindFirstChild("hull");
			if l__hull__13 ~= nil then
				l__hull__13:Destroy();
			end;
		end;
	end;
	local v14, v15, v16 = ipairs((v10:GetDescendants()));
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		if v15:IsA("BasePart") then
			v15.Transparency = 1;
		elseif v15:IsA("Decal") then
			v15.Transparency = 1;
		end;	
	end;
	l__scaleModel__4(v10, 0.05);
	v10.Parent = l__Workspace__2;
	v7:GiveTask(v10);
	local v17, v18, v19 = ipairs((v10:GetDescendants()));
	while true do
		v17(v18, v19);
		if not v17 then
			break;
		end;
		v19 = v17;
		if v18:IsA("BasePart") then
			l__default__5(0.75, l__OutExpo__6, function(p7)
				v18.Transparency = p7;
				return v18.Transparency;
			end, 1, 0);
		end;	
	end;
	l__default__5(1, l__OutSine__7, function(p8)
		return v10:SetPrimaryPartCFrame(p8);
	end, v10:GetPrimaryPartCFrame(), v9 * (CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0))):Wait();
	local u13 = v9;
	v7:GiveTask(l__RunService__8.Heartbeat:Connect(function(p9)
		u13 = u13 * CFrame.Angles(0, -0.005, 0);
		v10:SetPrimaryPartCFrame(u13 * CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0));
	end));
	local function v20()
		local v21 = u9("Part", {
			Shape = Enum.PartType.Ball, 
			Color = Color3.fromHex("#353536"), 
			Size = Vector3.new(2, 2, 2), 
			CanCollide = false
		});
		v21.CFrame = v10:GetPrimaryPartCFrame();
		v21.Parent = l__Workspace__2;
		v7:GiveTask(v21);
		local v22 = u9("Trail", {
			Attachment0 = u9("Attachment", {
				Position = Vector3.new(0, -0.75, 0), 
				Parent = v21
			}), 
			Attachment1 = u9("Attachment", {
				Position = Vector3.new(0, 0.75, 0), 
				Parent = v21
			}), 
			Parent = v21, 
			Transparency = NumberSequence.new(0.6)
		});
		l__default__5(0.5, l__InExpo__10, function(p10)
			v21.CFrame = p10;
			return v21.CFrame;
		end, v21.CFrame, v9 * CFrame.new(0, -3 + v21.Size.Y / 2, 0)):Wait();
		v21:Destroy();
		local v23 = l__ReplicatedStorage__3.Assets.Effects.GuidedMissileExplosion:Clone();
		v23.Position = p6.Position;
		v23.Parent = l__Workspace__2;
		v23.Debris1.Size = NumberSequence.new(0.25);
		v23.Debris2.Size = NumberSequence.new(0.5);
		v23.Debris2.Lifetime = NumberRange.new(4);
		v23.ExplosionFlames.Size = NumberSequence.new(1.5);
		v23.Debris1:Emit(5);
		v23.Debris2:Emit(5);
		v23.ExplosionFlames:Emit(50);
		v7:GiveTask(v23);
		l__SoundManager__11:playSound(l__GameSound__12.MINICOPTER_EXPLODE, {
			position = p6.Position, 
			rollOffMaxDistance = 160
		});
	end;
	local v24 = Random.new(os.time());
	local v25 = math.round(v24:NextInteger(4, 6));
	local v26 = 0;
	local v27 = false;
	while true do
		if v27 then
			v26 = v26 + 1;
		else
			v27 = true;
		end;
		if not (v26 < v25) then
			break;
		end;
		task.spawn(function()
			return v20();
		end);
		wait(v24:NextNumber(0.3, 0.6));	
	end;
	local v28, v29, v30 = ipairs((v10:GetDescendants()));
	while true do
		v28(v29, v30);
		if not v28 then
			break;
		end;
		v30 = v28;
		if v29:IsA("BasePart") then
			l__default__5(0.75, l__OutExpo__6, function(p11)
				v29.Transparency = p11;
				return v29.Transparency;
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
