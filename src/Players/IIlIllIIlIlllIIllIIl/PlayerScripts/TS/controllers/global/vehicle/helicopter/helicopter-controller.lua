-- Script Hash: 24dfc0c89948d836b109b01ddc1cc12808ca168e53699bdae0b7ee783c3d6681b4923e309b8e1f062ccb70b98762ecb7
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = setmetatable({}, {
	__tostring = function()
		return "HelicopterController";
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
	p1.Name = "HelicopterController";
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ExplosionType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local l__ReplicatedStorage__4 = v3.ReplicatedStorage;
local l__Workspace__5 = v3.Workspace;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__WatchCollectionTag__8 = v2.WatchCollectionTag;
local l__VehicleType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__TweenService__11 = v3.TweenService;
function v5.KnitStart(p2)
	u1.KnitStart(p2);
	l__ClientSyncEvents__2.ExplosionEffectEvent:connect(function(p3)
		if p3.explosionType == l__ExplosionType__3.HELICOPTER then
			local v7 = l__ReplicatedStorage__4.Assets.Effects.GuidedMissileExplosion:Clone();
			v7.Position = p3.position;
			v7.Parent = l__Workspace__5;
			v7.Debris1:Emit(5);
			v7.Debris2:Emit(5);
			v7.ExplosionFlames:Emit(50);
			l__SoundManager__6:playSound(l__GameSound__7.MINICOPTER_EXPLODE, {
				position = p3.position, 
				rollOffMaxDistance = 160
			});
			task.delay(5, function()
				v7:Destroy();
			end);
		end;
	end);
	l__WatchCollectionTag__8(l__VehicleType__9.MINICOPTER, function(p4)
		if not p4.PrimaryPart then
			p4:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v8 = u10("Sound", {
			Name = "HoverSound", 
			SoundId = l__GameSound__7.MINICOPTER_LOOP, 
			Looped = true, 
			Volume = 0.2, 
			RollOffMaxDistance = 300, 
			RollOffMinDistance = 20, 
			Parent = p4.PrimaryPart
		});
		v8:Play();
		local function u12()
			local v9 = p4:GetAttribute("EngineOn");
			if v9 == true then
				local l__Propeller__10 = p4.Root:WaitForChild("Propeller", 1);
				local l__BackPropeller__11 = p4.Root:WaitForChild("BackPropeller", 1);
				if l__Propeller__10 then
					l__Propeller__10.HingeConstraint.AngularVelocity = 42;
				end;
				if l__BackPropeller__11 then
					l__BackPropeller__11.HingeConstraint.AngularVelocity = 42;
				end;
				l__SoundManager__6:playSound(l__GameSound__7.MINICOPTER_START, {
					position = p4.Root.Position, 
					rollOffMaxDistance = 300
				});
			else
				local l__Propeller__12 = p4.Root:WaitForChild("Propeller", 1);
				local l__BackPropeller__13 = p4.Root:WaitForChild("BackPropeller", 1);
				if l__Propeller__12 then
					l__Propeller__12.HingeConstraint.AngularVelocity = 0;
				end;
				if l__BackPropeller__13 then
					l__BackPropeller__13.HingeConstraint.AngularVelocity = 0;
				end;
				l__SoundManager__6:playSound(l__GameSound__7.MINICOPTER_STOP, {
					position = p4.Root.Position, 
					rollOffMaxDistance = 300
				});
			end;
			local v14 = {};
			if v9 == true then
				local v15 = 0.5;
			else
				v15 = 0;
			end;
			v14.Volume = v15;
			l__TweenService__11:Create(v8, TweenInfo.new(0.6), v14):Play();
		end;
		p4:GetAttributeChangedSignal("EngineOn"):Connect(function()
			u12();
		end);
		u12();
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
