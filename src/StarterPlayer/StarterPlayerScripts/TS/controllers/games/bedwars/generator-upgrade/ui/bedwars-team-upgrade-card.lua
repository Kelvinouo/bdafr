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
	local v17 = false;
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
		if u12.disabledInQueue ~= nil then
			local v22 = nil;
			for v23, v24 in ipairs(u12.disabledInQueue) do
				if v24 == p6.props.store.Game.queueType == true then
					v22 = v24;
					break;
				end;
			end;
			local v25 = v22 ~= nil;
		else
			v25 = false;
		end;
		v17 = v25;
	end;
	local v26 = "";
	local v27 = 0;
	local v28 = false;
	while true do
		if v28 then
			v27 = v27 + 1;
		else
			v28 = true;
		end;
		if not (v27 < 4) then
			break;
		end;
		local v29 = p6.props.Upgrade.tiers;
		if v29 ~= nil then
			v29 = v29[v27 + 1];
		end;
		if v29 then
			if v27 <= v14 then
				v26 = v26 .. "<font color=\"#ffffff\"><b>" .. v29.name .. "</b></font><br/>";
			else
				v26 = v26 .. v29.name .. "<br/>";
			end;
		else
			v26 = v26 .. "<br/>";
		end;	
	end;
	local v30 = {
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
	local v31 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.01, 0)
		}) };
	local v32 = #v31;
	local v33 = {};
	local v34 = p6.props.AspectRatio;
	if v34 == nil then
		v34 = 0.8275862068965517;
	end;
	v33.AspectRatio = v34;
	v33.DominantAxis = "Height";
	v31[v32 + 1] = v3.createElement("UIAspectRatioConstraint", v33);
	v31[v32 + 2] = v3.createElement("Frame", {
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
	v31[v32 + 3] = v3.createElement("ImageLabel", {
		Image = p6.props.Upgrade.image, 
		Size = UDim2.fromScale(0.18, 0.18), 
		SizeConstraint = "RelativeYY", 
		Position = UDim2.fromScale(0.5, 0.182), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	});
	v31[v32 + 4] = v3.createElement("TextLabel", {
		Text = v26, 
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
	local v35 = false;
	if v16 ~= nil then
		v35 = v3.createElement("TextLabel", {
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
	if v35 then
		v31[v32 + 5] = v35;
	end;
	if v16 ~= nil and not v17 then
		if true then
			local v36 = {
				Size = UDim2.fromScale(0.92, 0.125), 
				Position = UDim2.fromScale(0.5, 0.855), 
				AnchorPoint = Vector2.new(0.5, 0), 
				BackgroundColor3 = l__Theme__7.backgroundSuccess
			};
			local v37 = p6.props.ButtonTextOverride;
			if v37 == nil then
				v37 = "<b>Purchase Upgrade</b>";
			end;
			v36.Text = v37;
			v36.Selectable = false;
			function v36.OnClick()
				p6:purchase();
			end;
			v36[v3.Event.MouseButton2Click] = function()
				p6:purchase();
			end;
			local v38 = v3.createElement(l__Button__11, v36);
		else
			v38 = v3.createElement(l__Button__11, {
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
		local v39 = v38;
	else
		v39 = v3.createElement(l__Button__11, {
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
	v31[#v31 + 1] = v39;
	return v3.createElement("ImageButton", v30, v31);
end;
return {
	BedwarsTeamUpgradeCard = v4
};
