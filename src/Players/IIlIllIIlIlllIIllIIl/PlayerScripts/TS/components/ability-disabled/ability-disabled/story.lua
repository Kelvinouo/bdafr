-- Script Hash: acc6cf3848c2b8d8640053e2037bb7fccefcbedee29f298d0278005d048d0018a56a1e469c496e0b66a59ee97f8cedd1
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AbilityDisabled__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).AbilityDisabled;
return function(p1)
	local u3 = u1.mount(u1.createElement(l__AbilityDisabled__2), p1);
	return function()
		u1.unmount(u3);
	end;
end;
