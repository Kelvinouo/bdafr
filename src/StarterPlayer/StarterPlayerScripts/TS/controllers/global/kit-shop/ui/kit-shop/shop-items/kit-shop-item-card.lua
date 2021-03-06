-- Script Hash: e4a989fc7fa066e9904f96159073e789a1134982d03fa0b9a742a092ee384b3094361b2b5270ba6e02f6c6031863e062
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v6 = v4.Component:extend("KitShopItemCard");
local l__Maid__1 = v3.Maid;
function v6.init(p1)
	p1.hoverMaid = l__Maid__1.new();
	p1.ref = v4.createRef();
	p1.maid = l__Maid__1.new();
end;
local l__UserInputService__2 = v5.UserInputService;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__UIUtil__5 = v2.UIUtil;
function v6.didMount(p2)
	if l__UserInputService__2.GamepadEnabled and not l__UserInputService__2.MouseEnabled then
		local v7 = p2.ref:getValue();
		if v7 then
			p2.maid:GiveTask(v7.SelectionGained:Connect(function()
				l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
				p2.props.OnClick();
			end));
			if p2.props.Selected then
				l__UIUtil__5:selectGui(v7);
			end;
		end;
	end;
end;
function v6.willUnmount(p3)
	p3.maid:DoCleaning();
