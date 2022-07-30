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
local l__WatchCollectionTag__2 = v2.WatchCollectionTag;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__SoundManager__5 = v2.SoundManager;
local l__TweenService__6 = v3.TweenService;
function v5.watchHelicopterVehicle(p2, p3)
	l__WatchCollectionTag__2(p3, function(p4)
		if not p4.PrimaryPart then
			p4:GetPropertyChangedSignal("PrimaryPart"):Wait();
		end;
		local v7 = u3("Sound", {
			Name = "HoverSound", 
			SoundId = l__GameSound__4.MINICOPTER_LOOP, 
			Looped = true, 
			Volume = 0.2, 
			RollOffMaxDistance = 300, 
			RollOffMinDistsance = 20, 
			Parent = p4.PrimaryPart
		});
		v7:Play();
		local function u7()
			local v8 = p4:GetAttribute("EngineOn");
			if v8 == true then
				local l__Propeller__9 = p4.Root:WaitForChild("Propeller", 1);
				local l__BackPropeller__10 = p4.Root:WaitForChild("BackPropeller", 1);
				if l__Propeller__9 then
					l__Propeller__9.HingeConstraint.AngularVelocity = 42;
				end;
				if l__BackPropeller__10 then
					l__BackPropeller__10.HingeConstraint.AngularVelocity = 42;
				end;
				l__SoundManager__5:playSound(l__GameSound__4.MINICOPTER_START, {
					position = p4.Root.Position, 
					rollOffMaxDistance = 300
				});
			else
				local l__Propeller__11 = p4.Root:WaitForChild("Propeller", 1);
				local l__BackPropeller__12 = p4.Root:WaitForChild("BackPropeller", 1);
				if l__Propeller__11 then
					l__Propeller__11.HingeConstraint.AngularVelocity = 0;
				end;
				if l__BackPropeller__12 then
					l__BackPropeller__12.HingeConstraint.AngularVelocity = 0;
				end;
				l__SoundManager__5:playSound(l__GameSound__4.MINICOPTER_STOP, {
					position = p4.Root.Position, 
					rollOffMaxDistance = 300
				});
			end;
			local v13 = {};
			if v8 == true then
				local v14 = 0.5;
			else
				v14 = 0;
			end;
			v13.Volume = v14;
			l__TweenService__6:Create(v7, TweenInfo.new(0.6), v13):Play();
		end;
		p4:GetAttributeChangedSignal("EngineOn"):Connect(function()
			u7();
		end);
		u7();
	end);
end;
local l__ClientSyncEvents__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__ExplosionType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local l__ReplicatedStorage__10 = v3.ReplicatedStorage;
local l__Workspace__11 = v3.Workspace;
local l__VehicleType__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local l__default__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__HelicopterMissile__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile").HelicopterMissile;
function v5.KnitStart(p5)
	u1.KnitStart(p5);
	l__ClientSyncEvents__8.ExplosionEffect:connect(function(p6)
		if p6.explosionType == l__ExplosionType__9.HELICOPTER then
			local v15 = l__ReplicatedStorage__10.Assets.Effects.GuidedMissileExplosion:Clone();
			v15.Position = p6.position;
			v15.Parent = l__Workspace__11;
			v15.Debris1:Emit(5);
			v15.Debris2:Emit(5);
			v15.ExplosionFlames:Emit(50);
			l__SoundManager__5:playSound(l__GameSound__4.MINICOPTER_EXPLODE, {
				position = p6.position, 
				rollOffMaxDistance = 160
			});
			task.delay(5, function()
				v15:Destroy();
			end);
		end;
	end);
	p5:watchHelicopterVehicle(l__VehicleType__12.MINICOPTER);
	p5:watchHelicopterVehicle(l__VehicleType__12.ATTACK_HELI);
	l__default__13.Client:GetNamespace("Helicopter"):Get("ReplicateMissile"):Connect(function(p7, p8, p9, p10)
		l__HelicopterMissile__14.new(p8, p9, p7):fire(p10, function()

		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(v5.new());
return nil;
