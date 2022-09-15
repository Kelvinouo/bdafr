-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = setmetatable({}, {
	__tostring = function()
		return "SnowConeStatusEffectController";
	end, 
	__index = l__KnitController__3
});
v4.__index = v4;
function v4.new(...)
	local v5 = setmetatable({}, v4);
	return v5:constructor(...) and v5;
end;
function v4.constructor(p1)
	l__KnitController__3.constructor(p1);
	p1.Name = "SnowConeStatusEffectController";
end;
local l__ClientSyncEvents__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__StatusEffectUtil__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__BalanceFile__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "make"));
local l__Workspace__6 = v2.Workspace;
local l__ReplicatedStorage__7 = v2.ReplicatedStorage;
local l__SyncEventPriority__8 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEventPriority;
local l__Players__9 = v2.Players;
local l__BlockEngine__10 = v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out).BlockEngine;
local l__EffectUtil__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
local l__SoundManager__12 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.KnitStart(p2)
	l__KnitController__3.KnitStart(p2);
	l__ClientSyncEvents__1.ProjectileLaunched:connect(function(p3)
		if not p3.shooter then
			return nil;
		end;
		if l__StatusEffectUtil__2:getStacks(p3.shooter, l__StatusEffectType__3.SNOW_CONE) < l__BalanceFile__4.SNOW_CONE_ARROW_COST then
			return nil;
		end;
		local l__Handle__6 = p3.projectile:FindFirstChild("Handle");
		local v7 = l__Handle__6;
		if v7 ~= nil then
			v7 = v7:FindFirstChild("Trail");
		end;
		if v7 ~= nil then
			v7:Destroy();
		end;
		local v8 = u5("Trail", {
			FaceCamera = true, 
			LightInfluence = 0, 
			Lifetime = 0.35, 
			Attachment0 = u5("Attachment", {
				Position = Vector3.new(0, 0, 0), 
				Parent = l__Handle__6
			}), 
			Attachment1 = u5("Attachment", {
				Position = Vector3.new(0, 0.2, 0), 
				Parent = l__Handle__6
			}), 
			Brightness = 5, 
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(108, 168, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(108, 168, 255)) }), 
			WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0) }), 
			Transparency = NumberSequence.new(0.5), 
			Parent = l__Workspace__6
		});
		local v9 = l__ReplicatedStorage__7.Assets.Effects.Snowflake:Clone();
		v9.Parent = l__Handle__6;
		v9.Enabled = true;
		v9.Rate = 10;
		if l__Handle__6 ~= nil then
			local v10 = l__Handle__6.Destroying:Connect(function()
				v9.Enabled = false;
				task.delay(3, function()
					v8:Destroy();
					v9:Destroy();
				end);
			end);
		end;
	end);
	l__ClientSyncEvents__1.DamageBlock:setPriority(l__SyncEventPriority__8.MONITOR):connect(function(p4)
		if p4:isCancelled() then
			return nil;
		end;
		local l__Character__11 = l__Players__9.LocalPlayer.Character;
		if not l__Character__11 then
			return nil;
		end;
		if l__BalanceFile__4.SNOW_CONE_BLOCK_COST <= l__StatusEffectUtil__2:getStacks(l__Character__11, l__StatusEffectType__3.SNOW_CONE) then
			task.spawn(function()
				local v12 = l__ReplicatedStorage__7.Assets.Effects.SnowBlast:Clone();
				v12.Parent = l__Workspace__6;
				v12.Position = l__BlockEngine__10:getWorldPosition(p4.blockPosition);
				l__EffectUtil__11:playEffects({ v12 }, nil, {
					destroyAfterSec = 2, 
					particleMultiplier = 0.5, 
					sizeMultiplier = 0.7
				});
			end);
		end;
	end);
	l__ClientSyncEvents__1.LocalProjectileImpact:connect(function(p5)
		if p5.projectile.Name ~= "arrow" then
			return nil;
		end;
		local v13 = l__Players__9:GetPlayerByUserId((p5.projectile:GetAttribute("ProjectileShooter")));
		if not v13 then
			return nil;
		end;
		local v14 = l__StatusEffectUtil__2:getActive(v13.Character, l__StatusEffectType__3.SNOW_CONE);
		if v14 ~= nil then
			v14 = v14.stacks;
		end;
		local v15 = v14;
		if v15 == nil then
			v15 = false;
		end;
		if v15 ~= 0 and v15 == v15 and v15 then
			p5.projectile:SetAttribute("IgnoreDefaultImpactEffect", true);
			local v16 = l__ReplicatedStorage__7.Assets.Effects.SnowBlast:Clone();
			v16.Position = p5.hitPosition;
			v16.Parent = l__Workspace__6;
			task.spawn(function()
				l__EffectUtil__11:playEffects(v16:GetChildren(), nil, {
					sizeMultiplier = 0.5, 
					destroyAfterSec = 1.5
				});
			end);
		end;
	end);
	l__ClientSyncEvents__1.ItemConsumed:connect(function(p6)
		local v17 = l__ReplicatedStorage__7.Assets.Effects.SnowBlast:Clone();
		local v18 = p6.entity:getInstance().PrimaryPart;
		if v18 ~= nil then
			v18 = v18.Position;
		end;
		if not v18 then
			return nil;
		end;
		v17.Position = v18;
		v17.Parent = p6.entity:getInstance().PrimaryPart;
		task.spawn(function()
			l__SoundManager__12:playSound(l__GameSound__13.SNOW_CONE_MACHINE_MAKING_FINISH, {
				position = v18
			});
			l__EffectUtil__11:playEffects(v17:GetChildren(), nil, {
				destroyAfterSec = 1.5
			});
		end);
	end);
end;
local v19 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController(v4.new());
return nil;
