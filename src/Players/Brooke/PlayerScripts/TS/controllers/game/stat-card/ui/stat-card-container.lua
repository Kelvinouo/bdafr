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
	local v6 = table.create(#l__cards__5);
	for v7, v8 in ipairs(l__cards__5) do
		v6[v7] = v2.createElement(l__StatCardComponent__1, {
			card = v8, 
			index = v7 - 1 + 1
		});
	end;
	local v9 = {
		Size = UDim2.fromScale(1, 1), 
		Position = UDim2.fromScale(0.5, 0.6), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	local v10 = { v2.createElement("UIListLayout", {
			Padding = UDim.new(0, 0), 
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = "LayoutOrder"
		}) };
	local v11 = #v10;
	for v12, v13 in ipairs(v6) do
		v10[v11 + v12] = v13;
	end;
	v4.StatCardContainer = v2.createElement("Frame", v9, v10);
	return v2.createFragment({
		StatCardsScreenGui = v2.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v4)
	});
end;
return {
	StatCardContainer = v3
};
