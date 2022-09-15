-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__KnitController__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v6 = setmetatable({}, {
	__tostring = function()
		return "VolleyEnchantController";
	end, 
	__index = l__KnitController__5
});
v6.__index = v6;
function v6.new(...)
	local v7 = setmetatable({}, v6);
	return v7:constructor(...) and v7;
end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v6.constructor(p1)
	l__KnitController__5.constructor(p1);
	p1.Name = "VolleyEnchantController";
	p1.canFireVolleyArrows = false;
	p1.cooldownMaid = u1.new();
end;
local l__ClientSyncEvents__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local l__StatusEffectUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__CooldownId__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local l__BalanceFile__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
function v6.KnitStart(p2)
	l__KnitController__5.KnitStart(p2);
	l__ClientSyncEvents__2.StatusEffectAdded:connect(function(p3)
		if not p2:checkIsLocalPlayer(p3.entityInstance) then
			return nil;
		end;
		if p3.statusEffect == l__StatusEffectType__3.VOLLEY and l__StatusEffectUtil__4:isActive(p3.entityInstance, l__StatusEffectType__3.VOLLEY) then
			p2.canFireVolleyArrows = true;
			p2.cooldownMaid:DoCleaning();
			p2.cooldownMaid:GiveTask(l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(l__CooldownId__6.VOLLEY));
		end;
	end);
	l__ClientSyncEvents__2.StatusEffectRemoved:connect(function(p4)
		if not p2:checkIsLocalPlayer(p4.entityInstance) then
			return nil;
		end;
		if p4.statusEffect == l__StatusEffectType__3.VOLLEY then
			p2.canFireVolleyArrows = false;
			p2.cooldownMaid:DoCleaning();
		end;
	end);
	l__ClientSyncEvents__2.ProjectileLaunched:connect(function(p5)
		if not p5:isLocalShooter() then
			return nil;
		end;
		if p5:isCancelled() then
			return nil;
		end;
		if not p5.shooter then
			return nil;
		end;
		local v8 = p5:getShooterHandItem();
		if v8 == nil then
			return nil;
		end;
		if p2:checkHand(v8.tool) and p2:checkProjectile(p5.projectileType) and l__StatusEffectUtil__4:isActive(p5.shooter, l__StatusEffectType__3.VOLLEY) and p2.canFireVolleyArrows then
			p2.canFireVolleyArrows = false;
			task.delay(0, function()
				p2:launchVolleyArrows(p5);
			end);
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(l__CooldownId__6.VOLLEY, l__BalanceFile__7.VOLLEY_ENCHANT_COOLDOWN, {
				cooldownBar = {
					color = Color3.fromRGB(77, 115, 209)
				}
			});
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(l__CooldownId__6.VOLLEY, "buffer", function()
				if not p2.canFireVolleyArrows then
					p2.canFireVolleyArrows = true;
				end;
			end);
		end;
	end);
	l__ClientSyncEvents__2.LocalProjectileImpact:connect(function(p6)
		if p6.projectile.Name == "volley_arrow" then
			p2:playEffect(CFrame.new(p6.hitPosition));
		end;
	end);
end;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ProjectileHandler__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local l__KnitClient__10 = v3.KnitClient;
local l__ItemType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__SoundManager__12 = v2.SoundManager;
local l__GameSound__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v6.launchVolleyArrows(p7, p8)
	if not p8:isLocalShooter() then
		return nil;
	end;
	local v9 = p8:getShooterHandItem();
	if not v9 then
		return nil;
	end;
	local v10 = l__getItemMeta__8(v9.tool.Name);
	if not v10 or not v10.projectileSource then
		return nil;
	end;
	local v11 = l__BalanceFile__7.VOLLEY_ENCHANT_ARROW_COUNT;
	if p7:checkHand(v9.tool) then
		local v12 = 0;
		local v13 = false;
		while true do
			if v13 then
				v12 = v12 + 1;
			else
				v13 = true;
			end;
			if not (v12 < v11) then
				break;
			end;
			task.spawn(function()
				local v14 = p7:calculateTargetPoint(p8);
				if not v14 then
					return nil;
				end;
				local v15 = l__ProjectileHandler__9.new(1, p8.launchVelocity.Magnitude, "volley_arrow", nil, v14, Vector3.new(0, 2, 0));
				if v10.projectileSource then
					l__KnitClient__10.Controllers.ProjectileController:launchProjectile(v9.tool.Name, l__ItemType__11.VOLLEY_ARROW, v15, v9.tool, v10.projectileSource, nil, "volley_arrow");
				end;
			end);		
		end;
		l__SoundManager__12:playSound(l__GameSound__13.VOLLEY_BOW_FIRE, {
			volumeMultiplier = 1.1, 
			rollOffMaxDistance = 30
		});
	end;
end;
function v6.checkHand(p9, p10)
	if not p10 then
		return false;
	end;
	if p10.Name ~= l__ItemType__11.WOOD_BOW and p10.Name ~= l__ItemType__11.WOOD_CROSSBOW and p10.Name ~= l__ItemType__11.TACTICAL_CROSSBOW then
		return false;
	end;
	return true;
end;
function v6.checkProjectile(p11, p12)
	if p12 ~= "arrow" and p12 ~= "crossbow_arrow" and p12 ~= "tactical_crossbow_arrow" then
		return false;
	end;
	return true;
end;
local u14 = v2.ConstantManager.registerConstants(script, {
	VolleySpread = 0.04
});
function v6.calculateTargetPoint(p13, p14)
	return (p14.launchVelocity.Unit + Vector3.new((math.random() * 2 - 1) * u14.VolleySpread, (math.random() * 2 - 1) * u14.VolleySpread, (math.random() * 2 - 1) * u14.VolleySpread)) * 100 + p14.origin;
end;
local l__ProjectileMeta__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
function v6.calculateVelocityMultiplier(p15, p16)
	local l__launchVelocity__16 = l__ProjectileMeta__15[p16.projectileType].launchVelocity;
	if l__launchVelocity__16 == 0 or l__launchVelocity__16 ~= l__launchVelocity__16 or not l__launchVelocity__16 then
		return nil;
	end;
	return p16.launchVelocity.Magnitude / l__launchVelocity__16;
end;
local l__ReplicatedStorage__16 = v4.ReplicatedStorage;
local l__Workspace__17 = v4.Workspace;
local l__EffectUtil__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "effect", "effect-util").EffectUtil;
function v6.playEffect(p17, p18)
	task.spawn(function()
		local v17 = l__ReplicatedStorage__16.Assets.Effects.VolleyArrowHit:Clone();
		v17.CFrame = p18;
		v17.Parent = l__Workspace__17;
		l__EffectUtil__18:playEffects({ v17 }, nil, {
			destroyAfterSec = 0.75, 
			sizeMultiplier = 0.5
		});
	end);
end;
local l__Players__19 = v4.Players;
function v6.checkIsLocalPlayer(p19, p20)
	local v18 = false;
	if p20 ~= nil then
		v18 = p20 == l__Players__19.LocalPlayer.Character;
	end;
	return v18;
end;
local v19 = v3.KnitClient.CreateController(v6.new());
return nil;