end;
local l__getBedwarsKitMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__KnitClient__9 = v3.KnitClient;
local l__BedwarsKitShop__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop;
local l__ColorUtil__11 = v2.ColorUtil;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__13 = v5.TweenService;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__TooltipContainer__15 = v2.TooltipContainer;
local l__AutoSizedText__16 = v2.AutoSizedText;
local l__Empty__17 = v2.Empty;
local l__KitViewport__18 = v1.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
function v6.render(p4)
	local v8 = false;
	local v9 = l__getBedwarsKitMeta__6(p4.props.Kit);
	if p4.props.Kit == l__BedwarsKit__7.NONE then
		v8 = true;
	elseif table.find(p4.props.store.Bedwars.ownedKits, p4.props.Kit) ~= nil then
		v8 = true;
	elseif not l__DeviceUtil__8.isHoarceKat() and l__KnitClient__9.Controllers.UnlockController.allKitsUnlocked then
		v8 = true;
	end;
	local v10 = p4.props.store.Bedwars.kit == p4.props.Kit;
	if not p4.props.store.Bedwars.kit and not p4.props.Kit then
		v10 = true;
	end;
	local v11 = table.find(l__BedwarsKitShop__10.FreeKits, p4.props.Kit) ~= nil;
	local v12 = v9.unlockedInBattlePass;
	if v12 == nil then
		v12 = false;
	end;
	local v13 = p4.props.store.Clans.myClan;
	if v13 ~= nil then
		v13 = v13.kitShop.unlocks[p4.props.Kit] ~= nil;
	end;
	local v14 = v13;
	if v14 == nil then
		v14 = false;
	end;
	local v15 = {
		[v4.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1)
	};
	if p4.props.Selected then
		local v16 = l__ColorUtil__11.hexColor(2500410);
	else
		v16 = l__Theme__12.backgroundSecondary;
	end;
	v15.BackgroundColor3 = v16;
	if p4.props.Selected then
		local v17 = 0;
	else
		v17 = 0;
	end;
	v15.BackgroundTransparency = v17;
	if v10 then
		local v18 = 1;
	else
		v18 = 0;
	end;
	v15.BorderSizePixel = v18;
	v15.BorderMode = "Outline";
	v15.BorderColor3 = l__ColorUtil__11.hexColor(16771973);
	v15.LayoutOrder = p4.props.LayoutOrder;
	v15.AutoButtonColor = false;
	v15.Selectable = true;
	v15[v4.Event.MouseButton1Click] = function()
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		p4.props.OnClick();
	end;
	v15[v4.Event.MouseEnter] = function(p5)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u19 = l__TweenService__13:Create(p5, TweenInfo.new(0.12), {
				BackgroundColor3 = l__ColorUtil__11.darken(l__Theme__12.backgroundSecondary, 0.8)
			});
			p4.hoverMaid:GiveTask(function()
				u19:Cancel();
			end);
			u19:Play();
		end;
	end;
	v15[v4.Event.MouseLeave] = function(p6)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u20 = l__TweenService__13:Create(p6, TweenInfo.new(0.12), {
				BackgroundColor3 = l__Theme__12.backgroundSecondary
			});
			p4.hoverMaid:GiveTask(function()
				u20:Cancel();
			end);
			u20:Play();
		end;
	end;
	local v19 = { v4.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		}), v4.createElement("UIStroke", {
			Color = Color3.fromRGB(70, 72, 117), 
			Thickness = 2
		}) };
	local v20 = v11 and v4.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__14.BANNER_HORIZONTAL, 
		Position = UDim2.fromScale(0.5, -0.01), 
		AnchorPoint = Vector2.new(0.5, 0), 
		ImageColor3 = Color3.fromRGB(255, 255, 255), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v4.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.8421052631578947
		}), v4.createElement("TextLabel", {
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
	if v20 then
		v19[#v19 + 1] = v20;
	end;
	local v21 = v9.limitedTime and v4.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__14.BANNER_HORIZONTAL, 
		Position = UDim2.fromScale(0.5, -0.01), 
		AnchorPoint = Vector2.new(0.5, 0), 
		ImageColor3 = Color3.fromRGB(252, 122, 122), 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	}, { v4.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.8421052631578947
		}), v4.createElement("TextLabel", {
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
	if v21 then
		v19[#v19 + 1] = v21;
	end;
	local v22 = { v4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v23 = v14 and v4.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		Image = l__BedwarsImageId__14.CLAN, 
		ScaleType = "Fit", 
		BackgroundTransparency = 1
	}, { v4.createElement(l__TooltipContainer__15, {}, { v4.createElement(l__AutoSizedText__16, {
				Text = "Unlocked by Clan", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) }) });
	if v23 then
		v22[#v22 + 1] = v23;
	end;
	if not v11 and not v8 and not v12 then
		local v24 = v4.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__14.GEM, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v4.createElement(l__TooltipContainer__15, {}, { v4.createElement(l__AutoSizedText__16, {
					Text = "Unlockable", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	elseif v9.battlepassSeason then
		v24 = v4.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__14.BattlePassIcons[v9.battlepassSeason], 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v4.createElement(l__TooltipContainer__15, {}, { v4.createElement(l__AutoSizedText__16, {
					Text = "BP Season " .. string.gsub(v9.battlepassSeason, "season", ""), 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	else
		v24 = v4.createFragment();
	end;
	v22[#v22 + 1] = v24;
	v19.KitCategoryIcons = v4.createElement("Frame", {
		Size = UDim2.fromScale(1, 0.16), 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(0.97, 0.03), 
		BackgroundTransparency = 1
	}, v22);
	v19[#v19 + 1] = v9 and v4.createFragment({
		KitNameTag = v4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.16), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundTransparency = 0.55, 
			BackgroundColor3 = l__ColorUtil__11.BLACK, 
			ZIndex = 10
		}, { v4.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}), v4.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.fromScale(0.8, 0.8), 
				Text = "<b>" .. v9.name .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__ColorUtil__11.WHITE, 
				TextXAlignment = "Center", 
				Font = "Roboto", 
				BackgroundTransparency = 1, 
				ZIndex = 10
			}) })
	});
	local v25 = {};
	local v26 = {};
	if p4.props.Kit == l__BedwarsKit__7.NONE then
		local v27 = nil;
	else
		v27 = p4.props.Kit;
	end;
	v26.Kit = v27;
	v25[1] = v4.createElement(l__KitViewport__18, v26);
	v19[#v19 + 1] = v4.createElement(l__Empty__17, {
		Size = UDim2.fromScale(0.92, 0.92), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v25);
	return v4.createElement("ImageButton", v15, v19);
end;
return {
	KitShopItemCard = v6
};
