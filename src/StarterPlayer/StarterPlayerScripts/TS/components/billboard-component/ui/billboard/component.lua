-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v2 = u1.Component:extend("BillboardComponent");
function v2.init(p1)

end;
local function u2(p2)
	return u1.createElement("TextLabel", {
		Size = p2.LabelSize, 
		BackgroundTransparency = 0.6, 
		BackgroundColor3 = Color3.new(0.01, 0.01, 0.01), 
		BorderSizePixel = 0, 
		Font = Enum.Font.Arcade, 
		TextScaled = true, 
		RichText = true, 
		TextColor3 = p2.TextColor, 
		Text = p2.Text
	});
end;
function v2.render(p3)
	local l__Texts__3 = p3.props.Texts;
	local function v4(p4)
		local v5 = {};
		for v6, v7 in pairs(p4) do
			v5[v6] = v7;
		end;
		return u1.createElement(u2, v5);
	end;
	local v8 = table.create(#l__Texts__3);
	for v9, v10 in ipairs(l__Texts__3) do
		v8[v9] = v4(v10, v9 - 1, l__Texts__3);
	end;
	local v11 = {
		AnchorPoint = Vector2.new(0.5, 1), 
		Position = UDim2.fromScale(0.5, 1), 
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v12 = { u1.createElement("UISizeConstraint", {
			MaxSize = p3.props.MaxSize or Vector2.new(math.huge, math.huge)
		}), u1.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Bottom, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = p3.props.ItemPadding
		}) };
	local v13 = #v12;
	for v14, v15 in ipairs(v8) do
		v12[v13 + v14] = v15;
	end;
	return u1.createElement("Frame", v11, v12);
end;
return {
	BillboardComponent = v2
};
