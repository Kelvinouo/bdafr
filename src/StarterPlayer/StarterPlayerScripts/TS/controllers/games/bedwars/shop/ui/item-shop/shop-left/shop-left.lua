-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v2.Component:extend("BedwarsItemShopLeft");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
function v4.init(p1, p2)
	p1.maid = u1.new();
	p1:setState({
		alreadyPurchased = p2.SelectedItem ~= nil and l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[p2.SelectedItem.itemType] ~= nil
	});
end;
function v4.didUpdate(p3, p4, p5)
	if p4.SelectedItem ~= p3.props.SelectedItem then
		p3:setState({
			alreadyPurchased = p3.props.SelectedItem ~= nil and l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[p3.props.SelectedItem.itemType] ~= nil
		});
	end;
end;
local l__UserInputService__3 = v3.UserInputService;
function v4.didMount(p6)
	if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled then
		p6.maid:GiveTask(l__UserInputService__3.InputBegan:Connect(function(p7, p8)
			if p7.KeyCode == Enum.KeyCode.ButtonA then
				p6:purchase();
			end;
		end));
	end;
end;
function v4.willUnmount(p9)
	p9.maid:DoCleaning();
end;
local l__BedwarsShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
v4.checkIsLockedItem = v1.async(function(p10)
	return v1.Promise.new(function(p11)
		if p10.props.SelectedItem == nil then
			p11(false);
		end;
		local v5 = {};
		local v6 = 0;
		local v7, v8, v9 = ipairs(l__BedwarsShop__4.TeamUpgrades);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			if v8.items ~= nil == true then
				v6 = v6 + 1;
				v5[v6] = v8;
			end;		
		end;
		if #v5 == 0 then
			p11(false);
		end;
		local v10, v11, v12 = ipairs(v5);
		while true do
			v10(v11, v12);
			if not v10 then
				break;
			end;
			local v13 = table.find(v11.items, p10.props.SelectedItem.itemType) ~= nil;
			local v14 = p10.props.store.Bedwars.teamUpgrades[v11.id];
			if v14 == nil then
				v14 = -1;
			end;
			if v14 >= 0 and nil then
				p11(false);
			elseif v14 == -1 and nil then
				p11(true);
			end;		
		end;
		if nil then
			p11(true);
			return;
		end;
		p11(false);
	end);
end);
local l__shopPurchaseItem__5 = v1.import(script, script.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local l__Players__6 = v3.Players;
function v4.purchase(p12)
	local l__SelectedItem__15 = p12.props.SelectedItem;
	l__shopPurchaseItem__5(l__SelectedItem__15);
	if l__SelectedItem__15.nextTier then
		p12.props.SetSelectedShopItem(l__BedwarsShop__4.getShopItem(l__SelectedItem__15.nextTier, l__Players__6.LocalPlayer));
		return;
	end;
	if l__SelectedItem__15.tiered then
		p12:setState({
			alreadyPurchased = true
		});
		l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[l__SelectedItem__15.itemType] = true;
	end;
end;
local l__InventoryUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemViewport__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ItemUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__Button__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Button;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v4.render(p13)
	if p13.props.SelectedItem and l__Players__6.LocalPlayer then
		local u13 = false;
		local u14 = "LOCKED";
		p13:checkIsLockedItem():andThen(function(p14)
			if p14 then
				u13 = true;
				u14 = "Locked";
				return;
			end;
			if not l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p13.props.SelectedItem.currency, p13.props.SelectedItem.price) then
				u13 = true;
				u14 = "Not Enough";
			end;
		end);
		if not u13 then
			local v16 = l__getItemMeta__8(p13.props.SelectedItem.itemType);
			local v17 = v16;
			if v17 ~= nil then
				v17 = v17.maxStackSize;
			end;
			if v17 ~= nil then
				local v18 = l__InventoryUtil__7.getToolFromInventory(l__Players__6.LocalPlayer, p13.props.SelectedItem.itemType);
				local v19 = v18;
				if v19 ~= nil then
					v19 = v19.amount;
				end;
				if v19 ~= nil and v16.maxStackSize <= v18.amount then
					u13 = true;
					u14 = "Max Amount";
				end;
			end;
		end;
	end;
	local v20 = p13.state.alreadyPurchased;
	local v21 = nil;
	if p13.props.SelectedItem then
		v21 = l__getItemMeta__8(p13.props.SelectedItem.itemType).description;
		if v21 == nil or #v21 == 0 then
			v21 = " ";
		end;
		if (p13.props.SelectedItem.lockAfterPurchase or p13.props.SelectedItem.tiered) and l__Players__6.LocalPlayer and l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p13.props.SelectedItem.itemType, 1) then
			v20 = true;
		end;
	end;
	local v22 = p13.props.SelectedItem ~= nil;
	if v22 then
		local v23 = { v2.createElement(l__ItemViewport__9, {
				ItemType = p13.props.SelectedItem.itemType, 
				Size = UDim2.fromScale(0.32, 0.32), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.073), 
				AnchorPoint = Vector2.new(0.5, 0), 
				ShowCooldownBar = false
			}) };
		local v24 = #v23;
		local v25 = {};
		local v26 = p13.props.SelectedItem.customDisplayName;
		if v26 == nil then
			v26 = l__ItemUtil__10.getDisplayName(p13.props.SelectedItem.itemType);
		end;
		v25.Text = "<b>" .. v26 .. "</b>";
		v25.Size = UDim2.fromScale(0.9, 0.063);
		v25.Position = UDim2.fromScale(0.5, 0.42);
		v25.AnchorPoint = Vector2.new(0.5, 0);
		v25.BackgroundTransparency = 1;
		v25.BorderSizePixel = 0;
		v25.Font = "Roboto";
		v25.TextScaled = true;
		v25.RichText = true;
		v25.TextColor3 = Color3.fromRGB(255, 255, 255);
		v23[v24 + 1] = v2.createElement("TextLabel", v25);
		local v27 = false;
		if p13.props.SelectedItem.amount > 1 then
			v27 = v2.createElement("TextLabel", {
				Text = "<b>x" .. tostring(p13.props.SelectedItem.amount) .. "</b>", 
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
			}, { v2.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}), v2.createElement("UIPadding", {
					PaddingTop = UDim.new(0.2), 
					PaddingBottom = UDim.new(0.2, 0)
				}) });
		end;
		if v27 then
			v23[v24 + 2] = v27;
		end;
		local v28 = v21;
		if v28 ~= "" and v28 then
			local v29 = false;
			if v21 ~= " " then
				v29 = v2.createElement("TextLabel", {
					Text = "<b>" .. v21 .. "</b>", 
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
				}, { v2.createElement("UICorner", {
						CornerRadius = UDim.new(0.1, 0)
					}), v2.createElement("UIPadding", {
						PaddingTop = UDim.new(0.1), 
						PaddingBottom = UDim.new(0.1, 0), 
						PaddingLeft = UDim.new(0.1, 0), 
						PaddingRight = UDim.new(0.1, 0)
					}) });
			end;
			v28 = v29;
		end;
		if v28 then
			v23[#v23 + 1] = v28;
		end;
		local v30 = #v23;
		v23[v30 + 1] = v2.createElement("TextLabel", {
			Text = "<b>" .. tostring(p13.props.SelectedItem.price) .. " " .. l__ItemUtil__10.getDisplayName(p13.props.SelectedItem.currency) .. "</b>", 
			Size = UDim2.fromScale(0.9, 0.038), 
			Position = UDim2.fromScale(0.5, 0.894), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__getItemMeta__8(p13.props.SelectedItem.currency).displayNameColor or Color3.fromRGB(255, 255, 255)
		});
		if not false then
			if v20 then
				local v31 = v2.createElement(l__Button__11, {
					Text = "<b>Purchased</b>", 
					Size = UDim2.fromScale(0.9, 0.075), 
					Position = UDim2.fromScale(0.5, 0.98), 
					AnchorPoint = Vector2.new(0.5, 1), 
					BackgroundColor3 = l__Theme__12.backgroundPrimary, 
					Selectable = false, 
					OnClick = function()

					end
				});
			else
				local v32 = {};
				if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled then
					local v33 = " (A)";
				else
					v33 = "";
				end;
				v32.Text = "<b>Purchase" .. v33 .. "</b>";
				v32.Size = UDim2.fromScale(0.9, 0.075);
				v32.Position = UDim2.fromScale(0.5, 0.98);
				v32.AnchorPoint = Vector2.new(0.5, 1);
				v32.BackgroundColor3 = l__Theme__12.backgroundSuccess;
				v32.Selectable = false;
				function v32.OnClick()
					p13:purchase();
				end;
				v31 = v2.createElement(l__Button__11, v32);
			end;
		else
			v31 = v2.createElement(l__Button__11, {
				Text = "<b>LOCKED</b>", 
				Size = UDim2.fromScale(0.9, 0.075), 
				Position = UDim2.fromScale(0.5, 0.98), 
				AnchorPoint = Vector2.new(0.5, 1), 
				BackgroundColor3 = l__Theme__12.backgroundError, 
				Selectable = false, 
				OnClick = function()

				end
			});
		end;
		v23[v30 + 2] = v31;
		v22 = v2.createFragment(v23);
	end;
	local v34 = {};
	if v22 then
		v34[#v34 + 1] = v22;
	end;
	return v2.createElement("Frame", {
		Size = p13.props.Size, 
		Position = p13.props.Position, 
		BackgroundColor3 = l__Theme__12.backgroundSecondary, 
		BorderSizePixel = 0
	}, v34);
end;
return {
	BedwarsItemShopLeft = v4
};
