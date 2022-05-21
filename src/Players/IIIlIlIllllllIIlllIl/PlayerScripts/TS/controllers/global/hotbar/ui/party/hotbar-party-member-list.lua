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
	local function v6(p3, p4)
		return v2.createElement(l__HotbarPartyMember__2, {
			Member = p3, 
			LayoutOrder = p4
		});
	end;
	local v7 = table.create(#v4);
	for v8, v9 in ipairs(v4) do
		v7[v8] = v6(v9, v8 - 1, v4);
	end;
	local v10 = {
		AnchorPoint = p2.props.AnchorPoint, 
		Position = p2.props.Position, 
		Size = UDim2.fromScale(0.1, 0.1), 
		SizeConstraint = "RelativeXX", 
		BackgroundTransparency = 1, 
		BorderSizePixel = 1, 
		LayoutOrder = p2.props.LayoutOrder
	};
	local v11 = { v2.createElement("UIGridLayout", {
			CellSize = UDim2.fromScale(0.45, 0.45), 
			CellPadding = UDim2.fromScale(0.05, 0.05), 
			FillDirection = "Horizontal", 
			FillDirectionMaxCells = 2, 
			StartCorner = "BottomRight", 
			VerticalAlignment = "Bottom"
		}) };
	local v12 = #v11;
	for v13, v14 in ipairs(v7) do
		v11[v12 + v13] = v14;
	end;
	return v2.createElement("Frame", v10, v11);
end;
return {
	HotbarPartyMemberList = v3
};
