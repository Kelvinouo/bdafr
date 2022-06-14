-- Script Hash: 3802c237b345448fa7f5999a372f6c0c47c94b4e4bcb4eec842e6f916581694e77e532188fcb50cd42f42a102a8b3f27
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("ClanMenuBase");
function v4.init(p1)

end;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__DarkBackground__2 = v2.DarkBackground;
local l__SlideIn__3 = v2.SlideIn;
local l__ClanMenu__4 = v1.import(script, script.Parent, "clan-menu-core").ClanMenu;
function v4.render(p2)
	return v3.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen(), 
		ResetOnSpawn = false
	}, { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}), v3.createElement(l__SlideIn__3, {}, { v3.createElement(l__ClanMenu__4, {
				AppId = p2.props.AppId, 
				store = p2.props.store
			}) }) });
end;
return {
	ClanMenuApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v5 = {
			store = p3
		};
		for v6, v7 in pairs(p4) do
			v5[v6] = v7;
		end;
		return v5;
	end)(v4)
};
