
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__CollectionService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).CollectionService;
return {
	CollectionTagAdded = function(p1, p2)
		l__CollectionService__1:GetInstanceAddedSignal(p1):Connect(function(p3)
			p2(p3);
		end);
		for v2, v3 in ipairs(l__CollectionService__1:GetTagged(p1)) do
			p2(v3);
		end;
	end
};

