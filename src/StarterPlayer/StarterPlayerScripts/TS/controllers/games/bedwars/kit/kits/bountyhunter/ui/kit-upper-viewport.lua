
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("KitUpperViewport");
function v3.init(p1, p2)

end;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__KitViewport__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
function v3.render(p3)
	local v4 = u1.copy(p3.props);
	v4.kit = nil;
	v4[v2.Children] = nil;
	local v5 = {};
	local v6 = #v5;
	local v7 = p3.props[v2.Children];
	if v7 then
		local v8, v9, v10 = pairs(v7);
		while true do
			local v11 = nil;
			local v12 = nil;
			v12, v11 = v8(v9, v10);
			if not v12 then
				break;
			end;
			v10 = v12;
			if type(v12) == "number" then
				v5[v6 + v12] = v11;
			else
				v5[v12] = v11;
			end;		
		end;
	end;
	return v2.createElement(l__KitViewport__2, {
		Kit = p3.props.kit
	}, v5);
end;
return {
	KitUpperViewport = v3
};

