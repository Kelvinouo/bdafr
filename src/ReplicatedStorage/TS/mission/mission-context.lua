-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	MissionContext = (function(...)
		local v2 = { ... };
		local u2 = {};
		local function v3(p1)
			local l__id__4 = p1.id;
			u2[l__id__4] = p1;
			return u2[l__id__4];
		end;
		for v5, v6 in ipairs(v2) do
			v3(v6, v5 - 1, v2);
		end;
		return {
			register = function(p2)
				if not u2[p2.id] then
					u2[p2.id] = p2;
					return p2;
				end;
				return u2[p2.id];
			end, 
			unregister = function(p3)
				if not u2[p3] then
					return false;
				end;
				u2[p3] = nil;
				return true;
			end, 
			getMission = function(p4)
				return u2[p4];
			end, 
			values = function()
				return u1.values(u2);
			end
		};
	end)()
};
