-- Script Hash: 0bfab5a26bdeef658361de6a8c03ea9a20822c37d458cdbfa448318369bf09b3f8988db1a514594dc399478b2d186405
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__KitSkinCard__3 = v1.import(script, script.Parent, "kit-skin-card").KitSkinCard;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__BedwarsKitSkin__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__AutoCanvasScrollingFrame__6 = v2.AutoCanvasScrollingFrame;
local l__Empty__7 = v2.Empty;
return {
	KitSkinList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Bottom", 
				Padding = UDim.new(0.03, 0)
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.17), 
				Text = "<b>Skins:</b>", 
				RichText = true, 
				TextScaled = true, 
				TextColor3 = l__ColorUtil__2.WHITE, 
				TextXAlignment = "Left", 
				Font = "Roboto", 
				BackgroundTransparency = 1
			}) };
		local l__Skins__5 = p1.Skins;
		local function v6(p3)
			return u1.createElement(l__KitSkinCard__3, {
				Kit = p1.Kit, 
				Skin = p3, 
				SelectedSkin = p1.SelectedSkin, 
				SetSelectedSkin = p1.SetSelectedSkin, 
				store = p1.store
			});
		end;
		local v7 = table.create(#l__Skins__5);
		for v8, v9 in ipairs(l__Skins__5) do
			v7[v8] = v6(v9, v8 - 1, l__Skins__5);
		end;
		local v10 = {
			AdditionalSpace = 10, 
			ScrollingFrameProps = {
				Size = UDim2.fromScale(1, 0.7999999999999999), 
				CanvasSize = UDim2.fromScale(0, 0.7999999999999999), 
				ScrollingDirection = Enum.ScrollingDirection.X, 
				AutomaticCanvasSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1
			}
		};
		local v11 = {};
		local v12 = {
			PaddingLeft = UDim.new(0.01, 0)
		};
		if l__DeviceUtil__4.isSmallScreen() then
			local v13 = 0.02;
		else
			v13 = 0.01;
		end;
		v12.PaddingTop = UDim.new(v13, 0);
		v11[1] = u1.createElement("UIPadding", v12);
		v11[2] = u1.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Left", 
			VerticalAlignment = "Top", 
			Padding = UDim.new(0.03, 0)
		});
		v11[3] = u1.createElement(l__KitSkinCard__3, {
			Kit = p1.Kit, 
			Skin = l__BedwarsKitSkin__5.DEFAULT, 
			SelectedSkin = p1.SelectedSkin, 
			SetSelectedSkin = p1.SetSelectedSkin, 
			store = p1.store
		});
		local v14 = #v11;
		for v15, v16 in ipairs(v7) do
			v11[v14 + v15] = v16;
		end;
		v4[#v4 + 1] = u1.createElement(l__AutoCanvasScrollingFrame__6, v10, v11);
		return u1.createElement(l__Empty__7, {
			Size = p1.Size, 
			LayoutOrder = 0
		}, v4);
	end)
};
