
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "MeteorsController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__3 = v3.Workspace;
function v5.constructor(p1)
	u1.constructor(p1);
	p1.Name = "MeteorsController";
	p1.meteorsFolder = u2("Folder", {
		Name = "Meteors", 
		Parent = l__Workspace__3
	});
end;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Maid__5 = v2.Maid;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__RunService__7 = v3.RunService;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__9 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__4.Client:GetNamespace("Disaster"):OnEvent("RemoteName", function(p3, p4, p5, p6, p7)
		local v7 = Random.new(p7);
		local v8 = l__Maid__5.new();
		local v9 = CFrame.new(p3) * CFrame.Angles(v7:NextNumber() * math.pi * 2, v7:NextNumber() * math.pi * 2, v7:NextNumber() * math.pi * 2);
		local v10 = CFrame.new(p4);
		local v11 = l__ReplicatedStorage__6.Assets.Effects.Meteor:Clone();
		v11:SetPrimaryPartCFrame(v9);
		v11.Parent = p2.meteorsFolder;
		local u11 = 0;
		local u12 = v7:NextNumber(0.2, 0.5);
		local u13 = v7:NextNumber(0.2, 0.5);
		local u14 = v7:NextNumber(0.2, 0.5);
		local u15 = u2("Part", {
			Anchored = true, 
			Name = "Meteor", 
			CFrame = v9, 
			Size = Vector3.new(4, 4, 4), 
			Color = Color3.fromRGB(0, 0, 0), 
			Material = Enum.Material.Rock, 
			Parent = v11, 
			CanCollide = false
		});
		v8:GiveTask(l__RunService__7.RenderStepped:Connect(function(p8)
			u11 = u11 + p8;
			local v12 = CFrame.new(v9:Lerp(v10, (l__Workspace__3:GetServerTimeNow() - p5) / (p6 - p5)).Position, p4) * CFrame.Angles(math.rad(90), 0, math.rad(90));
			v11:SetPrimaryPartCFrame(v12);
			u15.CFrame = v12 * CFrame.Angles(u11 * math.pi * 2 * u12, u11 * math.pi * 2 * u13, u11 * math.pi * 2 * u14);
			if p6 <= l__Workspace__3:GetServerTimeNow() then
				v8:DoCleaning();
			end;
		end));
		v8:GiveTask(function()
			task.spawn(function()
				v11:Destroy();
				local v13 = 0;
				if l__Workspace__3.CurrentCamera then
					v13 = (p4 - l__Workspace__3.CurrentCamera.CFrame.Position).Magnitude;
				end;
				local v14 = l__ReplicatedStorage__6.Assets.Effects.MeteorHitEffect:Clone();
				v14.CFrame = v10;
				v14.Parent = p2.meteorsFolder;
				local v15 = {
					destroyAfterSec = 3
				};
				if v13 > 200 then
					local v16 = 0.2;
				else
					v16 = 1;
				end;
				v15.particleMultiplier = v16;
				l__EffectUtil__8:playEffects({ v14 }, nil, v15);
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
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

