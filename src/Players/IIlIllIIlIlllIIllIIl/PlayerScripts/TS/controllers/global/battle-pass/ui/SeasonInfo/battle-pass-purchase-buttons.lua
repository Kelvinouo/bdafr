-- Script Hash: d6a04485716f3b051fa5c9f25d0c485cca69c38f97665155e9a0f45792fc089ffb701d4a6523569caa4a313e4e0d94d8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__BPRewardDisplayMeta__3 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__BPRewardDisplayType__4 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-type").BPRewardDisplayType;
local l__ButtonComponent__5 = v2.ButtonComponent;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Flamework__8 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__GiftType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
return {
	BattlePassPurchaseButtons = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.store = nil;
		local v7 = {
			Size = p1.Size, 
			BackgroundTransparency = 1
		};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 6)
			}), u1.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.4), 
				Text = "<b><font color=\"" .. l__ColorUtil__2.richTextColor(l__BPRewardDisplayMeta__3[l__BPRewardDisplayType__4.KIT].borderColor) .. "\">5 Kits</font>, <font color=\"" .. l__ColorUtil__2.richTextColor(l__BPRewardDisplayMeta__3[l__BPRewardDisplayType__4.KILL_EFFECT].borderColor) .. "\">3 Kill Effects</font>, <font color=\"" .. l__ColorUtil__2.richTextColor(l__BPRewardDisplayMeta__3[l__BPRewardDisplayType__4.KIT_SKIN].borderColor) .. "\">2 Kit Skins</font>, <font color=\"" .. l__ColorUtil__2.richTextColor(l__BPRewardDisplayMeta__3[l__BPRewardDisplayType__4.LOBBY_GADGET].borderColor) .. "\">3 Lobby Gadgets</font>, 3 Dance Emotes, 35 Image Emotes, & 21 Titles!</b>", 
				TextXAlignment = "Center", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__ColorUtil__2.WHITE, 
				BackgroundTransparency = 1
			}) };
		local v11 = not p1.store.BattlePass.paid and u1.createElement(l__ButtonComponent__5, {
			Text = "\240\159\142\159\239\184\143  BUY BATTLE PASS", 
			Size = UDim2.new(1, 0, 0, 32), 
			OnClick = function()
				l__KnitClient__6.Controllers.BattlePassController:promptBattlePassPurchase();
			end, 
			CornerRadius = UDim.new(0, 5), 
			TextSize = 18, 
			BackgroundColor3 = l__Theme__7.backgroundSuccess
		});
		if v11 then
			v10[#v10 + 1] = v11;
		end;
		v10[#v10 + 1] = u1.createElement(l__ButtonComponent__5, {
			Text = "\240\159\142\129  GIFT BATTLE PASS", 
			Size = UDim2.new(1, 0, 0, 32), 
			OnClick = function()
				l__Flamework__8.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__9.GIFTING, {
					GiftType = l__GiftType__10.BattlePass
				});
			end, 
			CornerRadius = UDim.new(0, 5), 
			TextSize = 18, 
			BackgroundColor3 = l__ColorUtil__2.hexColor(13934614)
		});
		return u1.createFragment({
			BattlePassPurchaseButtons = u1.createElement("Frame", v7, v10)
		});
	end)
};
