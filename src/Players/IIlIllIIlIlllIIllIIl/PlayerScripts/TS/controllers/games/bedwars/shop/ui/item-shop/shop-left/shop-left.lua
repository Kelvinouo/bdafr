-- Script Hash: 7be51f154187a359f5e4429a81dd4a86d276fdb28d8dc92719320b9db70b7d2e675fd662528de06e865141278a10731a
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
		local l__TeamUpgrades__5 = l__BedwarsShop__4.TeamUpgrades;
		local function v6(p12)
			return p12.items ~= nil;
		end;
		local v7 = {};
		local v8 = 0;
		for v9, v10 in ipairs(l__TeamUpgrades__5) do
			if v6(v10, v9 - 1, l__TeamUpgrades__5) == true then
				v8 = v8 + 1;
				v7[v8] = v10;
			end;
		end;
		if #v7 == 0 then
			p11(false);
		end;
		local v11, v12, v13 = ipairs(v7);
		while true do
			local v14, v15 = v11(v12, v13);
			if not v14 then
				break;
			end;
			local v16 = table.find(v15.items, p10.props.SelectedItem.itemType) ~= nil;
			local v17 = p10.props.store.Bedwars.teamUpgrades[v15.id];
			if v17 == nil then
				v17 = -1;
			end;
			if v17 >= 0 and nil then
				p11(false);
			elseif v17 == -1 and nil then
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
function v4.purchase(p13)
	local l__SelectedItem__18 = p13.props.SelectedItem;
	l__shopPurchaseItem__5(l__SelectedItem__18);
	if l__SelectedItem__18.nextTier then
		p13.props.SetSelectedShopItem(l__BedwarsShop__4.getShopItem(l__SelectedItem__18.nextTier, l__Players__6.LocalPlayer));
		return;
	end;
	if l__SelectedItem__18.tiered then
		p13:setState({
			alreadyPurchased = true
		});
		l__KnitClient__2.Controllers.BedwarsShopController.alreadyPurchasedMap[l__SelectedItem__18.itemType] = true;
	end;
end;
local l__InventoryUtil__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__getItemMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__ItemViewport__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__ItemUtil__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__Button__11 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Button;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v4.render(p14)
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
			local v19 = l__getItemMeta__8(p14.props.SelectedItem.itemType);
			local v20 = v19;
			if v20 ~= nil then
				v20 = v20.maxStackSize;
			end;
			if v20 ~= nil then
				local v21 = l__InventoryUtil__7.getToolFromInventory(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType);
				local v22 = v21;
				if v22 ~= nil then
					v22 = v22.amount;
				end;
				if v22 ~= nil and v19.maxStackSize <= v21.amount then
					u13 = true;
					u14 = "Max Amount";
				end;
			end;
		end;
	end;
	local v23 = p14.state.alreadyPurchased;
	if p14.props.SelectedItem and ((p14.props.SelectedItem.lockAfterPurchase or p14.props.SelectedItem.tiered) and l__Players__6.LocalPlayer and l__InventoryUtil__7.hasEnough(l__Players__6.LocalPlayer, p14.props.SelectedItem.itemType, 1)) then
		v23 = true;
	end;
	local v24 = p14.props.SelectedItem ~= nil;
	if v24 then
		local v25 = { v2.createElement(l__ItemViewport__9, {
				ItemType = p14.props.SelectedItem.itemType, 
				Size = UDim2.fromScale(0.32, 0.32), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.073), 
				AnchorPoint = Vector2.new(0.5, 0), 
				ShowCooldownBar = false
			}) };
		local v26 = #v25;
		local v27 = {};
		local v28 = p14.props.SelectedItem.customDisplayName;
		if v28 == nil then
			v28 = l__ItemUtil__10.getDisplayName(p14.props.SelectedItem.itemType);
		end;
		v27.Text = "<b>" .. v28 .. "</b>";
		v27.Size = UDim2.fromScale(0.9, 0.063);
		v27.Position = UDim2.fromScale(0.5, 0.42);
		v27.AnchorPoint = Vector2.new(0.5, 0);
		v27.BackgroundTransparency = 1;
		v27.BorderSizePixel = 0;
		v27.Font = "Roboto";
		v27.TextScaled = true;
		v27.RichText = true;
		v27.TextColor3 = Color3.fromRGB(255, 255, 255);
		v25[v26 + 1] = v2.createElement("TextLabel", v27);
		local v29 = false;
		if p14.props.SelectedItem.amount > 1 then
			v29 = v2.createElement("TextLabel", {
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
			}, { v2.createElement("UICorner", {
					CornerRadius = UDim.new(0.1, 0)
				}), v2.createElement("UIPadding", {
					PaddingTop = UDim.new(0.2), 
					PaddingBottom = UDim.new(0.2, 0)
				}) });
		end;
		if v29 then
			v25[v26 + 2] = v29;
		end;
		local v30 = #v25;
		v25[v30 + 1] = v2.createElement("TextLabel", {
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
			if v23 then
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
					p14:purchase();
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
		v25[v30 + 2] = v31;
		v24 = v2.createFragment(v25);
	end;
	local v34 = {};
	if v24 then
		v34[#v34 + 1] = v24;
	end;
	return v2.createElement("Frame", {
		Size = p14.props.Size, 
		Position = p14.props.Position, 
		BackgroundColor3 = l__Theme__12.backgroundSecondary, 
		BorderSizePixel = 0
	}, v34);
end;
return {
	BedwarsItemShopLeft = v4
};
