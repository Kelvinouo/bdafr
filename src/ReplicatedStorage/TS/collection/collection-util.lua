-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CollectionService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
return {
	CollectionTagAdded = function(p1, p2)
		l__CollectionService__1:GetInstanceAddedSignal(p1):Connect(function(p3)
			p2(p3);
		end);
		local v2, v3, v4 = ipairs(l__CollectionService__1:GetTagged(p1));
		while true do
			v2(v3, v4);
			if not v2 then
				break;
			end;
			v4 = v2;
			p2(v3);		
		end;
	end
};
