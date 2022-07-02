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
			local v10, v11 = v7(v8, v9);
			if not v10 then
				break;
			end;
			if v11.items ~= nil == true then
				v6 = v6 + 1;
				v5[v6] = v11;
			end;		
		end;
		if #v5 == 0 then
			p11(false);
		end;
		local v12, v13, v14 = ipairs(v5);
		while true do
			local v15, v16 = v12(v13, v14);
			if not v15 then
				break;
			end;
			local v17 = table.find(v16.items, p10.props.SelectedItem.itemType) ~= nil;
			local v18 = p10.props.store.Bedwars.teamUpgrades[v16.id];
			if v18 == nil then
				v18 = -1;
			end;
			if v18 >= 0 and nil then
				p11(false);
			elseif v18 == -1 and nil then
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
	local l__SelectedItem__19 = p12.props.SelectedItem;
	l__shopPurchaseItem__5(l__SelectedItem__19);
	if l__SelectedItem__19.nextTier then
		p12.props.SetSelectedShopItem(l__BedwarsShop__4.getShopItem(l__SelectedItem__19.nextTier, l__Players__6.LocalPlayer));
		return;
	end;
	if l__SelectedItem__19.tiered then
		p12:setState({
			alreadyPurchased = true
		});
		l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[l__SelectedItem__19.itemType] = true;
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
			local v20 = l__getItemMeta__8(p13.props.SelectedItem.itemType);
			local v21 = v20;
			if v21 ~= nil then
				v21 = v21.maxStackSize;
			end;
			if v21 ~= nil then
				local v22 = l__InventoryUtil__7.getToolFromInventory(l__Players__6.LocalPlayer, p13.props.SelectedItem.itemType);
				local v23 = v22;
				if v23 ~= nil then
					v23 = v23.amount;
				end;
				if v23 ~= nil and v20.maxStackSize <= v22.amount then
					u13 = true;
					u14 = "Max Amount";
				end;
			end;
		end;
	end;
	local v24 = p13.state.alreadyPurchased;
	local v25 = nil;
	if p13.props.SelectedItem then
		v25 = l__getItemMeta__8(p13.props.SelectedItem.itemType).description;
		if v25 == nil or #v25 == 0 then
			v25 = " ";
		end;
		if (p13.props.SelectedItem.lockAfterPurchase or p13.props.SelectedItem.tiered) and l__Players__6.LocalPlayer and l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p13.props.SelectedItem.itemType, 1) then
			v24 = true;
		end;
	end;
	local v26 = p13.props.SelectedItem ~= nil;
	if v26 then
		local v27 = { v2.createElement(l__ItemViewport__9, {
				ItemType = p13.props.SelectedItem.itemType, 
				Size = UDim2.fromScale(0.32, 0.32), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.073), 
				AnchorPoint = Vector2.new(0.5, 0), 
				ShowCooldownBar = false
			}) };
		local v28 = #v27;
		local v29 = {};
		local v30 = p13.props.SelectedItem.customDisplayName;
		if v30 == nil then
			v30 = l__ItemUtil__10.getDisplayName(p13.props.SelectedItem.itemType);
		end;
		v29.Text = "<b>" .. v30 .. "</b>";
		v29.Size = UDim2.fromScale(0.9, 0.063);
		v29.Position = UDim2.fromScale(0.5, 0.42);
		v29.AnchorPoint = Vector2.new(0.5, 0);
		v29.BackgroundTransparency = 1;
		v29.BorderSizePixel = 0;
		v29.Font = "Roboto";
		v29.TextScaled = true;
		v29.RichText = true;
		v29.TextColor3 = Color3.fromRGB(255, 255, 255);
		v27[v28 + 1] = v2.createElement("TextLabel", v29);
		local v31 = false;
		if p13.props.SelectedItem.amount > 1 then
			v31 = v2.createElement("TextLabel", {
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
		if v31 then
			v27[v28 + 2] = v31;
		end;
		local v32 = v25;
		if v32 ~= "" and v32 then
			local v33 = false;
			if v25 ~= " " then
				v33 = v2.createElement("TextLabel", {
					Text = "<b>" .. v25 .. "</b>", 
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
			v32 = v33;
		end;
		if v32 then
			v27[#v27 + 1] = v32;
		end;
		local v34 = #v27;
		v27[v34 + 1] = v2.createElement("TextLabel", {
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
			if v24 then
				local v35 = v2.createElement(l__Button__11, {
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
				local v36 = {};
				if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled then
					local v37 = " (A)";
				else
					v37 = "";
				end;
				v36.Text = "<b>Purchase" .. v37 .. "</b>";
				v36.Size = UDim2.fromScale(0.9, 0.075);
				v36.Position = UDim2.fromScale(0.5, 0.98);
				v36.AnchorPoint = Vector2.new(0.5, 1);
				v36.BackgroundColor3 = l__Theme__12.backgroundSuccess;
				v36.Selectable = false;
				function v36.OnClick()
					p13:purchase();
				end;
				v35 = v2.createElement(l__Button__11, v36);
			end;
		else
			v35 = v2.createElement(l__Button__11, {
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
		v27[v34 + 2] = v35;
		v26 = v2.createFragment(v27);
	end;
	local v38 = {};
	if v26 then
		v38[#v38 + 1] = v26;
	end;
	return v2.createElement("Frame", {
		Size = p13.props.Size, 
		Position = p13.props.Position, 
		BackgroundColor3 = l__Theme__12.backgroundSecondary, 
		BorderSizePixel = 0
	}, v38);
end;
return {
	BedwarsItemShopLeft = v4
};
