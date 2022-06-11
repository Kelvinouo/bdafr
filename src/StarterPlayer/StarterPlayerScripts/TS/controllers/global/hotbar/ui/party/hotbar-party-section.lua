-- Script Hash: f1b95f971dabcd0b76363b5921da86242a241dc67e79b453b9f3ce8c1ee085b815b1d23c62a7711c55a798ea9e3ccd44
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("HotbarPartySection");
function v4.init(p1)

end;
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__Empty__2 = v2.Empty;
local l__HotbarButton__3 = v1.import(script, script.Parent.Parent, "hotbar-button").HotbarButton;
local l__BattlePassUtils__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__Flamework__5 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ShineEffect__7 = v2.ShineEffect;
local l__ColorUtil__8 = v2.ColorUtil;
local l__ImageId__9 = v2.ImageId;
local l__Theme__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsImageId__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__HotbarPartyMemberList__12 = v1.import(script, script.Parent, "hotbar-party-member-list").HotbarPartyMemberList;
local l__HotbarPartyButton__13 = v1.import(script, script.Parent, "hotbar-party-button").HotbarPartyButton;
local l__Party__14 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).Party;
local l__HotbarKitButton__15 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-button").HotbarKitButton;
local l__HotbarKitViewport__16 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport;
function v4.render(p2)
	local v5 = #p2.props.store.Party.members + 1;
	local v6 = "Invites";
	local v7 = #p2.props.store.PartyInvites.incomingInvites;
	if v7 > 0 then
		v6 = "Invites (" .. tostring(v7) .. ")";
	end;
	local v8 = {};
	if l__DeviceUtil__1.isSmallScreen() then
		local v9 = 0.95;
	else
		v9 = 0.82;
	end;
	v8.Size = UDim2.fromScale(1, v9);
	v8.Position = UDim2.fromScale(0.5, -0.2);
	v8.AnchorPoint = Vector2.new(0.5, 1);
	v8.BorderSizePixel = 1;
	v8.BackgroundTransparency = 1;
	local v10 = {};
	local v11 = {
		Size = UDim2.fromScale(1, 1)
	};
	if l__DeviceUtil__1.isSmallScreen() then
		local v12 = -0.65;
	else
		v12 = -0.7;
	end;
	v11.Position = UDim2.fromScale(0, v12);
	local v13 = {};
	local v14 = { (v3.createElement(l__ShineEffect__7)) };
	local v15 = {};
	local v16 = {};
	if l__DeviceUtil__1.isSmallScreen() then
		local v17 = 0.4;
	else
		v17 = 0.5;
	end;
	v16.Size = UDim2.fromScale(0.8, v17);
	v16.Position = UDim2.fromScale(0.5, 0.5);
	v16.AnchorPoint = Vector2.new(0.5, 0.5);
	v16.Text = "<b>NEW!</b>";
	v16.RichText = true;
	v16.TextScaled = true;
	v16.TextColor3 = l__ColorUtil__8.WHITE;
	v16.BackgroundTransparency = 1;
	v15[1] = v3.createElement("UIAspectRatioConstraint", {
		AspectRatio = 1
	});
	v15[2] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(1, 0)
	});
	v15[3] = v3.createElement("TextLabel", v16);
	v14.NewBattlePassBadge = v3.createElement("Frame", {
		Size = UDim2.fromScale(1, 1), 
		SizeConstraint = "RelativeYY", 
		BackgroundColor3 = Color3.fromRGB(255, 23, 23), 
		BorderSizePixel = 0, 
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, v15);
	local v18 = {
		Text = "Missions", 
		Icon = l__ImageId__9.SCROLL_SOLID, 
		AspectRatio = 4.469387755102041
	};
	function v18.OnClick()
		l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.MISSIONS, {
			store = p2.props.store
		});
	end;
	v18.BackgroundColor = l__Theme__10.backgroundSuccess;
	v18.LayoutOrder = 1;
	v13[1] = v3.createElement("UIListLayout", {
		FillDirection = "Horizontal", 
		VerticalAlignment = "Bottom", 
		HorizontalAlignment = "Center", 
		SortOrder = "LayoutOrder", 
		Padding = UDim.new(0.03, 0)
	});
	v13[2] = v3.createElement(l__HotbarButton__3, {
		Text = "Battle Pass", 
		Icon = l__BattlePassUtils__4.BATTLE_PASS_ICON, 
		IconSize = UDim2.fromScale(0.6, 0.6), 
		AspectRatio = 4.469387755102041, 
		OnClick = function()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.BATTLEPASS, {});
		end, 
		BackgroundColor = Color3.fromRGB(22, 103, 198), 
		LayoutOrder = 0
	}, v14);
	v13[3] = v3.createElement(l__HotbarButton__3, v18);
	v13[4] = v3.createElement(l__HotbarButton__3, {
		Text = "Locker", 
		Icon = l__ImageId__9.BOX_OPEN_SLOID, 
		AspectRatio = 3.4693877551020407, 
		OnClick = function()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.LOCKER, {});
		end, 
		BackgroundColor = Color3.fromRGB(69, 84, 247), 
		LayoutOrder = 2
	});
	v13[5] = v3.createElement(l__HotbarButton__3, {
		Text = "Clan", 
		Icon = l__BedwarsImageId__11.CLAN, 
		AspectRatio = 3.4693877551020407, 
		OnClick = function()
			local l__myClanId__19 = p2.props.store.Clans.myClanId;
			if l__myClanId__19 == "" or not l__myClanId__19 then
				l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.CLAN_MENU, {});
				return;
			end;
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.CLAN_PROFILE, {
				ClanId = p2.props.store.Clans.myClanId
			});
		end, 
		BackgroundColor = Color3.fromRGB(69, 84, 247), 
		LayoutOrder = 3
	});
	local v20 = {};
	local v21 = {};
	local v22 = {};
	if v5 > 1 then
		local v23 = "<b>Party (" .. tostring(v5) .. "/" .. tostring(l__Party__14.MAX_SIZE) .. ")</b>";
	else
		v23 = "<b>Create Party</b>";
	end;
	v22.Text = v23;
	v22.Image = l__ImageId__9.PARTY;
	function v22.OnClick()
		l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.PARTY, {});
	end;
	v22.LayoutOrder = 1;
	v21[1] = v3.createElement("UIListLayout", {
		FillDirection = "Horizontal", 
		VerticalAlignment = "Bottom", 
		HorizontalAlignment = "Center", 
		SortOrder = "LayoutOrder"
	});
	v21[2] = v3.createElement(l__HotbarPartyButton__13, v22);
	v21[3] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(0.03, 0), 
		LayoutOrder = 2
	});
	v21[4] = v3.createElement(l__HotbarPartyButton__13, {
		Text = "<b>" .. v6 .. "</b>", 
		Image = l__ImageId__9.BELL, 
		OnClick = function()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.PARTY_INVITES, {});
		end, 
		LayoutOrder = 3
	});
	v21[5] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(0.03, 0), 
		LayoutOrder = 4
	});
	v21[6] = v3.createElement(l__HotbarKitButton__15, {
		store = p2.props.store, 
		LayoutOrder = 5
	});
	v20[1] = v3.createElement(l__HotbarPartyMemberList__12, {
		store = p2.props.store, 
		AnchorPoint = Vector2.new(0, 0.5), 
		Position = UDim2.fromScale(0, 0.5), 
		LayoutOrder = 1
	});
	v20[2] = v3.createElement(l__Empty__2, {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.8, 1)
	}, v21);
	v20[3] = v3.createElement(l__HotbarKitViewport__16, {
		store = p2.props.store, 
		AnchorPoint = Vector2.new(1, 1), 
		Position = UDim2.fromScale(1, 1)
	});
	v10[1] = v3.createElement(l__Empty__2, v11, v13);
	v10[2] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(1, 1)
	}, v20);
	return v3.createElement("Frame", v8, v10);
end;
return {
	HotbarPartySection = v4
};
