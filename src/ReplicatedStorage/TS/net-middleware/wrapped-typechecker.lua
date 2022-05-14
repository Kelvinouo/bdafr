-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "net").out);
return {
	WrappedTypechecker = function(...)
		local u2 = u1.Middleware.TypeChecking(unpack({ ... }));
		return function(p1, p2)
			return function(p3, ...)
				local u3 = { ... };
				local v2, v3 = pcall(function()
					return u2(p1, p2)(p3, unpack(u3));
				end);
				local v4 = v2 and {
					success = true, 
					value = v3
				} or {
					success = false, 
					error = v3
				};
				if not v4.success or v4.value == false then
					return;
				end;
				return v4.value;
			end;
		end;
	end
};
