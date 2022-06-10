-- Script Hash: d048c073f79682f8f7732f190ef177a0b57dea102d636609281e834f9d4d0f713670789e90699d33ed694fa32fddc4dc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__getBedwarsKitMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local l__KillEffectMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__EmoteMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__TitleMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
local l__LobbyGadgetMeta__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__BedwarsKitSkinMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BPRewardDisplayType__8 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-type").BPRewardDisplayType;
local l__BPRewardDisplayMeta__9 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__ColorUtil__10 = v2.ColorUtil;
local u11 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__13 = v2.Empty;
local l__ButtonComponent__14 = v2.ButtonComponent;
local l__KnitClient__15 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__IconButton__16 = v2.IconButton;
local l__Flamework__17 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__BedwarsImageId__19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__TooltipContainer__20 = v2.TooltipContainer;
local l__AutoSizedText__21 = v2.AutoSizedText;
return {
	BattlePassRewardInfoCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u11)(function(p1, p2)
		local v3 = p1.Reward.level <= p1.BattlePass.level;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.BattlePass = nil;
		v4.Reward = nil;
		local v7 = {
			BackgroundColor3 = l__ColorUtil__10.BLACK, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0.4, 
			ZIndex = 100
		};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = { u11.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 16), 
				PaddingBottom = UDim.new(0, 16), 
				PaddingLeft = UDim.new(0, 16), 
				PaddingRight = UDim.new(0, 16)
			}), u11.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}) };
		local v11 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		local v12 = { u11.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 4)
			}), u11.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 18), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				Text = "<b>" .. (function()
					local v13 = "";
					local l__comingSoon__14 = p1.Reward.comingSoon;
					if l__comingSoon__14 then
						local v15 = u7.values(l__BPRewardDisplayType__8);
						local function v16(p3)
							return l__comingSoon__14[p3] ~= nil;
						end;
						local v17 = nil;
						for v18, v19 in ipairs(v15) do
							if v16(v19, v18 - 1, v15) == true then
								v17 = v19;
								break;
							end;
						end;
						if v17 then
							return l__BPRewardDisplayMeta__9[v17].name;
						end;
					end;
					if p1.Reward.kit then
						return "Kit";
					end;
					if p1.Reward.killEffect then
						return "Kill Effect";
					end;
					if p1.Reward.emote then
						return "Emote";
					end;
					if p1.Reward.title then
						return "Lobby Title";
					end;
					if p1.Reward.lobbyGadget then
						return "Lobby Gadget";
					end;
					if p1.Reward.kitSkin then
						v13 = "Kit Skin";
					end;
					return v13;
				end)() .. "</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__Theme__12.textPrimary, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 18, 
				LayoutOrder = 1, 
				ZIndex = 100
			}), u11.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 18), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				Text = "<b>" .. (function()
					local v20 = "";
					if p1.Reward.comingSoon then
						return "Coming Soon";
					end;
					if p1.Reward.kit then
						return l__getBedwarsKitMeta__1(p1.Reward.kit).name;
					end;
					if p1.Reward.killEffect then
						return l__KillEffectMeta__2[p1.Reward.killEffect].name;
					end;
					if p1.Reward.emote then
						return l__EmoteMeta__3[p1.Reward.emote].name;
					end;
					if p1.Reward.title then
						local v21 = l__TitleMeta__4[p1.Reward.title].name;
						if v21 == nil then
							v21 = l__TitleMeta__4[p1.Reward.title].text;
						end;
						return v21;
					end;
					if p1.Reward.lobbyGadget then
						return l__LobbyGadgetMeta__5[p1.Reward.lobbyGadget].name;
					end;
					if p1.Reward.kitSkin then
						v20 = l__BedwarsKitSkinMeta__6[p1.Reward.kitSkin].name;
					end;
					return v20;
				end)() .. "</b>", 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__10.WHITE, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 22, 
				LayoutOrder = 2, 
				ZIndex = 100
			}) };
		local v22 = {
			Size = UDim2.new(1, 0, 0, 18), 
			AutomaticSize = Enum.AutomaticSize.XY, 
			BackgroundTransparency = 1, 
			LayoutOrder = 3
		};
		local v23 = { u11.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v24 = not v3 and u11.createFragment({
			RequiresLevelText = u11.createElement("TextLabel", {
				Size = UDim2.new(1, 0, 0, 16), 
				AutomaticSize = Enum.AutomaticSize.X, 
				BackgroundTransparency = 1, 
				TextTransparency = 0.3, 
				Text = "Requires Level " .. tostring(p1.Reward.level), 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextColor3 = l__ColorUtil__10.WHITE, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 16, 
				LayoutOrder = 1, 
				ZIndex = 100
			})
		});
		if v24 then
			v23[#v23 + 1] = v24;
		end;
		local v25 = {
			Size = UDim2.new(1, 0, 0, 16), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			TextTransparency = 0.3
		};
		if not p1.BattlePass.paid and p1.Reward.paid then
			local v26 = "Requires Battle Pass";
		elseif v3 then
			v26 = "Claimed";
		else
			v26 = "";
		end;
		v25.Text = v26;
		v25.TextXAlignment = Enum.TextXAlignment.Left;
		v25.TextColor3 = l__ColorUtil__10.WHITE;
		v25.RichText = true;
		v25.Font = Enum.Font.Roboto;
		v25.TextSize = 16;
		v25.LayoutOrder = 2;
		v25.ZIndex = 100;
		v23[#v23 + 1] = u11.createElement("TextLabel", v25);
		v12[#v12 + 1] = u11.createElement("Frame", v22, v23);
		v10.CardInfo = u11.createElement(l__Empty__13, v11, v12);
		local v27 = { u11.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v28 = p1.BattlePass.paid and (not v3 and u11.createElement(l__ButtonComponent__14, {
			Text = "PURCHASE " .. tostring(p1.Reward.level - p1.BattlePass.level) .. " LEVELS", 
			Size = UDim2.new(0.85, 0, 0, 32), 
			OnClick = function()
				l__KnitClient__15.Controllers.BattlePassController:promptPurchaseToLevel(p1.Reward.level);
			end, 
			CornerRadius = UDim.new(0, 5), 
			TextSize = 14, 
			BackgroundColor3 = l__Theme__12.backgroundSuccess, 
			LayoutOrder = 1, 
			ZIndex = 120
		}));
		if v28 then
			v27[#v27 + 1] = v28;
		end;
		local v29 = p1.Reward.kit and u11.createElement(l__IconButton__16, {
			Size = UDim2.new(0.1, 0, 0, 32), 
			OnClick = function()
				l__Flamework__17.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__18.KIT_SHOP, {
					SelectedKit = p1.Reward.kit
				});
			end, 
			Image = l__BedwarsImageId__19.EYE_REGULAR, 
			IconProps = {
				ScaleType = "Fit"
			}, 
			ZIndex = 120, 
			LayoutOrder = 2
		}, { u11.createElement(l__TooltipContainer__20, {}, { u11.createElement(l__AutoSizedText__21, {
					Text = "Open Kit Shop", 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}), u11.createElement(l__AutoSizedText__21, {
					Text = l__getBedwarsKitMeta__1(p1.Reward.kit).name, 
					Font = Enum.Font.SourceSansSemibold, 
					TextSize = 14, 
					Limits = Vector2.new(300, 500)
				}) }) });
		if v29 then
			v27[#v27 + 1] = v29;
		end;
		v10.CardButtons = u11.createElement(l__Empty__13, {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.new(0, 0, 1, 0), 
			Size = UDim2.new(1, 0, 0, 32), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			ZIndex = 120
		}, v27);
		return u11.createFragment({
			RewardInfoCard = u11.createElement("Frame", v7, v10)
		});
	end)
};
