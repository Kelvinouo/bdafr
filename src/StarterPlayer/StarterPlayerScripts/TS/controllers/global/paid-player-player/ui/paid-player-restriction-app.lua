
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("PaidPlayerRestrictionAppBase");
function v3.init(p1)

end;
local u1 = v1.import(script, script.Parent, "paid-player-restriction-core").PaidPlayerRestrictionCore;
function v3.render(p2)
	local v4 = {};
	local v5 = {};
	for v6, v7 in pairs(p2.props) do
		v5[v6] = v7;
	end;
	v4[#v4 + 1] = v2.createElement(u1, v5);
	return v2.createElement("ScreenGui", {
		DisplayOrder = 20
	}, v4);
end;
return {
	PaidPlayerRestrictionApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		return p4;
	end)(v3)
};

