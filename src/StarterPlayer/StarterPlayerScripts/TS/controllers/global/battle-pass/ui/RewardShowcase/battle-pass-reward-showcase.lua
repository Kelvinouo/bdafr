-- Script Hash: 61cf67729abfee6bbe7058717e52bc809433c64b92790299cca741cd0d747e9abb06d736fe269e8f55838442d994a28f
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TitleMeta__2 = v2.TitleMeta;
local l__LobbyTitleDefaults__3 = v2.LobbyTitleDefaults;
local l__KitViewport__4 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__BedwarsKitSkinMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__EmoteShowcase__6 = v1.import(script, script.Parent, "emote-showcase").EmoteShowcase;
local l__BattlePassUtils__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__Empty__8 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	BattlePassRewardShowcase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		if p1.Reward.comingSoon then
			return u1.createFragment({
				RewardShowcase = u1.createElement("Frame", {
					Size = p1.Size, 
					BackgroundTransparency = 1, 
					LayoutOrder = p1.LayoutOrder
				})
			});
		end;
		local v3 = {};
		for v4, v5 in pairs(p1) do
			v3[v4] = v5;
		end;
		v3.Reward = nil;
		local v6 = {};
		for v7, v8 in pairs(v3) do
			v6[v7] = v8;
		end;
		if p1.Reward.title ~= nil then
			local v9 = {};
			local v10 = l__TitleMeta__2[p1.Reward.title].name;
			if v10 == nil then
				v10 = l__TitleMeta__2[p1.Reward.title].text;
			end;
			v9.Text = v10;
			v9.AnchorPoint = Vector2.new(0.5, 0.5);
			v9.Position = UDim2.fromScale(0.5, 0.5);
			v9.Size = UDim2.new(1, 0, 0, 60);
			v9.TextScaled = true;
			v9.TextColor3 = l__TitleMeta__2[p1.Reward.title].color or l__LobbyTitleDefaults__3.color;
			v9.Font = l__TitleMeta__2[p1.Reward.title].font or l__LobbyTitleDefaults__3.font;
			v9.BackgroundColor3 = l__TitleMeta__2[p1.Reward.title].backgroundColor or l__LobbyTitleDefaults__3.backgroundColor;
			v9.BorderSizePixel = 0;
			local v11 = l__TitleMeta__2[p1.Reward.title].backgroundTransparency;
			if v11 == nil then
				v11 = l__LobbyTitleDefaults__3.backgroundTransparency;
			end;
			v9.BackgroundTransparency = v11;
			v9.RichText = true;
			local v12 = u1.createElement("TextLabel", v9, { u1.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 4), 
					PaddingBottom = UDim.new(0, 4), 
					PaddingRight = UDim.new(0, 6), 
					PaddingLeft = UDim.new(0, 6)
				}) });
		elseif p1.Reward.kit then
			v12 = u1.createElement(l__KitViewport__4, {
				Kit = p1.Reward.kit
			});
		elseif p1.Reward.kitSkin then
			v12 = u1.createElement(l__KitViewport__4, {
				Kit = l__BedwarsKitSkinMeta__5[p1.Reward.kitSkin].kit, 
				Skin = p1.Reward.kitSkin
			});
		elseif p1.Reward.emote then
			v12 = u1.createElement(l__EmoteShowcase__6, {
				Size = UDim2.fromScale(1, 1), 
				Emote = p1.Reward.emote, 
				PlaySound = true
			});
		else
			if not p1.Reward.killEffect then
				local v13 = p1.Reward.lobbyGadget and u1.createFragment({
					RewardShowcase = u1.createElement("ImageLabel", {
						Image = l__BattlePassUtils__7.getRewardImageId(p1.Reward), 
						Size = UDim2.fromScale(1, 1), 
						ScaleType = "Fit", 
						BackgroundTransparency = 1
					}, { u1.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							HorizontalAlignment = Enum.HorizontalAlignment.Center, 
							VerticalAlignment = Enum.VerticalAlignment.Center
						}) })
				});
			else
				v13 = u1.createFragment({
					RewardShowcase = u1.createElement("ImageLabel", {
						Image = l__BattlePassUtils__7.getRewardImageId(p1.Reward), 
						Size = UDim2.fromScale(1, 1), 
						ScaleType = "Fit", 
						BackgroundTransparency = 1
					}, { u1.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							HorizontalAlignment = Enum.HorizontalAlignment.Center, 
							VerticalAlignment = Enum.VerticalAlignment.Center
						}) })
				});
			end;
			v12 = v13;
		end;
		local v14 = {};
		if v12 then
			v14[#v14 + 1] = v12;
		end;
		return u1.createFragment({
			RewardShowcase = u1.createElement(l__Empty__8, v6, v14)
		});
	end)
};
