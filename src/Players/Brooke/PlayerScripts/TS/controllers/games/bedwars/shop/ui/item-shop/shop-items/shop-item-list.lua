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
local l__VoidWorldUtil__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local u9 = v3.BedwarsShopCategoryPanels;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u11 = v1.import(script, script.Parent, "shop-item-default-categories").ShopItemDefaultCategories;
local u12 = v1.import(script, script.Parent, "shop-item-unlockable-categories").ShopItemUnlockableCategories;
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
	local v11 = {};
	local v12 = 0;
	for v13, v14 in ipairs((l__BedwarsShop__2.getShop(l__Players__3.LocalPlayer))) do
		if not v14.tiered == true then
			v12 = v12 + 1;
			v11[v12] = v14;
		end;
	end;
	local function v15(p4)
		if p4.requiresKit then
			local l__kit__16 = l__ClientStore__4:getState().Bedwars.kit;
			if not l__kit__16 or table.find(p4.requiresKit, l__kit__16) == nil then
				return false;
			end;
		end;
		if p4.ignoredByKit then
			local l__kit__17 = l__ClientStore__4:getState().Bedwars.kit;
			if l__kit__17 and table.find(p4.ignoredByKit, l__kit__17) ~= nil then
				return false;
			end;
		end;
		return true;
	end;
	local v18 = {};
	local v19 = 0;
	for v20, v21 in ipairs(v11) do
		if v15(v21, v20 - 1, v11) == true then
			v19 = v19 + 1;
			v18[v19] = v21;
		end;
	end;
	local function v22(p5)
		while p5.nextTier and table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p5.itemType) ~= nil do
			p5 = l__BedwarsShop__2.getShopItem(p5.nextTier, l__Players__3.LocalPlayer);		
		end;
		return p5;
	end;
	local v23 = {};
	local v24 = 0;
	for v25, v26 in ipairs(v18) do
		local v27 = v22(v26, v25 - 1, v18);
		if v27 ~= nil then
			v24 = v24 + 1;
			v23[v24] = v27;
		end;
	end;
	local v28 = {};
	local v29 = table.create(#v23);
	for v30, v31 in ipairs(v23) do
		v29[v30] = v31.itemType;
	end;
	for v32, v33 in ipairs(v29) do
		v28[v33] = true;
	end;
	local u13 = {};
	local function v34(p6)
		if u13[p6.itemType] ~= nil then
			return false;
		end;
		u13[p6.itemType] = true;
		while p6.nextTier and (p6.itemType ~= l__ItemType__5.VOID_CHESTPLATE or table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p6.itemType) ~= nil) do
			p6 = l__BedwarsShop__2.getShopItem(p6.nextTier, l__Players__3.LocalPlayer);
			if v28[p6.itemType] ~= nil then
				return false;
			end;		
		end;
		return true;
	end;
	local v35 = {};
	local v36 = 0;
	for v37, v38 in ipairs(v23) do
		if v34(v38, v37 - 1, v23) == true then
			v36 = v36 + 1;
			v35[v36] = v38;
		end;
	end;
	local v39 = u6.keys(l__BedwarsShopItemCategory__7);
	v5 = {};
	local function v40(p7, p8)
		local v41 = {};
		for v42, v43 in pairs(p7) do
			v41[v42] = v43;
		end;
		v41[p8] = {};
		return v41;
	end;
	for v44 = 1, #v39 do
		v5 = v40(v5, v39[v44], v44 - 1, v39);
	end;
	v6 = local v45;
	local function v46(p9, p10)
		if p10.category == l__BedwarsShopItemCategory__7.Void and not l__VoidWorldUtil__8.VOID_ENABLED then
			return p9;
		end;
		local v47 = p9[p10.category];
		if v47 ~= nil then
			v47 = #v47 == 0;
		end;
		if v47 then
			p9[p10.category] = { p10 };
			return p9;
		end;
		local v48 = p9[p10.category];
		if v48 ~= nil then
			table.insert(v48, p10);
		end;
		return p9;
	end;
	for v49 = 1, #v35 do
		v6 = v46(v6, v35[v49], v49 - 1, v35);
	end;
	local v50 = {};
	local v51 = 0;
	local v52, v53, v54 = ipairs((u6.entries(local v55)));
	while true do
		local v56, v57 = v52(v53, v54);
		if not v56 then
			break;
		end;
		local v58 = v57[2];
		if table.find(u9, v57[1]) == nil == true then
			v51 = v51 + 1;
			v50[v51] = v57;
		end;	
	end;
	local v59 = {};
	local v60 = 0;
	local v61, v62, v63 = ipairs((u6.entries(v55)));
	while true do
		local v64, v65 = v61(v62, v63);
		if not v64 then
			break;
		end;
		local v66 = v65[2];
		if table.find(u9, v65[1]) ~= nil == true then
			v60 = v60 + 1;
			v59[v60] = v65;
		end;	
	end;
	local v67 = #u6.keys(l__BedwarsShopItemCategory__7);
	local v68 = #u6.keys(v50);
	local v69 = math.ceil(#u6.keys(v59) / 2);
	local v70 = u6.entries(v55);
	local u14 = 0;
	v7 = 0;
	for v71 = 1, #v70 do
		local v72 = v70[v71];
		local v73 = 8;
		if table.find(u9, v72[1]) ~= nil then
			v73 = 4;
		end;
		local v74 = math.ceil(#v72[2] / v73);
		if v74 > 1 then
			u14 = u14 + 1;
		end;
		v7 = v7 + v74;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v75 = 8;
	else
		v75 = 14;
	end;
	local v76 = v75 + 2;
	if l__DeviceUtil__1.isSmallScreen() then
		local v77 = 4;
	else
		v77 = 8;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v78 = 10;
	else
		v78 = 20;
	end;
	local v79 = {
		CanvasSize = UDim2.new(p3.props.Size.X.Scale, 0, 0, v9 * local v80 + v10 * u14 + (v68 * (v76 + v77) + v69 * (v76 * 3 + v77)) + v67 * p3.state.wrapperSize.Y * 0.025 + v78 * 2), 
		Size = p3.props.Size, 
		Position = p3.props.Position, 
		BackgroundColor3 = l__Theme__10.backgroundPrimary, 
		ScrollBarThickness = 5, 
		BorderSizePixel = 0, 
		ScrollingDirection = "Y", 
		Selectable = false
	};
	v79[v2.Change.AbsoluteSize] = function(p11)
		p3:setState({
			wrapperSize = p11.AbsoluteSize
		});
	end;
	return v2.createElement("ScrollingFrame", v79, {
		ScrollingFramePadding = v2.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v78), 
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
		v2.createElement(u11, {
			ShopCategories = v50, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v77, 
			CategoryTitleTextSize = v76, 
			CellWidth = v9, 
			CellPadding = v10, 
			LayoutOrder = 1
		}), v2.createElement(u12, {
			ShopCategories = v59, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v77, 
			CategoryTitleTextSize = v76, 
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
