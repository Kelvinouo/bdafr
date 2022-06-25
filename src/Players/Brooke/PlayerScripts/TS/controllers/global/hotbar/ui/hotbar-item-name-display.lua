-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
return {
	HotbarItemNameDisplay = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1)
		local v2 = p1.store.Inventory.observedInventory.hotbar[p1.store.Inventory.observedInventory.hotbarSlot + 1].item;
		if v2 ~= nil then
			v2 = v2.itemType;
		end;
		if v2 == nil then
			return u1.createFragment();
		end;
		local l__displayName__3 = l__getItemMeta__2(v2).displayName;
		if v2 == nil then
			return u1.createFragment();
		end;
		local u3 = u1.createRef();
		task.delay(1.5, function()
			v1.try(function()
				u3:getValue().Text = "";
			end, function()

			end);
		end);
		return u1.createFragment({ u1.createElement("TextLabel", {
				[u1.Ref] = u3, 
				Text = "<b>" .. l__displayName__3 .. "</b>", 
				Size = UDim2.fromScale(0.37, 0.37), 
				Position = UDim2.fromScale(0.5, -0.7), 
				BackgroundTransparency = 100, 
				BorderSizePixel = 0, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = "Roboto", 
				TextScaled = true, 
				RichText = true, 
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}), u1.createElement("UIPadding", {
					PaddingTop = UDim.new(0.15, 0), 
					PaddingBottom = UDim.new(0.15, 0)
				}) }) });
	end)
};
