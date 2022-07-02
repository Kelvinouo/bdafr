-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local v4 = v3.Component:extend("BattlePassLevelRewardsListLevelCard");
function v4.init(p1)

end;
function v4.shouldUpdate(p2, p3, p4)
	if p2.props.BattlePass.experience ~= p3.BattlePass.experience and p2.props.BattlePass.level <= p2.props.LevelRewards[1].level and p2.props.LevelRewards[1].level <= p3.BattlePass.level then
		return true;
	end;
	if p2.props.Active == p3.Active then
		return false;
	end;
	return table.find(p2.props.LevelRewards, p3.Active) ~= nil and table.find(p2.props.LevelRewards, p2.props.Active) ~= nil;
end;
local l__EmoteMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__BPRewardDisplayMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
local l__CornerFiller__5 = v2.CornerFiller;
local l__BattlePassUtils__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__ImageId__7 = v2.ImageId;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BPRewardDisplayType__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-type").BPRewardDisplayType;
local u10 = v1.import(script, script.Parent, "battle-pass-rewards-list-reward").BattlePassRewardsListReward;
function v4.render(p5)
	local v5 = p5.props.BattlePass.level == p5.props.LevelRewards[1].level;
	local v6 = p5.props.BattlePass.level < p5.props.LevelRewards[1].level;
	local v7 = {};
	local v8 = 0;
	for v9, v10 in ipairs(p5.props.LevelRewards) do
		if not v10.paid == true then
			v8 = v8 + 1;
			v7[v8] = v10;
		end;
	end;
	local v11 = {};
	local v12 = 0;
	for v13, v14 in ipairs(p5.props.LevelRewards) do
		if v14.paid == true then
			v12 = v12 + 1;
			v11[v12] = v14;
		end;
	end;
	local v15 = not v6 and #v7;
	local v16 = not v6 and (p5.props.BattlePass.paid and #v11);
	local v17 = (function()
		local l__LevelRewards__18 = p5.props.LevelRewards;
		local u11 = false;
		local u12 = false;
		local u13 = false;
		local u14 = false;
		local u15 = false;
		local function v19(p6)
			local v20 = p6.kit ~= nil;
			if not v20 then
				local v21 = p6.comingSoon;
				if v21 ~= nil then
					v21 = v21.kit;
				end;
				v20 = v21 ~= nil;
			end;
			if v20 then
				u11 = true;
				return;
			end;
			local v22 = p6.kitSkin ~= nil;
			if not v22 then
				local v23 = p6.comingSoon;
				if v23 ~= nil then
					v23 = v23.kitSkin;
				end;
				v22 = v23 ~= nil;
			end;
			if v22 then
				u12 = true;
				return;
			end;
			local v24 = p6.killEffect ~= nil;
			if not v24 then
				local v25 = p6.comingSoon;
				if v25 ~= nil then
					v25 = v25.killEffect;
				end;
				v24 = v25 ~= nil;
			end;
			if v24 then
				u13 = true;
				return;
			end;
			local v26 = p6.lobbyGadget ~= nil;
			if not v26 then
				local v27 = p6.comingSoon;
				if v27 ~= nil then
					v27 = v27.lobbyGadget;
				end;
				v26 = v27 ~= nil;
			end;
			if v26 then
				u14 = true;
				return;
			end;
			local v28 = p6.emote ~= nil;
			if not v28 then
				local v29 = p6.comingSoon;
				if v29 ~= nil then
					v29 = v29.emote;
				end;
				v28 = v29 ~= nil;
			end;
			if v28 and p6.emote then
				if l__EmoteMeta__1[p6.emote].animation then
					u15 = true;
					return;
				end;
			else
				return;
			end;
			return nil;
		end;
		for v30, v31 in ipairs(l__LevelRewards__18) do
			v19(v31, v30 - 1, l__LevelRewards__18);
		end;
		if u11 then
			return l__BPRewardDisplayMeta__2.kit.backgroundColor;
		end;
		if u12 then
			return l__BPRewardDisplayMeta__2.kitSkin.backgroundColor;
		end;
		if u13 then
			return l__BPRewardDisplayMeta__2.killEffect.backgroundColor;
		end;
		if u14 then
			return l__BPRewardDisplayMeta__2.lobbyGadget.backgroundColor;
		end;
		if not u15 then
			return l__Theme__3.backgroundTertiary;
		end;
		return l__BPRewardDisplayMeta__2.emote.backgroundColor;
	end)();
	local v32 = {
		Size = UDim2.new(p5.props.Size.X.Scale, p5.props.Size.X.Offset, p5.props.Size.Y.Scale, p5.props.Size.Y.Scale), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__3.backgroundSecondary, 
		LayoutOrder = p5.props.LayoutOrder
	};
	local v33 = {};
	local v34 = v5 and v3.createElement("UIStroke", {
		Color = l__ColorUtil__4.WHITE, 
		Thickness = 1
	});
	if v34 then
		v33[#v33 + 1] = v34;
	end;
	local v35 = #v33;
	v33[v35 + 1] = v3.createElement("UISizeConstraint", {
		MinSize = Vector2.new(90, 0)
	});
	v33[v35 + 2] = v3.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical, 
		HorizontalAlignment = Enum.HorizontalAlignment.Center, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 4)
	});
	local v36 = {
		Size = UDim2.fromScale(1, 0.1), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BackgroundColor3 = v17, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	};
	local v37 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement(l__CornerFiller__5, {
			BottomRight = true, 
			BottomLeft = true
		}) };
	local v38 = not v6;
	if v38 then
		local v39 = {};
		local v40 = {};
		local v41 = {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		if v5 then
			local v42 = math.min(l__BattlePassUtils__6.getCurrExperienceProgression(p5.props.BattlePass.experience, p5.props.BattlePass.level) / l__BattlePassUtils__6.getExperienceForLevel(p5.props.BattlePass.level + 1), 1);
		else
			v42 = 1;
		end;
		v41.Size = UDim2.new(v42, 0, 0, 3);
		v41.BorderSizePixel = 0;
		v41.BackgroundTransparency = 0;
		v41.BackgroundColor3 = l__Theme__3.backgroundSuccess;
		v41.LayoutOrder = 1;
		v41.ZIndex = 100;
		v40.BottomBorderProgress = v3.createElement("Frame", v41, { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) });
		v39.BottomBorderProgress = v3.createFragment(v40);
		v39.BottomBorderBG = v3.createFragment({
			BottomBorderBG = v3.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.new(1, 0, 0, 3), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 0.6, 
				BackgroundColor3 = l__ColorUtil__4.WHITE, 
				LayoutOrder = 1, 
				ZIndex = 99
			}, { v3.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Center
				}) })
		});
		v38 = v3.createFragment(v39);
	end;
	if v38 then
		v37[#v37 + 1] = v38;
	end;
	local v43 = {
		Size = UDim2.fromScale(0, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	if v6 then
		local v44 = 0.3;
	else
		v44 = 0;
	end;
	v43.TextTransparency = v44;
	v43.Text = "<b>" .. tostring(p5.props.LevelRewards[1].level) .. "</b>";
	v43.TextXAlignment = Enum.TextXAlignment.Center;
	v43.TextYAlignment = Enum.TextYAlignment.Center;
	v43.TextColor3 = l__ColorUtil__4.WHITE;
	v43.RichText = true;
	v43.Font = Enum.Font.Roboto;
	v43.TextSize = 16;
	v37.LevelText = v3.createElement("TextLabel", v43);
	v33.LevelColumnHeader = v3.createElement("Frame", v36, v37);
	local v45 = {
		Size = UDim2.fromScale(1, 0.4), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__4.darken(l__Theme__3.backgroundPrimary, 0.9), 
		LayoutOrder = 2
	};
	local v46 = {};
	local v47 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 then
		local v48 = l__ImageId__7.LOCK_SOLID;
	elseif v15 ~= 0 and v15 == v15 and v15 then
		v48 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v48 = nil;
	end;
	v47.Image = v48;
	if v15 ~= 0 and v15 == v15 and v15 then
		local v49 = 0;
	else
		v49 = 0.4;
	end;
	v47.ImageTransparency = v49;
	v47.ZIndex = 200;
	v46[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v46[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v46[3] = v3.createElement("ImageLabel", v47);
	local function v50(p7, p8)
		local v51 = nil;
		for v52, v53 in ipairs((u8.values(l__BPRewardDisplayType__9))) do
			if p7[v53] ~= nil == true then
				v51 = v53;
				break;
			end;
		end;
		return v3.createElement(u10, {
			Reward = p7, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v51, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p8, 
			Locked = v6
		});
	end;
	local v54 = table.create(#v7);
	for v55, v56 in ipairs(v7) do
		v54[v55] = v50(v56, v55 - 1, v7);
	end;
	local v57 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v58 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v59 = #v58;
	for v60, v61 in ipairs(v54) do
		v58[v59 + v60] = v61;
	end;
	v46[#v46 + 1] = v3.createElement("Frame", v57, v58);
	v33.FreePassRewards = v3.createElement("Frame", v45, v46);
	local v62 = {
		Size = UDim2.new(1, 0, 0.5, -8), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__3.backgroundPrimary, 
		LayoutOrder = 3
	};
	local v63 = {};
	local v64 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 or not p5.props.BattlePass.paid then
		local v65 = l__ImageId__7.LOCK_SOLID;
	elseif v16 ~= 0 and v16 == v16 and v16 then
		v65 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v65 = nil;
	end;
	v64.Image = v65;
	if v16 ~= 0 and v16 == v16 and v16 then
		local v66 = 0;
	else
		v66 = 0.4;
	end;
	v64.ImageTransparency = v66;
	v64.ZIndex = 200;
	v63[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v63[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v63[3] = v3.createElement("ImageLabel", v64);
	local function v67(p9, p10)
		local v68 = nil;
		for v69, v70 in ipairs((u8.values(l__BPRewardDisplayType__9))) do
			if p9[v70] ~= nil == true then
				v68 = v70;
				break;
			end;
		end;
		return v3.createElement(u10, {
			Reward = p9, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v68, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p10, 
			Locked = v6 or not p5.props.BattlePass.paid
		});
	end;
	local v71 = table.create(#v11);
	for v72, v73 in ipairs(v11) do
		v71[v72] = v67(v73, v72 - 1, v11);
	end;
	local v74 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v75 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v76 = #v75;
	for v77, v78 in ipairs(v71) do
		v75[v76 + v77] = v78;
	end;
	v63[#v63 + 1] = v3.createElement("Frame", v74, v75);
	v33.BattlePassRewards = v3.createElement("Frame", v62, v63);
	return v3.createFragment({
		LevelRewardsCardContainer = v3.createElement("Frame", v32, v33)
	});
end;
return {
	BattlePassLevelRewardsListLevelCard = v4
};
