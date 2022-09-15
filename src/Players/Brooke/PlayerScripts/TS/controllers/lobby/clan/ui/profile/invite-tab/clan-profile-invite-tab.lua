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
			local v6 = {};
			local v7 = 0;
			local v8, v9, v10 = ipairs((l__Players__3:GetPlayers()));
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				if v9 ~= l__Players__3.LocalPlayer == true then
					v7 = v7 + 1;
					v6[v7] = v9;
				end;			
			end;
			local v11 = table.create(#v6);
			local v12, v13, v14 = ipairs(v6);
			while true do
				v12(v13, v14);
				if not v12 then
					break;
				end;
				v14 = v12;
				v11[v12] = l__OfflinePlayerUtil__2.getOfflinePlayer(v13);			
			end;
			table.sort(v11, function(p5, p6)
				return p5.displayName < p6.displayName;
			end);
			v5 = v11;
		end;
		if #v5 ~= 0 then
			local v15 = table.create(#v5);
			local v16, v17, v18 = ipairs(v5);
			while true do
				v16(v17, v18);
				if not v16 then
					break;
				end;
				v18 = v16;
				v15[v16] = u4.createElement(l__ClanProfileInviteEntry__5, {
					Player = v17
				});			
			end;
			local v19 = { u4.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 10), 
					SortOrder = "LayoutOrder"
				}) };
			local v20 = #v19;
			local v21, v22, v23 = ipairs(v15);
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				v19[v20 + v21] = v22;			
			end;
			local v24 = u4.createElement(l__AutoCanvasScrollingFrame__6, {
				AdditionalSpace = 80, 
				ScrollingFrameProps = {
					LayoutOrder = 2
				}
			}, v19);
		else
			v24 = u4.createElement("TextLabel", {
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
		local v25 = {};
		v25[#v25 + 1] = v24;
		return u4.createElement(l__ClanProfilePageLayout__8, {
			Title = "INVITE TO CLAN"
		}, v25);
	end)
};
