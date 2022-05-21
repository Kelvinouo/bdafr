-- Script Hash: 6af350cb7e39782b3c2b276396dc402bf18af326bf328e83ce8ba779f90e51a3bada43b6cade4c5f9cd5a414d3e98e1a
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("LockerAppBase");
function v3.init(p1)

end;
local l__DarkBackground__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DarkBackground;
local l__LockerCore__2 = v1.import(script, script.Parent, "locker-core").LockerCore;
function v3.render(p2)
	return v2.createElement("ScreenGui", {
		DisplayOrder = 20, 
		IgnoreGuiInset = true, 
		ResetOnSpawn = false
	}, { v2.createElement(l__DarkBackground__1, {
			AppId = p2.props.AppId
		}), v2.createElement(l__LockerCore__2, {
			store = p2.props.store, 
			AppId = p2.props.AppId
		}) });
end;
return {
	LockerApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v4 = {
			store = p3
		};
		for v5, v6 in pairs(p4) do
			v4[v5] = v6;
		end;
		return v4;
	end)(v3)
};
