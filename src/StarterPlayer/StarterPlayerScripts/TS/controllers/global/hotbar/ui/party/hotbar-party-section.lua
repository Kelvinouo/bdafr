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
local l__ImageId__8 = v2.ImageId;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsImageId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__HotbarPartyMemberList__11 = v1.import(script, script.Parent, "hotbar-party-member-list").HotbarPartyMemberList;
local l__HotbarPartyButton__12 = v1.import(script, script.Parent, "hotbar-party-button").HotbarPartyButton;
local l__Party__13 = v1.import(script, v1.getModule(script, "@easy-games", "lobby").out).Party;
local l__HotbarKitButton__14 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-button").HotbarKitButton;
local l__HotbarKitViewport__15 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport;
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
	local v14 = {
		Text = "Missions", 
		Icon = l__ImageId__8.SCROLL_SOLID, 
		AspectRatio = 4.469387755102041
	};
	function v14.OnClick()
		l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.MISSIONS, {
			store = p2.props.store
		});
	end;
	v14.BackgroundColor = l__Theme__9.backgroundSuccess;
	v14.LayoutOrder = 1;
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
	}, { v3.createElement(l__ShineEffect__7) });
	v13[3] = v3.createElement(l__HotbarButton__3, v14);
	v13[4] = v3.createElement(l__HotbarButton__3, {
		Text = "Locker", 
		Icon = l__ImageId__8.BOX_OPEN_SLOID, 
		AspectRatio = 3.4693877551020407, 
		OnClick = function()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.LOCKER, {});
		end, 
		BackgroundColor = Color3.fromRGB(69, 84, 247), 
		LayoutOrder = 2
	});
	v13[5] = v3.createElement(l__HotbarButton__3, {
		Text = "Clan", 
		Icon = l__BedwarsImageId__10.CLAN, 
		AspectRatio = 3.4693877551020407, 
		OnClick = function()
			local l__myClanId__15 = p2.props.store.Clans.myClanId;
			if l__myClanId__15 == "" or not l__myClanId__15 then
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
	local v16 = {};
	local v17 = {};
	local v18 = {};
	if v5 > 1 then
		local v19 = "<b>Party (" .. tostring(v5) .. "/" .. tostring(l__Party__13.MAX_SIZE) .. ")</b>";
	else
		v19 = "<b>Create Party</b>";
	end;
	v18.Text = v19;
	v18.Image = l__ImageId__8.PARTY;
	function v18.OnClick()
		l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.PARTY, {});
	end;
	v18.LayoutOrder = 1;
	v17[1] = v3.createElement("UIListLayout", {
		FillDirection = "Horizontal", 
		VerticalAlignment = "Bottom", 
		HorizontalAlignment = "Center", 
		SortOrder = "LayoutOrder"
	});
	v17[2] = v3.createElement(l__HotbarPartyButton__12, v18);
	v17[3] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(0.03, 0), 
		LayoutOrder = 2
	});
	v17[4] = v3.createElement(l__HotbarPartyButton__12, {
		Text = "<b>" .. v6 .. "</b>", 
		Image = l__ImageId__8.BELL, 
		OnClick = function()
			l__Flamework__5.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__6.PARTY_INVITES, {});
		end, 
		LayoutOrder = 3
	});
	v17[5] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(0.03, 0), 
		LayoutOrder = 4
	});
	v17[6] = v3.createElement(l__HotbarKitButton__14, {
		store = p2.props.store, 
		LayoutOrder = 5
	});
	v16[1] = v3.createElement(l__HotbarPartyMemberList__11, {
		store = p2.props.store, 
		AnchorPoint = Vector2.new(0, 0.5), 
		Position = UDim2.fromScale(0, 0.5), 
		LayoutOrder = 1
	});
	v16[2] = v3.createElement(l__Empty__2, {
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		Size = UDim2.fromScale(0.8, 1)
	}, v17);
	v16[3] = v3.createElement(l__HotbarKitViewport__15, {
		store = p2.props.store, 
		AnchorPoint = Vector2.new(1, 1), 
		Position = UDim2.fromScale(1, 1)
	});
	v10[1] = v3.createElement(l__Empty__2, v11, v13);
	v10[2] = v3.createElement(l__Empty__2, {
		Size = UDim2.fromScale(1, 1)
	}, v16);
	return v3.createElement("Frame", v8, v10);
end;
return {
	HotbarPartySection = v4
};
