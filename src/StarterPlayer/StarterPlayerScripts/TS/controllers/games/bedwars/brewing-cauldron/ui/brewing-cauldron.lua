-- Script Hash: 6a8b0da0b2f57bc338f3591beebf34dc5608ed69969fdf19106dd21b94bbfe37c04a1fb902eac1651afb0675407a1709
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
		local function v16(p3)
			local v17 = p3[1];
			return u1.createElement(l__IngredientBox__2, {
				Image = l__getItemMeta__7(p3[2]).image, 
				Amount = 1
			});
		end;
		local v18 = table.create(#v15);
		for v19, v20 in ipairs(v15) do
			v18[v19] = v16(v20, v19 - 1, v15);
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
		for v24, v25 in ipairs(v18) do
			v22[v23 + v24] = v25;
		end;
		local v26 = #v22;
		for v27, v28 in ipairs(v7) do
			v22[v26 + v27] = v28;
		end;
		v14.IngredientList = u1.createElement(l__Empty__8, v21, v22);
		v11.Container = u1.createElement("Frame", v13, v14);
		return u1.createFragment({
			BrewingCauldronBillboard = u1.createElement("BillboardGui", v10, v11)
		});
	end)
};
