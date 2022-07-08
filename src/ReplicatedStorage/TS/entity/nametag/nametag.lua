-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto");
local l__CollectionService__1 = v2.CollectionService;
local l__Players__2 = v2.Players;
local l__PlaceUtil__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__KnitServer__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitServer;
local l__RankDistribution__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local l__RankMeta__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local l__HostPanelGeneralToggle__7 = v3.HostPanelGeneralToggle;
local l__HostPanelToggleValue__8 = v3.HostPanelToggleValue;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__NameTagWinStreak__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-winStreak").NameTagWinStreak;
return {
	NameTag = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u9)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local l__useEffect__5 = p2.useEffect;
		local v6, v7 = l__useState__4(p1.EntityInstance.Name);
		local v8, v9 = l__useState__4("");
		local v10, v11 = l__useState__4(0);
		local v12, v13 = l__useState__4("");
		local u11 = nil;
		l__useEffect__5(function()
			local v14 = u11:getValue();
			local v15 = nil;
			if v14 then
				l__CollectionService__1:AddTag(v14, "EntityNameTag");
				v14.Adornee = p1.EntityInstance.Head;
				v15 = p1.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function()
					local v16 = p1.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace");
					if v16 then
						v14.StudsOffsetWorldSpace = v16;
					end;
				end);
			end;
			local v17 = l__Players__2:GetPlayerFromCharacter(p1.EntityInstance);
			if v17 then
				task.spawn(function()
					if l__PlaceUtil__3.isLobbyServer() then
						local v18 = l__KnitServer__4.Services.StatsService:getHighestWinStreak(v17);
						v11(v18);
						v17:SetAttribute("WinStreak", v18);
						local v19 = l__KnitServer__4.Services.StatsService:getRankedStats(v17);
						if v19.matchesPlayed >= 5 then
							v13(l__RankMeta__6[l__RankDistribution__5:getDisplayedRank(v19.rankPoints, v19.leaderboardPosition).division].image);
						end;
					elseif l__PlaceUtil__3.isGameServer() and l__KnitServer__4.Services.CustomMatchService:isCustomMatch() and (l__KnitServer__4.Services.HostPanelService:getHostPanelSettings().generalToggles[l__HostPanelGeneralToggle__7.HideAllNametags] == l__HostPanelToggleValue__8.ON and v14) then
						v14.Enabled = false;
					end;
					v7(v17.DisplayName);
				end);
			end;
			return function()
				v15:Disconnect();
			end;
		end, {});
		l__useEffect__5(function()
			local u12 = nil;
			task.spawn(function()
				local v20 = p1.EntityInstance:GetAttribute("Clan");
				if v20 ~= "" and v20 then
					v9(v20);
				end;
				u12 = p1.EntityInstance:GetAttributeChangedSignal("Clan"):Connect(function(p3)
					local v21 = p1.EntityInstance:GetAttribute("Clan");
					if v21 ~= "" and v21 then
						v9(v21);
					end;
				end);
			end);
			return function()
				u12:Disconnect();
			end;
		end, {});
		u11 = u9.createRef();
		local v22 = v8 ~= "";
		local v23 = {};
		if l__PlaceUtil__3.isGameServer() then
			local v24 = u9.createFragment({
				TeamIndicator = u9.createElement("ImageLabel", {
					Size = UDim2.fromScale(0.75, 0.75), 
					AnchorPoint = Vector2.new(0, 0.5), 
					Position = UDim2.fromScale(0, 0.5), 
					SizeConstraint = Enum.SizeConstraint.RelativeYY, 
					BackgroundColor3 = Color3.fromRGB(0, 255, 38), 
					BorderSizePixel = 0, 
					Visible = false, 
					LayoutOrder = 1
				}, { u9.createElement("UICorner", {
						CornerRadius = UDim.new(50, 0)
					}) })
			});
		elseif v12 ~= "" then
			v24 = u9.createFragment({
				RankDisplay = u9.createElement("ImageLabel", {
					Size = UDim2.fromScale(1.2, 1.2), 
					AnchorPoint = Vector2.new(0, 0.5), 
					Position = UDim2.fromScale(-0.02, 0.5), 
					SizeConstraint = Enum.SizeConstraint.RelativeYY, 
					Image = v12, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				})
			});
		else
			v24 = u9.createFragment();
		end;
		v23[1] = v24;
		local v25 = {
			Size = UDim2.fromScale(0.75, 0.75)
		};
		if v22 then
			local v26 = "X";
		else
			v26 = "None";
		end;
		v25.AutomaticSize = v26;
		v25.AnchorPoint = Vector2.new(0.5, 0.5);
		v25.Position = UDim2.fromScale(0.5, 0.5);
		v25.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
		v25.BackgroundTransparency = 0.75;
		v25.BorderSizePixel = 0;
		v25.LayoutOrder = 2;
		local v27 = {
			Stroke = u9.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
				Thickness = 1, 
				Transparency = 1
			}),
			u9.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 6), 
				PaddingRight = UDim.new(0, 6)
			}), (u9.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.01, 0)
			}))
		};
		local v28 = v22 and u9.createFragment({
			Tag = u9.createElement("TextLabel", {
				Text = "[" .. v8 .. "] ", 
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
		if v28 then
			v27[#v27 + 1] = v28;
		end;
		local v29 = {
			Text = v6
		};
		if v22 then
			local v30 = 0;
		else
			v30 = 1;
		end;
		v29.Size = UDim2.fromScale(v30, 1);
		v29.AutomaticSize = "X";
		v29.TextColor3 = Color3.fromRGB(255, 255, 255);
		v29.Font = Enum.Font.GothamMedium;
		v29.BackgroundTransparency = 1;
		v29.TextScaled = true;
		v29.RichText = true;
		v29.AutoLocalize = false;
		v29.TextYAlignment = "Center";
		v29.LayoutOrder = 2;
		v27.DisplayName = u9.createElement("TextLabel", v29);
		v23.DisplayNameContainer = u9.createElement("Frame", v25, v27);
		local v31 = l__PlaceUtil__3.isLobbyServer();
		if v31 then
			v31 = false;
			if v10 > 0 then
				v31 = u9.createElement(l__NameTagWinStreak__10, {
					WinStreak = v10, 
					Size = UDim2.fromScale(0.1, 0.75), 
					AnchorPoint = Vector2.new(1, 0.5), 
					Position = UDim2.fromScale(1, 0.5)
				});
			end;
		end;
		if v31 then
			v23[#v23 + 1] = v31;
		end;
		return u9.createFragment({
			Nametag = u9.createElement("BillboardGui", {
				Size = UDim2.fromScale(6, 0.65), 
				StudsOffsetWorldSpace = Vector3.new(0, 1.6, 0), 
				AlwaysOnTop = true, 
				MaxDistance = 150, 
				ResetOnSpawn = false, 
				AutoLocalize = false, 
				[u9.Ref] = u11
			}, v23)
		});
	end)
};
