-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__4 = v2.ColorUtil;
local l__Empty__5 = v2.Empty;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ButtonComponent__10 = v2.ButtonComponent;
return {
	ConfirmationModal = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local v5 = {};
		if l__DeviceUtil__1.isSmallScreen() then
			local v6 = 0.5;
		else
			v6 = 0.3;
		end;
		v5.Size = UDim2.new(v6, 0, 0, 300);
		v5.AutomaticSize = "Y";
		v5.Position = UDim2.fromScale(0.5, 0.5);
		v5.AnchorPoint = Vector2.new(0.5, 0.5);
		v5.BackgroundColor3 = l__Theme__2.backgroundPrimary;
		v5.BorderSizePixel = 0;
		local v7 = {};
		local v8 = {
			PaddingTop = UDim.new(0.08, 0), 
			PaddingBottom = UDim.new(0.08, 0)
		};
		if l__DeviceUtil__1.isSmallScreen() then
			local v9 = 0.08;
		else
			v9 = 0.05;
		end;
		v8.PaddingLeft = UDim.new(v9, 0);
		if l__DeviceUtil__1.isSmallScreen() then
			local v10 = 0.08;
		else
			v10 = 0.05;
		end;
		v8.PaddingRight = UDim.new(v10, 0);
		v7[1] = u3.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		});
		v7[2] = u3.createElement("UIPadding", v8);
		local v11 = { u3.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder", 
				HorizontalAlignment = "Center"
			}), u3.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 24), 
				AutomaticSize = "XY", 
				SizeConstraint = "RelativeXY", 
				Text = "<b>" .. p1.Title .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__4.WHITE, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 24
				}) }) };
		local v12 = false;
		if p1.Body ~= nil then
			v12 = u3.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 36), 
				AutomaticSize = "Y", 
				Text = p1.Body, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__4.WHITE, 
				BackgroundTransparency = 1, 
				TextXAlignment = "Center", 
				TextTransparency = 0.3, 
				LayoutOrder = 1
			}, { u3.createElement("UITextSizeConstraint", {
					MaxTextSize = 18
				}) });
		end;
		if v12 then
			v11[#v11 + 1] = v12;
		end;
		v7[#v7 + 1] = u3.createElement(l__Empty__5, {
			Size = UDim2.new(1, 0, 0, 50), 
			AutomaticSize = "Y"
		}, v11);
		local v13 = { u3.createElement("UIListLayout", {
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
			BackgroundColor3 = l__Theme__2.backgroundPrimary
		};
		function v14.OnClick()
			l__SoundManager__6:playSound(l__GameSound__7.UI_CLICK);
			p1.OnSecondaryBtnClick();
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__9.CONFIRMATION_MODAL);
		end;
		v14.LayoutOrder = 1;
		local l__SecondaryBtnProps__15 = p1.SecondaryBtnProps;
		if l__SecondaryBtnProps__15 then
			for v16, v17 in pairs(l__SecondaryBtnProps__15) do
				v14[v16] = v17;
			end;
		end;
		v13.SecondaryButton = u3.createElement(l__ButtonComponent__10, v14);
		local v18 = {
			TextSize = 18, 
			Size = UDim2.new(0.3, 0, 0, 40), 
			Text = "Accept", 
			BackgroundColor3 = l__Theme__2.backgroundSuccess
		};
		function v18.OnClick()
			l__SoundManager__6:playSound(l__GameSound__7.UI_CLICK);
			p1.OnPrimaryBtnClick(v4);
			l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(l__BedwarsAppIds__9.CONFIRMATION_MODAL);
		end;
		v18.Loading = v3;
		v18.LayoutOrder = 2;
		local l__PrimaryBtnProps__19 = p1.PrimaryBtnProps;
		if l__PrimaryBtnProps__19 then
			for v20, v21 in pairs(l__PrimaryBtnProps__19) do
				v18[v20] = v21;
			end;
		end;
		v13.PrimaryButton = u3.createElement(l__ButtonComponent__10, v18);
		v7.ActionButtons = u3.createElement(l__Empty__5, {
			Position = UDim2.fromScale(0.5, 1), 
			AnchorPoint = Vector2.new(0.5, 1), 
			Size = UDim2.new(1, 0, 0, 40), 
			LayoutOrder = 4
		}, v13);
		return u3.createElement("Frame", v5, v7);
	end)
};
