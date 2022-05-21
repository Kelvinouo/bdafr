-- Script Hash: c2c05b1b6486e4e6496b8e8223f6809ed893c49bb5390e5627f396dbcc8ad1c6d90cbecb387f868a095974476fa8c418
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__KnitClient__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__UIUtil__4 = v2.UIUtil;
local l__InventoryUtil__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local l__Players__6 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ColorUtil__7 = v2.ColorUtil;
local l__Button__8 = v2.Button;
local l__StringUtil__9 = v2.StringUtil;
local l__getItemMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local l__Empty__11 = v2.Empty;
return {
	EnchantActionButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local u12 = u2.createRef();
		p2.useEffect(function()
			if l__DeviceUtil__3.isGamepadControls() then
				l__UIUtil__4:selectGui((u12:getValue()));
			end;
		end, {});
		local l__ResearchData__3 = p1.ResearchData;
		local v4 = l__ResearchData__3[2];
		local v5 = "<b>" .. v4.name .. "</b>";
		if l__DeviceUtil__3.isHoarceKat() then
			local v6 = true;
		else
			v6 = l__InventoryUtil__5.hasEnough(l__Players__6.LocalPlayer, v4.currency, v4.price);
		end;
		if not v6 then
			v5 = "<b>Not Enough</b>";
		end;
		local v7 = {
			Size = UDim2.fromScale(0.45, 1)
		};
		local v8 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.1, 0)
			}) };
		local v9 = #v8;
		local v10 = {
			[u2.Ref] = u12, 
			Size = UDim2.fromScale(1, 0.6), 
			Text = v5
		};
		local function u13(p3)
			task.spawn(function()
				l__KnitClient__1.Controllers.EnchantTableController:researchEnchant(p3);
			end);
		end;
		local u14 = l__ResearchData__3[1];
		function v10.OnClick()
			if not v6 then
				return nil;
			end;
			u13(u14);
		end;
		if v6 then
			local v11 = v4.buttonColor;
		else
			v11 = l__ColorUtil__7.darken(v4.buttonColor, 0.2);
		end;
		v10.BackgroundColor3 = v11;
		v10.Selectable = true;
		local v12 = {};
		local v13 = v6 and u2.createElement("UIGradient", {
			Rotation = 90, 
			Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l__ColorUtil__7.brighten(v4.buttonColor, 0.9)), ColorSequenceKeypoint.new(1, l__ColorUtil__7.darken(v4.buttonColor, 0.9)) })
		});
		if v13 then
			v12[#v12 + 1] = v13;
		end;
		v12[#v12 + 1] = u2.createElement("UIStroke", {
			Color = l__ColorUtil__7.brighten(v4.buttonColor, 0.1), 
			Thickness = 2
		});
		v8[v9 + 1] = u2.createElement(l__Button__8, v10, v12);
		v8[v9 + 2] = u2.createElement("TextLabel", {
			Size = UDim2.fromScale(1, 0.3), 
			Text = "<b>" .. tostring(v4.price) .. " " .. l__StringUtil__9.capitalizeFirstLetter(v4.currency) .. "</b>", 
			TextColor3 = l__getItemMeta__10(v4.currency).displayNameColor, 
			TextScaled = true, 
			TextXAlignment = "Center", 
			TextYAlignment = "Center", 
			RichText = true, 
			BackgroundTransparency = 1
		}, { u2.createElement("UITextSizeConstraint", {
				MaxTextSize = 13
			}) });
		return u2.createElement(l__Empty__11, v7, v8);
	end)
};
