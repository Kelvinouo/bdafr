-- Script Hash: 8201dae02a36b3cb9628db7a57319322359ea94f912dac6ab8c97e20bec8b6c6eb9f66da44e109b99d7ded69d3113f3d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta");
local l__ColorUtil__1 = v2.ColorUtil;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BPRewardDisplayMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__EmoteMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BPRewardDisplayType__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-type").BPRewardDisplayType;
local l__TweenService__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__LobbyTitleDefaults__9 = v3.LobbyTitleDefaults;
local l__TitleMeta__10 = v3.TitleMeta;
local l__KillEffectMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__BattlePassUtils__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__KitViewport__13 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__BedwarsKitSkinMeta__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__EmoteShowcase__15 = v1.import(script, script.Parent.Parent, "RewardShowcase", "emote-showcase").EmoteShowcase;
local l__EmptyButton__16 = v2.EmptyButton;
return {
	BattlePassRewardsListReward = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local v4 = {
			name = "", 
			borderColor = l__ColorUtil__1.darken(l__Theme__2.backgroundSecondary, 0.8), 
			backgroundColor = l__Theme__2.backgroundTertiary, 
			frameSize = UDim2.new(0, 75, 0, 75)
		};
		local v5 = v4;
		local l__comingSoon__6 = p1.Reward.comingSoon;
		if p1.RewardDisplayType then
			v5 = l__BPRewardDisplayMeta__3[p1.RewardDisplayType];
			if p1.Reward.emote and not l__EmoteMeta__4[p1.Reward.emote].animation then
				v5 = v4;
			end;
		elseif l__comingSoon__6 then
			local v7 = u5.values(l__BPRewardDisplayType__6);
			local function v8(p3)
				return l__comingSoon__6[p3] ~= nil;
			end;
			local v9 = nil;
			for v10, v11 in ipairs(v7) do
				if v8(v11, v10 - 1, v7) == true then
					v9 = v11;
					break;
				end;
			end;
			if v9 then
				v5 = l__BPRewardDisplayMeta__3[v9];
			end;
		end;
		local u17 = nil;
		p2.useEffect(function()
			local v12 = u17:getValue();
			if v12 then
				l__TweenService__7:Create(v12, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, -1, true), {
					Offset = Vector2.new(1, 0)
				}):Play();
			end;
		end, {});
		u17 = u8.createRef();
		local v13 = {
			Size = v5.frameSize or v4.frameSize, 
			BackgroundTransparency = 0, 
			BackgroundColor3 = l__Theme__2.backgroundSecondary, 
			LayoutOrder = p1.LayoutOrder
		};
		v13[u8.Event.MouseEnter] = function()
			p1.SetReward(p1.Reward);
			p1.SetActive(p1.Reward);
		end;
		local v14 = {};
		local v15 = {};
		if p1.Active == p1.Reward then
			local v16 = l__ColorUtil__1.WHITE;
		else
			v16 = v5.borderColor;
		end;
		v15.Color = v16;
		v15.Thickness = 2;
		v14[1] = u8.createElement("UIStroke", v15);
		v14[2] = u8.createElement("UICorner", {
			CornerRadius = UDim.new(0)
		});
		local v17 = v5.frameShine and u8.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v5.backgroundColor, 
			BackgroundTransparency = 0.4, 
			BorderSizePixel = 0
		}, { u8.createElement("UIGradient", {
				Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v5.backgroundColor), ColorSequenceKeypoint.new(0.3, l__ColorUtil__1.brighten(v5.backgroundColor, 1)), ColorSequenceKeypoint.new(0.5, l__ColorUtil__1.brighten(v5.backgroundColor, 1)), ColorSequenceKeypoint.new(0.7, l__ColorUtil__1.brighten(v5.backgroundColor, 1)), ColorSequenceKeypoint.new(1, v5.backgroundColor) }), 
				[u8.Ref] = u17, 
				Offset = Vector2.new(-1, 0), 
				Rotation = 45
			}) });
		if v17 then
			v14[#v14 + 1] = v17;
		end;
		if l__comingSoon__6 then
			local v18 = {
				Text = "Coming Soon", 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.new(1, 0, 0, 40), 
				TextScaled = true, 
				TextColor3 = l__LobbyTitleDefaults__9.color
			};
			if p1.Locked then
				local v19 = 0.6;
			else
				v19 = 0;
			end;
			v18.TextTransparency = v19;
			v18.Font = l__LobbyTitleDefaults__9.font;
			v18.RichText = true;
			v18.BackgroundColor3 = l__LobbyTitleDefaults__9.backgroundColor;
			v18.BorderSizePixel = 0;
			v18.BackgroundTransparency = l__LobbyTitleDefaults__9.backgroundTransparency;
			local v20 = u8.createElement("TextLabel", v18, { u8.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 4), 
					PaddingBottom = UDim.new(0, 4), 
					PaddingRight = UDim.new(0, 6), 
					PaddingLeft = UDim.new(0, 6)
				}) });
		else
			if p1.Reward.title ~= nil then
				local v21 = {};
				local v22 = l__TitleMeta__10[p1.Reward.title].name;
				if v22 == nil then
					v22 = l__TitleMeta__10[p1.Reward.title].text;
				end;
				v21.Text = v22;
				v21.AnchorPoint = Vector2.new(0.5, 0.5);
				v21.Position = UDim2.fromScale(0.5, 0.5);
				v21.Size = UDim2.new(1, 0, 0, 40);
				v21.TextScaled = true;
				v21.TextColor3 = l__TitleMeta__10[p1.Reward.title].color or l__LobbyTitleDefaults__9.color;
				if p1.Locked then
					local v23 = 0.6;
				else
					v23 = 0;
				end;
				v21.TextTransparency = v23;
				v21.Font = l__TitleMeta__10[p1.Reward.title].font or l__LobbyTitleDefaults__9.font;
				v21.RichText = true;
				v21.BackgroundColor3 = l__TitleMeta__10[p1.Reward.title].backgroundColor or l__LobbyTitleDefaults__9.backgroundColor;
				v21.BorderSizePixel = 0;
				local v24 = l__TitleMeta__10[p1.Reward.title].backgroundTransparency;
				if v24 == nil then
					v24 = l__LobbyTitleDefaults__9.backgroundTransparency;
				end;
				v21.BackgroundTransparency = v24;
				local v25 = u8.createElement("TextLabel", v21, { u8.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 4), 
						PaddingBottom = UDim.new(0, 4), 
						PaddingRight = UDim.new(0, 6), 
						PaddingLeft = UDim.new(0, 6)
					}) });
			else
				local v26 = p1.Reward.lobbyGadget or p1.Reward.killEffect and l__KillEffectMeta__11[p1.Reward.killEffect].image;
				if v26 ~= "" and v26 then
					local v27 = {
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.fromScale(0.8, 0.8), 
						Image = l__BattlePassUtils__12.getRewardImageId(p1.Reward)
					};
					if p1.Locked then
						local v28 = 0.6;
					else
						v28 = 0;
					end;
					v27.ImageTransparency = v28;
					v27.ScaleType = "Fit";
					v27.BorderSizePixel = 0;
					v27.BackgroundTransparency = 1;
					v25 = u8.createElement("ImageLabel", v27);
				elseif p1.Reward.killEffect then
					local v29 = {
						Text = "<b>" .. l__KillEffectMeta__11[p1.Reward.killEffect].name .. "</b>", 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.new(1, 0, 0, 40), 
						TextScaled = true, 
						TextColor3 = l__ColorUtil__1.WHITE, 
						Font = "Highway"
					};
					if p1.Locked then
						local v30 = 0.4;
					else
						v30 = 0;
					end;
					v29.TextTransparency = v30;
					v29.BorderSizePixel = 0;
					v29.BackgroundTransparency = 1;
					v29.RichText = true;
					v25 = u8.createElement("TextLabel", v29, { u8.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 4), 
							PaddingBottom = UDim.new(0, 4), 
							PaddingRight = UDim.new(0, 6), 
							PaddingLeft = UDim.new(0, 6)
						}) });
				elseif p1.Reward.kit then
					v25 = u8.createFragment({
						RewardShowcase = u8.createElement("Frame", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.9, 0.9), 
							BackgroundTransparency = 1, 
							LayoutOrder = p1.LayoutOrder
						}, { u8.createElement(l__KitViewport__13, {
								Kit = p1.Reward.kit, 
								ImageTransparency = 0
							}) })
					});
				elseif p1.Reward.kitSkin then
					v25 = u8.createFragment({
						RewardShowcase = u8.createElement("Frame", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.9, 0.9), 
							BackgroundTransparency = 1, 
							LayoutOrder = p1.LayoutOrder
						}, { u8.createElement(l__KitViewport__13, {
								Kit = l__BedwarsKitSkinMeta__14[p1.Reward.kitSkin].kit, 
								Skin = p1.Reward.kitSkin, 
								ImageTransparency = 0
							}) })
					});
				else
					v25 = p1.Reward.emote and u8.createElement(l__EmoteShowcase__15, {
						Size = UDim2.fromScale(0.8, 0.8), 
						LayoutOrder = p1.LayoutOrder, 
						Emote = p1.Reward.emote
					});
				end;
			end;
			v20 = v25;
		end;
		if v20 then
			v14[#v14 + 1] = v20;
		end;
		return u8.createFragment({
			LevelRewardFrame = u8.createElement(l__EmptyButton__16, v13, v14)
		});
	end)
};
