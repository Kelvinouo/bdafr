-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__OfflinePlayerUtil__2 = v2.OfflinePlayerUtil;
local l__Players__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ClanProfileInviteEntry__5 = v1.import(script, script.Parent, "clan-profile-invite-entry").ClanProfileInviteEntry;
local l__AutoCanvasScrollingFrame__6 = v2.AutoCanvasScrollingFrame;
local l__Theme__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ClanProfilePageLayout__8 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
return {
	ClanProfileInviteTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		if l__DeviceUtil__1.isHoarceKat() then
			local v4 = { l__OfflinePlayerUtil__2.Dummy.SnickTrix, l__OfflinePlayerUtil__2.Dummy.spleenhook, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99, l__OfflinePlayerUtil__2.Dummy.grilme99 };
			table.sort(v4, function(p3, p4)
				return p3.displayName < p4.displayName;
			end);
			local v5 = v4;
		else
			local v6 = l__Players__3:GetPlayers();
			local function v7(p5)
				return p5 ~= l__Players__3.LocalPlayer;
			end;
			local v8 = {};
			local v9 = 0;
			for v10, v11 in ipairs(v6) do
				if v7(v11, v10 - 1, v6) == true then
					v9 = v9 + 1;
					v8[v9] = v11;
				end;
			end;
			local function v12(p6)
				return l__OfflinePlayerUtil__2.getOfflinePlayer(p6);
			end;
			local v13 = table.create(#v8);
			for v14, v15 in ipairs(v8) do
				v13[v14] = v12(v15, v14 - 1, v8);
			end;
			table.sort(v13, function(p7, p8)
				return p7.displayName < p8.displayName;
			end);
			v5 = v13;
		end;
		if #v5 ~= 0 then
			local function v16(p9)
				return u4.createElement(l__ClanProfileInviteEntry__5, {
					Player = p9
				});
			end;
			local v17 = table.create(#v5);
			for v18, v19 in ipairs(v5) do
				v17[v18] = v16(v19, v18 - 1, v5);
			end;
			local v20 = {
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1, 
				AdditionalSpace = 80, 
				LayoutOrder = 2
			};
			local v21 = { u4.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 10), 
					SortOrder = "LayoutOrder"
				}) };
			local v22 = #v21;
			for v23, v24 in ipairs(v17) do
				v21[v22 + v23] = v24;
			end;
			local v25 = u4.createElement(l__AutoCanvasScrollingFrame__6, v20, v21);
		else
			v25 = u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.9), 
				Text = "<b>No players in your current server to invite.</b>", 
				TextColor3 = l__Theme__7.textPrimary, 
				TextXAlignment = "Center", 
				TextYAlignment = "Center", 
				BackgroundTransparency = 1, 
				TextTransparency = 0, 
				BorderSizePixel = 0, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				LayoutOrder = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 24
				}) });
		end;
		local v26 = {};
		v26[#v26 + 1] = v25;
		return u4.createElement(l__ClanProfilePageLayout__8, {
			Title = "INVITE TO CLAN"
		}, v26);
	end)
};
