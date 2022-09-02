-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	name = "Manage ships", 
	priority = 100, 
	event = "Heartbeat"
};
local l__Workspace__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
function v2.func(p1, p2, p3)
	local v3 = p3;
	if v3 ~= nil then
		v3 = v3:get("ships");
	end;
	local v4 = p2:get("ships");
	if v4 == nil then
		v4 = {};
		p2:set("ships", v4);
	end;
	for v5, v6 in pairs(v4) do
		v6.instance:PivotTo(v6.cframe);
		if not v6.instance:IsDescendantOf(l__Workspace__1) then
			v4[v5] = nil;
		end;
	end;
	if v3 then
		for v7, v8 in pairs(v3) do
			if not v4[v7] then
				v8.instance:Destroy();
			end;
		end;
	end;
	p2:set("ships", v4);
end;
return {
	ManageShipsBehavior = v2
};
