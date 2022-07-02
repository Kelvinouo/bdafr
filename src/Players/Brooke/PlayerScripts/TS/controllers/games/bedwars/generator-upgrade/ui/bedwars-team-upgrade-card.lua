-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BedwarsTeamUpgradeCard");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v4.init(p1)
	p1.ref = v3.createRef();
	p1.maid = u1.new();
end;
local l__UserInputService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__UIUtil__3 = v2.UIUtil;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
function v4.didMount(p2)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		local v5 = p2.ref:getValue();
		if v5 then
			l__UIUtil__3:selectGui(v5);
			p2.maid:GiveTask(v5.MouseButton1Down:Connect(function()
				if p2:hasEnough() then
					p2:purchase();
					return;
				end;
				l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
			end));
		end;
	end;
end;
function v4.willUnmount(p3)
	p3.maid:DoCleaning();
end;
function v4.purchase(p4)
	p4.props.Purchased();
end;
function v4.hasEnough(p5)
	local v6 = p5.props.store.Bedwars.teamUpgrades[p5.props.Upgrade.id];
	if v6 == nil then
		v6 = -1;
	end;
	local v7 = v6 + 1;
	local v8 = p5.props.Upgrade.tiers;
	if v8 ~= nil then
		v8 = v8[v7 + 1];
	end;
	local v9 = true;
	if v8 then
		local u6 = p5.props.Upgrade.tiers[v7 + 1];
		local v10 = nil;
		for v11, v12 in ipairs(p5.props.store.Inventory.observedInventory.inventory.items) do
			local v13 = false;
			if v12.itemType == u6.currency then
				v13 = u6.price <= v12.amount;
			end;
			if v13 == true then
				v10 = v12;
				break;
			end;
		end;
		v9 = v10 ~= nil;
	end;
	return v9;
