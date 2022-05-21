-- Script Hash: 504662f392e6dfbfaee9e05c3d61d5d88a2ddcbd50e43d9560017fea5ea38e9ef5fe5d0142f6108062703ce2f8ddb6a5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SyncEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEvent;
local v3 = v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "guided-projectile", "event", "guided-projectile-events");
local v4 = v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-press-events");
local v5 = {};
for v6, v7 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents) do
	v5[v6] = v7;
end;
for v8, v9 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreClientSyncEvents) do
	v5[v8] = v9;
end;
v5.GroundTouch = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "events", "ground-touch-event").GroundTouchEvent);
v5.SwordSwing = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-swing-event").SwordSwingEvent);
v5.SwordCharge = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-charge-event").SwordChargeEvent);
v5.SwordSwingDown = l__SyncEvent__2.new(v4.SwordPressDownEvent);
v5.SwordSwingUp = l__SyncEvent__2.new(v4.SwordPressUpEvent);
v5.PerformCombat = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "event", "perform-combat-event").PerformCombatEvent);
v5.StartLaunchProjectile = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "start-projectile-launch-event").StartProjectileLaunchEvent);
v5.ProjectileLaunched = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-launched-event").ProjectileLaunchedEvent);
v5.ProjectileDestroy = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-destroy-event").ProjectileDestroyEvent);
v5.LocalProjectileImpact = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "projectile", "event", "local-projectile-impact-event").LocalProjectileImpactEvent);
v5.FishermanMinigameEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "games", "bedwars", "fisherman", "fisherman-minigame-end-event").FishermanMinigameEndEvent);
v5.MatchEndScreenEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "match", "match-end-screen-end-event").MatchEndScreenEndEvent);
v5.AnnouncementEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "announcement", "event", "announcement-end-event").AnnouncementEndEvent);
v5.GuidedProjectileDetonated = l__SyncEvent__2.new(v3.GuidedProjectileDetonateEvent);
v5.GuidedProjectileRemoved = l__SyncEvent__2.new(v3.GuidedProjectileRemovedEvent);
v5.GuidedProjectileDisabling = l__SyncEvent__2.new(v3.GuidedProjectileDisablingEvent);
v5.GuidedProjectileEnabling = l__SyncEvent__2.new(v3.GuidedProjectileEnablingEvent);
v5.StatusEffectAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-added-event").ClientStatusEffectAddedEvent);
v5.StatusEffectRemoved = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-removed-event").ClientStatusEffectRemovedEvent);
v5.LaunchPadUsed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "launch-pad", "event", "launch-pad-used-event").LaunchPadUsedEvent);
v5.KitEquip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-equip-event").ClientKitEquipEvent);
v5.KitUnequip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-unequip-event").ClientKitUnequipEvent);
v5.KillEffect = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "locker", "kill-effect", "kill-effect-event").KillEffectEvent);
v5.ViewModelItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "viewmodel", "event", "view-model-item-added-event").ViewModelItemAddedEvent);
v5.DisasterBegan = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-events").DisasterBeganEvent);
v5.ItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "inventory", "event", "item-added-event").ItemAddedEvent);
v5.MobileSwordButtonPressed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "event", "mobile-sword-button-pressed-event").MobileSwordButtonPressedEvent);
v5.CancelEmoteEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "locker", "emote", "event", "cancel-emote-event").CancelEmoteClientEvent);
v5.ExplosionEffectEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "explosion", "explosion-sync-events").ExplosionEffectEvent);
return {
	ClientSyncEvents = v5
};
