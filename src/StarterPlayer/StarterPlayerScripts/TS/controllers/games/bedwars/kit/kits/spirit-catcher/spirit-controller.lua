-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
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
function v5.constructor(p1, ...)
	l__KnitController__4.constructor(p1, ...);
	p1.Name = "SpiritController";
	p1.random = Random.new();
	p1.spiritToMaid = {};
end;
local l__CollectionService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u6 = v2.ConstantManager.registerConstants(script, {
	RotationSpeed = 15, 
	ExplosionSoundMaxDistance = 150, 
	RandomSizeOffset = 10, 
	RandomPositionOffset = 2
});
local l__KnitClient__7 = v3.KnitClient;
function v5.KnitStart(p2)
	l__KnitController__4.KnitStart(p2);
	l__CollectionService__1:GetInstanceAddedSignal("spirit"):Connect(function(p3)
		local v7 = u2.new();
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
	l__CollectionService__1:GetInstanceRemovedSignal("spirit"):Connect(function(p4)
		local v10 = p2.spiritToMaid[p4];
		if v10 ~= nil then
			v10:DoCleaning();
		end;
		p2.spiritToMaid[p4] = nil;
	end);
	l__default__3.Client:OnEvent("RemoteName", v1.async(function(p5)
		l__SoundManager__4:playSound(l__GameSound__5.SPIRIT_EXPLODE, {
			position = p5.position, 
			rollOffMaxDistance = u6.ExplosionSoundMaxDistance
		});
		v1.await(l__KnitClient__7.Controllers.FancyExplosionController:createExplosion({
			position = p5.position, 
			radius = p5.radius, 
			randomSizeOffset = u6.RandomSizeOffset, 
			randomPositionOffset = u6.RandomPositionOffset, 
			rotationSpeed = u6.RotationSpeed
		}));
	end));
end;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v5.setupSpiritAnimationTracks(p6, p7)
	local v11 = Instance.new("AnimationController");
	v11.Parent = p7;
	local v12 = Instance.new("Animator");
	v12.Parent = v11;
	return {
		idle = v12:LoadAnimation(u8("Animation", {
			AnimationId = "http://www.roblox.com/asset/?id=616006778"
		})), 
		run = v12:LoadAnimation(u8("Animation", {
			AnimationId = "http://www.roblox.com/asset/?id=616010382"
		}))
	};
end;
local l__default__9 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InExpo__10 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InExpo;
v5.tweenOutSpirit = v1.async(function(p8, p9)
	l__default__9(0.2, l__InExpo__10, function(p10)
		local v13, v14, v15 = ipairs(p9:GetChildren());
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			if v14:IsA("BasePart") then
				v14.Transparency = p10;
			end;		
		end;
	end, 0.9, 1):Wait();
end);
local v16 = v3.KnitClient.CreateController(v5.new());
return nil;
