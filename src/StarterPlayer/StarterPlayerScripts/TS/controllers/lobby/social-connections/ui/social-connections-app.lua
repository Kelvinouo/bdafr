-- Script Hash: 32fb4e4fe201ea92d499a97c9208c2f4743a5dc1ff865bbbde3657bee9fbbb355fe4ad933e3903bc2605f177c4263a36
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("SocialConnectionsAppBase");
function v3.init(p1)

end;
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__SocialConnectionsCore__2 = v1.import(script, script.Parent, "social-connections-core").SocialConnectionsCore;
function v3.render(p2)
	return v2.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen()
	}, { v2.createElement(l__SocialConnectionsCore__2, {
			store = p2.props.store, 
			AppId = p2.props.AppId
		}) });
end;
return {
	SocialConnectionsApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v4 = {
			store = p3
		};
		for v5, v6 in pairs(p4) do
			v4[v5] = v6;
		end;
		return v4;
	end)(v3)
};
