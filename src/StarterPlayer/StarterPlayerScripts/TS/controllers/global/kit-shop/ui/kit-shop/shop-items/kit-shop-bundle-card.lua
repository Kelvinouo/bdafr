-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src);
local v4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v5 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v6 = v4.Component:extend("KitShopBundleCard");
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
local l__BundleMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__DeviceUtil__8 = v2.DeviceUtil;
local l__KnitClient__9 = v3.KnitClient;
local l__ColorUtil__10 = v2.ColorUtil;
local l__Theme__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__12 = v5.TweenService;
local l__ImageId__13 = v2.ImageId;
local l__EmoteType__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__EmoteAssets__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").EmoteAssets;
local l__TooltipContainer__16 = v2.TooltipContainer;
local l__AutoSizedText__17 = v2.AutoSizedText;
local l__BedwarsImageId__18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Empty__19 = v2.Empty;
function v6.render(p4)
	local v8 = false;
	local v9 = {};
	local v10 = l__BundleMeta__6[p4.props.Bundle];
	local l__kits__11 = v10.kits;
	if l__kits__11 ~= nil then
		local u20 = {};
		local function v12(p5)
			if p5 == l__BedwarsKit__7.NONE then
				table.insert(v9, p5);
				return;
			end;
			if table.find(p4.props.store.Bedwars.ownedKits, p5) ~= nil then
				table.insert(v9, p5);
				return;
			end;
			if not l__DeviceUtil__8.isHoarceKat() and l__KnitClient__9.Controllers.UnlockController.allItemsUnlocked then
				table.insert(v9, p5);
				return;
			end;
			table.insert(u20, p5);
		end;
		for v13, v14 in ipairs(l__kits__11) do
			v12(v14, v13 - 1, l__kits__11);
		end;
	end;
	if v9 == v10.kits then
		v8 = true;
	end;
	local v15 = v10.battlepass;
	if v15 == nil then
		v15 = false;
	end;
	local v16 = {
		[v4.Ref] = p4.ref, 
		Size = UDim2.fromScale(1, 1)
	};
	if p4.props.Selected then
		local v17 = l__ColorUtil__10.hexColor(2500410);
	else
		v17 = l__Theme__11.backgroundSecondary;
	end;
	v16.BackgroundColor3 = v17;
	if p4.props.Selected then
		local v18 = 0;
	else
		v18 = 0;
	end;
	v16.BackgroundTransparency = v18;
	v16.BorderSizePixel = 0;
	v16.BorderMode = "Outline";
	v16.BorderColor3 = l__ColorUtil__10.hexColor(16771973);
	v16.LayoutOrder = p4.props.LayoutOrder;
	v16.AutoButtonColor = false;
	v16.Selectable = true;
	v16[v4.Event.MouseButton1Click] = function()
		l__SoundManager__3:playSound(l__GameSound__4.UI_CLICK);
		p4.props.OnClick();
	end;
	v16[v4.Event.MouseEnter] = function(p6)
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
	v16[v4.Event.MouseLeave] = function(p7)
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
	local v19 = { v4.createElement("UICorner", {
			CornerRadius = UDim.new(0.03, 0)
		}), v4.createElement("UIStroke", {
			Color = Color3.fromRGB(70, 72, 117), 
			Thickness = 2
		}) };
	local v20 = v10.limitedTime and v4.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 0.22), 
		Image = l__ImageId__13.BANNER_HORIZONTAL, 
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
	if v20 then
		v19[#v19 + 1] = v20;
	end;
	local v21 = {
		Size = UDim2.fromScale(1, 0.16), 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(0.97, 0.03), 
		BackgroundTransparency = 1
	};
	local v22 = { v4.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			VerticalAlignment = "Center", 
			Padding = UDim.new(0.05, 0)
		}) };
	local v23 = #v22;
	v22[v23 + 1] = v4.createElement("ImageLabel", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		Image = l__EmoteAssets__15[l__EmoteType__14.LUCKY_GIFT], 
		ScaleType = "Fit", 
		BackgroundTransparency = 1
	}, { v4.createElement(l__TooltipContainer__16, {}, { v4.createElement(l__AutoSizedText__17, {
				Text = "Kit Bundle", 
				Font = Enum.Font.SourceSansBold, 
				TextSize = 16, 
				Limits = Vector2.new(300, 60)
			}) }) });
	if not v8 and not v15 then
		local v24 = v4.createElement("ImageLabel", {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Image = l__ImageId__13.GEM, 
			ScaleType = "Fit", 
			BackgroundTransparency = 1
		}, { v4.createElement(l__TooltipContainer__16, {}, { v4.createElement(l__AutoSizedText__17, {
					Text = "Unlockable", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) }) });
	else
		local v25 = v10.battlepass;
		if v25 ~= nil then
			v25 = v25.season;
		end;
		if v25 then
			local v26 = {
				Size = UDim2.fromScale(1, 1), 
				SizeConstraint = "RelativeYY"
			};
			local v27 = v10.battlepass;
			if v27 ~= nil then
				v27 = v27.season;
			end;
			v26.Image = l__BedwarsImageId__18.BattlePassIcons[v27];
			v26.ScaleType = "Fit";
			v26.BackgroundTransparency = 1;
			local v28 = {};
			local v29 = {};
			local v30 = {};
			local v31 = l__BundleMeta__6[p4.props.Bundle].battlepass;
			if v31 ~= nil then
				v31 = string.gsub(v31.season, "season", "");
			end;
			v30.Text = "BP Season " .. tostring(v31);
			v30.Font = Enum.Font.SourceSansBold;
			v30.TextSize = 16;
			v30.Limits = Vector2.new(300, 60);
			v29[#v29 + 1] = v4.createElement(l__AutoSizedText__17, v30);
			v28[#v28 + 1] = v4.createElement(l__TooltipContainer__16, {}, v29);
			local v32 = v4.createElement("ImageLabel", v26, v28);
		else
			v32 = v4.createFragment();
		end;
		v24 = v32;
	end;
	v22[v23 + 2] = v24;
	v19.KitCategoryIcons = v4.createElement("Frame", v21, v22);
	local v33 = v10;
	if v33 then
		local v34 = { v4.createElement("UICorner", {
				CornerRadius = UDim.new(0.03, 0)
			}) };
		local v35 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		local v36 = v10.kitShopBundle;
		if v36 ~= nil then
			v36 = v36.name;
		end;
		v35.Text = "<b>" .. tostring(v36) .. "</b>";
		v35.TextScaled = true;
		v35.RichText = true;
		v35.TextColor3 = l__ColorUtil__10.WHITE;
		v35.TextXAlignment = "Center";
		v35.Font = "Roboto";
		v35.BackgroundTransparency = 1;
		v35.ZIndex = 10;
		v34[#v34 + 1] = v4.createElement("TextLabel", v35);
		v33 = v4.createFragment({
			KitNameTag = v4.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.16), 
				Position = UDim2.fromScale(0, 1), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 0.55, 
				BackgroundColor3 = l__ColorUtil__10.BLACK, 
				ZIndex = 10
			}, v34)
		});
	end;
	v19[#v19 + 1] = v33;
	local v37 = {};
	local v38 = {};
	local v39 = v10.kitShopBundle;
	if v39 ~= nil then
		v39 = v39.image;
	end;
	v38.Image = v39;
	v38.ScaleType = "Crop";
	v38.Size = UDim2.fromScale(1, 1);
	v38.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	v38.BorderSizePixel = 0;
	v38.BackgroundTransparency = 1;
	v37[#v37 + 1] = v4.createElement("ImageLabel", v38);
	v19[#v19 + 1] = v4.createElement(l__Empty__19, {
		Size = UDim2.fromScale(0.92, 0.92), 
		Position = UDim2.fromScale(0.5, 0.5), 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v37);
	return v4.createElement("ImageButton", v16, v19);
end;
return {
	KitShopBundleCard = v6
};
