-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v2.Component:extend("HotbarPartyMemberList");
function v3.init(p1)

end;
local l__Empty__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local l__HotbarPartyMember__2 = v1.import(script, script.Parent, "hotbar-party-member").HotbarPartyMember;
function v3.render(p2)
	local v4 = { p2.props.store.Party.leader };
	local l__members__5 = p2.props.store.Party.members;
	table.move(l__members__5, 1, #l__members__5, #v4 + 1, v4);
	if #v4 == 1 then
		return v2.createElement(l__Empty__1, {
			Size = UDim2.fromScale(0.1, 0)
		});
	end;
	local v6 = table.create(#v4);
	for v7, v8 in ipairs(v4) do
		v6[v7] = v2.createElement(l__HotbarPartyMember__2, {
			Member = v8, 
			LayoutOrder = v7 - 1
		});
	end;
	local v9 = {
		AnchorPoint = p2.props.AnchorPoint, 
		Position = p2.props.Position, 
		Size = UDim2.fromScale(0.1, 0.1), 
		SizeConstraint = "RelativeXX", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 1, 
		LayoutOrder = p2.props.LayoutOrder
	};
	local v10 = { v2.createElement("UIGridLayout", {
			CellSize = UDim2.fromScale(0.45, 0.45), 
			CellPadding = UDim2.fromScale(0.05, 0.05), 
			FillDirection = "Horizontal", 
			FillDirectionMaxCells = 2, 
			StartCorner = "BottomRight", 
			VerticalAlignment = "Bottom"
		}) };
	local v11 = #v10;
	for v12, v13 in ipairs(v6) do
		v10[v11 + v12] = v13;
	end;
	return v2.createElement("Frame", v9, v10);
end;
return {
	HotbarPartyMemberList = v3
};
