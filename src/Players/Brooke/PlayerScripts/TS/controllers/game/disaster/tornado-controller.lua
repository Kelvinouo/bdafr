-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "TornadoController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
function v5.constructor(p1)
	l__KnitController__4.constructor(p1);
	p1.Name = "TornadoController";
	p1.random = Random.new();
end;
local l__CollectionService__1 = v3.CollectionService;
local l__SoundManager__2 = v2.SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__4 = v2.GameQueryUtil;
local l__ReplicatedStorage__5 = v3.ReplicatedStorage;
local l__scaleModel__6 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__7 = v3.Workspace;
local l__RunService__8 = v3.RunService;
local l__Linear__9 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__default__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u12 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Players__13 = v3.Players;
local l__GameWorldUtil__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("Tornado"):Connect(function(p3)
		local v7 = l__SoundManager__2:playSound(l__GameSound__3.DISASTER_TORNADO_LOOP, {
			parent = p3, 
			position = p3.Position, 
			playbackSpeedMultiplier = 2, 
			rollOffMaxDistance = 1000
		});
		v7.Looped = true;
		l__GameQueryUtil__4:setQueryIgnored(p3, true);
		local v8 = l__ReplicatedStorage__5.Assets.Effects.Tornado:Clone();
		local v9, v10, v11 = ipairs(v8:GetDescendants());
		while true do
			v9(v10, v11);
			if not v9 then
				break;
			end;
			if v10:IsA("Weld") then
				v10:Destroy();
			end;
			if v10:IsA("BasePart") then
				v10.Anchored = true;
				l__GameQueryUtil__4:setQueryIgnored(v10, true);
			end;		
		end;
		l__scaleModel__6(v8, 0.1);
		v8:SetPrimaryPartCFrame(p3.CFrame);
		v8.Parent = l__Workspace__7;
		local v12 = p3:GetAttribute("EndScalingTime");
		local v13 = l__Workspace__7:GetServerTimeNow();
		local v14 = v8:GetDescendants();
		local function v15(p4)
			if not p4:IsA("BasePart") then
				return;
			end;
			return { p4, {
					size = p4.Size, 
					positionOffset = p4.Position - p3.Position
				} };
		end;
		local v16 = {};
		local v17 = 0;
		local v18, v19, v20 = ipairs(v14);
		while true do
			v18(v19, v20);
			if not v18 then
				break;
			end;
			v20 = v18;
			local v21 = v15(v19, v18 - 1, v14);
			if v21 ~= nil then
				v17 = v17 + 1;
				v16[v17] = v21;
			end;		
		end;
		local v22 = {};
		local v23, v24, v25 = ipairs(v16);
		while true do
			v23(v24, v25);
			if not v23 then
				break;
			end;
			v25 = v23;
			v22[v24[1]] = v24[2];		
		end;
		local u15 = 0;
		local u16 = math.random() * 5000;
		local u17 = l__RunService__8.RenderStepped:Connect(function(p5)
			u15 = u15 + p5;
			local v26 = math.min((l__Workspace__7:GetServerTimeNow() - v13) / (v12 - v13), 1);
			local v27 = l__Linear__9(v26, 6, 54, 1);
			local v28, v29, v30 = ipairs(v8:GetDescendants());
			while true do
				v28(v29, v30);
				if not v28 then
					break;
				end;
				v30 = v28;
				if v29:IsA("BasePart") then
					local v31 = v22[v29];
					if v31 ~= nil then
						local v32 = l__Linear__9(v26, 1, 9, 1);
						v29.Position = p3.Position:Lerp(p3.Position + v31.positionOffset, v32);
						v29.Size = v31.size * v32;
					end;
				end;			
			end;
			v8:SetPrimaryPartCFrame(p3.CFrame * CFrame.Angles(math.rad(math.noise(u15, u16) * 15), u15 * 20, math.rad(math.noise(u15, -u16) * 15)));
		end);
		p3.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				u17:Disconnect();
				if v7 ~= nil then
					v7:Destroy();
				end;
				v8:Destroy();
			end;
		end);
	end);
	l__default__10.Client:GetNamespace("Disaster"):OnEvent("TornadoSucked", function(p8, p9)
		local v33 = l__EntityUtil__11:getLocalPlayerEntity();
		if v33 == nil then
			return nil;
		end;
		local v34 = p8:GetAttribute("EndScalingTime");
		local v35 = l__Workspace__7:GetServerTimeNow();
		local v36 = u12("BodyPosition", {
			Position = p8.Position, 
			D = 100, 
			MaxForce = Vector3.new(50000000, 50000000, 50000000), 
			Parent = l__Players__13.LocalPlayer.Character.PrimaryPart
		});
		v33:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
		local v37 = p2.random:NextNumber(-5000, 5000);
		local u18 = 0;
		local u19 = p9 - l__Workspace__7:GetServerTimeNow();
		local u20 = l__RunService__8.Heartbeat:Connect(function(p10)
			u18 = u18 + p10;
			local v38 = l__Linear__9(math.min((l__Workspace__7:GetServerTimeNow() - v35) / (v34 - v35), 1), 6, 30, 1);
			v36.Position = p8.Position + Vector3.new(math.sin(u18 * 7) * (v38 + math.noise(u18, v37, 0) * 4), 0, math.cos(u18 * 7) * (v38 + math.noise(u18, -v37, 0) * 4)) + Vector3.new(math.noise(u18 * 3, 0, v37) * 8, l__Linear__9(u18, 0, v38, u19) + math.noise(u18 * 1, 0, -v37) * 4, math.noise(u18 * 3, 0, v37 + v37) * 8);
		end);
		task.delay(u19, function()
			u20:Disconnect();
			v36:Destroy();
			local l__HumanoidRootPart__39 = v33:getInstance().HumanoidRootPart;
			if l__HumanoidRootPart__39 == nil then
				return nil;
			end;
			l__HumanoidRootPart__39:ApplyImpulse(l__GameWorldUtil__14.randomUnitVector(Vector3.new(0, 1, 0), 6.283185307179586) * l__HumanoidRootPart__39.AssemblyMass * 10);
			task.wait(1);
			v33:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Running);
		end);
	end);
end;
local v40 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v5.new());
return nil;
