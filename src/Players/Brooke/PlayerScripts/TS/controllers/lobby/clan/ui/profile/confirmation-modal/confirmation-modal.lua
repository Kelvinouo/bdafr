-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__UserInputService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).UserInputService;
local l__UIUtil__3 = v2.UIUtil;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__6 = v2.ColorUtil;
local l__Empty__7 = v2.Empty;
local l__SoundManager__8 = v2.SoundManager;
local l__GameSound__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__10 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ButtonComponent__12 = v2.ButtonComponent;
return {
	ConfirmationModal = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local u13 = u1.createRef();
		p2.useEffect(function()
			if l__UserInputService__2.GamepadEnabled then
				l__UIUtil__3:selectGui(u13:getValue());
			end;
		end, {});
		local v5 = {};
		if l__DeviceUtil__4.isSmallScreen() then
			local v6 = 0.5;
		else
			v6 = 0.3;
		end;
		v5.Size = UDim2.new(v6, 0, 0, 300);
		v5.AutomaticSize = "Y";
		v5.Position = UDim2.fromScale(0.5, 0.5);
		v5.AnchorPoint = Vector2.new(0.5, 0.5);
		v5.BackgroundColor3 = l__Theme__5.backgroundPrimary;
		v5.BorderSizePixel = 0;
		v5.Selectable = false;
		v5.AutoButtonColor = false;
		v5.Active = true;
		v5.Modal = true;
		local v7 = {};
		local v8 = {
			PaddingTop = UDim.new(0.08, 0), 
			PaddingBottom = UDim.new(0.08, 0)
		};
		if l__DeviceUtil__4.isSmallScreen() then
			local v9 = 0.08;
		else
			v9 = 0.05;
		end;
		v8.PaddingLeft = UDim.new(v9, 0);
		if l__DeviceUtil__4.isSmallScreen() then
			local v10 = 0.08;
		else
			v10 = 0.05;
		end;
		v8.PaddingRight = UDim.new(v10, 0);
		v7[1] = u1.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		});
		v7[2] = u1.createElement("UIPadding", v8);
		local v11 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder", 
				HorizontalAlignment = "Center"
			}), u1.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 24), 
				AutomaticSize = "XY", 
				SizeConstraint = "RelativeXY", 
				Text = "<b>" .. p1.Title .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__6.WHITE, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 24
				}) }) };
		local v12 = false;
		if p1.Body ~= nil then
			v12 = u1.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 36), 
				AutomaticSize = "Y", 
				Text = p1.Body, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__6.WHITE, 
				BackgroundTransparency = 1, 
				TextXAlignment = "Center", 
				TextTransparency = 0.3, 
				LayoutOrder = 1
			}, { u1.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) });
		end;
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		v7[#v7 + 1] = u1.createElement(l__Empty__7, {
			Size = UDim2.new(1, 0, 0, 50), 
			AutomaticSize = "Y"
		}, v11);
		local v13 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.05, 0), 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v14 = {
			TextSize = 18, 
			Size = UDim2.new(0.3, 0, 0, 40), 
			Text = "Cancel", 
			BackgroundColor3 = l__Theme__5.backgroundPrimary
		};
		function v14.OnClick()
			l__SoundManager__8:playSound(l__GameSound__9.UI_CLICK);
			p1.OnSecondaryBtnClick();
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__11.CONFIRMATION_MODAL);
		end;
		v14.Selectable = true;
		v14.LayoutOrder = 1;
		v14[u1.Ref] = u13;
		local l__SecondaryBtnProps__15 = p1.SecondaryBtnProps;
		if l__SecondaryBtnProps__15 then
			for v16, v17 in pairs(l__SecondaryBtnProps__15) do
				v14[v16] = v17;
			end;
		end;
		v13.SecondaryButton = u1.createElement(l__ButtonComponent__12, v14);
		local v18 = {
			TextSize = 18, 
			Size = UDim2.new(0.3, 0, 0, 40), 
			Text = "Accept", 
			BackgroundColor3 = l__Theme__5.backgroundSuccess
		};
		function v18.OnClick()
			l__SoundManager__8:playSound(l__GameSound__9.UI_CLICK);
			p1.OnPrimaryBtnClick(v4);
			l__Flamework__10.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__11.CONFIRMATION_MODAL);
		end;
		v18.Loading = v3;
		v18.Selectable = true;
		v18.LayoutOrder = 2;
		local l__PrimaryBtnProps__19 = p1.PrimaryBtnProps;
		if l__PrimaryBtnProps__19 then
			for v20, v21 in pairs(l__PrimaryBtnProps__19) do
				v18[v20] = v21;
			end;
		end;
		v13.PrimaryButton = u1.createElement(l__ButtonComponent__12, v18);
		v7.ActionButtons = u1.createElement(l__Empty__7, {
			Position = UDim2.fromScale(0.5, 1), 
			AnchorPoint = Vector2.new(0.5, 1), 
			Size = UDim2.new(1, 0, 0, 40), 
			LayoutOrder = 4
		}, v13);
		return u1.createElement("ImageButton", v5, v7);
	end)
};
