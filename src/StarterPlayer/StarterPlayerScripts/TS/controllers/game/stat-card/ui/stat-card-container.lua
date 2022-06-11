-- Script Hash: 9cd294a1980c7324da7c1c8289b68100b1bd46f92e3c7a545b3cc7afb3350fd9b9720bcb1b37b7740bbb33026170dc57
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("StatCardContainer");
function v3.init(p1)

end;
local l__StatCardComponent__1 = v1.import(script, script.Parent, "stat-card").StatCardComponent;
function v3.render(p2)
	local v4 = {};
	local l__cards__5 = p2.props.cards;
	local function v6(p3, p4)
		return v2.createElement(l__StatCardComponent__1, {
			card = p3, 
			index = p4 + 1
		});
	end;
	local v7 = table.create(#l__cards__5);
	for v8, v9 in ipairs(l__cards__5) do
		v7[v8] = v6(v9, v8 - 1, l__cards__5);
	end;
	local v10 = {
		Size = UDim2.fromScale(1, 1), 
		Position = UDim2.fromScale(0.5, 0.6), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	local v11 = { v2.createElement("UIListLayout", {
			Padding = UDim.new(0, 0), 
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = "LayoutOrder"
		}) };
	local v12 = #v11;
	for v13, v14 in ipairs(v7) do
		v11[v12 + v13] = v14;
	end;
	v4.StatCardContainer = v2.createElement("Frame", v10, v11);
	return v2.createFragment({
		StatCardsScreenGui = v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v4)
	});
end;
return {
	StatCardContainer = v3
};
