-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__IngredientBox__2 = v1.import(script, script.Parent, "ingredient-box").IngredientBox;
local l__CraftingStatus__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local l__TimedProgressBar__4 = v2.TimedProgressBar;
local l__ColorUtil__5 = v2.ColorUtil;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__getItemMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Empty__8 = v2.Empty;
return {
	BrewingCauldron = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3, v4 = p2.useState(0);
		local v5 = p1.MaxNumIngredients;
		if v5 == nil then
			v5 = 3;
		end;
		local v6 = v5 - #p1.Inventory;
		local v7 = {};
		local v8 = 0;
		local v9 = false;
		while true do
			if v9 then
				v8 = v8 + 1;
			else
				v9 = true;
			end;
			if not (v8 < v6) then
				break;
			end;
			table.insert(v7, (u1.createElement(l__IngredientBox__2)));		
		end;
		p2.useEffect(function()
			if p1.CraftingStatus == l__CraftingStatus__3.crafting then
				v4(os.time() + p1.timeToCraft);
			end;
		end, { p1.CraftingStatus });
		local v10 = {
			Size = UDim2.fromScale(7, 3), 
			MaxDistance = 35, 
			ExtentsOffsetWorldSpace = Vector3.new(0, 1, 0), 
			SizeOffset = Vector2.new(0, 1), 
			AlwaysOnTop = true, 
			ResetOnSpawn = false
		};
		local v11 = {};
		local v12 = false;
		if p1.CraftingStatus == l__CraftingStatus__3.crafting then
			v12 = false;
			if v3 > 0 then
				v12 = u1.createElement(l__TimedProgressBar__4, {
					EndTime = v3, 
					BarColor = l__ColorUtil__5.WHITE, 
					HideOnComplete = true, 
					AnchorPoint = Vector2.new(0, 0), 
					Position = UDim2.fromScale(0, 0), 
					Size = UDim2.fromScale(1, 0.1)
				}, { u1.createElement("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}) });
			end;
		end;
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		local v13 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0, 0.13), 
			Size = UDim2.fromScale(1, 0.87), 
			BackgroundColor3 = l__ColorUtil__5.BLACK, 
			BackgroundTransparency = 0.3
		};
		local v14 = {
			Title = u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.15), 
				SizeConstraint = "RelativeYY", 
				Text = p1.Text, 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__ColorUtil__5.WHITE, 
				BackgroundTransparency = 1, 
				TextXAlignment = "Center", 
				LayoutOrder = 1
			}),
			u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.05, 0), 
				PaddingLeft = UDim.new(0.05, 0)
			}), (u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}))
		};
		local v15 = u6.entries(p1.Inventory);
		local v16 = table.create(#v15);
		local v17, v18, v19 = ipairs(v15);
		while true do
			v17(v18, v19);
			if not v17 then
				break;
			end;
			v19 = v17;
			local v20 = v18[1];
			v16[v17] = u1.createElement(l__IngredientBox__2, {
				Image = l__getItemMeta__7(v18[2]).image, 
				Amount = 1
			});		
		end;
		local v21 = {
			Size = UDim2.fromScale(1, 0.75), 
			LayoutOrder = 2
		};
		local v22 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center"
			}) };
		local v23 = #v22;
		local v24, v25, v26 = ipairs(v16);
		while true do
			v24(v25, v26);
			if not v24 then
				break;
			end;
			v26 = v24;
			v22[v23 + v24] = v25;		
		end;
		local v27 = #v22;
		local v28, v29, v30 = ipairs(v7);
		while true do
			v28(v29, v30);
			if not v28 then
				break;
			end;
			v30 = v28;
			v22[v27 + v28] = v29;		
		end;
		v14.IngredientList = u1.createElement(l__Empty__8, v21, v22);
		v11.Container = u1.createElement("Frame", v13, v14);
		return u1.createFragment({
			BrewingCauldronBillboard = u1.createElement("BillboardGui", v10, v11)
		});
	end)
};
