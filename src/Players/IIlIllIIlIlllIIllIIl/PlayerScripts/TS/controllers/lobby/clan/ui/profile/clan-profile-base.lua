-- Script Hash: 3ca940363639b91a2383d1fd3ca839524c2fe5e61659536f65da376671fea66c0134d97f00633749d739fdb9ea20d20f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.PureComponent:extend("ClanProfileBase");
function v4.init(p1)

end;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__DarkBackground__2 = v2.DarkBackground;
local l__ConfettiGroup__3 = v2.ConfettiGroup;
local l__ClanProfileCore__4 = v1.import(script, script.Parent, "clan-profile-core").ClanProfileCore;
local l__SlideIn__5 = v2.SlideIn;
function v4.render(p2)
	local v5 = {
		DisplayOrder = 20, 
		IgnoreGuiInset = l__DeviceUtil__1.isSmallScreen(), 
		ResetOnSpawn = false
	};
	local v6 = { v3.createElement(l__DarkBackground__2, {
			AppId = p2.props.AppId
		}) };
	local v7 = {};
	local v8 = p2.props.newClan and v3.createElement(l__ConfettiGroup__3, {
		Lifetime = 10
	});
	if v8 then
		v7[#v7 + 1] = v8;
	end;
	local v9 = {};
	for v10, v11 in pairs(p2.props) do
		v9[v10] = v11;
	end;
	v7[#v7 + 1] = v3.createElement(l__ClanProfileCore__4, v9);
	v6[#v6 + 1] = v3.createElement(l__SlideIn__5, {}, v7);
	return v3.createElement("ScreenGui", v5, v6);
end;
return {
	ClanProfileApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v12 = {
			store = p3
		};
		for v13, v14 in pairs(p4) do
			v12[v13] = v14;
		end;
		return v12;
	end)(v4)
};
