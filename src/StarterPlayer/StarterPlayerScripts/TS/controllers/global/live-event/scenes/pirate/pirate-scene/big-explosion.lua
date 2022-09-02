-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = {
	name = "Big explosion", 
	event = "Heartbeat"
};
local l__PirateSceneTimestamps__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "scene-config", "pirate-scene-timestamps").PirateSceneTimestamps;
local l__useEffect__2 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src.Runtime).useEffect;
local l__createCannonball__3 = v1.import(script, script.Parent, "modules", "create-cannonball").createCannonball;
local l__SoundManager__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ReplicatedStorage__6 = v3.ReplicatedStorage;
local l__Workspace__7 = v3.Workspace;
local l__EffectUtil__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__OutQuart__9 = v2.OutQuart;
local l__InQuad__10 = v2.InQuad;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "plasma").src);
local l__Lighting__12 = v3.Lighting;
local u13 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
function v4.func(p1, p2, p3)
	if l__PirateSceneTimestamps__1.BigExplosionShoot < p1.elapsedEventTime then
		l__useEffect__2(function()
			local v5 = Vector3.new(38, 293.05, 302);
			local v6 = Vector3.new(17, 700, -1200);
			l__SoundManager__4:playSound(l__GameSound__5.PIRATE_EVENT_MOTHERSHIP_FIRE, {
				position = v6, 
				parent = l__createCannonball__3({
					origin = v6, 
					goal = v5, 
					bezierControlPoint = v6:Lerp(v5, 0.5) + Vector3.new(0, 600, 0), 
					duration = l__PirateSceneTimestamps__1.BigExplosionHit - l__PirateSceneTimestamps__1.BigExplosionShoot, 
					size = 30, 
					shakeMagnitude = 8, 
					shakeDuration = 0.6, 
					shakeInTravel = true, 
					playHitEffect = false
				}), 
				rollOffMaxDistance = 1000000, 
				rollOffMinDistsance = 1000, 
				volumeMultiplier = 2
			});
			task.delay(l__PirateSceneTimestamps__1.BigExplosionHit - l__PirateSceneTimestamps__1.BigExplosionShoot, function()
				local v7 = l__ReplicatedStorage__6.Assets.Effects.BigCannonballLand:Clone();
				v7.Anchored = true;
				v7.Position = v5;
				v7.Parent = l__Workspace__7;
				l__EffectUtil__8:playEffects(v7:GetDescendants(), nil);
				l__SoundManager__4:playSound(l__GameSound__5.PIRATE_EVENT_MOTHERSHIP_IMPACT, {
					position = v5, 
					rollOffMaxDistance = 600, 
					volumeMultiplier = 2
				});
				task.delay(3, function()
					v7:Destroy();
				end);
			end);
		end);
		if l__PirateSceneTimestamps__1.BigExplosionHit < p1.elapsedEventTime then
			if p1.elapsedEventTime < l__PirateSceneTimestamps__1.BigExplosionHit + 1 then
				local v8 = l__OutQuart__9(math.min(p1.elapsedEventTime - l__PirateSceneTimestamps__1.BigExplosionHit, 1), 0, 1, 1);
			elseif l__PirateSceneTimestamps__1.BigExplosionHit + 3 < p1.elapsedEventTime then
				v8 = l__InQuad__10(math.min(p1.elapsedEventTime - (l__PirateSceneTimestamps__1.BigExplosionHit + 3), 1), 1, -1, 1);
			else
				v8 = 1;
			end;
			u11.portal(l__Lighting__12, function()
				u11.useInstance(function(p4)
					local v9 = u13("ColorCorrectionEffect", {
						TintColor = Color3.fromRGB()
					});
					p4.colorCorrectionEffect = v9;
					return v9;
				end).colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(0, 0, 0), v8);
			end);
			u11.portal(l__Lighting__12, function()
				u11.useInstance(function(p5)
					local v10 = u13("BlurEffect", {});
					p5.blurEffect = v10;
					return v10;
				end).blurEffect.Size = 24 * v8;
			end);
		end;
	end;
end;
return {
	BigExplosion = v4
};
