-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__InventoryTile__3 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-tile").InventoryTile;
local l__Players__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__default__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__InventoryHeader__6 = v1.import(script, script.Parent.Parent.Parent, "ui", "inventory-header").InventoryHeader;
local l__EmptyButton__7 = v2.EmptyButton;
return {
	InventoryChest = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		local v5 = 0;
		local v6 = false;
		while true do
			if v6 then
				v5 = v5 + 1;
			else
				v6 = true;
			end;
			if not (v5 < 24) then
				break;
			end;
			local v7 = nil;
			if v5 < #p1.ObservedChest.items then
				local v8 = p1.ObservedChest.items[v5 + 1];
				if v8 ~= "empty" then
					v7 = v8;
				end;
			end;
			local v9 = {};
			local v10 = {
				InvItem = v7, 
				LayoutOrder = v5, 
				AutoSelect = v5 == 0
			};
			v10.OnClick = v1.async(function()
				if v7 then
					local v11 = l__Players__4.LocalPlayer.Character;
					if v11 ~= nil then
						v11 = v11:FindFirstChild("ObservedChestFolder");
					end;
					local v12 = v1.await(v11);
					local v13 = v12;
					if v13 ~= nil then
						v13 = v13.Value;
					end;
					if v13 then
						return v1.await(l__default__5.Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(v12.Value, v7.tool));
					end;
				end;
			end);
			function v10.SendToHotbarSlot(p3)

			end;
			v10.TileColor = Color3.fromRGB(110, 69, 28);
			v10.ItemClickLoadingProgress = true;
			v9[1] = u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.025), 
				PaddingBottom = UDim.new(0.025), 
				PaddingLeft = UDim.new(0.025), 
				PaddingRight = UDim.new(0.025)
			});
			v9[2] = u1.createElement(l__InventoryTile__3, v10);
			table.insert(v4, (u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(1, 1)
			}, v9)));		
		end;
		local v14 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v15 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical"
			}), u1.createElement(l__InventoryHeader__6, {
				Title = tostring(p1.Title and "Chest")
			}), u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(0, 0.01)
			}) };
		local v16 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v17 = {};
		local v18 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 0, 
			BackgroundColor3 = Color3.fromRGB(81, 50, 22), 
			BorderSizePixel = 0
		};
		local v19 = { u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u1.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.02, 0), 
				PaddingRight = UDim.new(0.02, 0), 
				PaddingTop = UDim.new(0.03, 0), 
				PaddingBottom = UDim.new(0.03, 0)
			}), u1.createElement("UIGridLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				CellSize = UDim2.fromScale(0.14666666666666667, 0.23), 
				CellPadding = UDim2.fromScale(0.02, 0.02), 
				SortOrder = "LayoutOrder"
			}) };
		local v20 = #v19;
		local v21, v22, v23 = ipairs(v4);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v19[v20 + v21] = v22;		
		end;
		v17[#v17 + 1] = u1.createElement("Frame", v18, v19);
		v15[#v15 + 1] = u1.createElement(l__EmptyButton__7, v16, v17);
		return u1.createElement(l__Empty__2, v14, v15);
	end)
};
