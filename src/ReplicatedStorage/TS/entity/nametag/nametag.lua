-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__CollectionService__1 = v2.CollectionService;
local l__Players__2 = v2.Players;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__KnitServer__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitServer;
local l__RankDistribution__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local l__RankMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__HostPanelGeneralToggle__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").HostPanelGeneralToggle;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__NameTagWinStreak__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-winStreak").NameTagWinStreak;
return {
	NameTag = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5, v6 = l__useState__3(p1.EntityInstance.Name);
		local v7, v8 = l__useState__3("");
		local v9, v10 = l__useState__3(0);
		local v11, v12 = l__useState__3("");
		local u10 = nil;
		l__useEffect__4(function()
			local v13 = u10:getValue();
			local v14 = nil;
			if v13 then
				l__CollectionService__1:AddTag(v13, "EntityNameTag");
				v13.Adornee = p1.EntityInstance.Head;
				v14 = p1.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function()
					local v15 = p1.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace");
					if v15 then
						v13.StudsOffsetWorldSpace = v15;
					end;
				end);
			end;
			local v16 = l__Players__2:GetPlayerFromCharacter(p1.EntityInstance);
			if v16 then
				task.spawn(function()
					if l__PlaceUtil__3.isLobbyServer() then
						local v17 = l__KnitServer__4.Services.StatsService:getHighestWinStreak(v16);
						v10(v17);
						v16:SetAttribute("WinStreak", v17);
						local v18 = l__KnitServer__4.Services.StatsService:getRankedStats(v16);
						if v18.matchesPlayed >= 5 then
							v12(l__RankMeta__6[l__RankDistribution__5:getDisplayedRank(v18.rankPoints, v18.leaderboardPosition).division].image);
						end;
					elseif l__PlaceUtil__3.isGameServer() and l__KnitServer__4.Services.CustomMatchService:isCustomMatch() and (l__KnitServer__4.Services.HostPanelService:getHostPanelSettings().generalToggles[l__HostPanelGeneralToggle__7.HideAllNametags] and v13) then
						v13.Enabled = false;
					end;
					v6(v16.DisplayName);
				end);
			end;
			return function()
				v14:Disconnect();
			end;
		end, {});
		l__useEffect__4(function()
			local u11 = nil;
			task.spawn(function()
				local v19 = p1.EntityInstance:GetAttribute("Clan");
				if v19 ~= "" and v19 then
					v8(v19);
				end;
				u11 = p1.EntityInstance:GetAttributeChangedSignal("Clan"):Connect(function(p3)
					local v20 = p1.EntityInstance:GetAttribute("Clan");
					if v20 ~= "" and v20 then
						v8(v20);
					end;
				end);
			end);
			return function()
				u11:Disconnect();
			end;
		end, {});
		u10 = u8.createRef();
		local v21 = v7 ~= "";
		local v22 = {};
		if l__PlaceUtil__3.isGameServer() then
			local v23 = u8.createFragment({
				TeamIndicator = u8.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.75, 0.75), 
					AnchorPoint = Vector2.new(0, 0.5), 
					Position = UDim2.fromScale(0, 0.5), 
					SizeConstraint = Enum.SizeConstraint.RelativeYY, 
					BackgroundColor3 = Color3.fromRGB(0, 255, 38), 
					BorderSizePixel = 0, 
					Visible = false, 
					LayoutOrder = 1
				}, { u8.createElement("UICorner", {
						CornerRadius = UDim.new(50, 0)
					}) })
			});
		elseif v11 ~= "" then
			v23 = u8.createFragment({
				RankDisplay = u8.createElement("ImageLabel", {
					Size = UDim2.fromScale(1.2, 1.2), 
					AnchorPoint = Vector2.new(0, 0.5), 
					Position = UDim2.fromScale(-0.02, 0.5), 
					SizeConstraint = Enum.SizeConstraint.RelativeYY, 
					Image = v11, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				})
			});
		else
			v23 = u8.createFragment();
		end;
		v22[1] = v23;
		local v24 = {
			Size = UDim2.fromScale(0.75, 0.75)
		};
		if v21 then
			local v25 = "X";
		else
			v25 = "None";
		end;
		v24.AutomaticSize = v25;
		v24.AnchorPoint = Vector2.new(0.5, 0.5);
		v24.Position = UDim2.fromScale(0.5, 0.5);
		v24.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		v24.BackgroundTransparency = 0.75;
		v24.BorderSizePixel = 0;
		v24.LayoutOrder = 2;
		local v26 = {
			Stroke = u8.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
				Thickness = 1, 
				Transparency = 1
			}),
			u8.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 6), 
				PaddingRight = UDim.new(0, 6)
			}), (u8.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.01, 0)
			}))
		};
		local v27 = v21 and u8.createFragment({
			Tag = u8.createElement("TextLabel", {
				Text = "[" .. v7 .. "] ", 
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = "X", 
				TextColor3 = Color3.fromRGB(219, 219, 219), 
				Font = Enum.Font.GothamMedium, 
				BackgroundTransparency = 1, 
				TextScaled = true, 
				RichText = true, 
				AutoLocalize = false, 
				TextYAlignment = "Center", 
				LayoutOrder = 1
			})
		});
		if v27 then
			v26[#v26 + 1] = v27;
		end;
		local v28 = {
			Text = v5
		};
		if v21 then
			local v29 = 0;
		else
			v29 = 1;
		end;
		v28.Size = UDim2.fromScale(v29, 1);
		v28.AutomaticSize = "X";
		v28.TextColor3 = Color3.fromRGB(255, 255, 255);
		v28.Font = Enum.Font.GothamMedium;
		v28.BackgroundTransparency = 1;
		v28.TextScaled = true;
		v28.RichText = true;
		v28.AutoLocalize = false;
		v28.TextYAlignment = "Center";
		v28.LayoutOrder = 2;
		v26.DisplayName = u8.createElement("TextLabel", v28);
		v22.DisplayNameContainer = u8.createElement("Frame", v24, v26);
		local v30 = l__PlaceUtil__3.isLobbyServer();
		if v30 then
			v30 = false;
			if v9 > 0 then
				v30 = u8.createElement(l__NameTagWinStreak__9, {
					WinStreak = v9, 
					Size = UDim2.fromScale(0.1, 0.75), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Position = UDim2.fromScale(1, 0.5)
				});
			end;
		end;
		if v30 then
			v22[#v22 + 1] = v30;
		end;
		return u8.createFragment({
			Nametag = u8.createElement("BillboardGui", {
				Size = UDim2.fromScale(6, 0.65), 
				StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0), 
				AlwaysOnTop = true, 
				MaxDistance = 150, 
				ResetOnSpawn = false, 
				AutoLocalize = false, 
				[u8.Ref] = u10
			}, v22)
		});
	end)
};
