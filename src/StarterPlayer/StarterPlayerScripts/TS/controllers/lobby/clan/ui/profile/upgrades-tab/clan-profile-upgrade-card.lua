
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta");
local l__ClanUpgradeTypeMeta__1 = v3.ClanUpgradeTypeMeta;
local l__ClanUpgradeMeta__2 = v3.ClanUpgradeMeta;
local l__Maid__3 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__8 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ColorUtil__9 = v2.ColorUtil;
return {
	ClanProfileUpgradeCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local v5 = l__ClanUpgradeTypeMeta__1[p1.UpgradeType];
		if p1.UpgradeTier then
			local v6 = l__ClanUpgradeMeta__2[p1.UpgradeTier];
		else
			v6 = l__ClanUpgradeMeta__2[v5.firstUpgrade];
		end;
		local v7 = p1.SelectedUpgrade == p1.UpgradeTier;
		local v8 = {};
		local v9 = {
			Size = UDim2.new(1, 0, 0, 40), 
			BackgroundColor3 = l__Theme__5.backgroundPrimary, 
			BorderSizePixel = 1
		};
		if v7 then
			local v10 = l__Theme__5.textPrimary;
		else
			v10 = l__Theme__5.backgroundPrimary;
		end;
		v9.BorderColor3 = v10;
		v9.BorderMode = "Inset";
		v9.LayoutOrder = 1;
		v9.AutoButtonColor = false;
		local u10 = l__Maid__3.new();
		v9[u4.Event.Activated] = function(p3)
			p1.OnClick(p1.UpgradeTier);
			l__SoundManager__6:playSound(l__GameSound__7.UI_CLICK);
			u10:DoCleaning();
			local v11 = l__TweenService__8:Create(p3, TweenInfo.new(0.12), {
				BackgroundTransparency = 0
			});
			v11:Play();
			u10:GiveTask(function()
				v11:Cancel();
			end);
		end;
		v9[u4.Event.MouseEnter] = function(p4)
			if v7 then
				return nil;
			end;
			u10:DoCleaning();
			local v12 = l__TweenService__8:Create(p4, TweenInfo.new(0.12), {
				BackgroundTransparency = 0.3
			});
			v12:Play();
			u10:GiveTask(function()
				v12:Cancel();
			end);
		end;
		v9[u4.Event.MouseLeave] = function(p5)
			if v7 then
				return nil;
			end;
			u10:DoCleaning();
			local v13 = l__TweenService__8:Create(p5, TweenInfo.new(0.12), {
				BackgroundTransparency = 0
			});
			v13:Play();
			u10:GiveTask(function()
				v13:Cancel();
			end);
		end;
		v8.UpgradeCard = u4.createElement("ImageButton", v9, { u4.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center"
			}), u4.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 6), 
				PaddingBottom = UDim.new(0, 6), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 1), 
				Text = "<b>" .. v5.name .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__ColorUtil__9.WHITE, 
				TextXAlignment = "Left", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(0.2, 1), 
				Text = "<b>Lv. " .. tostring(v6.level) .. "</b>", 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextColor3 = l__Theme__5.mcYellow, 
				TextXAlignment = "Right", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) }) });
		return u4.createFragment(v8);
	end)
};

