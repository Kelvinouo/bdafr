-- Script Hash: 501f29b237e4cbb0ba9bb961ca73b6058267f9d09dd8b6a6c0b352c663a450fa1fc60461e3cd8a1c4bb9bf28c2b3f64a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "SpiritController";
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
	p1.Name = "SpiritController";
	p1.random = Random.new();
	p1.spiritToMaid = {};
end;
local l__CollectionService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local l__Maid__3 = v3.Maid;
local l__default__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = v2.ConstantManager.registerConstants(script, {
	RotationSpeed = 15, 
	ExplosionSoundMaxDistance = 150, 
	RandomSizeOffset = 10, 
	RandomPositionOffset = 2
});
local l__KnitClient__8 = v3.KnitClient;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__CollectionService__2:GetInstanceAddedSignal("spirit"):Connect(function(p3)
		local v7 = l__Maid__3.new();
		p2.spiritToMaid[p3] = v7;
		local v8 = p2:setupSpiritAnimationTracks(p3);
		v8.idle:Play();
		v7:GiveTask(p3:GetAttributeChangedSignal("State"):Connect(function()
			local v9 = p3:GetAttribute("State");
			if v9 ~= 1 then
				if v9 == 2 then
					p2:tweenOutSpirit(p3);
				end;
				return;
			end;
			v8.idle:Stop();
			v8.run:Play();
		end));
		v7:GiveTask(v8.idle);
		v7:GiveTask(v8.run);
	end);
	l__CollectionService__2:GetInstanceRemovedSignal("spirit"):Connect(function(p4)
		local v10 = p2.spiritToMaid[p4];
		if v10 ~= nil then
			v10:DoCleaning();
		end;
		p2.spiritToMaid[p4] = nil;
	end);
	l__default__4.Client:OnEvent("SpiritExplosion", v1.async(function(p5)
		l__SoundManager__5:playSound(l__GameSound__6.SPIRIT_EXPLODE, {
			position = p5.position, 
			rollOffMaxDistance = u7.ExplosionSoundMaxDistance
		});
		v1.await(l__KnitClient__8.Controllers.FancyExplosionController:createExplosion({
			position = p5.position, 
			radius = p5.radius, 
			randomSizeOffset = u7.RandomSizeOffset, 
			randomPositionOffset = u7.RandomPositionOffset, 
			rotationSpeed = u7.RotationSpeed
		}));
	end));
end;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.setupSpiritAnimationTracks(p6, p7)
	local v11 = Instance.new("AnimationController");
	v11.Parent = p7;
	local v12 = Instance.new("Animator");
	v12.Parent = v11;
	return {
		idle = v12:LoadAnimation(u9("Animation", {
			AnimationId = "http://www.roblox.com/asset/?id=616006778"
		})), 
		run = v12:LoadAnimation(u9("Animation", {
			AnimationId = "http://www.roblox.com/asset/?id=616010382"
		}))
	};
end;
local l__default__10 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InExpo__11 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InExpo;
v5.tweenOutSpirit = v1.async(function(p8, p9)
	l__default__10(0.2, l__InExpo__11, function(p10)
		for v13, v14 in ipairs(p9:GetChildren()) do
			if v14:IsA("BasePart") then
				v14.Transparency = p10;
			end;
		end;
	end, 0.9, 1):Wait();
end);
u1 = v3.KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
