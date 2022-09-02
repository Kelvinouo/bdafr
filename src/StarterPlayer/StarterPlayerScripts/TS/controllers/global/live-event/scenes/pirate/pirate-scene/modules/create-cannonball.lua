-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__ReplicatedStorage__1 = v3.ReplicatedStorage;
local l__EffectUtil__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__Workspace__3 = v3.Workspace;
local l__ScreenShakeUtil__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "screen-shake", "screen-shake-util").ScreenShakeUtil;
local l__default__5 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InQuad__6 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).InQuad;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__RandomUtil__9 = v2.RandomUtil;
local l__Players__10 = v3.Players;
return {
	createCannonball = function(p1)
		local v4 = p1.size;
		if v4 == nil then
			v4 = 4;
		end;
		local v5 = l__ReplicatedStorage__1.Assets.Misc.CannonBall:Clone();
		l__EffectUtil__2:scaleEffect({ v5 }, v4 / v5.Size.X);
		v5.Size = Vector3.new(v4, v4, v4);
		v5.Trail1.Position = Vector3.new(0, v4 / 2, 0);
		v5.Trail2.Position = Vector3.new(0, -v4 / 2, 0);
		v5.Parent = l__Workspace__3;
		task.spawn(function()
			local l__Position__6 = l__Workspace__3.CurrentCamera.CFrame.Position;
			local v7 = {
				magnitude = 0
			};
			local v8 = p1.duration;
			if v8 == nil then
				v8 = 2;
			end;
			v7.duration = v8;
			local v9 = p1.duration;
			if v9 == nil then
				v9 = 2;
			end;
			v7.cycles = 5 * (v9 / 0.25);
			if p1.shakeInTravel then
				l__ScreenShakeUtil__4.shake(p1.origin:Lerp(l__Position__6, 0.6), (p1.origin - l__Position__6).Unit, v7);
			end;
			local v10 = p1.duration;
			if v10 == nil then
				v10 = 2;
			end;
			l__default__5(v10, l__InQuad__6, function(p2)
				local v11 = p1.origin:Lerp(p1.goal, p2);
				if p1.bezierControlPoint then
					v11 = p1.origin:Lerp(p1.bezierControlPoint, p2):Lerp(p1.bezierControlPoint:Lerp(p1.goal, p2), p2);
				end;
				v5.Position = v11;
				local v12 = p1.shakeMagnitude;
				if v12 == nil then
					v12 = 1.2;
				end;
				v7.magnitude = v12 * 0.2 * p2;
			end, 0, 1):Wait();
			v5.Transparency = 1;
			local v13, v14, v15 = ipairs((v5:GetDescendants()));
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				v15 = v13;
				if v14:IsA("ParticleEmitter") then
					v14.Enabled = false;
				end;			
			end;
			if p1.playHitEffect == nil or p1.playHitEffect == true then
				if p1.hitPirateShip then
					local v16 = l__ReplicatedStorage__1.Assets.Effects.PirateShipHit:Clone();
					v16.Position = p1.goal;
					v16.Parent = l__Workspace__3;
					l__EffectUtil__2:playEffects({ v16 }, nil, {
						destroyAfterSec = 3
					});
					l__SoundManager__7:playSound(l__GameSound__8.PIRATE_SHIP_HIT, {
						position = p1.goal, 
						rollOffMaxDistance = 500
					});
				else
					local v17 = l__ReplicatedStorage__1.Assets.Effects.CannonballLand:Clone();
					v17.Position = p1.goal;
					v17.Parent = l__Workspace__3;
					l__EffectUtil__2:playEffects(v17:GetDescendants(), nil, {
						destroyAfterSec = 3
					});
					task.delay(3, function()
						local v18 = v17;
						if v18 ~= nil then
							v18 = v18:Destroy();
						end;
						return v18;
					end);
					l__SoundManager__7:playSound(l__RandomUtil__9.fromList(l__GameSound__8.PIRATE_CANNON_EXPLODE_1, l__GameSound__8.PIRATE_CANNON_EXPLODE_2, l__GameSound__8.PIRATE_CANNON_EXPLODE_3), {
						position = p1.goal, 
						rollOffMinDistsance = 50, 
						rollOffMaxDistance = 500
					});
				end;
			end;
			local v19 = l__Players__10.LocalPlayer;
			if v19 ~= nil then
				v19 = v19.Character;
				if v19 ~= nil then
					v19 = v19:GetPrimaryPartCFrame();
				end;
			end;
			local v20 = v19;
			if v20 == nil then
				v20 = l__Workspace__3.CurrentCamera.CFrame;
			end;
			local v21 = {};
			local v22 = p1.shakeMagnitude;
			if v22 == nil then
				v22 = 1.2;
			end;
			v21.magnitude = v22 / ((p1.goal - v20.Position).Magnitude * 0.1);
			local v23 = p1.shakeDuration;
			if v23 == nil then
				v23 = 0.25;
			end;
			v21.cycles = 5 * (v23 / 0.25);
			local v24 = p1.shakeDuration;
			if v24 == nil then
				v24 = 0.25;
			end;
			v21.duration = v24;
			l__ScreenShakeUtil__4.shake(p1.goal, (p1.goal - v20.Position).Unit, v21);
			task.wait(3);
			v5:Destroy();
		end);
		return v5;
	end
};
