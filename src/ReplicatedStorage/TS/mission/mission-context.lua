-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	MissionContext = (function(...)
		local u2 = {};
		local v2, v3, v4 = ipairs({ ... });
		while true do
			v2(v3, v4);
			if not v2 then
				break;
			end;
			v4 = v2;
			local l__id__5 = v3.id;
			u2[l__id__5] = v3;
			local v6 = u2[l__id__5];		
		end;
		return {
			register = function(p1)
				if not u2[p1.id] then
					u2[p1.id] = p1;
					return p1;
				end;
				return u2[p1.id];
			end, 
			unregister = function(p2)
				if not u2[p2] then
					return false;
				end;
				u2[p2] = nil;
				return true;
			end, 
			getMission = function(p3)
				return u2[p3];
			end, 
			values = function()
				return u1.values(u2);
			end
		};
	end)()
};
