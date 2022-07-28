-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "MeteorsController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
local u1 = l__KnitController__3;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v2.Workspace;
function v4.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MeteorsController";
	p1.meteorsFolder = u2("Folder", {
		Name = "Meteors", 
		Parent = l__Workspace__3
	});
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__6 = v2.ReplicatedStorage;
local l__RunService__7 = v2.RunService;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p3, p4, p5, p6, p7)
		local v6 = Random.new(p7);
		local v7 = u5.new();
		local v8 = CFrame.new(p3) * CFrame.Angles(v6:NextNumber() * math.pi * 2, v6:NextNumber() * math.pi * 2, v6:NextNumber() * math.pi * 2);
		local v9 = CFrame.new(p4);
		local v10 = l__ReplicatedStorage__6.Assets.Effects.Meteor:Clone();
		v10:SetPrimaryPartCFrame(v8);
		v10.Parent = p2.meteorsFolder;
		local u11 = 0;
		local u12 = v6:NextNumber(0.2, 0.5);
		local u13 = v6:NextNumber(0.2, 0.5);
		local u14 = v6:NextNumber(0.2, 0.5);
		local u15 = u2("Part", {
			Anchored = true, 
			Name = "Meteor", 
			CFrame = v8, 
			Size = Vector3.new(4, 4, 4), 
			Color = Color3.fromRGB(0, 0, 0), 
			Material = Enum.Material.Rock, 
			Parent = v10, 
			CanCollide = false
		});
		v7:GiveTask(l__RunService__7.RenderStepped:Connect(function(p8)
			u11 = u11 + p8;
			local v11 = CFrame.new(v8:Lerp(v9, (l__Workspace__3:GetServerTimeNow() - p5) / (p6 - p5)).Position, p4) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
			v10:SetPrimaryPartCFrame(v11);
			u15.CFrame = v11 * CFrame.Angles(u11 * math.pi * 2 * u12, u11 * math.pi * 2 * u13, u11 * math.pi * 2 * u14);
			if p6 <= l__Workspace__3:GetServerTimeNow() then
				v7:DoCleaning();
			end;
		end));
		v7:GiveTask(function()
			task.spawn(function()
				v10:Destroy();
				local v12 = 0;
				if l__Workspace__3.CurrentCamera then
					v12 = (p4 - l__Workspace__3.CurrentCamera.CFrame.Position).Magnitude;
				end;
				local v13 = l__ReplicatedStorage__6.Assets.Effects.MeteorHitEffect:Clone();
				v13.CFrame = v9;
				v13.Parent = p2.meteorsFolder;
				local v14 = {
					destroyAfterSec = 3
				};
				if v12 > 200 then
					local v15 = 0.2;
				else
					v15 = 1;
				end;
				v14.particleMultiplier = v15;
				l__EffectUtil__8:playEffects({ v13 }, nil, v14);
				l__SoundManager__9:playSound(l__GameSound__10.TNT_EXPLODE_1, {
					position = p4, 
					rollOffMaxDistance = 300
				});
				l__SoundManager__9:playSound(l__GameSound__10.CARROT_LAUNCHER_IMPACT, {
					position = p4, 
					rollOffMaxDistance = 300
				});
			end);
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v4.new());
return nil;
