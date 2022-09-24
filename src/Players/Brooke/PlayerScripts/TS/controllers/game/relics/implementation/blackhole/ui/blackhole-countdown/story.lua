-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__getRelicMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta").getRelicMeta;
local l__RelicType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-type").RelicType;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BlackholeCountdown__4 = v1.import(script, script.Parent, "blackhole-countdown").BlackholeCountdown;
return function(p1)
	local u5 = u3.mount(u3.createElement(l__BlackholeCountdown__4, {
		initialCountdown = l__getRelicMeta__1(l__RelicType__2.BLACKHOLE).config.initialCountdown
	}), p1);
	return function()
		return u3.unmount(u5);
	end;
end;
