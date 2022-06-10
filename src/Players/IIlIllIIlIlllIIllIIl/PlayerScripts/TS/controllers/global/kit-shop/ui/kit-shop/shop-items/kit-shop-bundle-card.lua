-- Script Hash: 9167cc864a2886977c792913d5f36cdbbdf6d72c2058d900a60fff0a9069595778e3cf35c2151adbeeb15f26fe9829c9
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v5 = v3.Component:extend("KitShopBundleCard");
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
local l__BundleMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ColorUtil__10 = v2.ColorUtil;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__12 = v4.TweenService;
local l__ImageId__13 = v2.ImageId;
local l__EmoteType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteAssets__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets;
local l__TooltipContainer__16 = v2.TooltipContainer;
local l__AutoSizedText__17 = v2.AutoSizedText;
local l__BedwarsImageId__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Empty__19 = v2.Empty;
function v5.render(p4)
	local v7 = false;
	local v8 = {};
	local v9 = l__BundleMeta__6[p4.props.Bundle];
	local l__kits__10 = v9.kits;
	if l__kits__10 ~= nil then
		local u20 = {};
		local function v11(p5)
			if p5 == l__BedwarsKit__7.NONE then
				table.insert(v8, p5);
				return;
			end;
			if table.find(p4.props.store.Bedwars.ownedKits, p5) ~= nil then
				table.insert(v8, p5);
				return;
			end;
			if not l__DeviceUtil__8.isHoarceKat() and l__KnitClient__9.Controllers.UnlockController.allKitsUnlocked then
				table.insert(v8, p5);
				return;
			end;
			table.insert(u20, p5);
		end;
		for v12, v13 in ipairs(l__kits__10) do
			v11(v13, v12 - 1, l__kits__10);
		end;
	end;
	if v8 == v9.kits then
		v7 = true;
	end;
	local v14 = v9.battlepass;
	if v14 == nil then
		v14 = false;
	end;
	local v15 = {
		[v3.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1)
	};
	if p4.props.Selected then
		local v16 = l__ColorUtil__10.hexColor(2500410);
	else
		v16 = l__Theme__11.backgroundSecondary;
	end;
	v15.BackgroundColor3 = v16;
	if p4.props.Selected then
		local v17 = 0;
	else
		v17 = 0;
	end;
	v15.BackgroundTransparency = v17;
	v15.BorderSizePixel = 0;
	v15.BorderMode = "Outline";
	v15.BorderColor3 = l__ColorUtil__10.hexColor(16771973);
	v15.LayoutOrder = p4.props.LayoutOrder;
	v15.AutoButtonColor = false;
	v15.Selectable = true;
	v15[v3.Event.MouseButton1Click] = function()
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		p4.props.OnClick();
	end;
	v15[v3.Event.MouseEnter] = function(p6)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u21 = l__TweenService__12:Create(p6, TweenInfo.new(0.12), {
				BackgroundColor3 = l__ColorUtil__10.darken(l__Theme__11.backgroundSecondary, 0.8)
			});
			p4.hoverMaid:GiveTask(function()
				u21:Cancel();
			end);
			u21:Play();
		end;
	end;
	v15[v3.Event.MouseLeave] = function(p7)
		p4.hoverMaid:DoCleaning();
		if not p4.props.Selected then
			local u22 = l__TweenService__12:Create(p7, TweenInfo.new(0.12), {
				BackgroundColor3 = l__Theme__11.backgroundSecondary
			});
			p4.hoverMaid:GiveTask(function()
				u22:Cancel();
			end);
			u22:Play();
		end;
	end;
	local v18 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		}), v3.createElement("UIStroke", {
			Color = Color3.fromRGB(70, 72, 117), 
			Thickness = 2
		}) };
	local v19 = v9.limitedTime and v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__ImageId__13.BANNER_HORIZONTAL, 
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
	if v19 then
		v18[#v18 + 1] = v19;
	end;
	local v20 = {
		Size = UDim2.fromScale(1, 0.16), 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(0.97, 0.03), 
		BackgroundTransparency = 1
	};
	local v21 = { v3.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v22 = #v21;
	v21[v22 + 1] = v3.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		Image = l__EmoteAssets__15[l__EmoteType__14.LUCKY_GIFT], 
		ScaleType = "Fit", 
		BackgroundTransparency = 1
	}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
				Text = "Kit Bundle", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) }) });
	if not v7 and not v14 then
		local v23 = v3.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__ImageId__13.GEM, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v3.createElement(l__TooltipContainer__16, {}, { v3.createElement(l__AutoSizedText__17, {
					Text = "Unlockable", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	else
		local v24 = v9.battlepass;
		if v24 ~= nil then
			v24 = v24.season;
		end;
		if v24 then
			local v25 = {
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY"
			};
			local v26 = v9.battlepass;
			if v26 ~= nil then
				v26 = v26.season;
			end;
			v25.Image = l__BedwarsImageId__18.BattlePassIcons[v26];
			v25.ScaleType = "Fit";
			v25.BackgroundTransparency = 1;
			local v27 = {};
			local v28 = {};
			local v29 = {};
			local v30 = l__BundleMeta__6[p4.props.Bundle].battlepass;
			if v30 ~= nil then
				v30 = string.gsub(v30.season, "season", "");
			end;
			v29.Text = "BP Season " .. tostring(v30);
			v29.Font = Enum.Font.SourceSansBold;
			v29.TextSize = 16;
			v29.Limits = Vector2.new(300, 60);
			v28[#v28 + 1] = v3.createElement(l__AutoSizedText__17, v29);
			v27[#v27 + 1] = v3.createElement(l__TooltipContainer__16, {}, v28);
			local v31 = v3.createElement("ImageLabel", v25, v27);
		else
			v31 = v3.createFragment();
		end;
		v23 = v31;
	end;
	v21[v22 + 2] = v23;
	v18.KitCategoryIcons = v3.createElement("Frame", v20, v21);
	local v32 = v9;
	if v32 then
		local v33 = { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}) };
		local v34 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		local v35 = v9.kitShopBundle;
		if v35 ~= nil then
			v35 = v35.name;
		end;
		v34.Text = "<b>" .. tostring(v35) .. "</b>";
		v34.TextScaled = true;
		v34.RichText = true;
		v34.TextColor3 = l__ColorUtil__10.WHITE;
		v34.TextXAlignment = "Center";
		v34.Font = "Roboto";
		v34.BackgroundTransparency = 1;
		v34.ZIndex = 10;
		v33[#v33 + 1] = v3.createElement("TextLabel", v34);
		v32 = v3.createFragment({
			KitNameTag = v3.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.16), 
				Position = UDim2.fromScale(0, 1), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 0.55, 
				BackgroundColor3 = l__ColorUtil__10.BLACK, 
				ZIndex = 10
			}, v33)
		});
	end;
	v18[#v18 + 1] = v32;
	local v36 = {};
	local v37 = {};
	local v38 = v9.kitShopBundle;
	if v38 ~= nil then
		v38 = v38.image;
	end;
	v37.Image = v38;
	v37.ScaleType = "Crop";
	v37.Size = UDim2.fromScale(1, 1);
	v37.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v37.BorderSizePixel = 0;
	v37.BackgroundTransparency = 1;
	v36[#v36 + 1] = v3.createElement("ImageLabel", v37);
	v18[#v18 + 1] = v3.createElement(l__Empty__19, {
		Size = UDim2.fromScale(0.92, 0.92), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v36);
	return v3.createElement("ImageButton", v15, v18);
end;
return {
	KitShopBundleCard = v5
};
