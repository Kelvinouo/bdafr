-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BedwarsShopCategory__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory;
local l__BedwarsShopCategoryMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ShopCategoryUnlockable__5 = v1.import(script, script.Parent, "shop-category-unlockable").ShopCategoryUnlockable;
local l__Empty__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	ShopCategoryUnlockableList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		local v4 = 0;
		local v5, v6, v7 = ipairs((u1.values(l__BedwarsShopCategory__2)));
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			local v8 = l__BedwarsShopCategoryMeta__3[v6];
			if v8.disabled or not v8.unlockable then
				local v9 = nil;
			else
				v9 = v6;
			end;
			if v9 ~= nil then
				v4 = v4 + 1;
				v3[v4] = v9;
			end;		
		end;
		local u7 = math.ceil(#v3 / 2);
		local v10 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = "Y", 
			LayoutOrder = 2
		};
		local v11 = { u4.createElement("UIListLayout", {
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 18), 
				SortOrder = "LayoutOrder"
			}) };
		local v12 = #v11;
		local v13, v14, v15 = ipairs(((function()
			local v16 = {};
			local v17 = 0;
			local v18 = false;
			while true do
				if v18 then
					v17 = v17 + 1;
				else
					v18 = true;
				end;
				if not (v17 < u7) then
					break;
				end;
				local v19 = {};
				local v20 = 0;
				local v21 = false;
				while true do
					if v21 then
						v20 = v20 + 1;
					else
						v21 = true;
					end;
					if not (v20 < 2) then
						break;
					end;
					local v22 = #v3;
					local v23 = v3[v22];
					v3[v22] = nil;
					if v23 then
						table.insert(v19, v23);
					end;				
				end;
				if #v19 ~= 0 then
					local function v24(p3, p4)
						local v25 = {
							Size = UDim2.new(0.5, -6, 0, 0), 
							Category = p3
						};
						local v26 = {};
						local v27 = 0;
						local v28, v29, v30 = ipairs(p1.ShopItems);
						while true do
							v28(v29, v30);
							if not v28 then
								break;
							end;
							if v29.category == p3 == true then
								v27 = v27 + 1;
								v26[v27] = v29;
							end;						
						end;
						v25.ShopItems = v26;
						v25.SelectedItem = p1.SelectedItem;
						v25.SetSelectedShopItem = p1.SetSelectedShopItem;
						v25.store = p1.store;
						local v31 = l__BedwarsShopCategoryMeta__3[p3].layoutOrder;
						if v31 == nil then
							v31 = p4;
						end;
						v25.LayoutOrder = v31;
						return u4.createElement(l__ShopCategoryUnlockable__5, v25);
					end;
					local v32 = table.create(#v19);
					local v33, v34, v35 = ipairs(v19);
					while true do
						v33(v34, v35);
						if not v33 then
							break;
						end;
						v35 = v33;
						v32[v33] = v24(v34, v33 - 1, v19);					
					end;
					local v36 = {
						Size = UDim2.fromScale(1, 0), 
						AutomaticSize = "Y", 
						LayoutOrder = v17
					};
					local v37 = { u4.createElement("UIListLayout", {
							VerticalAlignment = "Top", 
							HorizontalAlignment = "Left", 
							FillDirection = "Horizontal", 
							Padding = UDim.new(0, 12), 
							SortOrder = "LayoutOrder"
						}) };
					local v38 = #v37;
					local v39, v40, v41 = ipairs(v32);
					while true do
						v39(v40, v41);
						if not v39 then
							break;
						end;
						v41 = v39;
						v37[v38 + v39] = v40;					
					end;
					table.insert(v16, (u4.createElement(l__Empty__6, v36, v37)));
				end;			
			end;
			return v16;
		end)()));
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v11[v12 + v13] = v14;		
		end;
		return u4.createElement(l__Empty__6, v10, v11);
	end)
};
