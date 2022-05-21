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
		local v3 = { "http://www.roblox.com/asset/?id=507766388", "rbxassetid://3338083565", "http://www.roblox.com/asset/?id=913376220", "http://www.roblox.com/asset/?id=5917459365", "http://www.roblox.com/asset/?id=4841405708" };
		if p1.Reward.comingSoon then
			return u1.createFragment({
				RewardShowcase = u1.createElement("Frame", {
					Size = p1.Size, 
					BackgroundTransparency = 1, 
					LayoutOrder = p1.LayoutOrder
				})
			});
		end;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.Reward = nil;
		local v7 = {};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		if p1.Reward.title ~= nil then
			local v10 = {};
			local v11 = l__TitleMeta__2[p1.Reward.title].name;
			if v11 == nil then
				v11 = l__TitleMeta__2[p1.Reward.title].text;
			end;
			v10.Text = v11;
			v10.AnchorPoint = Vector2.new(0.5, 0.5);
			v10.Position = UDim2.fromScale(0.5, 0.5);
			v10.Size = UDim2.new(1, 0, 0, 60);
			v10.TextScaled = true;
			v10.TextColor3 = l__TitleMeta__2[p1.Reward.title].color or l__LobbyTitleDefaults__3.color;
			v10.Font = l__TitleMeta__2[p1.Reward.title].font or l__LobbyTitleDefaults__3.font;
			v10.BackgroundColor3 = l__TitleMeta__2[p1.Reward.title].backgroundColor or l__LobbyTitleDefaults__3.backgroundColor;
			v10.BorderSizePixel = 0;
			local v12 = l__TitleMeta__2[p1.Reward.title].backgroundTransparency;
			if v12 == nil then
				v12 = l__LobbyTitleDefaults__3.backgroundTransparency;
			end;
			v10.BackgroundTransparency = v12;
			v10.RichText = true;
			local v13 = u1.createElement("TextLabel", v10, { u1.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 4), 
					PaddingBottom = UDim.new(0, 4), 
					PaddingRight = UDim.new(0, 6), 
					PaddingLeft = UDim.new(0, 6)
				}) });
		elseif p1.Reward.kit then
			v13 = u1.createElement(l__KitViewport__4, {
				Kit = p1.Reward.kit
			});
		elseif p1.Reward.kitSkin then
			v13 = u1.createElement(l__KitViewport__4, {
				Kit = l__BedwarsKitSkinMeta__5[p1.Reward.kitSkin].kit, 
				Skin = p1.Reward.kitSkin
			});
		elseif p1.Reward.emote then
			v13 = u1.createElement(l__EmoteShowcase__6, {
				Size = UDim2.fromScale(1, 1), 
				Emote = p1.Reward.emote, 
				PlaySound = true
			});
		else
			if not p1.Reward.killEffect then
				local v14 = p1.Reward.lobbyGadget and u1.createFragment({
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
				v14 = u1.createFragment({
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
			v13 = v14;
		end;
		local v15 = {};
		if v13 then
			v15[#v15 + 1] = v13;
		end;
		return u1.createFragment({
			RewardShowcase = u1.createElement(l__Empty__8, v7, v15)
		});
	end)
};
