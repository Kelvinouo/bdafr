-- Script Hash: d49b2ce1b8b10ea37f23de84ac36672deee997e19201dde6e102e20440e1ad3a3327e75bf20061e1db58d3df555ead6e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SyncEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEvent;
local v3 = v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "guided-projectile", "event", "guided-projectile-events");
local v4 = v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-press-events");
local v5 = v1.import(script, script.Parent, "controllers", "global", "mount", "mount-events");
local v6 = {};
for v7, v8 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents) do
	v6[v7] = v8;
end;
for v9, v10 in pairs(v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).GameCoreClientSyncEvents) do
	v6[v9] = v10;
end;
v6.GroundTouch = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "events", "ground-touch-event").GroundTouchEvent);
v6.SwordSwing = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-swing-event").SwordSwingEvent);
v6.SwordCharge = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "sword-charge-event").SwordChargeEvent);
v6.SwordSwingDown = l__SyncEvent__2.new(v4.SwordPressDownEvent);
v6.SwordSwingUp = l__SyncEvent__2.new(v4.SwordPressUpEvent);
v6.PerformCombat = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "event", "perform-combat-event").PerformCombatEvent);
v6.BeginProjectileTargeting = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "begin-projectile-targeting-event").BeginProjectileTargetingEvent);
v6.StartLaunchProjectile = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "start-projectile-launch-event").StartProjectileLaunchEvent);
v6.ProjectileLaunched = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-launched-event").ProjectileLaunchedEvent);
v6.ProjectileDestroy = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "projectile", "event", "projectile-destroy-event").ProjectileDestroyEvent);
v6.LocalProjectileImpact = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "projectile", "event", "local-projectile-impact-event").LocalProjectileImpactEvent);
v6.FishermanMinigameEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "games", "bedwars", "fisherman", "fisherman-minigame-end-event").FishermanMinigameEndEvent);
v6.MatchEndScreenEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "match", "match-end-screen-end-event").MatchEndScreenEndEvent);
v6.AnnouncementEnd = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "announcement", "event", "announcement-end-event").AnnouncementEndEvent);
v6.WindWalkerOrbUpdate = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "games", "bedwars", "kit", "kits", "wind-walker", "event", "wind-walker-orb-update-event").WindWalkerOrbUpdateEvent);
v6.GuidedProjectileDetonated = l__SyncEvent__2.new(v3.GuidedProjectileDetonateEvent);
v6.GuidedProjectileRemoved = l__SyncEvent__2.new(v3.GuidedProjectileRemovedEvent);
v6.GuidedProjectileDisabling = l__SyncEvent__2.new(v3.GuidedProjectileDisablingEvent);
v6.GuidedProjectileEnabling = l__SyncEvent__2.new(v3.GuidedProjectileEnablingEvent);
v6.StatusEffectAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-added-event").ClientStatusEffectAddedEvent);
v6.StatusEffectRemoved = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "status-effect", "event", "client-status-effect-removed-event").ClientStatusEffectRemovedEvent);
v6.LaunchPadUsed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "block", "launch-pad", "event", "launch-pad-used-event").LaunchPadUsedEvent);
v6.KitEquip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-equip-event").ClientKitEquipEvent);
v6.KitUnequip = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "kit", "kit-unequip-event").ClientKitUnequipEvent);
v6.KillEffect = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "locker", "kill-effect", "kill-effect-event").KillEffectEvent);
v6.ViewModelItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "viewmodel", "event", "view-model-item-added-event").ViewModelItemAddedEvent);
v6.DisasterBegan = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "disaster", "disaster-events").DisasterBeganEvent);
v6.ItemAdded = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "inventory", "event", "item-added-event").ItemAddedEvent);
v6.MobileSwordButtonPressed = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "combat", "sword", "event", "mobile-sword-button-pressed-event").MobileSwordButtonPressedEvent);
v6.CancelEmoteEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "global", "locker", "emote", "event", "cancel-emote-event").CancelEmoteClientEvent);
v6.ExplosionEffectEvent = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "combat", "explosion", "explosion-sync-events").ExplosionEffectEvent);
v6.GenericMountMounted = l__SyncEvent__2.new(v5.GenericMountMounted);
v6.GenericMountDismounted = l__SyncEvent__2.new(v5.GenericMountDismounted);
v6.ZiplineMount = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "items", "zipline", "event", "zipline-mount-event").ZiplineMountEvent);
v6.ChangeWorld = l__SyncEvent__2.new(v1.import(script, script.Parent, "controllers", "game", "world", "event", "world-change-event").WorldChangeEvent);
return {
	ClientSyncEvents = v6
};
