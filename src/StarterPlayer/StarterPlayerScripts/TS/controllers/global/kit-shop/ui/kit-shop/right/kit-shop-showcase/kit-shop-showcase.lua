
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BedwarsKitSkin__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local l__BedwarsKitSkinMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__GiftMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KitViewport__9 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
local l__Button__10 = v2.Button;
local l__ColorUtil__11 = v2.ColorUtil;
local l__ImageId__12 = v2.ImageId;
local l__TooltipContainer__13 = v2.TooltipContainer;
local l__AutoSizedText__14 = v2.AutoSizedText;
local l__ButtonComponent__15 = v2.ButtonComponent;
local l__getBedwarsKitMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__Empty__17 = v2.Empty;
local l__BedwarsKit__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__PlayerViewport__19 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "player-viewport").PlayerViewport;
return {
	KitShopShowcase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = l__BedwarsKitSkin__1.DEFAULT;
		local v6 = p1.SelectedKit;
		if v6 then
			local v7 = p1.store;
			if v7 ~= nil then
				v7 = v7.Bedwars.equippedKitSkins;
			end;
			v6 = v7;
		end;
		if v6 then
			v5 = p1.store.Bedwars.equippedKitSkins[p1.SelectedKit];
		end;
		local v8 = false;
		local v9 = false;
		if p1.SelectedSkin and p1.store then
			local v10 = p1.SelectedSkin == l__BedwarsKitSkin__1.DEFAULT or table.find(p1.store.Bedwars.ownedKitSkins, p1.SelectedSkin) ~= nil;
			local v11 = l__BedwarsKitSkinMeta__2[p1.SelectedSkin].product;
			if v11 ~= nil then
				v11 = v11.devProductId;
			end;
			local v12 = v11 ~= nil;
			if v12 then
				local v13 = l__BedwarsKitSkinMeta__2[p1.SelectedSkin].product;
				if v13 ~= nil then
					v13 = v13.priceRobux;
				end;
				v12 = v13 ~= nil;
			end;
			v9 = v12;
		end;
		if not l__DeviceUtil__3.isHoarceKat() and l__KnitClient__4.Controllers.UnlockController.allItemsUnlocked then
			v8 = true;
		end;
		local v14 = {};
		for v15, v16 in pairs(p1) do
			v14[v15] = v16;
		end;
		v14.SelectedKit = nil;
		v14.SelectedSkin = nil;
		v14.ItemImage = nil;
		v14.store = nil;
		local function u20()
			if not p1.SelectedSkin then
				return nil;
			end;
			local v17 = {
				GiftType = p1.SelectedSkin
			};
			local v18 = {};
			for v19, v20 in pairs(l__GiftMeta__7[p1.SelectedSkin]) do
				v18[v19] = v20;
			end;
			v18.customImage = u8.createElement(l__KitViewport__9, {
				Kit = p1.SelectedKit, 
				Skin = p1.SelectedSkin, 
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY"
			});
			v17.Gift = v18;
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.GIFTING, v17);
		end;
		local function u21()
			if p1.SelectedSkin and p1.SelectedKit then
				l__KnitClient__4.Controllers.KitSkinController:purchaseKitSkin(p1.SelectedSkin, p1.SelectedKit);
			end;
		end;
		local v21 = {
			Image = "rbxassetid://7993278185", 
			ImageTransparency = 0.7, 
			BackgroundColor3 = l__ColorUtil__11.hexColor(3092567), 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		};
		for v22, v23 in pairs(v14) do
			v21[v22] = v23;
		end;
		local v24 = false;
		if p1.SelectedKit ~= nil then
			v24 = l__getBedwarsKitMeta__16(p1.SelectedKit).skins ~= nil;
		end;
		if v24 then
			local v25 = { u8.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(math.huge, 30)
				}), u8.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					VerticalAlignment = "Bottom", 
					HorizontalAlignment = "Right"
				}) };
			local v26 = v9 and (not l__DeviceUtil__3.isSmallScreen() and u8.createElement(function(p3)
				local v27 = { u8.createElement("UIPadding", {
						PaddingRight = UDim.new(0.05, 0)
					}), u8.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						Padding = UDim.new(0.05), 
						VerticalAlignment = "Center", 
						HorizontalAlignment = "Center"
					}), u8.createElement("ImageLabel", {
						Image = l__ImageId__12.ROBUX, 
						Size = UDim2.fromScale(0.5, 0.6), 
						SizeConstraint = "RelativeYY", 
						ScaleType = "Fit", 
						ImageColor3 = Color3.fromRGB(255, 255, 255), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0
					}) };
				local v28 = {};
				local v29 = l__BedwarsKitSkinMeta__2[p1.SelectedSkin].product;
				if v29 ~= nil then
					v29 = v29.priceRobux;
				end;
				v28.Text = tostring(v29);
				v28.Size = UDim2.fromScale(0, 0.5);
				v28.AutomaticSize = "X";
				v28.SizeConstraint = "RelativeYY";
				v28.BackgroundTransparency = 1;
				v28.BorderSizePixel = 0;
				v28.TextColor3 = Color3.fromRGB(255, 255, 255);
				v28.RichText = true;
				v28.TextScaled = true;
				v28.Font = "Roboto";
				v28.TextXAlignment = "Left";
				v28.TextYAlignment = "Center";
				v27[#v27 + 1] = u8.createElement("TextLabel", v28);
				return u8.createElement("Frame", {
					Size = p3.Size, 
					BackgroundColor3 = l__ColorUtil__11.BLACK, 
					BackgroundTransparency = 0.8
				}, v27);
			end, {
				Size = UDim2.fromScale(0.25, 1)
			}));
			if v26 then
				v25[#v25 + 1] = v26;
			end;
			local v30 = v9;
			if v30 then
				v30 = not v8;
				if v30 then
					local v31 = {};
					if l__DeviceUtil__3.isSmallScreen() then
						local v32 = 0.6;
					else
						v32 = 0.4;
					end;
					v31.Size = UDim2.fromScale(v32, 1);
					v30 = u8.createElement(function(p4)
						local v33 = {
							Text = "BUY SKIN", 
							Size = p4.Size, 
							OnClick = u21, 
							BackgroundColor3 = l__ColorUtil__11.WHITE
						};
						if v5 ~= p1.SelectedSkin then
							local v34 = 0.6;
						else
							v34 = 0.8;
						end;
						v33.BackgroundTransparency = v34;
						v33.TextColor3 = l__ColorUtil__11.WHITE;
						v33.CornerRadius = UDim.new(0, 0);
						v33.AutoButtonColor = true;
						return u8.createElement(l__ButtonComponent__15, v33);
					end, v31);
				end;
			end;
			if v30 then
				v25[#v25 + 1] = v30;
			end;
			local v35 = v9;
			if v35 then
				local v36 = {};
				if l__DeviceUtil__3.isSmallScreen() then
					local v37 = 0.2;
				else
					v37 = 0.125;
				end;
				v36.Size = UDim2.fromScale(v37, 1);
				v35 = u8.createElement(function(p5)
					local v38 = {};
					local v39 = {};
					local v40 = {};
					if p1.SelectedSkin then
						local v41 = l__GiftMeta__7[p1.SelectedSkin].name;
					else
						v41 = "";
					end;
					v40.Text = v41;
					v40.Font = Enum.Font.SourceSansSemibold;
					v40.TextSize = 14;
					v40.Limits = Vector2.new(300, 500);
					v39[1] = u8.createElement(l__AutoSizedText__14, {
						Text = "Gift Kit Skin", 
						Font = Enum.Font.SourceSansBold, 
						TextSize = 16, 
						Limits = Vector2.new(300, 60)
					});
					v39[2] = u8.createElement(l__AutoSizedText__14, v40);
					v38[1] = u8.createElement("ImageLabel", {
						Image = l__ImageId__12.GIFTS_SOLID, 
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						ImageColor3 = Color3.fromRGB(255, 255, 255), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						Size = UDim2.fromScale(0.65, 0.65), 
						ScaleType = "Fit", 
						SizeConstraint = "RelativeYY"
					});
					v38[2] = u8.createElement(l__TooltipContainer__13, {}, v39);
					return u8.createElement(l__Button__10, {
						Size = p5.Size, 
						OnClick = u20, 
						BackgroundColor3 = l__ColorUtil__11.hexColor(7631988), 
						BackgroundTransparency = 0.6, 
						CornerRadius = UDim.new(0, 0), 
						AutoButtonColor = true
					}, v38);
				end, v36);
			end;
			if v35 then
				v25[#v25 + 1] = v35;
			end;
			v24 = u8.createFragment({
				ActionButtons = u8.createElement(l__Empty__17, {
					Size = UDim2.new(1, 0, 0.2, 0), 
					Position = UDim2.fromScale(1, 1), 
					AnchorPoint = Vector2.new(1, 1)
				}, v25)
			});
		end;
		local v42 = {};
		if p1.SelectedKit ~= nil and p1.SelectedKit ~= l__BedwarsKit__18.NONE then
			local v43 = u8.createElement(l__KitViewport__9, {
				Kit = p1.SelectedKit, 
				Skin = p1.SelectedSkin, 
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0), 
				AnchorPoint = Vector2.new(0.5, 0)
			});
		elseif p1.ItemImage == nil then
			v43 = u8.createElement(l__PlayerViewport__19, {
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0), 
				AnchorPoint = Vector2.new(0.5, 0), 
				Rotate = true
			});
		else
			v43 = u8.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.85, 0.85), 
				SizeConstraint = "RelativeYY", 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Image = p1.ItemImage, 
				BackgroundTransparency = 1
			});
		end;
		v42[1] = u8.createElement("UIPadding", {
			PaddingTop = UDim.new(0.05, 0), 
			PaddingRight = UDim.new(0.05, 0), 
			PaddingBottom = UDim.new(0.05, 0), 
			PaddingLeft = UDim.new(0.05, 0)
		});
		v42[2] = v43;
		if v24 then
			v42[#v42 + 1] = v24;
		end;
		return u8.createFragment({
			TopSection = u8.createElement("ImageLabel", v21, v42)
		});
	end)
};

