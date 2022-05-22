-- Script Hash: e4d01e1e9107824a4c252c925653ee2fc602c98051585056b68232930d08bb13f3e143a8698449391a27f1a119b271bb
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("BedwarsItemShopLeft");
local l__Maid__1 = v2.Maid;
local l__KnitClient__2 = v2.KnitClient;
function v5.init(p1, p2)
	p1.maid = l__Maid__1.new();
	p1:setState({
		alreadyPurchased = p2.SelectedItem ~= nil and l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[p2.SelectedItem.itemType] ~= nil
	});
end;
function v5.didUpdate(p3, p4, p5)
	if p4.SelectedItem ~= p3.props.SelectedItem then
		p3:setState({
			alreadyPurchased = p3.props.SelectedItem ~= nil and l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[p3.props.SelectedItem.itemType] ~= nil
		});
	end;
end;
local l__UserInputService__3 = v4.UserInputService;
function v5.didMount(p6)
	if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled then
		p6.maid:GiveTask(l__UserInputService__3.InputBegan:Connect(function(p7, p8)
			if p7.KeyCode == Enum.KeyCode.ButtonA then
				p6:purchase();
			end;
		end));
	end;
end;
function v5.willUnmount(p9)
	p9.maid:DoCleaning();
end;
local l__BedwarsShop__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
v5.checkIsLockedItem = v1.async(function(p10)
	return v1.Promise.new(function(p11)
		if p10.props.SelectedItem == nil then
			p11(false);
		end;
		local l__TeamUpgrades__6 = l__BedwarsShop__4.TeamUpgrades;
		local function v7(p12)
			return p12.items ~= nil;
		end;
		local v8 = {};
		local v9 = 0;
		for v10, v11 in ipairs(l__TeamUpgrades__6) do
			if v7(v11, v10 - 1, l__TeamUpgrades__6) == true then
				v9 = v9 + 1;
				v8[v9] = v11;
			end;
		end;
		if #v8 == 0 then
			p11(false);
		end;
		local v12, v13, v14 = ipairs(v8);
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
local l__Players__6 = v4.Players;
function v5.purchase(p13)
	local l__SelectedItem__19 = p13.props.SelectedItem;
	l__shopPurchaseItem__5(l__SelectedItem__19);
	if l__SelectedItem__19.nextTier then
		p13.props.SetSelectedShopItem(l__BedwarsShop__4.getShopItem(l__SelectedItem__19.nextTier, l__Players__6.LocalPlayer));
		return;
	end;
	if l__SelectedItem__19.tiered then
		p13:setState({
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
function v5.render(p14)
	if p14.props.SelectedItem and l__Players__6.LocalPlayer then
		local u13 = false;
		local u14 = "LOCKED";
		p14:checkIsLockedItem():andThen(function(p15)
			if p15 then
				u13 = true;
				u14 = "Locked";
				return;
			end;
			if not l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p14.props.SelectedItem.currency, p14.props.SelectedItem.price) then
				u13 = true;
				u14 = "Not Enough";
			end;
		end);
		if not u13 then
			local v20 = l__getItemMeta__8(p14.props.SelectedItem.itemType);
			local v21 = v20;
			if v21 ~= nil then
				v21 = v21.maxStackSize;
			end;
			if v21 ~= nil then
				local v22 = l__InventoryUtil__7.getToolFromInventory(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType);
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
	local v24 = p14.state.alreadyPurchased;
	if p14.props.SelectedItem and ((p14.props.SelectedItem.lockAfterPurchase or p14.props.SelectedItem.tiered) and l__Players__6.LocalPlayer and l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType, 1)) then
		v24 = true;
	end;
	local v25 = p14.props.SelectedItem ~= nil;
	if v25 then
		local v26 = { v3.createElement(l__ItemViewport__9, {
				ItemType = p14.props.SelectedItem.itemType, 
				Size = UDim2.fromScale(0.32, 0.32), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.073), 
				AnchorPoint = Vector2.new(0.5, 0), 
				ShowCooldownBar = false
			}) };
		local v27 = #v26;
		local v28 = {};
		local v29 = p14.props.SelectedItem.customDisplayName;
		if v29 == nil then
			v29 = l__ItemUtil__10.getDisplayName(p14.props.SelectedItem.itemType);
		end;
		v28.Text = "<b>" .. v29 .. "</b>";
		v28.Size = UDim2.fromScale(0.9, 0.063);
		v28.Position = UDim2.fromScale(0.5, 0.42);
		v28.AnchorPoint = Vector2.new(0.5, 0);
		v28.BackgroundTransparency = 1;
		v28.BorderSizePixel = 0;
		v28.Font = "Roboto";
		v28.TextScaled = true;
		v28.RichText = true;
		v28.TextColor3 = Color3.fromRGB(255, 255, 255);
		v26[v27 + 1] = v3.createElement("TextLabel", v28);
		local v30 = false;
		if p14.props.SelectedItem.amount > 1 then
			v30 = v3.createElement("TextLabel", {
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
		if v30 then
			v26[v27 + 2] = v30;
		end;
		local v31 = #v26;
		v26[v31 + 1] = v3.createElement("TextLabel", {
			Text = "<b>" .. tostring(p14.props.SelectedItem.price) .. " " .. l__ItemUtil__10.getDisplayName(p14.props.SelectedItem.currency) .. "</b>", 
			Size = UDim2.fromScale(0.9, 0.038), 
			Position = UDim2.fromScale(0.5, 0.894), 
			AnchorPoint = Vector2.new(0.5, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__getItemMeta__8(p14.props.SelectedItem.currency).displayNameColor or Color3.fromRGB(255, 255, 255)
		});
		if not false then
			if v24 then
				local v32 = v3.createElement(l__Button__11, {
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
				local v33 = {};
				if l__UserInputService__3.GamepadEnabled and not l__UserInputService__3.MouseEnabled then
					local v34 = " (A)";
				else
					v34 = "";
				end;
				v33.Text = "<b>Purchase" .. v34 .. "</b>";
				v33.Size = UDim2.fromScale(0.9, 0.075);
				v33.Position = UDim2.fromScale(0.5, 0.98);
				v33.AnchorPoint = Vector2.new(0.5, 1);
				v33.BackgroundColor3 = l__Theme__12.backgroundSuccess;
				v33.Selectable = false;
				function v33.OnClick()
					p14:purchase();
				end;
				v32 = v3.createElement(l__Button__11, v33);
			end;
		else
			v32 = v3.createElement(l__Button__11, {
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
		v26[v31 + 2] = v32;
		v25 = v3.createFragment(v26);
	end;
	local v35 = {};
	if v25 then
		v35[#v35 + 1] = v25;
	end;
	return v3.createElement("Frame", {
		Size = p14.props.Size, 
		Position = p14.props.Position, 
		BackgroundColor3 = l__Theme__12.backgroundSecondary, 
		BorderSizePixel = 0
	}, v35);
end;
return {
	BedwarsItemShopLeft = v5
};
