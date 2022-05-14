-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local v5 = v3.Component:extend("LeaderboardCore");
local l__GetTarmacAsset__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local u2 = v4.LEADERBOARD_DEFAULT_BOARD;
function v5.init(p1, p2)
	p1.crownIcon = l__GetTarmacAsset__1("CrownIcon");
	p1.resetTimerActive = true;
	p1:handleSelectLeaderboard(u2);
	local v6, v7 = v3.createBinding("");
	p1.resetsInText = v6;
	p1.setResetsInText = v7;
end;
function v5.didMount(p3)
	p3:setupResetTimer(p3.state.leaderboard);
end;
function v5.didUpdate(p4, p5, p6)
	if p5.store.Leaderboard.leaderboards ~= p4.props.store.Leaderboard.leaderboards then
		p4:refreshLeaderboard();
		return true;
	end;
	if p6.leaderboard == p4.state.leaderboard then
		return nil;
	end;
	local l__nextReset__8 = p4.state.leaderboardData.nextReset;
	if l__nextReset__8 ~= 0 and l__nextReset__8 == l__nextReset__8 and l__nextReset__8 then
		p4:setupResetTimer(p4.state.leaderboard);
		p4.resetTimerActive = true;
	end;
	if l__nextReset__8 == 0 or l__nextReset__8 ~= l__nextReset__8 or not l__nextReset__8 then
		p4.resetTimerActive = false;
		p4.setResetsInText("");
	end;
	return true;
end;
local l__StringUtil__3 = v2.StringUtil;
function v5.setupResetTimer(p7, p8)
	local v9 = p7.props.store.Leaderboard.leaderboards[p8];
	if not v9 then
		return nil;
	end;
	v1.Promise.defer(function()
		while p7.resetTimerActive do
			local l__nextReset__10 = v9.nextReset;
			if l__nextReset__10 == 0 then
				return nil;
			end;
			if l__nextReset__10 ~= l__nextReset__10 then
				return nil;
			end;
			if not l__nextReset__10 then
				return nil;
			end;
			p7.setResetsInText("<b>Resets in:</b> <font color=\"rgb(185, 188, 255)\">" .. l__StringUtil__3.formatCountdownTime(math.max(0, v9.nextReset - os.time()), {
				hours = true, 
				days = true, 
				seperator = ":"
			}) .. "</font>");
			wait(1);		
		end;
	end);
end;
function v5.refreshLeaderboard(p9)
	local l__leaderboard__4 = p9.state.leaderboard;
	p9:setState(function()
		return {
			leaderboard = l__leaderboard__4, 
			leaderboardData = p9.props.store.Leaderboard.leaderboards[l__leaderboard__4]
		};
	end);
end;
function v5.handleSelectLeaderboard(p10, p11)
	local v11 = p10.props.store.Leaderboard.leaderboards[p11];
	if not v11 then
		error("No leaderboard data in store for " .. p11);
	end;
	p10:setState(function()
		return {
			leaderboard = p11, 
			leaderboardData = v11
		};
	end);
end;
local l__Empty__5 = v2.Empty;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__7 = v2.ColorUtil;
local l__LeaderboardMeta__8 = v4.LeaderboardMeta;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__DropdownComponent__10 = v2.DropdownComponent;
local function u11(p12)
	return string.gsub(string.reverse((string.gsub(string.reverse(p12), "%d%d%d", "%1,"))), "^,", "");
