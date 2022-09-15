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
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__2 = v2.Workspace;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "MeteorsController";
	p1.meteorsFolder = u1("Folder", {
		Name = "Meteors", 
		Parent = l__Workspace__2
	});
end;
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__ReplicatedStorage__5 = v2.ReplicatedStorage;
local l__RunService__6 = v2.RunService;
local l__EffectUtil__7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__default__3.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p3, p4, p5, p6, p7)
		local v6 = Random.new(p7);
		local v7 = u4.new();
		local v8 = CFrame.new(p3) * CFrame.Angles(v6:NextNumber() * math.pi * 2, v6:NextNumber() * math.pi * 2, v6:NextNumber() * math.pi * 2);
		local v9 = CFrame.new(p4);
		local v10 = l__ReplicatedStorage__5.Assets.Effects.Meteor:Clone();
		v10:SetPrimaryPartCFrame(v8);
		v10.Parent = p2.meteorsFolder;
		local u10 = 0;
		local u11 = v6:NextNumber(0.2, 0.5);
		local u12 = v6:NextNumber(0.2, 0.5);
		local u13 = v6:NextNumber(0.2, 0.5);
		local u14 = u1("Part", {
			Anchored = true, 
			Name = "Meteor", 
			CFrame = v8, 
			Size = Vector3.new(4, 4, 4), 
			Color = Color3.fromRGB(0, 0, 0), 
			Material = Enum.Material.Rock, 
			Parent = v10, 
			CanCollide = false
		});
		v7:GiveTask(l__RunService__6.RenderStepped:Connect(function(p8)
			u10 = u10 + p8;
			local v11 = CFrame.new(v8:Lerp(v9, (l__Workspace__2:GetServerTimeNow() - p5) / (p6 - p5)).Position, p4) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
			v10:SetPrimaryPartCFrame(v11);
			u14.CFrame = v11 * CFrame.Angles(u10 * math.pi * 2 * u11, u10 * math.pi * 2 * u12, u10 * math.pi * 2 * u13);
			if p6 <= l__Workspace__2:GetServerTimeNow() then
				v7:DoCleaning();
			end;
		end));
		v7:GiveTask(function()
			task.spawn(function()
				v10:Destroy();
				local v12 = 0;
				if l__Workspace__2.CurrentCamera then
					v12 = (p4 - l__Workspace__2.CurrentCamera.CFrame.Position).Magnitude;
				end;
				local v13 = l__ReplicatedStorage__5.Assets.Effects.MeteorHitEffect:Clone();
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
				l__EffectUtil__7:playEffects({ v13 }, nil, v14);
				l__SoundManager__8:playSound(l__GameSound__9.TNT_EXPLODE_1, {
					position = p4, 
					rollOffMaxDistance = 300
				});
				l__SoundManager__8:playSound(l__GameSound__9.CARROT_LAUNCHER_IMPACT, {
					position = p4, 
					rollOffMaxDistance = 300
				});
			end);
		end);
	end);
end;
local v16 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
