
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
local u1 = l__KnitController__4;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "TornadoController";
	p1.random = Random.new();
end;
local l__CollectionService__2 = v3.CollectionService;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__GameQueryUtil__5 = v2.GameQueryUtil;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__scaleModel__7 = v1.import(script, v1.getModule(script, "@rbxts", "scale-model").out).scaleModel;
local l__Workspace__8 = v3.Workspace;
local l__RunService__9 = v3.RunService;
local l__Linear__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__default__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__EntityUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Players__14 = v3.Players;
local l__WorldUtil__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "world-util").WorldUtil;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("Tornado"):Connect(function(p3)
		local v7 = l__SoundManager__3:playSound(l__GameSound__4.DISASTER_TORNADO_LOOP, {
			parent = p3, 
			position = p3.Position, 
			playbackSpeedMultiplier = 2, 
			rollOffMaxDistance = 1000
		});
		v7.Looped = true;
		l__GameQueryUtil__5:setQueryIgnored(p3, true);
		local v8 = l__ReplicatedStorage__6.Assets.Effects.Tornado:Clone();
		local v9, v10, v11 = ipairs(v8:GetDescendants());
		while true do
			local v12, v13 = v9(v10, v11);
			if not v12 then
				break;
			end;
			if v13:IsA("Weld") then
				v13:Destroy();
			end;
			if v13:IsA("BasePart") then
				v13.Anchored = true;
				l__GameQueryUtil__5:setQueryIgnored(v13, true);
			end;		
		end;
		l__scaleModel__7(v8, 0.1);
		v8:SetPrimaryPartCFrame(p3.CFrame);
		v8.Parent = l__Workspace__8;
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
		for v18, v19 in ipairs(v14) do
			local v20 = v15(v19, v18 - 1, v14);
			if v20 ~= nil then
				v17 = v17 + 1;
				v16[v17] = v20;
			end;
		end;
		local v21 = {};
		for v22, v23 in ipairs(v16) do
			v21[v23[1]] = v23[2];
		end;
		local u16 = 0;
		local u17 = l__Workspace__8:GetServerTimeNow();
		local u18 = p3:GetAttribute("EndScalingTime");
		local u19 = math.random() * 5000;
		local u20 = l__RunService__9.RenderStepped:Connect(function(p5)
			u16 = u16 + p5;
			local v24 = math.min((l__Workspace__8:GetServerTimeNow() - u17) / (u18 - u17), 1);
			local v25 = l__Linear__10(v24, 6, 54, 1);
			for v26, v27 in ipairs(v8:GetDescendants()) do
				if v27:IsA("BasePart") then
					local v28 = v21[v27];
					if v28 ~= nil then
						local v29 = l__Linear__10(v24, 1, 9, 1);
						v27.Position = p3.Position:Lerp(p3.Position + v28.positionOffset, v29);
						v27.Size = v28.size * v29;
					end;
				end;
			end;
			v8:SetPrimaryPartCFrame(p3.CFrame * CFrame.Angles(math.rad(math.noise(u16, u19) * 15), u16 * 20, math.rad(math.noise(u16, -u19) * 15)));
		end);
		p3.AncestryChanged:Connect(function(p6, p7)
			if p7 == nil then
				u20:Disconnect();
				if v7 ~= nil then
					v7:Destroy();
				end;
				v8:Destroy();
			end;
		end);
	end);
	l__default__11.Client:GetNamespace("Disaster"):OnEvent("RemoteName", function(p8, p9)
		local v30 = l__EntityUtil__12:getLocalPlayerEntity();
		if v30 == nil then
			return nil;
		end;
		local v31 = p8:GetAttribute("EndScalingTime");
		local v32 = l__Workspace__8:GetServerTimeNow();
		local v33 = u13("BodyPosition", {
			Position = p8.Position, 
			D = 100, 
			MaxForce = Vector3.new(50000000, 50000000, 50000000), 
			Parent = l__Players__14.LocalPlayer.Character.PrimaryPart
		});
		v30:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
		local v34 = p2.random:NextNumber(-5000, 5000);
		local u21 = 0;
		local u22 = p9 - l__Workspace__8:GetServerTimeNow();
		local u23 = l__RunService__9.Heartbeat:Connect(function(p10)
			u21 = u21 + p10;
			local v35 = l__Linear__10(math.min((l__Workspace__8:GetServerTimeNow() - v32) / (v31 - v32), 1), 6, 30, 1);
			v33.Position = p8.Position + Vector3.new(math.sin(u21 * 7) * (v35 + math.noise(u21, v34, 0) * 4), 0, math.cos(u21 * 7) * (v35 + math.noise(u21, -v34, 0) * 4)) + Vector3.new(math.noise(u21 * 3, 0, v34) * 8, l__Linear__10(u21, 0, v35, u22) + math.noise(u21 * 1, 0, -v34) * 4, math.noise(u21 * 3, 0, v34 + v34) * 8);
		end);
		task.delay(u22, function()
			u23:Disconnect();
			v33:Destroy();
			local l__HumanoidRootPart__36 = v30:getInstance().HumanoidRootPart;
			if l__HumanoidRootPart__36 == nil then
				return nil;
			end;
			l__HumanoidRootPart__36:ApplyImpulse(l__WorldUtil__15.randomUnitVector(Vector3.new(0, 1, 0), math.rad(360)) * l__HumanoidRootPart__36.AssemblyMass * 10);
			task.wait(1);
			v30:getInstance().Humanoid:ChangeState(Enum.HumanoidStateType.Running);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

