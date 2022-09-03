-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("BedwarsItemShopLeft");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.init(p1, p2)
	p1.maid = u1.new();
	local v6 = {};
	local v7 = false;
	if p2.SelectedItem ~= nil then
		v7 = p1:hasAlreadyPurchased(p2.SelectedItem.itemType);
	end;
	v6.alreadyPurchased = v7;
	p1:setState(v6);
end;
function v5.didUpdate(p3, p4, p5)
	if p4.SelectedItem ~= p3.props.SelectedItem then
		local v8 = {};
		local v9 = false;
		if p3.props.SelectedItem ~= nil then
			v9 = p3:hasAlreadyPurchased(p3.props.SelectedItem.itemType);
		end;
		v8.alreadyPurchased = v9;
		p3:setState(v8);
	end;
end;
local l__UserInputService__2 = v4.UserInputService;
function v5.didMount(p6)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		p6.maid:GiveTask(l__UserInputService__2.InputBegan:Connect(function(p7, p8)
			if p7.KeyCode == Enum.KeyCode.ButtonA then
				p6:purchase();
			end;
		end));
	end;
end;
function v5.willUnmount(p9)
	p9.maid:DoCleaning();
end;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v5.hasAlreadyPurchased(p10, p11)
	if l__DeviceUtil__3.isHoarceKat() then
		return false;
	end;
	return l__KnitClient__4.Controllers.BedwarsShopController.alreadyPurchasedMap[p11] ~= nil;
end;
local l__BedwarsShop__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local l__Players__6 = v4.Players;
local l__BedwarsShopCategoryMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta;
function v5.isLockedItem(p12)
	if not p12.props.SelectedItem then
		return false;
	end;
	local v10 = l__BedwarsShop__5.getShopItem(p12.props.SelectedItem.itemType, l__Players__6.LocalPlayer);
	if not v10 then
		return false;
	end;
	if not l__BedwarsShopCategoryMeta__7[v10.category].purchase then
		return false;
	end;
	return p12.props.store.Game.unlockedShopCategories[v10.category] == nil;
end;
local l__shopPurchaseItem__8 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
function v5.purchase(p13)
	local l__SelectedItem__11 = p13.props.SelectedItem;
	l__shopPurchaseItem__8(l__SelectedItem__11);
	if l__SelectedItem__11.nextTier then
		p13.props.SetSelectedShopItem(l__BedwarsShop__5.getShopItem(l__SelectedItem__11.nextTier, l__Players__6.LocalPlayer));
		return;
	end;
	if l__SelectedItem__11.tiered then
		p13:setState({
			alreadyPurchased = true
		});
		if not l__DeviceUtil__3.isHoarceKat() then
			l__KnitClient__4.Controllers.BedwarsShopController.alreadyPurchasedMap[l__SelectedItem__11.itemType] = true;
		end;
	end;
