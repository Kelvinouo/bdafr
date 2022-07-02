-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ClanUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__Players__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__StringUtil__3 = v2.StringUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__5 = v2.ColorUtil;
local l__mcYellow__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme.mcYellow;
local l__Empty__7 = v2.Empty;
return {
	ClanProfileGeneralDailyContribution = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5, v6 = l__useState__3(0);
		local v7, v8 = l__useState__3(0);
		local v9, v10 = l__useState__3(0);
		l__useEffect__4(function()
			if p1.DailyMemberContributions then
				local v11 = p1.DailyMemberContributions[l__ClanUtil__1.getContributionDayId()];
				if v11 ~= nil then
					v11 = v11[tostring(l__Players__2.LocalPlayer.UserId)];
				end;
				if v11 ~= 0 and v11 == v11 and v11 then
					v6(v11);
				end;
			end;
		end, {});
		l__useEffect__4(function()
			if p1.DailyMemberContributions then
				local v12 = p1.DailyMemberContributions[l__ClanUtil__1.getContributionDayId()];
				if v12 then
					local u8 = 0;
					for v13, v14 in pairs(v12) do
						u8 = u8 + v14;
					end;
					v8(u8);
				end;
			end;
		end, { p1.DailyMemberContributions });
		l__useEffect__4(function()
			if p1.DailyClanContribution then
				local v15 = p1.DailyClanContribution[l__ClanUtil__1.getContributionDayId()];
				if v15 then
					v10(v15.gainedCoins);
				end;
			end;
		end, { p1.DailyClanContribution });
		local v16 = p1.MemberCount;
		if v16 == nil then
			v16 = 1;
		end;
		local v17 = l__ClanUtil__1.calcClanMaxDailyCoins(v16);
		local v18 = l__StringUtil__3.formatNumberWithCommas(math.floor(v7));
		local v19 = l__StringUtil__3.formatNumberWithCommas(v16 * 1000);
		local v20 = l__StringUtil__3.formatNumberWithCommas(math.floor(v9));
		local v21 = l__StringUtil__3.formatNumberWithCommas(math.floor(v17));
		local v22 = { u4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Bottom", 
				Padding = UDim.new(0.03, 0)
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.3), 
				TextColor3 = l__ColorUtil__5.WHITE, 
				Font = "Roboto", 
				Text = "Play matches to earn coins for your clan.\nYou'll earn coins at 10% the rate after reaching your daily contribution limit or the clan daily total limit.", 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				TextTransparency = 0.3, 
				BackgroundTransparency = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }) };
		local v23 = { u4.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Bottom", 
				Padding = UDim.new(0.03, 0)
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.3), 
				TextColor3 = l__ColorUtil__5.WHITE, 
				Font = "Roboto", 
				Text = "<b>Your Daily Contribution:</b> <font color=\"" .. l__ColorUtil__5.richTextColor(l__mcYellow__6) .. "\">" .. l__StringUtil__3.formatNumberWithCommas(math.floor(v5)) .. " / " .. l__StringUtil__3.formatNumberWithCommas(l__ClanUtil__1.MAX_DAILY_CONTRIBUTION) .. " (" .. l__StringUtil__3.formatPercentage(v5, l__ClanUtil__1.MAX_DAILY_CONTRIBUTION) .. ")</font>", 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) }) };
		local v24 = false;
		if p1.MemberCount ~= nil then
			v24 = u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.3), 
				TextColor3 = l__ColorUtil__5.WHITE, 
				Font = "Roboto", 
				Text = "<b>Clan's Daily Total Contribution:</b> <font color=\"" .. l__ColorUtil__5.richTextColor(l__mcYellow__6) .. "\">" .. v18 .. " / " .. v19 .. " (" .. l__StringUtil__3.formatPercentage(v7, v16 * 1000) .. ")</font>", 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) });
		end;
		if v24 then
			v23[#v23 + 1] = v24;
		end;
		local v25 = false;
		if p1.MemberCount ~= nil then
			v25 = u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.3), 
				TextColor3 = l__ColorUtil__5.WHITE, 
				Font = "Roboto", 
				Text = "<b>Clan's Daily Total Coins:</b> <font color=\"" .. l__ColorUtil__5.richTextColor(l__mcYellow__6) .. "\">" .. v20 .. " / " .. v21 .. " (" .. l__StringUtil__3.formatPercentage(v9, v17) .. ")</font>", 
				TextXAlignment = "Left", 
				TextScaled = true, 
				RichText = true, 
				BackgroundTransparency = 1
			}, { u4.createElement("UITextSizeConstraint", {
					MaxTextSize = 16
				}) });
		end;
		if v25 then
			v23[#v23 + 1] = v25;
		end;
		v22[#v22 + 1] = u4.createElement(l__Empty__7, {
			Size = UDim2.fromScale(1, 0.67)
		}, v23);
		return u4.createFragment({
			YourContribution = u4.createElement(l__Empty__7, {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.fromScale(1, 0.175), 
				LayoutOrder = 4
			}, v22)
		});
	end)
};
