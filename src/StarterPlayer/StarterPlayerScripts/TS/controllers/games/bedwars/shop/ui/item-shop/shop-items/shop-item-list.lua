-- Script Hash: 91afbbdaede69aa6419e107b0f964150fd2514d5ae04904c6669a5a6a011d4185d35ca273ea859a9e8bfc86babd3dd81
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types");
local v4 = v2.Component:extend("ShopItemList");
function v4.init(p1, p2)
	p1:setState({
		wrapperSize = Vector2.new(694, 523)
	});
end;
local l__DeviceUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__BedwarsShop__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsShopItemCategory__7 = v3.BedwarsShopItemCategory;
local u8 = v3.BedwarsShopCategoryPanels;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u10 = v1.import(script, script.Parent, "shop-item-default-categories").ShopItemDefaultCategories;
local u11 = v1.import(script, script.Parent, "shop-item-unlockable-categories").ShopItemUnlockableCategories;
function v4.render(p3)
	local v5 = nil;
	local v6 = nil;
	local v7 = nil;
	if l__DeviceUtil__1.isSmallScreen() then
		local v8 = 79;
	else
		v8 = 69;
	end;
	local v9 = math.floor(p3.state.wrapperSize.X * (v8 / 694));
	local v10 = math.floor(p3.state.wrapperSize.X * 0.01488095238095238);
	local v11 = l__BedwarsShop__2.getShop(l__Players__3.LocalPlayer);
	local function v12(p4)
		return not p4.tiered;
	end;
	local v13 = {};
	local v14 = 0;
	for v15, v16 in ipairs(v11) do
		if v12(v16, v15 - 1, v11) == true then
			v14 = v14 + 1;
			v13[v14] = v16;
		end;
	end;
	local function v17(p5)
		if p5.requiresKit then
			local l__kit__18 = l__ClientStore__4:getState().Bedwars.kit;
			if not l__kit__18 or table.find(p5.requiresKit, l__kit__18) == nil then
				return false;
			end;
		end;
		if p5.ignoredByKit then
			local l__kit__19 = l__ClientStore__4:getState().Bedwars.kit;
			if l__kit__19 and table.find(p5.ignoredByKit, l__kit__19) ~= nil then
				return false;
			end;
		end;
		return true;
	end;
	local v20 = {};
	local v21 = 0;
	for v22, v23 in ipairs(v13) do
		if v17(v23, v22 - 1, v13) == true then
			v21 = v21 + 1;
			v20[v21] = v23;
		end;
	end;
	local function v24(p6)
		while p6.nextTier and table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p6.itemType) ~= nil do
			p6 = l__BedwarsShop__2.getShopItem(p6.nextTier, l__Players__3.LocalPlayer);		
		end;
		return p6;
	end;
	local v25 = {};
	local v26 = 0;
	for v27, v28 in ipairs(v20) do
		local v29 = v24(v28, v27 - 1, v20);
		if v29 ~= nil then
			v26 = v26 + 1;
			v25[v26] = v29;
		end;
	end;
	local v30 = {};
	local function v31(p7)
		return p7.itemType;
	end;
	local v32 = table.create(#v25);
	for v33, v34 in ipairs(v25) do
		v32[v33] = v31(v34, v33 - 1, v25);
	end;
	for v35, v36 in ipairs(v32) do
		v30[v36] = true;
	end;
	local u12 = {};
	local function v37(p8)
		if u12[p8.itemType] ~= nil then
			return false;
		end;
		u12[p8.itemType] = true;
		while p8.nextTier and (p8.itemType ~= l__ItemType__5.VOID_CHESTPLATE or table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p8.itemType) ~= nil) do
			p8 = l__BedwarsShop__2.getShopItem(p8.nextTier, l__Players__3.LocalPlayer);
			if v30[p8.itemType] ~= nil then
				return false;
			end;		
		end;
		return true;
	end;
	local v38 = {};
	local v39 = 0;
	for v40, v41 in ipairs(v25) do
		if v37(v41, v40 - 1, v25) == true then
			v39 = v39 + 1;
			v38[v39] = v41;
		end;
	end;
	local v42 = u6.keys(l__BedwarsShopItemCategory__7);
	v5 = {};
	local function v43(p9, p10)
		local v44 = {};
		for v45, v46 in pairs(p9) do
			v44[v45] = v46;
		end;
		v44[p10] = {};
		return v44;
	end;
	for v47 = 1, #v42 do
		v5 = v43(v5, v42[v47], v47 - 1, v42);
	end;
	v6 = local v48;
	local function v49(p11, p12)
		local v50 = p11[p12.category];
		if v50 ~= nil then
			v50 = #v50 == 0;
		end;
		if v50 then
			p11[p12.category] = { p12 };
			return p11;
		end;
		local v51 = p11[p12.category];
		if v51 ~= nil then
			table.insert(v51, p12);
		end;
		return p11;
	end;
	for v52 = 1, #v38 do
		v6 = v49(v6, v38[v52], v52 - 1, v38);
	end;
	local v53 = u6.entries(local v54);
	local function v55(p13)
		local v56 = p13[2];
		return table.find(u8, p13[1]) == nil;
	end;
	local v57 = {};
	local v58 = 0;
	for v59, v60 in ipairs(v53) do
		if v55(v60, v59 - 1, v53) == true then
			v58 = v58 + 1;
			v57[v58] = v60;
		end;
	end;
	local v61 = u6.entries(v54);
	local function v62(p14)
		local v63 = p14[2];
		return table.find(u8, p14[1]) ~= nil;
	end;
	local v64 = {};
	local v65 = 0;
	for v66, v67 in ipairs(v61) do
		if v62(v67, v66 - 1, v61) == true then
			v65 = v65 + 1;
			v64[v65] = v67;
		end;
	end;
	local v68 = #u6.keys(l__BedwarsShopItemCategory__7);
	local v69 = #u6.keys(v57);
	local v70 = math.ceil(#u6.keys(v64) / 2);
	local v71 = u6.entries(v54);
	local u13 = 0;
	v7 = 0;
	local function v72(p15, p16)
		local v73 = 8;
		if table.find(u8, p16[1]) ~= nil then
			v73 = 4;
		end;
		local v74 = math.ceil(#p16[2] / v73);
		if v74 > 1 then
			u13 = u13 + 1;
		end;
		return p15 + v74;
	end;
	for v75 = 1, #v71 do
		v7 = v72(v7, v71[v75], v75 - 1, v71);
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v76 = 8;
	else
		v76 = 14;
	end;
	local v77 = v76 + 2;
	if l__DeviceUtil__1.isSmallScreen() then
		local v78 = 4;
	else
		v78 = 8;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v79 = 10;
	else
		v79 = 20;
	end;
	local v80 = {
		CanvasSize = UDim2.new(p3.props.Size.X.Scale, 0, 0, v9 * local v81 + v10 * u13 + (v69 * (v77 + v78) + v70 * (v77 * 3 + v78)) + v68 * p3.state.wrapperSize.Y * 0.025 + v79 * 2), 
		Size = p3.props.Size, 
		Position = p3.props.Position, 
		BackgroundColor3 = l__Theme__9.backgroundPrimary, 
		ScrollBarThickness = 5, 
		BorderSizePixel = 0, 
		ScrollingDirection = "Y", 
		Selectable = false
	};
	v80[v2.Change.AbsoluteSize] = function(p17)
		p3:setState({
			wrapperSize = p17.AbsoluteSize
		});
	end;
	return v2.createElement("ScrollingFrame", v80, {
		ScrollingFramePadding = v2.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v79), 
			PaddingLeft = UDim.new(0.03, 0), 
			PaddingRight = UDim.new(0.03, 0)
		}), 
		ScrollingFrameListLayout = v2.createElement("UIListLayout", {
			VerticalAlignment = "Top", 
			HorizontalAlignment = "Left", 
			FillDirection = "Vertical", 
			Padding = UDim.new(0.025, 0), 
			SortOrder = "LayoutOrder"
		}),
		v2.createElement(u10, {
			ShopCategories = v57, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v78, 
			CategoryTitleTextSize = v77, 
			CellWidth = v9, 
			CellPadding = v10, 
			LayoutOrder = 1
		}), v2.createElement(u11, {
			ShopCategories = v64, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v78, 
			CategoryTitleTextSize = v77, 
			CellWidth = v9, 
			CellPadding = v10, 
			store = p3.props.store, 
			LayoutOrder = 2
		})
	});
end;
return {
	ShopItemList = v4
};
