
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local v5 = v3.Component:extend("ShopItemList");
function v5.init(p1, p2)
	p1:setState({
		wrapperSize = Vector2.new(694, 523)
	});
end;
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__BedwarsShop__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__BedwarsShopItemCategory__5 = v4.BedwarsShopItemCategory;
local u6 = v2.keys(v4.BedwarsShopUnlockableCategories);
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u8 = v1.import(script, script.Parent, "shop-item-default-categories").ShopItemDefaultCategories;
local u9 = v1.import(script, script.Parent, "shop-item-unlockable-categories").ShopItemUnlockableCategories;
function v5.render(p3)
	local v6 = nil;
	local v7 = nil;
	local v8 = nil;
	if l__DeviceUtil__1.isSmallScreen() then
		local v9 = 79;
	else
		v9 = 69;
	end;
	local v10 = math.floor(p3.state.wrapperSize.X * (v9 / 694));
	local v11 = math.floor(p3.state.wrapperSize.X * 0.01488095238095238);
	local v12 = l__BedwarsShop__2.getShop(l__Players__3.LocalPlayer);
	local function v13(p4)
		return not p4.tiered;
	end;
	local v14 = {};
	local v15 = 0;
	for v16, v17 in ipairs(v12) do
		if v13(v17, v16 - 1, v12) == true then
			v15 = v15 + 1;
			v14[v15] = v17;
		end;
	end;
	local function v18(p5)
		if p5.requiresKit then
			local l__kit__19 = l__ClientStore__4:getState().Bedwars.kit;
			if not l__kit__19 or table.find(p5.requiresKit, l__kit__19) == nil then
				return false;
			end;
		end;
		if p5.ignoredByKit then
			local l__kit__20 = l__ClientStore__4:getState().Bedwars.kit;
			if l__kit__20 and table.find(p5.ignoredByKit, l__kit__20) ~= nil then
				return false;
			end;
		end;
		return true;
	end;
	local v21 = {};
	local v22 = 0;
	for v23, v24 in ipairs(v14) do
		if v18(v24, v23 - 1, v14) == true then
			v22 = v22 + 1;
			v21[v22] = v24;
		end;
	end;
	local function v25(p6)
		while p6.nextTier and table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p6.itemType) ~= nil do
			p6 = l__BedwarsShop__2.getShopItem(p6.nextTier, l__Players__3.LocalPlayer);		
		end;
		return p6;
	end;
	local v26 = {};
	local v27 = 0;
	for v28, v29 in ipairs(v21) do
		local v30 = v25(v29, v28 - 1, v21);
		if v30 ~= nil then
			v27 = v27 + 1;
			v26[v27] = v30;
		end;
	end;
	local v31 = v2.keys(l__BedwarsShopItemCategory__5);
	v6 = {};
	local function v32(p7, p8)
		local v33 = {};
		for v34, v35 in pairs(p7) do
			v33[v34] = v35;
		end;
		v33[p8] = {};
		return v33;
	end;
	for v36 = 1, #v31 do
		v6 = v32(v6, v31[v36], v36 - 1, v31);
	end;
	v7 = local v37;
	local function v38(p9, p10)
		local v39 = p9[p10.category];
		if v39 ~= nil then
			v39 = #v39 == 0;
		end;
		if v39 then
			p9[p10.category] = { p10 };
			return p9;
		end;
		local v40 = p9[p10.category];
		if v40 ~= nil then
			table.insert(v40, p10);
		end;
		return p9;
	end;
	for v41 = 1, #v26 do
		v7 = v38(v7, v26[v41], v41 - 1, v26);
	end;
	local v42 = v2.entries(local v43);
	local function v44(p11)
		local v45 = p11[2];
		return table.find(u6, p11[1]) == nil;
	end;
	local v46 = {};
	local v47 = 0;
	for v48, v49 in ipairs(v42) do
		if v44(v49, v48 - 1, v42) == true then
			v47 = v47 + 1;
			v46[v47] = v49;
		end;
	end;
	local v50 = v2.entries(v43);
	local function v51(p12)
		local v52 = p12[2];
		return table.find(u6, p12[1]) ~= nil;
	end;
	local v53 = {};
	local v54 = 0;
	for v55, v56 in ipairs(v50) do
		if v51(v56, v55 - 1, v50) == true then
			v54 = v54 + 1;
			v53[v54] = v56;
		end;
	end;
	local v57 = #v2.keys(l__BedwarsShopItemCategory__5);
	local v58 = #v2.keys(v46);
	local v59 = math.ceil(#v2.keys(v53) / 2);
	local v60 = v2.entries(v43);
	local u10 = 0;
	v8 = 0;
	local function v61(p13, p14)
		local v62 = 8;
		if table.find(u6, p14[1]) ~= nil then
			v62 = 4;
		end;
		local v63 = math.ceil(#p14[2] / v62);
		if v63 > 1 then
			u10 = u10 + 1;
		end;
		return p13 + v63;
	end;
	for v64 = 1, #v60 do
		v8 = v61(v8, v60[v64], v64 - 1, v60);
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v65 = 8;
	else
		v65 = 14;
	end;
	local v66 = v65 + 2;
	if l__DeviceUtil__1.isSmallScreen() then
		local v67 = 4;
	else
		v67 = 8;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v68 = 10;
	else
		v68 = 20;
	end;
	local v69 = {
		CanvasSize = UDim2.new(p3.props.Size.X.Scale, 0, 0, v10 * local v70 + v11 * u10 + (v58 * (v66 + v67) + v59 * (v66 * 3 + v67)) + v57 * p3.state.wrapperSize.Y * 0.025 + v68 * 2), 
		Size = p3.props.Size, 
		Position = p3.props.Position, 
		BackgroundColor3 = l__Theme__7.backgroundPrimary, 
		ScrollBarThickness = 5, 
		BorderSizePixel = 0, 
		ScrollingDirection = "Y", 
		Selectable = false
	};
	v69[v3.Change.AbsoluteSize] = function(p15)
		p3:setState({
			wrapperSize = p15.AbsoluteSize
		});
	end;
	return v3.createElement("ScrollingFrame", v69, {
		ScrollingFramePadding = v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v68), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		}), 
		ScrollingFrameListLayout = v3.createElement("UIListLayout", {
			VerticalAlignment = "Top", 
			HorizontalAlignment = "Left", 
			FillDirection = "Vertical", 
			Padding = UDim.new(0.025, 0), 
			SortOrder = "LayoutOrder"
		}),
		v3.createElement(u8, {
			ShopCategories = v46, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v67, 
			CategoryTitleTextSize = v66, 
			CellWidth = v10, 
			CellPadding = v11, 
			LayoutOrder = 1
		}), v3.createElement(u9, {
			ShopCategories = v53, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v67, 
			CategoryTitleTextSize = v66, 
			CellWidth = v10, 
			CellPadding = v11, 
			store = p3.props.store, 
			LayoutOrder = 2
		})
	});
end;
return {
	ShopItemList = v5
};