end;
local l__SectionDivider__12 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "section-divider").SectionDivider;
function v5.render(p13)
	local v12 = nil;
	local l__leaderboardData__13 = p13.state.leaderboardData;
	local v14 = {
		Size = UDim2.fromScale(1, 1), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__6.backgroundPrimary
	};
	local v15 = { v3.createElement("ImageLabel", {
			Image = "rbxassetid://7106394844", 
			Size = UDim2.new(1, 0, 0, 80), 
			BackgroundColor3 = l__ColorUtil__7.hexColor(3092550), 
			BorderSizePixel = 0
		}, { v3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.2, 0), 
				PaddingBottom = UDim.new(0.2, 0), 
				PaddingLeft = UDim.new(0.075, 0), 
				PaddingRight = UDim.new(0.075, 0)
			}), v3.createElement("TextLabel", {
				Text = "<b>Leaderboard: " .. l__leaderboardData__13.displayName .. "</b>", 
				Size = UDim2.fromScale(1, 0.5), 
				Position = UDim2.fromScale(0, 0), 
				AnchorPoint = Vector2.new(0, 0), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.Roboto, 
				TextScaled = true, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Top, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				AutoLocalize = false
			}), v3.createElement("TextLabel", {
				Text = "<b>" .. l__leaderboardData__13.description .. "</b>", 
				Size = UDim2.fromScale(1, 0.4), 
				Position = UDim2.fromScale(0, 1), 
				AnchorPoint = Vector2.new(0, 1), 
				BackgroundTransparency = 1, 
				Font = Enum.Font.Roboto, 
				TextScaled = true, 
				RichText = true, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				TextYAlignment = Enum.TextYAlignment.Bottom, 
				TextColor3 = l__Theme__6.textPrimary
			}) }) };
	local v16 = {
		AnchorPoint = Vector2.new(0, 1), 
		Position = UDim2.fromScale(0, 1), 
		Size = UDim2.new(1, 0, 1, -80), 
		BackgroundTransparency = 1
	};
	local v17 = { v3.createElement("UIPadding", {
			PaddingTop = UDim.new(0.02, 0), 
			PaddingBottom = UDim.new(0.03, 0), 
			PaddingLeft = UDim.new(0.075, 0), 
			PaddingRight = UDim.new(0.075, 0)
		}) };
	local v18 = #v17;
	local v19 = {
		OnSurfaceGui = true, 
		DefaultItem = {
			text = l__LeaderboardMeta__8[u2].displayName, 
			value = l__LeaderboardMeta__8[u2].displayName
		}
	};
	local v20 = l__LeaderboardMeta__8[u2];
	if v20 ~= nil then
		v20 = v20.displayName;
	end;
	v19.PlaceholderText = v20;
	local v21 = {};
	local v22 = #v21;
	for v23, v24 in pairs(l__LeaderboardMeta__8) do
		v22 = v22 + 1;
		v21[v22] = { v23, v24 };
	end;
	v12 = {};
	local function v25(p14, p15)
		local l__displayName__26 = p15[2].displayName;
		local v27 = {};
		local v28 = #v27;
		local v29 = #p14;
		table.move(p14, 1, v29, v28 + 1, v27);
		v27[v28 + v29 + 1] = {
			text = l__displayName__26, 
			value = l__displayName__26
		};
		return v27;
	end;
	for v30 = 1, #v21 do
		v12 = v25(v12, v21[v30], v30 - 1, v21);
	end;
	v19.Items = local v31;
	function v19.OnItemSelected(p16)
		local v32 = {};
		local v33 = u9.entries(l__LeaderboardMeta__8);
		table.move(v33, 1, #v33, #v32 + 1, v32);
		local function v34(p17)
			local v35 = p17[1];
			return p17[2].displayName == p16;
		end;
		local v36 = {};
		local v37 = 0;
		for v38, v39 in ipairs(v32) do
			if v34(v39, v38 - 1, v32) == true then
				v37 = v37 + 1;
				v36[v37] = v39;
			end;
		end;
		local function v40(p18)
			local v41 = p18[2];
			return p18[1];
		end;
		local v42 = table.create(#v36);
		for v43, v44 in ipairs(v36) do
			v42[v43] = v40(v44, v43 - 1, v36);
		end;
		p13:handleSelectLeaderboard(v42[1]);
	end;
	v17[v18 + 1] = v3.createElement(l__DropdownComponent__10, v19);
	v17[v18 + 2] = p13.resetsInText and v3.createElement("TextLabel", {
		Text = p13.resetsInText, 
		Size = UDim2.new(0, 0, 0, 28), 
		AutomaticSize = Enum.AutomaticSize.X, 
		AnchorPoint = Vector2.new(1, 0), 
		Position = UDim2.fromScale(1, 0), 
		BackgroundTransparency = 1, 
		Font = Enum.Font.RobotoMono, 
		TextSize = 19, 
		RichText = true, 
		TextXAlignment = Enum.TextXAlignment.Right, 
		TextTransparency = 0.3, 
		TextColor3 = Color3.fromRGB(255, 255, 255)
	});
	local v45 = #v17;
	local l__users__46 = l__leaderboardData__13.users;
	local function u13(p19)
		local l__StatRank__47 = p19.StatRank;
		if not l__StatRank__47 then
			return v3.createFragment();
		end;
		local v48 = { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Right, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 6)
			}) };
		local v49 = false;
		if l__StatRank__47.image ~= nil then
			v49 = v3.createElement("ImageLabel", {
				Size = UDim2.new(0, 24, 0, 24), 
				Image = l__StatRank__47.image, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1
			});
		end;
		if v49 then
			v48[#v48 + 1] = v49;
		end;
		v48[#v48 + 1] = v3.createElement("TextLabel", {
			Text = "<b>" .. l__StatRank__47.rankName .. "</b>", 
			AutomaticSize = Enum.AutomaticSize.XY, 
			BackgroundTransparency = 1, 
			Font = Enum.Font.Roboto, 
			TextSize = 14, 
			RichText = true, 
			TextXAlignment = Enum.TextXAlignment.Right, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			LayoutOrder = 1
		});
		return v3.createElement(l__Empty__5, {
			Size = UDim2.fromScale(0, 1), 
			AutomaticSize = Enum.AutomaticSize.X, 
			LayoutOrder = p19.LayoutOrder
		}, v48);
	end;
	local function v50(p20, p21)
		local v51 = {
			Size = UDim2.fromScale(1, 0), 
			AutomaticSize = Enum.AutomaticSize.Y, 
			BackgroundTransparency = 1
		};
		local v52 = {};
		local v53 = #v52;
		local v54 = { v3.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}) };
		if p21 < 3 then
			local v55 = {
				Position = UDim2.fromOffset(-10, -12), 
				Size = UDim2.fromOffset(26, 20.8), 
				BackgroundTransparency = 1, 
				Rotation = -25, 
				Image = p13.crownIcon.Image, 
				ImageRectOffset = p13.crownIcon.ImageRectOffset, 
				ImageRectSize = p13.crownIcon.ImageRectSize
			};
			if p21 == 0 then
				local v56 = Color3.fromRGB(255, 192, 79);
			elseif p21 == 1 then
				v56 = Color3.fromRGB(229, 206, 172);
			else
				v56 = Color3.fromRGB(255, 142, 80);
			end;
			v55.ImageColor3 = v56;
			local v57 = v3.createElement("ImageLabel", v55);
		else
			v57 = nil;
		end;
		if v57 then
			v54[#v54 + 1] = v57;
		end;
		local v58 = { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}), v3.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}), v3.createElement(l__Empty__5, {
				Size = UDim2.fromScale(0.6, 1)
			}, { v3.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 10)
				}), v3.createElement("TextLabel", {
					Text = "<b>" .. tostring(p21 + 1) .. "</b>", 
					AutomaticSize = Enum.AutomaticSize.XY, 
					BackgroundTransparency = 1, 
					Font = Enum.Font.RobotoMono, 
					TextSize = 18, 
					RichText = true, 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextColor3 = l__Theme__6.textPrimary
				}), v3.createElement("ImageLabel", {
					Size = UDim2.fromOffset(24, 24), 
					BackgroundColor3 = Color3.new(0.95, 0.95, 0.95), 
					Image = p20.avatarImage
				}, { v3.createElement("UICorner", {
						CornerRadius = UDim.new(1, 0)
					}) }), v3.createElement("TextLabel", {
					Text = "<b><font color=\"rgb(185, 188, 255)\">@</font></b>" .. p20.username, 
					RichText = true, 
					BackgroundTransparency = 1, 
					Font = Enum.Font.RobotoMono, 
					TextScaled = true, 
					Size = UDim2.new(1, -60, 0, 18), 
					TextXAlignment = Enum.TextXAlignment.Left, 
					TextColor3 = Color3.fromRGB(255, 255, 255), 
					AutoLocalize = false
				}) }) };
		local v59 = { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Right, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 10)
			}) };
		local v60 = p20.statRank and v3.createElement(u13, {
			StatRank = p20.statRank, 
			LayoutOrder = 2
		});
		if v60 then
			v59[#v59 + 1] = v60;
		end;
		local v61 = {};
		if p20.statRank then
			local v62 = p20.statRank.rankStatValue;
		else
			v62 = p20.statValue;
		end;
		v61.Text = "<b>" .. u11(tostring(v62)) .. " " .. l__leaderboardData__13.metric .. "</b>";
		v61.AutomaticSize = Enum.AutomaticSize.XY;
		v61.BackgroundTransparency = 1;
		v61.Font = Enum.Font.Roboto;
		v61.TextSize = 14;
		v61.RichText = true;
		v61.TextXAlignment = Enum.TextXAlignment.Right;
		v61.TextColor3 = l__Theme__6.textPrimary;
		v61.LayoutOrder = 2;
		v59[#v59 + 1] = v3.createElement("TextLabel", v61);
		v58.StatValuesContainer = v3.createElement(l__Empty__5, {
			Size = UDim2.new(0.4, -10, 1, 0)
		}, v59);
		v54.UserLeaderBoardDataContainer = v3.createElement(l__Empty__5, {
			Size = UDim2.fromScale(1, 1)
		}, v58);
		v52[v53 + 1] = v3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 38), 
			BorderSizePixel = 0, 
			BackgroundColor3 = l__ColorUtil__7.hexColor(7567033)
		}, v54);
		if p21 + 1 == 3 then
			local v63 = v3.createElement("Frame", {
				Position = UDim2.fromOffset(0, 48), 
				Size = UDim2.new(1, 0, 0, 4), 
				BackgroundTransparency = 1
			}, { v3.createElement(l__SectionDivider__12) });
		else
			v63 = nil;
		end;
		if v63 then
			v52[v53 + 2] = v63;
		end;
		return v3.createElement("Frame", v51, v52);
	end;
	local v64 = table.create(#l__users__46);
	for v65, v66 in ipairs(l__users__46) do
		v64[v65] = v50(v66, v65 - 1, l__users__46);
	end;
	local v67 = {
		Size = UDim2.fromScale(1, 0.9), 
		Position = UDim2.fromScale(0, 0.08), 
		BackgroundTransparency = 1
	};
	local v68 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		}) };
	local v69 = #v68;
	for v70, v71 in ipairs(v64) do
		v68[v69 + v70] = v71;
	end;
	v17[v45 + 1] = v3.createElement("Frame", v67, v68);
	local v72 = {
		AnchorPoint = Vector2.new(0, 1), 
		Position = UDim2.fromScale(0, 1), 
		Size = UDim2.fromScale(1, 0.1), 
		BackgroundTransparency = 1
	};
	local v73 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Bottom, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 2)
		}) };
	local v74 = #v73;
	local v75 = {};
	local l__leaderboardPosition__76 = l__leaderboardData__13.leaderboardPosition;
	if l__leaderboardPosition__76 ~= 0 and l__leaderboardPosition__76 == l__leaderboardPosition__76 and l__leaderboardPosition__76 then
		local v77 = u11(tostring(l__leaderboardData__13.leaderboardPosition));
	else
		v77 = "Not Placed";
	end;
	v75.Text = "<b>Your position:</b> <font color=\"rgb(185, 188, 255)\">" .. v77 .. "</font>";
	v75.Size = UDim2.new(1, 0, 0, 20);
	v75.BackgroundTransparency = 1;
	v75.Font = Enum.Font.RobotoMono;
	v75.TextSize = 20;
	v75.RichText = true;
	v75.TextXAlignment = Enum.TextXAlignment.Left;
	v75.TextColor3 = Color3.fromRGB(255, 255, 255);
	v75.LayoutOrder = 1;
	v73[v74 + 1] = v3.createElement("TextLabel", v75);
	local v78 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 10)
		}), v3.createElement("TextLabel", {
			Text = "<b>Your " .. l__leaderboardData__13.statName .. ":</b>", 
			Size = UDim2.new(0, 0, 1, 0), 
			AutomaticSize = "X", 
			BackgroundTransparency = 1, 
			Font = Enum.Font.RobotoMono, 
			TextSize = 20, 
			RichText = true, 
			TextXAlignment = Enum.TextXAlignment.Left, 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			LayoutOrder = 1
		}) };
	local v79 = l__leaderboardData__13.localStatRank and v3.createElement(u13, {
		StatRank = l__leaderboardData__13.localStatRank, 
		LayoutOrder = 2
	});
	if v79 then
		v78[#v78 + 1] = v79;
	end;
	local v80 = {};
	if l__leaderboardData__13.localStatRank then
		local v81 = l__leaderboardData__13.localStatRank.rankStatValue;
	else
		v81 = l__leaderboardData__13.localStatValue;
	end;
	if l__leaderboardData__13.localStatRank then
		local v82 = l__leaderboardData__13.metric;
	else
		v82 = "";
	end;
	v80.Text = "<font color=\"rgb(185, 188, 255)\">" .. u11(tostring(v81)) .. " " .. v82 .. "</font>";
	v80.Size = UDim2.new(0, 0, 1, 0);
	v80.AutomaticSize = "X";
	v80.BackgroundTransparency = 1;
	v80.Font = Enum.Font.RobotoMono;
	v80.TextSize = 20;
	v80.RichText = true;
	v80.TextXAlignment = Enum.TextXAlignment.Left;
	v80.TextColor3 = Color3.fromRGB(255, 255, 255);
	v80.LayoutOrder = 3;
	v78[#v78 + 1] = v3.createElement("TextLabel", v80);
	v73[v74 + 2] = v3.createElement(l__Empty__5, {
		Size = UDim2.new(1, 0, 0, 18), 
		LayoutOrder = 2
	}, v78);
	v17[v45 + 2] = v3.createElement("Frame", v72, v73);
	v15[#v15 + 1] = v3.createElement("Frame", v16, v17);
	return v3.createElement("Frame", v14, v15);
end;
function v5.willUnmount(p22)
	p22.resetTimerActive = false;
end;
return {
	LeaderboardUIWrapper = function(p23)
		local v83 = {};
		local v84 = {};
		local v85 = {};
		for v86, v87 in pairs(p23) do
			v85[v86] = v87;
		end;
		v84[#v84 + 1] = v3.createElement(v5, v85);
		v83[#v83 + 1] = v3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(1, -30, 1, -30), 
			BackgroundTransparency = 1
		}, v84);
		return v3.createElement("SurfaceGui", {
			Face = Enum.NormalId.Back, 
			LightInfluence = 0.25, 
			SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
		}, v83);
	end, 
	LeaderboardCore = v5
};
