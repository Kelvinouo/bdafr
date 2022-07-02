-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local v5 = v3.Component:extend("LeaderboardCore");
local u1 = v4.LEADERBOARD_DEFAULT_BOARD;
function v5.init(p1, p2)
	p1.resetTimerActive = true;
	p1:handleSelectLeaderboard(u1);
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
local l__StringUtil__2 = v2.StringUtil;
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
			p7.setResetsInText("<b>Resets in:</b> <font color=\"rgb(185, 188, 255)\">" .. l__StringUtil__2.formatCountdownTime(math.max(0, v9.nextReset - os.time()), {
				hours = true, 
				days = true, 
				seperator = ":"
			}) .. "</font>");
			wait(1);		
		end;
	end);
end;
function v5.refreshLeaderboard(p9)
	local l__leaderboard__3 = p9.state.leaderboard;
	p9:setState(function()
		return {
			leaderboard = l__leaderboard__3, 
			leaderboardData = p9.props.store.Leaderboard.leaderboards[l__leaderboard__3]
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
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__5 = v2.ColorUtil;
local l__LeaderboardMeta__6 = v4.LeaderboardMeta;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__DropdownComponent__8 = v2.DropdownComponent;
local l__LeaderboardList__9 = v1.import(script, script.Parent.Parent, "leaderboard-list").LeaderboardList;
local l__StatRankElement__10 = v1.import(script, script.Parent, "stat-rank-element").StatRankElement;
local l__Empty__11 = v2.Empty;
function v5.render(p12)
	local v12 = nil;
	local l__leaderboardData__13 = p12.state.leaderboardData;
	local v14 = {
		Size = UDim2.fromScale(1, 1), 
		BorderSizePixel = 0, 
		BackgroundColor3 = l__Theme__4.backgroundPrimary
	};
	local v15 = { v3.createElement("ImageLabel", {
			Image = "rbxassetid://7106394844", 
			Size = UDim2.new(1, 0, 0, 80), 
			BackgroundColor3 = l__ColorUtil__5.hexColor(3092550), 
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
				TextColor3 = l__Theme__4.textPrimary
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
			text = l__LeaderboardMeta__6[u1].displayName, 
			value = l__LeaderboardMeta__6[u1].displayName
		}
	};
	local v20 = l__LeaderboardMeta__6[u1];
	if v20 ~= nil then
		v20 = v20.displayName;
	end;
	v19.PlaceholderText = v20;
	local v21 = {};
	local v22 = #v21;
	for v23, v24 in pairs(l__LeaderboardMeta__6) do
		v22 = v22 + 1;
		v21[v22] = { v23, v24 };
	end;
	v12 = {};
	local function v25(p13, p14)
		local l__displayName__26 = p14[2].displayName;
		local v27 = {};
		local v28 = #v27;
		local v29 = #p13;
		table.move(p13, 1, v29, v28 + 1, v27);
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
	function v19.OnItemSelected(p15)
		local v32 = {};
		local v33 = u7.entries(l__LeaderboardMeta__6);
		table.move(v33, 1, #v33, #v32 + 1, v32);
		local v34 = {};
		local v35 = 0;
		local v36, v37, v38 = ipairs(v32);
		while true do
			local v39, v40 = v36(v37, v38);
			if not v39 then
				break;
			end;
			local v41 = v40[1];
			if v40[2].displayName == p15 == true then
				v35 = v35 + 1;
				v34[v35] = v40;
			end;		
		end;
		local v42 = table.create(#v34);
		for v43, v44 in ipairs(v34) do
			local v45 = v44[2];
			v42[v43] = v44[1];
		end;
		p12:handleSelectLeaderboard(v42[1]);
	end;
	v17[v18 + 1] = v3.createElement(l__DropdownComponent__8, v19);
	v17[v18 + 2] = p12.resetsInText and v3.createElement("TextLabel", {
		Text = p12.resetsInText, 
		Size = UDim2.new(0, 0.5, 0, 28), 
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
	local v46 = #v17;
	v17[v46 + 1] = v3.createElement(l__LeaderboardList__9, {
		LeaderboardData = l__leaderboardData__13, 
		FrameProps = {
			Size = UDim2.new(1, 0, 0.9, -38), 
			Position = UDim2.fromScale(0, 0.08), 
			BackgroundTransparency = 1
		}
	});
	local v47 = {
		AnchorPoint = Vector2.new(0, 1), 
		Position = UDim2.fromScale(0, 1), 
		Size = UDim2.fromScale(1, 0.1), 
		BackgroundTransparency = 1
	};
	local v48 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			VerticalAlignment = Enum.VerticalAlignment.Bottom, 
			HorizontalAlignment = Enum.HorizontalAlignment.Left, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 2)
		}) };
	local v49 = #v48;
	local v50 = {};
	local l__leaderboardPosition__51 = l__leaderboardData__13.leaderboardPosition;
	if l__leaderboardPosition__51 ~= 0 and l__leaderboardPosition__51 == l__leaderboardPosition__51 and l__leaderboardPosition__51 then
		local v52 = string.gsub(string.reverse((string.gsub(string.reverse((tostring(l__leaderboardData__13.leaderboardPosition))), "%d%d%d", "%1,"))), "^,", "");
	else
		v52 = "Not Placed";
	end;
	v50.Text = "<b>Your position:</b> <font color=\"rgb(185, 188, 255)\">" .. v52 .. "</font>";
	v50.Size = UDim2.new(1, 0, 0, 20);
	v50.BackgroundTransparency = 1;
	v50.Font = Enum.Font.RobotoMono;
	v50.TextSize = 20;
	v50.RichText = true;
	v50.TextXAlignment = Enum.TextXAlignment.Left;
	v50.TextColor3 = Color3.fromRGB(255, 255, 255);
	v50.LayoutOrder = 1;
	v48[v49 + 1] = v3.createElement("TextLabel", v50);
	local v53 = { v3.createElement("UIListLayout", {
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
	local v54 = l__leaderboardData__13.localStatRank and v3.createElement(l__StatRankElement__10, {
		StatRank = l__leaderboardData__13.localStatRank, 
		LayoutOrder = 2
	});
	if v54 then
		v53[#v53 + 1] = v54;
	end;
	local v55 = {};
	if l__leaderboardData__13.localStatRank then
		local v56 = l__leaderboardData__13.localStatRank.rankStatValue;
	else
		v56 = l__leaderboardData__13.localStatValue;
	end;
	if l__leaderboardData__13.localStatRank then
		local v57 = l__leaderboardData__13.metric;
	else
		v57 = "";
	end;
	v55.Text = "<font color=\"rgb(185, 188, 255)\">" .. string.gsub(string.reverse((string.gsub(string.reverse((tostring(v56))), "%d%d%d", "%1,"))), "^,", "") .. " " .. v57 .. "</font>";
	v55.Size = UDim2.new(0, 0, 1, 0);
	v55.AutomaticSize = "X";
	v55.BackgroundTransparency = 1;
	v55.Font = Enum.Font.RobotoMono;
	v55.TextSize = 20;
	v55.RichText = true;
	v55.TextXAlignment = Enum.TextXAlignment.Left;
	v55.TextColor3 = Color3.fromRGB(255, 255, 255);
	v55.LayoutOrder = 3;
	v53[#v53 + 1] = v3.createElement("TextLabel", v55);
	v48[v49 + 2] = v3.createElement(l__Empty__11, {
		Size = UDim2.new(1, 0, 0, 18), 
		LayoutOrder = 2
	}, v53);
	v17[v46 + 2] = v3.createElement("Frame", v47, v48);
	v15[#v15 + 1] = v3.createElement("Frame", v16, v17);
	return v3.createElement("Frame", v14, v15);
end;
function v5.willUnmount(p16)
	p16.resetTimerActive = false;
end;
return {
	LeaderboardUIWrapper = function(p17)
		local v58 = {};
		local v59 = {};
		local v60 = {};
		for v61, v62 in pairs(p17) do
			v60[v61] = v62;
		end;
		v59[#v59 + 1] = v3.createElement(v5, v60);
		v58[#v58 + 1] = v3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(1, -30, 1, -30), 
			BackgroundTransparency = 1
		}, v59);
		return v3.createElement("SurfaceGui", {
			Face = Enum.NormalId.Back, 
			LightInfluence = 0.25, 
			SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
		}, v58);
	end, 
	LeaderboardCore = v5
};
