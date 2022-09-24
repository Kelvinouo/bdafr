-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, script.Parent, "status-effect-hud-list").StatusEffectHudListScreen;
local l__StatusEffectType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
return function(p1)
	local u4 = u1.mount(u1.createElement(u2, {
		StatusEffects = { {
				statusEffect = l__StatusEffectType__3.FORCEFIELD, 
				expireTime = 90, 
				stacks = 2
			}, {
				statusEffect = l__StatusEffectType__3.ENCHANT_FIRE_3, 
				stacks = 0
			}, {
				statusEffect = l__StatusEffectType__3.GIANT, 
				expireTime = 15, 
				stacks = 0
			} }, 
		Position = UDim2.fromScale(0.5, 0.1)
	}), p1);
	return function()
		return u1.unmount(u4);
	end;
end;
