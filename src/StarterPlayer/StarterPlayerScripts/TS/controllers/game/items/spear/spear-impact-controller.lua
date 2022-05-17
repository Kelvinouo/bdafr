
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SpearImpactController";
	end, 
	__index = l__KnitController__4
});
v5.__index = v5;
function v5.new(...)
	local v6 = setmetatable({}, v5);
	return v6:constructor(...) and v6;
end;
local u1 = l__KnitController__4;
function v5.constructor(p1, ...)
	u1.constructor(p1, ...);
	p1.Name = "SpearImpactController";
	p1.random = Random.new();
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__Maid__3 = v2.Maid;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__8 = v3.Workspace;
local l__WorldUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "world-util").WorldUtil;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "lightning-beams").src);
local l__KnitClient__11 = v2.KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__default__2.Client:OnEvent("RemoteName", function(p3)
		local v7 = l__Maid__3.new();
		l__SoundManager__4:playSound(l__GameSound__5.SPEAR_HIT, {
			position = p3.position, 
			rollOffMaxDistance = 100
		});
		local v8 = l__ReplicatedStorage__6.Assets.Effects.SpearExplodeEffect:Clone();
		v8.Enabled = false;
		local v9 = u7("Attachment", {
			WorldCFrame = CFrame.new(p3.position), 
			Children = { v8 }, 
			Parent = l__Workspace__8.Terrain
		});
		v7:GiveTask(v9);
		v8:Emit(10);
		if Enum.SavedQualitySetting.QualityLevel2.Value <= UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value then
			local v10 = p2.random:NextNumber(3, 6);
			local v11 = 0;
			local v12 = false;
			while true do
				if v12 then
					v11 = v11 + 1;
				else
					v12 = true;
				end;
				if not (v11 < v10) then
					break;
				end;
				local v13 = v9.WorldPosition + l__WorldUtil__9.randomUnitVector(Vector3.new(0, 1, 0), math.rad(90)) * 15;
				local v14 = u10.new(v9, {
					WorldPosition = v13, 
					WorldAxis = (v9.WorldPosition - v13).Unit
				}, 5);
				v14.MaxThicknessMultiplier = 2;
				v14.AnimationSpeed = 0;
				v14.FadeLength = 0.25;
				v14.PulseSpeed = p2.random:NextNumber(4, 6);
				v14.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(70, 109, 236), p2.random:NextNumber());
				v14.PulseLength = 0.6;			
			end;
		end;
		task.delay(2, function()
			v7:DoCleaning();
		end);
		l__KnitClient__11.Controllers.FancyExplosionController:createExplosion({
			position = p3.position, 
			radius = p3.radius, 
			randomSizeOffset = 0, 
			randomPositionOffset = 0, 
			rotationSpeed = 30, 
			model = l__ReplicatedStorage__6.Assets.Effects.SpearExplode, 
			inDuration = 0.3, 
			outDuration = 0.3
		});
	end);
end;
u1 = v2.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;