end;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__8 = v2.ColorUtil;
local l__ItemUtil__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Button__11 = v2.Button;
function v4.render(p6)
	local v14 = p6.props.store.Bedwars.teamUpgrades[p6.props.Upgrade.id];
	if v14 == nil then
		v14 = -1;
	end;
	local v15 = v14 + 1;
	local v16 = p6.props.Upgrade.tiers;
	if v16 ~= nil then
		v16 = v16[v15 + 1];
	end;
	local v17 = true;
	if v16 then
		local u12 = p6.props.Upgrade.tiers[v15 + 1];
		local v18 = nil;
		for v19, v20 in ipairs(p6.props.store.Inventory.observedInventory.inventory.items) do
			local v21 = false;
			if v20.itemType == u12.currency then
				v21 = u12.price <= v20.amount;
			end;
			if v21 == true then
				v18 = v20;
				break;
			end;
		end;
		v17 = v18 ~= nil;
	end;
	local v22 = "";
	local v23 = 0;
	local v24 = false;
	while true do
		if v24 then
			v23 = v23 + 1;
		else
			v24 = true;
		end;
		if not (v23 < 4) then
			break;
		end;
		local v25 = p6.props.Upgrade.tiers;
		if v25 ~= nil then
			v25 = v25[v23 + 1];
		end;
		if v25 then
			if v23 <= v14 then
				v22 = v22 .. "<font color=\"#ffffff\"><b>" .. v25.name .. "</b></font><br/>";
			else
				v22 = v22 .. v25.name .. "<br/>";
			end;
		else
			v22 = v22 .. "<br/>";
		end;	
	end;
	local v26 = {
		[v3.Ref] = p6.ref, 
		Size = p6.props.Size or UDim2.fromScale(0.2, 1), 
		Position = UDim2.fromScale(0.5, 0.15), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundColor3 = l__Theme__7.backgroundPrimary, 
		BorderSizePixel = 0, 
		LayoutOrder = p6.props.LayoutOrder, 
		AutoButtonColor = false, 
		Selectable = true, 
		Modal = true
	};
	local v27 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.01, 0)
		}) };
	local v28 = #v27;
	local v29 = {};
	local v30 = p6.props.AspectRatio;
	if v30 == nil then
		v30 = 0.8275862068965517;
	end;
	v29.AspectRatio = v30;
	v29.DominantAxis = "Height";
	v27[v28 + 1] = v3.createElement("UIAspectRatioConstraint", v29);
	v27[v28 + 2] = v3.createElement("Frame", {
		Size = UDim2.fromScale(0.95, 0.12), 
		Position = UDim2.fromScale(0.5, 0.015), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__7.backgroundSecondary
	}, { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.01, 0)
		}), v3.createElement("TextLabel", {
			Text = "<b>" .. p6.props.Upgrade.name .. "</b>", 
			Size = UDim2.fromScale(0.95, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextScaled = true, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			RichText = true, 
			Font = "Roboto"
		}) });
	v27[v28 + 3] = v3.createElement("ImageLabel", {
		Image = p6.props.Upgrade.image, 
		Size = UDim2.fromScale(0.18, 0.18), 
		SizeConstraint = "RelativeYY", 
		Position = UDim2.fromScale(0.5, 0.182), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	});
	v27[v28 + 4] = v3.createElement("TextLabel", {
		Text = v22, 
		Size = UDim2.fromScale(0.94, 0.325), 
		Position = UDim2.fromScale(0.5, 0.42), 
		AnchorPoint = Vector2.new(0.5, 0), 
		TextColor3 = l__ColorUtil__8.hexColor(13948390), 
		TextScaled = true, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 1, 
		RichText = true, 
		Font = "Roboto", 
		TextXAlignment = "Center", 
		TextYAlignment = "Top"
	});
	local v31 = false;
	if v16 ~= nil then
		v31 = v3.createElement("TextLabel", {
			Text = "<b>" .. tostring(v16.price) .. " " .. l__ItemUtil__9.getDisplayName(v16.currency) .. "</b>", 
			Size = UDim2.fromScale(0.9, 0.06), 
			Position = UDim2.fromScale(0.5, 0.78), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__getItemMeta__10(v16.currency).displayNameColor or Color3.fromRGB(255, 255, 255)
		});
	end;
	if v31 then
		v27[v28 + 5] = v31;
	end;
	if v16 ~= nil then
		if v17 then
			local v32 = {
				Size = UDim2.fromScale(0.92, 0.125), 
				Position = UDim2.fromScale(0.5, 0.855), 
				AnchorPoint = Vector2.new(0.5, 0), 
				BackgroundColor3 = l__Theme__7.backgroundSuccess
			};
			local v33 = p6.props.ButtonTextOverride;
			if v33 == nil then
				v33 = "<b>Purchase Upgrade</b>";
			end;
			v32.Text = v33;
			v32.Selectable = false;
			function v32.OnClick()
				p6:purchase();
			end;
			v32[v3.Event.MouseButton2Click] = function()
				p6:purchase();
			end;
			local v34 = v3.createElement(l__Button__11, v32);
		else
			v34 = v3.createElement(l__Button__11, {
				Size = UDim2.fromScale(0.92, 0.125), 
				Position = UDim2.fromScale(0.5, 0.855), 
				AnchorPoint = Vector2.new(0.5, 0), 
				BackgroundColor3 = l__Theme__7.backgroundError, 
				Text = "<b>Not Enough Items</b>", 
				Selectable = false, 
				OnClick = function()
					l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
				end
			});
		end;
		local v35 = v34;
	else
		v35 = v3.createElement(l__Button__11, {
			Size = UDim2.fromScale(0.92, 0.125), 
			Position = UDim2.fromScale(0.5, 0.855), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundColor3 = l__Theme__7.backgroundError, 
			Text = "<b>Max Level</b>", 
			Selectable = false, 
			OnClick = function()
				l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
			end
		});
	end;
	v27[#v27 + 1] = v35;
	return v3.createElement("ImageButton", v26, v27);
end;
return {
	BedwarsTeamUpgradeCard = v4
};
