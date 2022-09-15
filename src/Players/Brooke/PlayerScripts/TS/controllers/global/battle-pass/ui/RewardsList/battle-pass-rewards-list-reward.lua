-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta");
local l__ColorUtil__1 = v2.ColorUtil;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BPRewardDisplayMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__EmoteMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BPRewardDisplayType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-type").BPRewardDisplayType;
local l__TweenService__8 = v3.TweenService;
local l__UserInputService__9 = v3.UserInputService;
local l__UIUtil__10 = v2.UIUtil;
local l__LobbyTitleDefaults__11 = v4.LobbyTitleDefaults;
local l__TitleMeta__12 = v4.TitleMeta;
local l__KillEffectMeta__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__BattlePassUtils__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__KitViewport__15 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;
local l__BedwarsKitSkinMeta__16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local l__EmoteShowcase__17 = v1.import(script, script.Parent.Parent, "RewardShowcase", "emote-showcase").EmoteShowcase;
local l__EmptyButton__18 = v2.EmptyButton;
return {
	BattlePassRewardsListReward = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useEffect__5 = p2.useEffect;
		local v6 = {
			name = "", 
			borderColor = l__ColorUtil__1.darken(l__Theme__2.backgroundSecondary, 0.8), 
			backgroundColor = l__Theme__2.backgroundTertiary, 
			frameSize = UDim2.new(0, 75, 0, 75)
		};
		local v7 = v6;
		local l__comingSoon__8 = p1.Reward.comingSoon;
		local v9 = u3.createRef();
		if p1.RewardDisplayType then
			v7 = l__BPRewardDisplayMeta__4[p1.RewardDisplayType];
			if p1.Reward.emote and not l__EmoteMeta__5[p1.Reward.emote].animation then
				v7 = v6;
			end;
		elseif l__comingSoon__8 then
			local v10 = nil;
			local v11, v12, v13 = ipairs((u6.values(l__BPRewardDisplayType__7)));
			while true do
				v11(v12, v13);
				if not v11 then
					break;
				end;
				v13 = v11;
				if l__comingSoon__8[v12] ~= nil == true then
					v10 = v12;
					break;
				end;			
			end;
			if v10 then
				v7 = l__BPRewardDisplayMeta__4[v10];
			end;
		end;
		local u19 = u3.createRef();
		l__useEffect__5(function()
			local v14 = u19:getValue();
			if v14 then
				l__TweenService__8:Create(v14, TweenInfo.new(2.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut, -1, true), {
					Offset = Vector2.new(1, 0)
				}):Play();
			end;
		end, {});
		l__useEffect__5(function()
			if l__UserInputService__9.GamepadEnabled then
				l__UIUtil__10:selectGui(v9:getValue());
			end;
		end, {});
		local v15 = {
			Size = v7.frameSize or v6.frameSize, 
			BackgroundTransparency = 0, 
			BackgroundColor3 = l__Theme__2.backgroundSecondary, 
			LayoutOrder = p1.LayoutOrder
		};
		v15[u3.Event.MouseEnter] = function()
			p1.SetReward(p1.Reward);
			p1.SetActive(p1.Reward);
		end;
		v15.Selectable = true;
		v15[u3.Ref] = v9;
		local v16 = {};
		local v17 = {};
		if p1.Active == p1.Reward then
			local v18 = l__ColorUtil__1.WHITE;
		else
			v18 = v7.borderColor;
		end;
		v17.Color = v18;
		v17.Thickness = 2;
		v16[1] = u3.createElement("UIStroke", v17);
		v16[2] = u3.createElement("UICorner", {
			CornerRadius = UDim.new(0)
		});
		local v19 = v7.frameShine and u3.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			BackgroundColor3 = v7.backgroundColor, 
			BackgroundTransparency = 0.4, 
			BorderSizePixel = 0
		}, { u3.createElement("UIGradient", {
				Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v7.backgroundColor), ColorSequenceKeypoint.new(0.3, l__ColorUtil__1.brighten(v7.backgroundColor, 1)), ColorSequenceKeypoint.new(0.5, l__ColorUtil__1.brighten(v7.backgroundColor, 1)), ColorSequenceKeypoint.new(0.7, l__ColorUtil__1.brighten(v7.backgroundColor, 1)), ColorSequenceKeypoint.new(1, v7.backgroundColor) }), 
				[u3.Ref] = u19, 
				Offset = Vector2.new(-1, 0), 
				Rotation = 45
			}) });
		if v19 then
			v16[#v16 + 1] = v19;
		end;
		if l__comingSoon__8 then
			local v20 = {
				Text = "Coming Soon", 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.new(1, 0, 0, 40), 
				TextScaled = true, 
				TextColor3 = l__LobbyTitleDefaults__11.color
			};
			if p1.Locked then
				local v21 = 0.6;
			else
				v21 = 0;
			end;
			v20.TextTransparency = v21;
			v20.Font = l__LobbyTitleDefaults__11.font;
			v20.RichText = true;
			v20.BackgroundColor3 = l__LobbyTitleDefaults__11.backgroundColor;
			v20.BorderSizePixel = 0;
			v20.BackgroundTransparency = l__LobbyTitleDefaults__11.backgroundTransparency;
			local v22 = u3.createElement("TextLabel", v20, { u3.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 4), 
					PaddingBottom = UDim.new(0, 4), 
					PaddingRight = UDim.new(0, 6), 
					PaddingLeft = UDim.new(0, 6)
				}) });
		else
			if p1.Reward.title ~= nil then
				local v23 = {};
				local v24 = l__TitleMeta__12[p1.Reward.title].name;
				if v24 == nil then
					v24 = l__TitleMeta__12[p1.Reward.title].text;
				end;
				v23.Text = v24;
				v23.AnchorPoint = Vector2.new(0.5, 0.5);
				v23.Position = UDim2.fromScale(0.5, 0.5);
				v23.Size = UDim2.new(1, 0, 0, 40);
				v23.TextScaled = true;
				v23.TextColor3 = l__TitleMeta__12[p1.Reward.title].color or l__LobbyTitleDefaults__11.color;
				if p1.Locked then
					local v25 = 0.6;
				else
					v25 = 0;
				end;
				v23.TextTransparency = v25;
				v23.Font = l__TitleMeta__12[p1.Reward.title].font or l__LobbyTitleDefaults__11.font;
				v23.RichText = true;
				v23.BackgroundColor3 = l__TitleMeta__12[p1.Reward.title].backgroundColor or l__LobbyTitleDefaults__11.backgroundColor;
				v23.BorderSizePixel = 0;
				local v26 = l__TitleMeta__12[p1.Reward.title].backgroundTransparency;
				if v26 == nil then
					v26 = l__LobbyTitleDefaults__11.backgroundTransparency;
				end;
				v23.BackgroundTransparency = v26;
				local v27 = u3.createElement("TextLabel", v23, { u3.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 4), 
						PaddingBottom = UDim.new(0, 4), 
						PaddingRight = UDim.new(0, 6), 
						PaddingLeft = UDim.new(0, 6)
					}) });
			else
				local v28 = p1.Reward.lobbyGadget or p1.Reward.killEffect and l__KillEffectMeta__13[p1.Reward.killEffect].image;
				if v28 ~= "" and v28 then
					local v29 = {
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.fromScale(0.8, 0.8), 
						Image = l__BattlePassUtils__14.getRewardImageId(p1.Reward)
					};
					if p1.Locked then
						local v30 = 0.6;
					else
						v30 = 0;
					end;
					v29.ImageTransparency = v30;
					v29.ScaleType = "Fit";
					v29.BorderSizePixel = 0;
					v29.BackgroundTransparency = 1;
					v27 = u3.createElement("ImageLabel", v29);
				elseif p1.Reward.killEffect then
					local v31 = {
						Text = "<b>" .. l__KillEffectMeta__13[p1.Reward.killEffect].name .. "</b>", 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Size = UDim2.new(1, 0, 0, 40), 
						TextScaled = true, 
						TextColor3 = l__ColorUtil__1.WHITE, 
						Font = "Highway"
					};
					if p1.Locked then
						local v32 = 0.4;
					else
						v32 = 0;
					end;
					v31.TextTransparency = v32;
					v31.BorderSizePixel = 0;
					v31.BackgroundTransparency = 1;
					v31.RichText = true;
					v27 = u3.createElement("TextLabel", v31, { u3.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 4), 
							PaddingBottom = UDim.new(0, 4), 
							PaddingRight = UDim.new(0, 6), 
							PaddingLeft = UDim.new(0, 6)
						}) });
				elseif p1.Reward.kit then
					v27 = u3.createFragment({
						RewardShowcase = u3.createElement("Frame", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.9, 0.9), 
							BackgroundTransparency = 1, 
							LayoutOrder = p1.LayoutOrder
						}, { u3.createElement(l__KitViewport__15, {
								Kit = p1.Reward.kit, 
								ImageTransparency = 0
							}) })
					});
				elseif p1.Reward.kitSkin then
					v27 = u3.createFragment({
						RewardShowcase = u3.createElement("Frame", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.9, 0.9), 
							BackgroundTransparency = 1, 
							LayoutOrder = p1.LayoutOrder
						}, { u3.createElement(l__KitViewport__15, {
								Kit = l__BedwarsKitSkinMeta__16[p1.Reward.kitSkin].kit, 
								Skin = p1.Reward.kitSkin, 
								ImageTransparency = 0
							}) })
					});
				else
					v27 = p1.Reward.emote and u3.createElement(l__EmoteShowcase__17, {
						Size = UDim2.fromScale(0.8, 0.8), 
						LayoutOrder = p1.LayoutOrder, 
						Emote = p1.Reward.emote
					});
				end;
			end;
			v22 = v27;
		end;
		if v22 then
			v16[#v16 + 1] = v22;
		end;
		return u3.createFragment({
			LevelRewardFrame = u3.createElement(l__EmptyButton__18, v15, v16)
		});
	end)
};
