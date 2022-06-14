-- Script Hash: b7c163f7930632e21e24c314f861e91a01c3f0d77b47b0b6f80b243c585bd60979ece8ec2b390258270dce8ade1dd469
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("CustomMatchHostPanelBase");
function v4.init(p1)

end;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__DarkBackground__2 = v2.DarkBackground;
local l__SlideIn__3 = v2.SlideIn;
local l__CustomMatchHostPanel__4 = v1.import(script, script.Parent, "custom-match-host-panel-core").CustomMatchHostPanel;
function v4.render(p2)
	return v3.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen(), 
		ResetOnSpawn = false
	}, { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}), v3.createElement(l__SlideIn__3, {}, { v3.createElement(l__CustomMatchHostPanel__4, {
				store = p2.props.store, 
				AppId = p2.props.AppId
			}) }) });
end;
return {
	CustomMatchHostPanelApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v5 = {
			store = p3
		};
		for v6, v7 in pairs(p4) do
			v5[v6] = v7;
		end;
		return v5;
	end)(v4)
};
