-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("ShopItemList");
function v4.init(p1, p2)

end;
local l__BedwarsShop__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsShopCategory__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local l__BedwarsShopCategoryMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local l__ShopCategoryDefault__10 = v1.import(script, script.Parent, "shop-category-default").ShopCategoryDefault;
local l__Empty__11 = v2.Empty;
local u12 = v1.import(script, script.Parent, "shop-category-unlockable-list").ShopCategoryUnlockableList;
local l__AutoCanvasScrollingFrame__13 = v2.AutoCanvasScrollingFrame;
function v4.render(p3)
	local v5 = {};
	local v6 = 0;
	local v7, v8, v9 = ipairs((l__BedwarsShop__1.getShop(l__Players__2.LocalPlayer)));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if not v8.tiered == true then
			v6 = v6 + 1;
			v5[v6] = v8;
		end;	
	end;
	local function v10(p4)
		if p4.requiresKit then
			local l__kit__11 = l__ClientStore__3:getState().Bedwars.kit;
			if not l__kit__11 or table.find(p4.requiresKit, l__kit__11) == nil then
				return false;
			end;
		end;
		if p4.ignoredByKit then
			local l__kit__12 = l__ClientStore__3:getState().Bedwars.kit;
			if l__kit__12 and table.find(p4.ignoredByKit, l__kit__12) ~= nil then
				return false;
			end;
		end;
		return true;
	end;
	local v13 = {};
	local v14 = 0;
	local v15, v16, v17 = ipairs(v5);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		if v10(v16, v15 - 1, v5) == true then
			v14 = v14 + 1;
			v13[v14] = v16;
		end;	
	end;
	local function v18(p5)
		while p5.nextTier and table.find(l__ClientStore__3:getState().Bedwars.itemTiersPurchased, p5.itemType) ~= nil do
			p5 = l__BedwarsShop__1.getShopItem(p5.nextTier, l__Players__2.LocalPlayer);		
		end;
		return p5;
	end;
	local v19 = {};
	local v20 = 0;
	local v21, v22, v23 = ipairs(v13);
	while true do
		v21(v22, v23);
		if not v21 then
			break;
		end;
		v23 = v21;
		local v24 = v18(v22, v21 - 1, v13);
		if v24 ~= nil then
			v20 = v20 + 1;
			v19[v20] = v24;
		end;	
	end;
	local v25 = {};
	local v26 = table.create(#v19);
	local v27, v28, v29 = ipairs(v19);
	while true do
		v27(v28, v29);
		if not v27 then
			break;
		end;
		v29 = v27;
		v26[v27] = v28.itemType;	
	end;
	local v30, v31, v32 = ipairs(v26);
	while true do
		v30(v31, v32);
		if not v30 then
			break;
		end;
		v32 = v30;
		v25[v31] = true;	
	end;
	local u14 = {};
	local function v33(p6)
		if u14[p6.itemType] ~= nil then
			return false;
		end;
		u14[p6.itemType] = true;
		while p6.nextTier and (p6.itemType ~= l__ItemType__4.VOID_CHESTPLATE or table.find(l__ClientStore__3:getState().Bedwars.itemTiersPurchased, p6.itemType) ~= nil) do
			p6 = l__BedwarsShop__1.getShopItem(p6.nextTier, l__Players__2.LocalPlayer);
			if v25[p6.itemType] ~= nil then
				return false;
			end;		
		end;
		return true;
	end;
	local v34 = {};
	local v35 = 0;
	local v36, v37, v38 = ipairs(v19);
	while true do
		v36(v37, v38);
		if not v36 then
			break;
		end;
		v38 = v36;
		if v33(v37, v36 - 1, v19) == true then
			v35 = v35 + 1;
			v34[v35] = v37;
		end;	
	end;
	local v39 = {};
	if l__DeviceUtil__5.isSmallScreen() then
		local v40 = 10;
	else
		v40 = 20;
	end;
	v39.AdditionalSpace = v40;
	v39.WaitForAbsoluteSize = true;
	v39.ScrollingFrameProps = {
		Size = p3.props.Size or UDim2.fromScale(1, 1), 
		Position = p3.props.Position, 
		BackgroundColor3 = l__Theme__6.backgroundPrimary, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0
	};
	local v41 = {};
	local v42 = {};
	if l__DeviceUtil__5.isSmallScreen() then
		local v43 = 10;
	else
		v43 = 20;
	end;
	v42.PaddingTop = UDim.new(0, v43);
	v42.PaddingLeft = UDim.new(0.03, 0);
	v42.PaddingRight = UDim.new(0.03, 0);
	v41.ScrollingFramePadding = v3.createElement("UIPadding", v42);
	v41.ScrollingFrameListLayout = v3.createElement("UIListLayout", {
		VerticalAlignment = "Top", 
		HorizontalAlignment = "Left", 
		FillDirection = "Vertical", 
		Padding = UDim.new(0, 18), 
		SortOrder = "LayoutOrder"
	});
	local v44 = #v41;
	local v45 = u7.values(l__BedwarsShopCategory__8);
	local function v46(p7)
		local v47 = l__BedwarsShopCategoryMeta__9[p7];
		if v47.disabled or v47.unlockable then
			return nil;
		end;
		local v48 = {
			Category = p7
		};
		local v49 = {};
		local v50 = 0;
		local v51, v52, v53 = ipairs(v34);
		while true do
			v51(v52, v53);
			if not v51 then
				break;
			end;
			if v52.category == p7 == true then
				v50 = v50 + 1;
				v49[v50] = v52;
			end;		
		end;
		v48.ShopItems = v49;
		v48.SelectedItem = p3.props.SelectedItem;
		v48.SetSelectedShopItem = p3.props.SetSelectedShopItem;
		v48.LayoutOrder = 1;
		return v3.createElement(l__ShopCategoryDefault__10, v48);
	end;
	local v54 = {};
	local v55 = 0;
	local v56, v57, v58 = ipairs(v45);
	while true do
		v56(v57, v58);
		if not v56 then
			break;
		end;
		v58 = v56;
		local v59 = v46(v57, v56 - 1, v45);
		if v59 ~= nil then
			v55 = v55 + 1;
			v54[v55] = v59;
		end;	
	end;
	local v60 = {
		Size = UDim2.fromScale(1, 0), 
		AutomaticSize = "Y", 
		LayoutOrder = 1
	};
	local v61 = { v3.createElement("UIListLayout", {
			VerticalAlignment = "Top", 
			HorizontalAlignment = "Left", 
			FillDirection = "Vertical", 
			Padding = UDim.new(0, 18), 
			SortOrder = "LayoutOrder"
		}) };
	local v62 = #v61;
	local v63, v64, v65 = ipairs(v54);
	while true do
		v63(v64, v65);
		if not v63 then
			break;
		end;
		v65 = v63;
		v61[v62 + v63] = v64;	
	end;
	v41[v44 + 1] = v3.createElement(l__Empty__11, v60, v61);
	v41[v44 + 2] = v3.createElement(u12, {
		ShopItems = v34, 
		SelectedItem = p3.props.SelectedItem, 
		SetSelectedShopItem = p3.props.SetSelectedShopItem, 
		store = p3.props.store, 
		LayoutOrder = 2
	});
	return v3.createElement(l__AutoCanvasScrollingFrame__13, v39, v41);
end;
return {
	ShopItemList = v4
};
