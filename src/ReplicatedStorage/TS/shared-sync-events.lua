-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__SyncEvent__2 = v1.import(script, v1.getModule(script, "@easy-games", "sync-event").out).SyncEvent;
return {
	SharedSyncEvents = {
		ProjectileRender = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "event", "projectile-render-event").ProjectileRenderEvent), 
		SwordChargedSwing = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "event", "sword-attack-event").SwordAttackEvent), 
		HookFunctionSwapEvent = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "event", "grappling-hook", "hook-funciton-swap-event").HookFunctionSwapEvent), 
		ProjectileHit = l__SyncEvent__2.new(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "event", "projectile-hit-event").ProjectileHitEvent)
	}
};
