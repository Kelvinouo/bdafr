-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("KitShopItemCard");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
function v5.init(p1)
	p1.hoverMaid = u1.new();
	p1.ref = v3.createRef();
	p1.maid = u1.new();
end;
local l__UserInputService__2 = v4.UserInputService;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__UIUtil__5 = v2.UIUtil;
function v5.didMount(p2)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		local v6 = p2.ref:getValue();
		if v6 then
			p2.maid:GiveTask(v6.SelectionGained:Connect(function()
				l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
				p2.props.OnClick();
			end));
			if p2.props.Selected then
				l__UIUtil__5:selectGui(v6);
			end;
		end;
	end;
end;
function v5.willUnmount(p3)
	p3.maid:DoCleaning();
end;
local l__getBedwarsKitMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__BedwarsKitShop__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__getBedwarsClassMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local l__ColorUtil__12 = v2.ColorUtil;
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__14 = v4.TweenService;
local l__BedwarsImageId__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__TooltipContainer__16 = v2.TooltipContainer;
local l__AutoSizedText__17 = v2.AutoSizedText;
local l__Empty__18 = v2.Empty;
local l__KitViewport__19 = v1.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
function v5.render(p4)
	local v7 = false;
	local v8 = l__getBedwarsKitMeta__6(p4.props.Kit);
	if p4.props.Kit == l__BedwarsKit__7.NONE then
		v7 = true;
	elseif table.find(p4.props.store.Bedwars.ownedKits, p4.props.Kit) ~= nil then
		v7 = true;
	elseif not l__DeviceUtil__8.isHoarceKat() and l__KnitClient__9.Controllers.UnlockController.allKitsUnlocked then
		v7 = true;
	end;
	local v9 = p4.props.store.Bedwars.kit == p4.props.Kit;
	if not p4.props.store.Bedwars.kit and not p4.props.Kit then
		v9 = true;
	end;
	local v10 = table.find(l__BedwarsKitShop__10.FreeKits, p4.props.Kit) ~= nil;
	local v11 = v8.unlockedInBattlePass;
	if v11 == nil then
		v11 = false;
	end;
	local v12 = p4.props.store.Clans.myClan;
	if v12 ~= nil then
		v12 = v12.kitShop.unlocks[p4.props.Kit] ~= nil;
	end;
	local v13 = v12;
	if v13 == nil then
		v13 = false;
	end;
	local l__kitClass__14 = v8.kitClass;
	if l__kitClass__14 ~= 0 and l__kitClass__14 == l__kitClass__14 and l__kitClass__14 then
		local v15 = l__getBedwarsClassMeta__11(v8.kitClass);
	else
		v15 = nil;
	end;
	local v16 = {
		[v3.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1)
	};
	if p4.props.Selected then
		local v17 = l__ColorUtil__12.hexColor(2500410);
	else
		v17 = l__Theme__13.backgroundSecondary;
	end;
	v16.BackgroundColor3 = v17;
	if p4.props.Selected then
		local v18 = 0;
	else
		v18 = 0;
	end;
	v16.BackgroundTransparency = v18;
	if v9 then
		local v19 = 1;
	else
		v19 = 0;
	end;
	v16.BorderSizePixel = v19;
	v16.BorderMode = "Outline";
	v16.BorderColor3 = l__ColorUtil__12.hexColor(16771973);
	v16.LayoutOrder = p4.props.LayoutOrder;
	v16.AutoButtonColor = false;
	v16.Selectable = true;
	v16[v3.Event.MouseButton1Click] = function()
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		p4.props.OnClick();
	end;
	v16[v3.Event.MouseEnter] = function(p5)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u20 = l__TweenService__14:Create(p5, TweenInfo.new(0.12), {
				BackgroundColor3 = l__ColorUtil__12.darken(l__Theme__13.backgroundSecondary, 0.8)
			});
			p4.hoverMaid:GiveTask(function()
				u20:Cancel();
			end);
			u20:Play();
		end;
	end;
	v16[v3.Event.MouseLeave] = function(p6)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u21 = l__TweenService__14:Create(p6, TweenInfo.new(0.12), {
				BackgroundColor3 = l__Theme__13.backgroundSecondary
			});
			p4.hoverMaid:GiveTask(function()
				u21:Cancel();
			end);
			u21:Play();
		end;
	end;
	local v20 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		}), v3.createElement("UIStroke", {
			Color = Color3.fromRGB(70, 72, 117), 
			Thickness = 2
		}) };
	local v21 = v10 and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__15.BANNER_HORIZONTAL, 
		Position = UDim2.fromScale(0.5, -0.01), 
		AnchorPoint = Vector2.new(0.5, 0), 
		ImageColor3 = Color3.fromRGB(255, 255, 255), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.8421052631578947
		}), v3.createElement("TextLabel", {
			Text = "<b>FREE THIS WEEK!</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			Size = UDim2.fromScale(0.75, 0.45), 
			Position = UDim2.fromScale(0.5, 0.13), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
	if v21 then
		v20[#v20 + 1] = v21;
	end;
	local v22 = v8.limitedTime and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__15.BANNER_HORIZONTAL, 
		Position = UDim2.fromScale(0.5, -0.01), 
		AnchorPoint = Vector2.new(0.5, 0), 
		ImageColor3 = Color3.fromRGB(252, 122, 122), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.8421052631578947
		}), v3.createElement("TextLabel", {
			Text = "<b>LIMITED</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			Size = UDim2.fromScale(0.75, 0.45), 
			Position = UDim2.fromScale(0.5, 0.13), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
	if v22 then
		v20[#v20 + 1] = v22;
	end;
	local v23 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v24 = v13 and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		Image = l__BedwarsImageId__15.CLAN, 
		ScaleType = "Fit", 
		BackgroundTransparency = 1
	}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
				Text = "Unlocked by Clan", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) }) });
	if v24 then
		v23[#v23 + 1] = v24;
	end;
	if not v10 and not v7 and not v11 then
		local v25 = v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__15.GEM, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
					Text = "Unlockable", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	elseif v8.battlepassSeason then
		v25 = v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__15.BattlePassIcons[v8.battlepassSeason], 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
					Text = "BP Season " .. string.gsub(v8.battlepassSeason, "season", ""), 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	else
		v25 = v3.createFragment();
	end;
	v23[#v23 + 1] = v25;
	v20.KitCategoryIcons = v3.createElement("Frame", {
		Size = UDim2.fromScale(1, 0.16), 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(0.97, 0.03), 
		BackgroundTransparency = 1
	}, v23);
	local v26 = v8;
	if v26 then
		local v27 = { v3.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				Padding = UDim.new(0.035, 0), 
				SortOrder = "LayoutOrder"
			}), v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}), v3.createElement(l__Empty__18, {
				LayoutOrder = 0
			}) };
		local v28 = v15;
		if v28 then
			v28 = false;
			if v15.imageId ~= "" then
				v28 = v3.createFragment({
					KitClass = v3.createElement("ImageLabel", {
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Size = UDim2.fromScale(0.12, 0.75), 
						Image = v15.imageId, 
						BackgroundTransparency = 1, 
						ScaleType = "Fit", 
						ZIndex = 10, 
						LayoutOrder = 1
					}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
								Text = v15.display, 
								Font = Enum.Font.SourceSansBold, 
								TextSize = 16
							}) }), v3.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1
						}) })
				});
			end;
		end;
		if v28 then
			v27[#v27 + 1] = v28;
		end;
		v27[#v27 + 1] = v3.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5), 
			Size = UDim2.fromScale(0.8, 0.8), 
			Text = "<b>" .. v8.name .. "</b>", 
			TextScaled = true, 
			RichText = true, 
			TextColor3 = l__ColorUtil__12.WHITE, 
			TextXAlignment = "Left", 
			Font = "Roboto", 
			BackgroundTransparency = 1, 
			ZIndex = 10, 
			LayoutOrder = 2
		});
		v26 = v3.createFragment({
			KitNameTag = v3.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.16), 
				Position = UDim2.fromScale(0, 1), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 0.55, 
				BackgroundColor3 = l__ColorUtil__12.BLACK, 
				ZIndex = 10
			}, v27)
		});
	end;
	v20[#v20 + 1] = v26;
	local v29 = {};
	local v30 = {};
	if p4.props.Kit == l__BedwarsKit__7.NONE then
		local v31 = nil;
	else
		v31 = p4.props.Kit;
	end;
	v30.Kit = v31;
	v29[1] = v3.createElement(l__KitViewport__19, v30);
	v20[#v20 + 1] = v3.createElement(l__Empty__18, {
		Size = UDim2.fromScale(0.92, 0.92), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v29);
	return v3.createElement("ImageButton", v16, v20);
end;
return {
	KitShopItemCard = v5
};
