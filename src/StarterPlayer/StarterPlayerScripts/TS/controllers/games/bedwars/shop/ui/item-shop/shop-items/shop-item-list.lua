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
	local v13, v14, v15 = ipairs((l__BedwarsShop__2.getShop(l__Players__3.LocalPlayer)));
	while true do
		v13(v14, v15);
		if not v13 then
			break;
		end;
		v15 = v13;
		if not v14.tiered == true then
			v12 = v12 + 1;
			v11[v12] = v14;
		end;	
	end;
	local function v16(p4)
		if p4.requiresKit then
			local l__kit__17 = l__ClientStore__4:getState().Bedwars.kit;
			if not l__kit__17 or table.find(p4.requiresKit, l__kit__17) == nil then
				return false;
			end;
		end;
		if p4.ignoredByKit then
			local l__kit__18 = l__ClientStore__4:getState().Bedwars.kit;
			if l__kit__18 and table.find(p4.ignoredByKit, l__kit__18) ~= nil then
				return false;
			end;
		end;
		return true;
	end;
	local v19 = {};
	local v20 = 0;
	local v21, v22, v23 = ipairs(v11);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		if v16(v22, v21 - 1, v11) == true then
			v20 = v20 + 1;
			v19[v20] = v22;
		end;	
	end;
	local function v24(p5)
		while p5.nextTier and table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p5.itemType) ~= nil do
			p5 = l__BedwarsShop__2.getShopItem(p5.nextTier, l__Players__3.LocalPlayer);		
		end;
		return p5;
	end;
	local v25 = {};
	local v26 = 0;
	local v27, v28, v29 = ipairs(v19);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		local v30 = v24(v28, v27 - 1, v19);
		if v30 ~= nil then
			v26 = v26 + 1;
			v25[v26] = v30;
		end;	
	end;
	local v31 = {};
	local v32 = table.create(#v25);
	local v33, v34, v35 = ipairs(v25);
	while true do
		v33(v34, v35);
		if not v33 then
			break;
		end;
		v35 = v33;
		v32[v33] = v34.itemType;	
	end;
	local v36, v37, v38 = ipairs(v32);
	while true do
		v36(v37, v38);
		if not v36 then
			break;
		end;
		v38 = v36;
		v31[v37] = true;	
	end;
	local u13 = {};
	local function v39(p6)
		if u13[p6.itemType] ~= nil then
			return false;
		end;
		u13[p6.itemType] = true;
		while p6.nextTier and (p6.itemType ~= l__ItemType__5.VOID_CHESTPLATE or table.find(l__ClientStore__4:getState().Bedwars.itemTiersPurchased, p6.itemType) ~= nil) do
			p6 = l__BedwarsShop__2.getShopItem(p6.nextTier, l__Players__3.LocalPlayer);
			if v31[p6.itemType] ~= nil then
				return false;
			end;		
		end;
		return true;
	end;
	local v40 = {};
	local v41 = 0;
	local v42, v43, v44 = ipairs(v25);
	while true do
		v42(v43, v44);
		if not v42 then
			break;
		end;
		v44 = v42;
		if v39(v43, v42 - 1, v25) == true then
			v41 = v41 + 1;
			v40[v41] = v43;
		end;	
	end;
	local v45 = u6.keys(l__BedwarsShopItemCategory__7);
	local function v46(p7, p8)
		local v47 = {};
		for v48, v49 in pairs(p7) do
			v47[v48] = v49;
		end;
		v47[p8] = {};
		return v47;
	end;
	v5 = {};
	for v50 = 1, #v45 do
		v5 = v46(v5, v45[v50], v50 - 1, v45);
	end;
	local function v51(p9, p10)
		if p10.category == l__BedwarsShopItemCategory__7.Void and not l__VoidWorldUtil__8.VOID_ENABLED then
			return p9;
		end;
		local v52 = p9[p10.category];
		if v52 ~= nil then
			v52 = #v52 == 0;
		end;
		if v52 then
			p9[p10.category] = { p10 };
			return p9;
		end;
		local v53 = p9[p10.category];
		if v53 ~= nil then
			table.insert(v53, p10);
		end;
		return p9;
	end;
	v6 = local v54;
	for v55 = 1, #v40 do
		v6 = v51(v6, v40[v55], v55 - 1, v40);
	end;
	local v56 = {};
	local v57 = 0;
	local v58, v59, v60 = ipairs((u6.entries(local v61)));
	while true do
		v58(v59, v60);
		if not v58 then
			break;
		end;
		local v62 = v59[2];
		if table.find(u9, v59[1]) == nil == true then
			v57 = v57 + 1;
			v56[v57] = v59;
		end;	
	end;
	local v63 = {};
	local v64 = 0;
	local v65, v66, v67 = ipairs((u6.entries(v61)));
	while true do
		v65(v66, v67);
		if not v65 then
			break;
		end;
		local v68 = v66[2];
		if table.find(u9, v66[1]) ~= nil == true then
			v64 = v64 + 1;
			v63[v64] = v66;
		end;	
	end;
	local v69 = #u6.keys(l__BedwarsShopItemCategory__7);
	local v70 = #u6.keys(v56);
	local v71 = math.ceil(#u6.keys(v63) / 2);
	local v72 = u6.entries(v61);
	local u14 = 0;
	v7 = 0;
	for v73 = 1, #v72 do
		local v74 = v72[v73];
		local v75 = 8;
		if table.find(u9, v74[1]) ~= nil then
			v75 = 4;
		end;
		local v76 = math.ceil(#v74[2] / v75);
		if v76 > 1 then
			u14 = u14 + 1;
		end;
		v7 = v7 + v76;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v77 = 8;
	else
		v77 = 14;
	end;
	local v78 = v77 + 2;
	if l__DeviceUtil__1.isSmallScreen() then
		local v79 = 4;
	else
		v79 = 8;
	end;
	if l__DeviceUtil__1.isSmallScreen() then
		local v80 = 10;
	else
		v80 = 20;
	end;
	local v81 = {
		CanvasSize = UDim2.new(p3.props.Size.X.Scale, 0, 0, v9 * local v82 + v10 * u14 + (v70 * (v78 + v79) + v71 * (v78 * 3 + v79)) + v69 * p3.state.wrapperSize.Y * 0.025 + v80 * 2), 
		Size = p3.props.Size, 
		Position = p3.props.Position, 
		BackgroundColor3 = l__Theme__10.backgroundPrimary, 
		ScrollBarThickness = 5, 
		BorderSizePixel = 0, 
		ScrollingDirection = "Y", 
		Selectable = false
	};
	v81[v2.Change.AbsoluteSize] = function(p11)
		p3:setState({
			wrapperSize = p11.AbsoluteSize
		});
	end;
	return v2.createElement("ScrollingFrame", v81, {
		ScrollingFramePadding = v2.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v80), 
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
			ShopCategories = v56, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v79, 
			CategoryTitleTextSize = v78, 
			CellWidth = v9, 
			CellPadding = v10, 
			LayoutOrder = 1
		}), v2.createElement(u12, {
			ShopCategories = v63, 
			SelectedItem = p3.props.SelectedItem, 
			SetSelectedShopItem = p3.props.SetSelectedShopItem, 
			CategoriesPadding = p3.state.wrapperSize.Y * 0.025, 
			TitlePadding = v79, 
			CategoryTitleTextSize = v78, 
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