end;
local l__InventoryUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemViewport__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ItemUtil__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__Button__13 = v2.Button;
local l__Theme__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v5.render(p14)
	local v12 = false;
	local v13 = "LOCKED";
	if p14.props.SelectedItem and l__Players__6.LocalPlayer then
		if p14:isLockedItem() then
			v12 = true;
			v13 = "Locked";
		elseif not l__InventoryUtil__9.hasEnough(l__Players__6.LocalPlayer, p14.props.SelectedItem.currency, p14.props.SelectedItem.price) then
			v12 = true;
			v13 = "Not Enough";
		end;
		if not v12 then
			local v14 = l__getItemMeta__10(p14.props.SelectedItem.itemType);
			local v15 = v14;
			if v15 ~= nil then
				v15 = v15.maxStackSize;
			end;
			if v15 ~= nil then
				local v16 = l__InventoryUtil__9.getToolFromInventory(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType);
				local v17 = v16;
				if v17 ~= nil then
					v17 = v17.amount;
				end;
				if v17 ~= nil and v14.maxStackSize <= v16.amount then
					v12 = true;
					v13 = "Max Amount";
				end;
			end;
		end;
	end;
	local v18 = p14.state.alreadyPurchased;
	local v19 = nil;
	if p14.props.SelectedItem then
		v19 = l__getItemMeta__10(p14.props.SelectedItem.itemType).description;
		if v19 == nil or #v19 == 0 then
			v19 = " ";
		end;
		if (p14.props.SelectedItem.lockAfterPurchase or p14.props.SelectedItem.tiered) and l__Players__6.LocalPlayer and l__InventoryUtil__9.hasEnough(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType, 1) then
			v18 = true;
		end;
	end;
	local v20 = p14.props.SelectedItem ~= nil;
	if v20 then
		local v21 = { v3.createElement(l__ItemViewport__11, {
				ItemType = p14.props.SelectedItem.itemType, 
				Size = UDim2.fromScale(0.32, 0.32), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.073), 
				AnchorPoint = Vector2.new(0.5, 0), 
				ShowCooldownBar = false
			}) };
		local v22 = #v21;
		local v23 = {};
		local v24 = p14.props.SelectedItem.customDisplayName;
		if v24 == nil then
			v24 = l__ItemUtil__12.getDisplayName(p14.props.SelectedItem.itemType);
		end;
		v23.Text = "<b>" .. v24 .. "</b>";
		v23.Size = UDim2.fromScale(0.9, 0.063);
		v23.Position = UDim2.fromScale(0.5, 0.42);
		v23.AnchorPoint = Vector2.new(0.5, 0);
		v23.BackgroundTransparency = 1;
		v23.BorderSizePixel = 0;
		v23.Font = "Roboto";
		v23.TextScaled = true;
		v23.RichText = true;
		v23.TextColor3 = Color3.fromRGB(255, 255, 255);
		v21[v22 + 1] = v3.createElement("TextLabel", v23);
		local v25 = false;
		if p14.props.SelectedItem.amount > 1 then
			v25 = v3.createElement("TextLabel", {
				Text = "<b>x" .. tostring(p14.props.SelectedItem.amount) .. "</b>", 
				Size = UDim2.fromScale(0.392, 0.063), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0), 
				BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
				BackgroundTransparency = 0.4, 
				BorderSizePixel = 0, 
				Font = "Roboto", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255)
			}, { v3.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}), v3.createElement("UIPadding", {
					PaddingTop = UDim.new(0.2), 
					PaddingBottom = UDim.new(0.2, 0)
				}) });
		end;
		if v25 then
			v21[v22 + 2] = v25;
		end;
		local v26 = v19;
		if v26 ~= "" and v26 then
			local v27 = false;
			if v19 ~= " " then
				v27 = v3.createElement("TextLabel", {
					Text = "<b>" .. v19 .. "</b>", 
					Size = UDim2.fromScale(0.85, 0.16), 
					Position = UDim2.fromScale(0.5, 0.59), 
					AnchorPoint = Vector2.new(0.5, 0), 
					BackgroundColor3 = Color3.fromRGB(191, 192, 217), 
					BackgroundTransparency = 0.9, 
					BorderSizePixel = 0, 
					Font = "Roboto", 
					TextScaled = true, 
					RichText = true, 
					TextColor3 = Color3.fromRGB(255, 255, 255)
				}, { v3.createElement("UICorner", {
						CornerRadius = UDim.new(0.1, 0)
					}), v3.createElement("UIPadding", {
						PaddingTop = UDim.new(0.1), 
						PaddingBottom = UDim.new(0.1, 0), 
						PaddingLeft = UDim.new(0.1, 0), 
						PaddingRight = UDim.new(0.1, 0)
					}) });
			end;
			v26 = v27;
		end;
		if v26 then
			v21[#v21 + 1] = v26;
		end;
		local v28 = #v21;
		v21[v28 + 1] = v3.createElement("TextLabel", {
			Text = "<b>" .. tostring(p14.props.SelectedItem.price) .. " " .. l__ItemUtil__12.getDisplayName(p14.props.SelectedItem.currency) .. "</b>", 
			Size = UDim2.fromScale(0.9, 0.038), 
			Position = UDim2.fromScale(0.5, 0.894), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__getItemMeta__10(p14.props.SelectedItem.currency).displayNameColor or Color3.fromRGB(255, 255, 255)
		});
		if not v12 then
			if v18 then
				local v29 = v3.createElement(l__Button__13, {
					Text = "<b>Purchased</b>", 
					Size = UDim2.fromScale(0.9, 0.075), 
					Position = UDim2.fromScale(0.5, 0.98), 
					AnchorPoint = Vector2.new(0.5, 1), 
					BackgroundColor3 = l__Theme__14.backgroundPrimary, 
					Selectable = false, 
					OnClick = function()

					end
				});
			else
				local v30 = {};
				if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
					local v31 = " (A)";
				else
					v31 = "";
				end;
				v30.Text = "<b>Purchase" .. v31 .. "</b>";
				v30.Size = UDim2.fromScale(0.9, 0.075);
				v30.Position = UDim2.fromScale(0.5, 0.98);
				v30.AnchorPoint = Vector2.new(0.5, 1);
				v30.BackgroundColor3 = l__Theme__14.backgroundSuccess;
				v30.Selectable = false;
				function v30.OnClick()
					p14:purchase();
				end;
				v29 = v3.createElement(l__Button__13, v30);
			end;
		else
			v29 = v3.createElement(l__Button__13, {
				Text = "<b>" .. v13 .. "</b>", 
				Size = UDim2.fromScale(0.9, 0.075), 
				Position = UDim2.fromScale(0.5, 0.98), 
				AnchorPoint = Vector2.new(0.5, 1), 
				BackgroundColor3 = l__Theme__14.backgroundError, 
				Selectable = false, 
				OnClick = function()

				end
			});
		end;
		v21[v28 + 2] = v29;
		v20 = v3.createFragment(v21);
	end;
	local v32 = {};
	if v20 then
		v32[#v32 + 1] = v20;
	end;
	return v3.createElement("Frame", {
		Size = p14.props.Size, 
		Position = p14.props.Position, 
		BackgroundColor3 = l__Theme__14.backgroundSecondary, 
		BorderSizePixel = 0
	}, v32);
end;
return {
	BedwarsItemShopLeft = v5
};
