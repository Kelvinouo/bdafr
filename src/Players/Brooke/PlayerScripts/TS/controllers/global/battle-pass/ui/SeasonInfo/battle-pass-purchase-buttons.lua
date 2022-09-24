-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BattlePassRewards__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local l__BattlePassUtils__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__EmoteMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v2.ColorUtil;
local l__BPRewardDisplayMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__BPRewardDisplayType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-type").BPRewardDisplayType;
local l__ButtonComponent__8 = v2.ButtonComponent;
local l__KnitClient__9 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Flamework__11 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__GiftType__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
return {
	BattlePassPurchaseButtons = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3 = nil;
		local l__useState__4 = p2.useState;
		local v5 = {};
		for v6, v7 in pairs(p1) do
			v5[v6] = v7;
		end;
		v5.store = nil;
		local v8 = l__BattlePassRewards__1[l__BattlePassUtils__2.BATTLE_PASS_SEASON];
		local function v9(p3, p4)
			if p4.emote then
				if l__EmoteMeta__3[p4.emote].animation then
					p3.animatedEmotes = p3.animatedEmotes + 1;
					return p3;
				else
					p3.imageEmotes = p3.imageEmotes + 1;
					return p3;
				end;
			end;
			if p4.killEffect then
				p3.killEffects = p3.killEffects + 1;
				return p3;
			end;
			local v10 = p4.kit;
			if not v10 then
				local v11 = p4.comingSoon;
				if v11 ~= nil then
					v11 = v11.kit;
				end;
				v10 = v11;
			end;
			if v10 then
				p3.kits = p3.kits + 1;
				return p3;
			end;
			if p4.kitSkin then
				p3.kitSkins = p3.kitSkins + 1;
				return p3;
			end;
			if p4.lobbyGadget then
				p3.lobbyGadgets = p3.lobbyGadgets + 1;
				return p3;
			end;
			if p4.title then
				p3.titles = p3.titles + 1;
			end;
			return p3;
		end;
		v3 = {
			titles = 0, 
			killEffects = 0, 
			imageEmotes = 0, 
			animatedEmotes = 0, 
			kitSkins = 0, 
			kits = 0, 
			lobbyGadgets = 0
		};
		for v12 = 1, #v8 do
			v3 = v9(v3, v8[v12], v12 - 1, v8);
		end;
		local v13 = {
			Size = p1.Size, 
			BackgroundTransparency = 1
		};
		for v14, v15 in pairs(v5) do
			v13[v14] = v15;
		end;
		local v16 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				Padding = UDim.new(0, 6)
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.4), 
				Text = "<b><font color=\"" .. l__ColorUtil__5.richTextColor(l__BPRewardDisplayMeta__6[l__BPRewardDisplayType__7.KIT].borderColor) .. "\">" .. tostring(local v17.kits) .. " Kits</font>, <font color=\"" .. l__ColorUtil__5.richTextColor(l__BPRewardDisplayMeta__6[l__BPRewardDisplayType__7.KILL_EFFECT].borderColor) .. "\">" .. tostring(v17.killEffects) .. " Kill Effects</font>, <font color=\"" .. l__ColorUtil__5.richTextColor(l__BPRewardDisplayMeta__6[l__BPRewardDisplayType__7.LOBBY_GADGET].borderColor) .. "\">" .. tostring(v17.lobbyGadgets) .. " Lobby Gadgets</font>, <font color=\"" .. l__ColorUtil__5.richTextColor(l__BPRewardDisplayMeta__6[l__BPRewardDisplayType__7.EMOTE].borderColor) .. "\">" .. tostring(v17.animatedEmotes) .. " Animated Emotes</font>, " .. tostring(v17.imageEmotes) .. " Image Emotes, & " .. tostring(v17.titles) .. " Titles!</b>", 
				TextXAlignment = "Center", 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = l__ColorUtil__5.WHITE, 
				BackgroundTransparency = 1
			}) };
		local v18 = not p1.store.BattlePass.paid and u4.createElement(l__ButtonComponent__8, {
			Text = "\240\159\142\159\239\184\143  BUY BATTLE PASS", 
			Size = UDim2.new(1, 0, 0, 32), 
			OnClick = function()
				l__KnitClient__9.Controllers.BattlePassController:promptBattlePassPurchase();
			end, 
			CornerRadius = UDim.new(0, 5), 
			TextSize = 18, 
			BackgroundColor3 = l__Theme__10.backgroundSuccess
		});
		if v18 then
			v16[#v16 + 1] = v18;
		end;
		v16[#v16 + 1] = u4.createElement(l__ButtonComponent__8, {
			Text = "\240\159\142\129  GIFT BATTLE PASS", 
			Size = UDim2.new(1, 0, 0, 32), 
			OnClick = function()
				l__Flamework__11.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__12.GIFTING, {
					GiftType = l__GiftType__13.BattlePass
				});
			end, 
			CornerRadius = UDim.new(0, 5), 
			TextSize = 18, 
			BackgroundColor3 = l__ColorUtil__5.hexColor(13934614)
		});
		return u4.createFragment({
			BattlePassPurchaseButtons = u4.createElement("Frame", v13, v16)
		});
	end)
};
