-- Script Hash: 1cd9a2d645928cd2766cb5ca5761baac0742985e7da81b9854b2b43395daa7075e899e8ef25edd7284df05ac6698620e
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("GiftingAppBase");
function v3.init(p1)

end;
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__GiftingCore__2 = v1.import(script, script.Parent, "gifting-core").GiftingCore;
function v3.render(p2)
	local v4 = {};
	local v5 = {};
	for v6, v7 in pairs(p2.props) do
		v5[v6] = v7;
	end;
	v4[#v4 + 1] = v2.createElement(l__GiftingCore__2, v5);
	return v2.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen()
	}, v4);
end;
return {
	GiftingApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		return p4;
	end)(v3)
};
