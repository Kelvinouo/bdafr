-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SyncEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEvent;
local v3 = v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "guided-projectile", "event", "guided-projectile-events");
local v4 = v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-press-events");
local v5 = v1.import(script, script.Parent, "controllers", "global", "mount", "mount-events");
local v6 = v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-added-event").ClientStatusEffectAddedEvent;
local v7 = {};
for v8, v9 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents) do
	v7[v8] = v9;
end;
for v10, v11 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreClientSyncEvents) do
	v7[v10] = v11;
end;
for v12, v13 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "block-engine").out.client["block-engine-client-events"]).BlockEngineClientEvents) do
	v7[v12] = v13;
end;
v7.GroundTouch = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "events", "ground-touch-event").GroundTouchEvent);
v7.SwordSwing = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-swing-event").SwordSwingEvent);
v7.SwordCharge = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-charge-event").SwordChargeEvent);
v7.SwordSwingDown = l__SyncEvent__2.new(v4.SwordPressDownEvent);
v7.SwordSwingUp = l__SyncEvent__2.new(v4.SwordPressUpEvent);
v7.PerformCombat = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "event", "perform-combat-event").PerformCombatEvent);
v7.BeginProjectileTargeting = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "begin-projectile-targeting-event").BeginProjectileTargetingEvent);
v7.StartLaunchProjectile = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "start-projectile-launch-event").StartProjectileLaunchEvent);
v7.ProjectileLaunched = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-launched-event").ProjectileLaunchedEvent);
v7.ProjectileDestroy = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-destroy-event").ProjectileDestroyEvent);
v7.LocalProjectileImpact = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "projectile", "event", "local-projectile-impact-event").LocalProjectileImpactEvent);
v7.FishermanMinigameEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "games", "bedwars", "fisherman", "fisherman-minigame-end-event").FishermanMinigameEndEvent);
v7.MatchEndScreenEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "match", "match-end-screen-end-event").MatchEndScreenEndEvent);
v7.WindWalkerOrbUpdate = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "games", "bedwars", "kit", "kits", "wind-walker", "event", "wind-walker-orb-update-event").WindWalkerOrbUpdateEvent);
v7.GuidedProjectileDetonated = l__SyncEvent__2.new(v3.GuidedProjectileDetonateEvent);
v7.GuidedProjectileRemoved = l__SyncEvent__2.new(v3.GuidedProjectileRemovedEvent);
v7.GuidedProjectileDisabling = l__SyncEvent__2.new(v3.GuidedProjectileDisablingEvent);
v7.GuidedProjectileEnabling = l__SyncEvent__2.new(v3.GuidedProjectileEnablingEvent);
v7.StatusEffectAdded = l__SyncEvent__2.new(v6);
v7.StatusEffectChanged = l__SyncEvent__2.new(v6);
v7.StatusEffectRemoved = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-removed-event").ClientStatusEffectRemovedEvent);
v7.LaunchPadUsed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "launch-pad", "event", "launch-pad-used-event").LaunchPadUsedEvent);
v7.KitEquip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-equip-event").ClientKitEquipEvent);
v7.KitUnequip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-unequip-event").ClientKitUnequipEvent);
v7.KillEffect = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "locker", "kill-effect", "kill-effect-event").KillEffectEvent);
v7.ViewModelItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "viewmodel", "event", "view-model-item-added-event").ViewModelItemAddedEvent);
v7.DisasterBegan = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-events").DisasterBeganEvent);
v7.ItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "inventory", "event", "item-added-event").ItemAddedEvent);
v7.MobileSwordButtonPressed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "event", "mobile-sword-button-pressed-event").MobileSwordButtonPressedEvent);
v7.CancelEmoteEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "locker", "emote", "event", "cancel-emote-event").CancelEmoteClientEvent);
v7.ExplosionEffect = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "explosion", "explosion-sync-events").ExplosionEffectEvent);
v7.GenericMountMounted = l__SyncEvent__2.new(v5.GenericMountMounted);
v7.GenericMountDismounted = l__SyncEvent__2.new(v5.GenericMountDismounted);
v7.ZiplineMount = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "items", "zipline", "event", "zipline-mount-event").ZiplineMountEvent);
v7.ChangeWorld = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "world", "event", "world-change-event").WorldChangeEvent);
v7.EntityChangeHeldItem = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "inventory", "event", "item-hold-event").ItemHoldEvent);
v7.BackpackEquipEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "backpack", "backpack-equip-event").BackpackEquipEvent);
v7.ItemConsumed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "consume", "event", "item-consumed-event").ItemConsumedEvent);
return {
	ClientSyncEvents = v7
};
