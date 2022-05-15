
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("RankedProgressBarAppBase");
function v3.init(p1)

end;
local l__DarkBackground__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DarkBackground;
local l__RankedProgressBarCore__2 = v1.import(script, script.Parent, "ranked-progress-bar-core").RankedProgressBarCore;
function v3.render(p2)
	local v4 = { v2.createElement(l__DarkBackground__1, {
			AppId = p2.props.AppId, 
			BackgroundTransparency = 0.4
		}) };
	local v5 = {};
	for v6, v7 in pairs(p2.props) do
		v5[v6] = v7;
	end;
	v4[#v4 + 1] = v2.createElement(l__RankedProgressBarCore__2, v5);
	return v2.createElement("ScreenGui", {
		ResetOnSpawn = false
	}, v4);
end;
return {
	RankedProgressBarApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v8 = {
			store = p3
		};
		for v9, v10 in pairs(p4) do
			v8[v9] = v10;
		end;
		return v8;
	end)(v3)
};

