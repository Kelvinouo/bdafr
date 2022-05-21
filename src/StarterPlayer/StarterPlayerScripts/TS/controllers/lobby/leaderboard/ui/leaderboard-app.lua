-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.PureComponent:extend("LeaderBoardAppBase");
function v3.init(p1)

end;
local l__LeaderboardCore__1 = v1.import(script, script.Parent, "leaderboard-core").LeaderboardCore;
function v3.render(p2)
	local v4 = {};
	local v5 = {};
	local v6 = {};
	for v7, v8 in pairs(p2.props) do
		v6[v7] = v8;
	end;
	v5[#v5 + 1] = v2.createElement(l__LeaderboardCore__1, v6);
	v4[#v4 + 1] = v2.createElement("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.new(1, -30, 1, -30), 
		BackgroundTransparency = 1
	}, v5);
	return v2.createElement("SurfaceGui", {
		Face = Enum.NormalId.Back, 
		LightInfluence = 0.25, 
		SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
	}, v4);
end;
return {
	LeaderboardApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p3, p4)
		local v9 = {
			store = p3
		};
		for v10, v11 in pairs(p4) do
			v9[v10] = v11;
		end;
		return v9;
	end)(v3)
};
