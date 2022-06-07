-- Script Hash: 179ba9c99dcc8292265a00e164ad005b57b2d72330ad6033c3999d11cf2076c0179c480ba5607635770dfeccdb52eab1
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
local l__ColorUtil__11 = v2.ColorUtil;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__13 = v4.TweenService;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__TooltipContainer__15 = v2.TooltipContainer;
local l__AutoSizedText__16 = v2.AutoSizedText;
local l__Empty__17 = v2.Empty;
local l__KitViewport__18 = v1.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport;
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
	local v14 = {
		[v3.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1)
	};
	if p4.props.Selected then
		local v15 = l__ColorUtil__11.hexColor(2500410);
	else
		v15 = l__Theme__12.backgroundSecondary;
	end;
	v14.BackgroundColor3 = v15;
	if p4.props.Selected then
		local v16 = 0;
	else
		v16 = 0;
	end;
	v14.BackgroundTransparency = v16;
	if v9 then
		local v17 = 1;
	else
		v17 = 0;
	end;
	v14.BorderSizePixel = v17;
	v14.BorderMode = "Outline";
	v14.BorderColor3 = l__ColorUtil__11.hexColor(16771973);
	v14.LayoutOrder = p4.props.LayoutOrder;
	v14.AutoButtonColor = false;
	v14.Selectable = true;
	v14[v3.Event.MouseButton1Click] = function()
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		p4.props.OnClick();
	end;
	v14[v3.Event.MouseEnter] = function(p5)
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
	v14[v3.Event.MouseLeave] = function(p6)
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
	local v18 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		}), v3.createElement("UIStroke", {
			Color = Color3.fromRGB(70, 72, 117), 
			Thickness = 2
		}) };
	local v19 = v10 and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__14.BANNER_HORIZONTAL, 
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
	if v19 then
		v18[#v18 + 1] = v19;
	end;
	local v20 = v8.limitedTime and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__BedwarsImageId__14.BANNER_HORIZONTAL, 
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
	if v20 then
		v18[#v18 + 1] = v20;
	end;
	local v21 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v22 = v13 and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		Image = l__BedwarsImageId__14.CLAN, 
		ScaleType = "Fit", 
		BackgroundTransparency = 1
	}, { v3.createElement(l__TooltipContainer__15, {}, { v3.createElement(l__AutoSizedText__16, {
				Text = "Unlocked by Clan", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) }) });
	if v22 then
		v21[#v21 + 1] = v22;
	end;
	if not v10 and not v7 and not v11 then
		local v23 = v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__14.GEM, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v3.createElement(l__TooltipContainer__15, {}, { v3.createElement(l__AutoSizedText__16, {
					Text = "Unlockable", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	elseif v8.battlepassSeason then
		v23 = v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__BedwarsImageId__14.BattlePassIcons[v8.battlepassSeason], 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v3.createElement(l__TooltipContainer__15, {}, { v3.createElement(l__AutoSizedText__16, {
					Text = "BP Season " .. string.gsub(v8.battlepassSeason, "season", ""), 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	else
		v23 = v3.createFragment();
	end;
	v21[#v21 + 1] = v23;
	v18.KitCategoryIcons = v3.createElement("Frame", {
		Size = UDim2.fromScale(1, 0.16), 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(0.97, 0.03), 
		BackgroundTransparency = 1
	}, v21);
	v18[#v18 + 1] = v8 and v3.createFragment({
		KitNameTag = v3.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.16), 
			Position = UDim2.fromScale(0, 1), 
			AnchorPoint = Vector2.new(0, 1), 
			BackgroundTransparency = 0.55, 
			BackgroundColor3 = l__ColorUtil__11.BLACK, 
			ZIndex = 10
		}, { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}), v3.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.fromScale(0.8, 0.8), 
				Text = "<b>" .. v8.name .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__ColorUtil__11.WHITE, 
				TextXAlignment = "Center", 
				Font = "Roboto", 
				BackgroundTransparency = 1, 
				ZIndex = 10
			}) })
	});
	local v24 = {};
	local v25 = {};
	if p4.props.Kit == l__BedwarsKit__7.NONE then
		local v26 = nil;
	else
		v26 = p4.props.Kit;
	end;
	v25.Kit = v26;
	v24[1] = v3.createElement(l__KitViewport__18, v25);
	v18[#v18 + 1] = v3.createElement(l__Empty__17, {
		Size = UDim2.fromScale(0.92, 0.92), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v24);
	return v3.createElement("ImageButton", v14, v18);
end;
return {
	KitShopItemCard = v5
};
