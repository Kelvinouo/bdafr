
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("TabListAppBase");
function v3.init(p1)

end;
local l__TabListCore__1 = v1.import(script, script.Parent, "tab-list-core").TabListCore;
function v3.render(p2)
	return v2.createFragment({
		TabListScreenGui = v2.createElement("ScreenGui", {
			DisplayOrder = 20, 
			IgnoreGuiInset = true, 
			ResetOnSpawn = false
		}, { v2.createElement(l__TabListCore__1, {
				store = p2.props.store
			}) })
	});
end;
return {
	TabListApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v4 = {
			store = p3
		};
		for v5, v6 in pairs(p4) do
			v4[v5] = v6;
		end;
		return v4;
	end)(v3)
};

