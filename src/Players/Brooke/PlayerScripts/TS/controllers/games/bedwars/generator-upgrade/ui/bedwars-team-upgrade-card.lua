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
		local v11, v12, v13 = ipairs(p5.props.store.Inventory.observedInventory.inventory.items);
		while true do
			v11(v12, v13);
			if not v11 then
				break;
			end;
			v13 = v11;
			local v14 = false;
			if v12.itemType == u6.currency then
				v14 = u6.price <= v12.amount;
			end;
			if v14 == true then
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
	local v15 = p6.props.store.Bedwars.teamUpgrades[p6.props.Upgrade.id];
	if v15 == nil then
		v15 = -1;
	end;
	local v16 = v15 + 1;
	local v17 = p6.props.Upgrade.tiers;
	if v17 ~= nil then
		v17 = v17[v16 + 1];
	end;
	local v18 = false;
	if v17 then
		local u12 = p6.props.Upgrade.tiers[v16 + 1];
		local v19 = nil;
		local v20, v21, v22 = ipairs(p6.props.store.Inventory.observedInventory.inventory.items);
		while true do
			v20(v21, v22);
			if not v20 then
				break;
			end;
			v22 = v20;
			local v23 = false;
			if v21.itemType == u12.currency then
				v23 = u12.price <= v21.amount;
			end;
			if v23 == true then
				v19 = v21;
				break;
			end;		
		end;
		if u12.disabledInQueue ~= nil then
			local v24 = nil;
			local v25, v26, v27 = ipairs(u12.disabledInQueue);
			while true do
				v25(v26, v27);
				if not v25 then
					break;
				end;
				v27 = v25;
				if v26 == p6.props.store.Game.queueType == true then
					v24 = v26;
					break;
				end;			
			end;
			local v28 = v24 ~= nil;
		else
			v28 = false;
		end;
		v18 = v28;
	end;
	local v29 = "";
	local v30 = 0;
	local v31 = false;
	while true do
		if v31 then
			v30 = v30 + 1;
		else
			v31 = true;
		end;
		if not (v30 < 4) then
			break;
		end;
		local v32 = p6.props.Upgrade.tiers;
		if v32 ~= nil then
			v32 = v32[v30 + 1];
		end;
		if v32 then
			if v30 <= v15 then
				v29 = v29 .. "<font color=\"#ffffff\"><b>" .. v32.name .. "</b></font><br/>";
			else
				v29 = v29 .. v32.name .. "<br/>";
			end;
		else
			v29 = v29 .. "<br/>";
		end;	
	end;
	local v33 = {
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
	local v34 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.01, 0)
		}) };
	local v35 = #v34;
	local v36 = {};
	local v37 = p6.props.AspectRatio;
	if v37 == nil then
		v37 = 0.8275862068965517;
	end;
	v36.AspectRatio = v37;
	v36.DominantAxis = "Height";
	v34[v35 + 1] = v3.createElement("UIAspectRatioConstraint", v36);
	v34[v35 + 2] = v3.createElement("Frame", {
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
	v34[v35 + 3] = v3.createElement("ImageLabel", {
		Image = p6.props.Upgrade.image, 
		Size = UDim2.fromScale(0.18, 0.18), 
		SizeConstraint = "RelativeYY", 
		Position = UDim2.fromScale(0.5, 0.182), 
		AnchorPoint = Vector2.new(0.5, 0), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	});
	v34[v35 + 4] = v3.createElement("TextLabel", {
		Text = v29, 
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
	local v38 = false;
	if v17 ~= nil then
		v38 = v3.createElement("TextLabel", {
			Text = "<b>" .. tostring(v17.price) .. " " .. l__ItemUtil__9.getDisplayName(v17.currency) .. "</b>", 
			Size = UDim2.fromScale(0.9, 0.06), 
			Position = UDim2.fromScale(0.5, 0.78), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Font = "Roboto", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__getItemMeta__10(v17.currency).displayNameColor or Color3.fromRGB(255, 255, 255)
		});
	end;
	if v38 then
		v34[v35 + 5] = v38;
	end;
	if v17 ~= nil and not v18 then
		if true then
			local v39 = {
				Size = UDim2.fromScale(0.92, 0.125), 
				Position = UDim2.fromScale(0.5, 0.855), 
				AnchorPoint = Vector2.new(0.5, 0), 
				BackgroundColor3 = l__Theme__7.backgroundSuccess
			};
			local v40 = p6.props.ButtonTextOverride;
			if v40 == nil then
				v40 = "<b>Purchase Upgrade</b>";
			end;
			v39.Text = v40;
			v39.Selectable = false;
			function v39.OnClick()
				p6:purchase();
			end;
			v39[v3.Event.MouseButton2Click] = function()
				p6:purchase();
			end;
			local v41 = v3.createElement(l__Button__11, v39);
		else
			v41 = v3.createElement(l__Button__11, {
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
		local v42 = v41;
	else
		v42 = v3.createElement(l__Button__11, {
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
	v34[#v34 + 1] = v42;
	return v3.createElement("ImageButton", v33, v34);
end;
return {
	BedwarsTeamUpgradeCard = v4
};
