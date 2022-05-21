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
local l__BPRewardDisplayMeta__1 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__3 = v2.ColorUtil;
local l__CornerFiller__4 = v2.CornerFiller;
local l__BattlePassUtils__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local l__ImageId__6 = v2.ImageId;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BPRewardDisplayType__8 = v1.import(script, script.Parent.Parent.Parent, "battle-pass-reward-display-type").BPRewardDisplayType;
local u9 = v1.import(script, script.Parent, "battle-pass-rewards-list-reward").BattlePassRewardsListReward;
function v4.render(p5)
	local v5 = p5.props.BattlePass.level == p5.props.LevelRewards[1].level;
	local v6 = p5.props.BattlePass.level < p5.props.LevelRewards[1].level;
	local l__LevelRewards__7 = p5.props.LevelRewards;
	local function v8(p6)
		return not p6.paid;
	end;
	local v9 = {};
	local v10 = 0;
	for v11, v12 in ipairs(l__LevelRewards__7) do
		if v8(v12, v11 - 1, l__LevelRewards__7) == true then
			v10 = v10 + 1;
			v9[v10] = v12;
		end;
	end;
	local l__LevelRewards__13 = p5.props.LevelRewards;
	local function v14(p7)
		return p7.paid;
	end;
	local v15 = {};
	local v16 = 0;
	for v17, v18 in ipairs(l__LevelRewards__13) do
		if v14(v18, v17 - 1, l__LevelRewards__13) == true then
			v16 = v16 + 1;
			v15[v16] = v18;
		end;
	end;
	local v19 = not v6 and #v9;
	local v20 = not v6 and (p5.props.BattlePass.paid and #v15);
	local v21 = (function()
		local l__LevelRewards__22 = p5.props.LevelRewards;
		local u10 = false;
		local u11 = false;
		local u12 = false;
		local u13 = false;
		local function v23(p8)
			local v24 = p8.kit ~= nil;
			if not v24 then
				local v25 = p8.comingSoon;
				if v25 ~= nil then
					v25 = v25.kit;
				end;
				v24 = v25 ~= nil;
			end;
			if v24 then
				u10 = true;
				return;
			end;
			local v26 = p8.kitSkin ~= nil;
			if not v26 then
				local v27 = p8.comingSoon;
				if v27 ~= nil then
					v27 = v27.kitSkin;
				end;
				v26 = v27 ~= nil;
			end;
			if v26 then
				u11 = true;
				return;
			end;
			local v28 = p8.killEffect ~= nil;
			if not v28 then
				local v29 = p8.comingSoon;
				if v29 ~= nil then
					v29 = v29.killEffect;
				end;
				v28 = v29 ~= nil;
			end;
			if v28 then
				u12 = true;
				return;
			end;
			local v30 = p8.lobbyGadget ~= nil;
			if not v30 then
				local v31 = p8.comingSoon;
				if v31 ~= nil then
					v31 = v31.lobbyGadget;
				end;
				v30 = v31 ~= nil;
			end;
			if v30 then
				u13 = true;
			end;
		end;
		for v32, v33 in ipairs(l__LevelRewards__22) do
			v23(v33, v32 - 1, l__LevelRewards__22);
		end;
		if u10 then
			return l__BPRewardDisplayMeta__1.kit.backgroundColor;
		end;
		if u11 then
			return l__BPRewardDisplayMeta__1.kitSkin.backgroundColor;
		end;
		if u12 then
			return l__BPRewardDisplayMeta__1.killEffect.backgroundColor;
		end;
		if not u13 then
			return l__Theme__2.backgroundTertiary;
		end;
		return l__BPRewardDisplayMeta__1.lobbyGadget.backgroundColor;
	end)();
	local v34 = {
		Size = UDim2.new(p5.props.Size.X.Scale, p5.props.Size.X.Offset, p5.props.Size.Y.Scale, p5.props.Size.Y.Scale), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__2.backgroundSecondary, 
		LayoutOrder = p5.props.LayoutOrder
	};
	local v35 = {};
	local v36 = v5 and v3.createElement("UIStroke", {
		Color = l__ColorUtil__3.WHITE, 
		Thickness = 1
	});
	if v36 then
		v35[#v35 + 1] = v36;
	end;
	local v37 = #v35;
	v35[v37 + 1] = v3.createElement("UISizeConstraint", {
		MinSize = Vector2.new(90, 0)
	});
	v35[v37 + 2] = v3.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical, 
		HorizontalAlignment = Enum.HorizontalAlignment.Center, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 4)
	});
	local v38 = {
		Size = UDim2.fromScale(1, 0.1), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BackgroundColor3 = v21, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	};
	local v39 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement(l__CornerFiller__4, {
			BottomRight = true, 
			BottomLeft = true
		}) };
	local v40 = not v6;
	if v40 then
		local v41 = {};
		local v42 = {};
		local v43 = {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		if v5 then
			local v44 = math.min(l__BattlePassUtils__5.getCurrExperienceProgression(p5.props.BattlePass.experience, p5.props.BattlePass.level) / l__BattlePassUtils__5.getExperienceForLevel(p5.props.BattlePass.level + 1), 1);
		else
			v44 = 1;
		end;
		v43.Size = UDim2.new(v44, 0, 0, 3);
		v43.BorderSizePixel = 0;
		v43.BackgroundTransparency = 0;
		v43.BackgroundColor3 = l__Theme__2.backgroundSuccess;
		v43.LayoutOrder = 1;
		v43.ZIndex = 100;
		v42.BottomBorderProgress = v3.createElement("Frame", v43, { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) });
		v41.BottomBorderProgress = v3.createFragment(v42);
		v41.BottomBorderBG = v3.createFragment({
			BottomBorderBG = v3.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0, 1), 
				Size = UDim2.new(1, 0, 0, 3), 
				BorderSizePixel = 0, 
				BackgroundTransparency = 0.6, 
				BackgroundColor3 = l__ColorUtil__3.WHITE, 
				LayoutOrder = 1, 
				ZIndex = 99
			}, { v3.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Center
				}) })
		});
		v40 = v3.createFragment(v41);
	end;
	if v40 then
		v39[#v39 + 1] = v40;
	end;
	local v45 = {
		Size = UDim2.fromScale(0, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	if v6 then
		local v46 = 0.3;
	else
		v46 = 0;
	end;
	v45.TextTransparency = v46;
	v45.Text = "<b>" .. tostring(p5.props.LevelRewards[1].level) .. "</b>";
	v45.TextXAlignment = Enum.TextXAlignment.Center;
	v45.TextYAlignment = Enum.TextYAlignment.Center;
	v45.TextColor3 = l__ColorUtil__3.WHITE;
	v45.RichText = true;
	v45.Font = Enum.Font.Roboto;
	v45.TextSize = 16;
	v39.LevelText = v3.createElement("TextLabel", v45);
	v35.LevelColumnHeader = v3.createElement("Frame", v38, v39);
	local v47 = {
		Size = UDim2.fromScale(1, 0.4), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__3.darken(l__Theme__2.backgroundPrimary, 0.9), 
		LayoutOrder = 2
	};
	local v48 = {};
	local v49 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 then
		local v50 = l__ImageId__6.LOCK_SOLID;
	elseif v19 ~= 0 and v19 == v19 and v19 then
		v50 = l__ImageId__6.CHECK_CIRCLE_SOLID;
	else
		v50 = nil;
	end;
	v49.Image = v50;
	if v19 ~= 0 and v19 == v19 and v19 then
		local v51 = 0;
	else
		v51 = 0.4;
	end;
	v49.ImageTransparency = v51;
	v49.ZIndex = 200;
	v48[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v48[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v48[3] = v3.createElement("ImageLabel", v49);
	local function v52(p9, p10)
		local v53 = u7.values(l__BPRewardDisplayType__8);
		local function v54(p11)
			return p9[p11] ~= nil;
		end;
		local v55 = nil;
		for v56, v57 in ipairs(v53) do
			if v54(v57, v56 - 1, v53) == true then
				v55 = v57;
				break;
			end;
		end;
		return v3.createElement(u9, {
			Reward = p9, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v55, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p10, 
			Locked = v6
		});
	end;
	local v58 = table.create(#v9);
	for v59, v60 in ipairs(v9) do
		v58[v59] = v52(v60, v59 - 1, v9);
	end;
	local v61 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v62 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v63 = #v62;
	for v64, v65 in ipairs(v58) do
		v62[v63 + v64] = v65;
	end;
	v48[#v48 + 1] = v3.createElement("Frame", v61, v62);
	v35.FreePassRewards = v3.createElement("Frame", v47, v48);
	local v66 = {
		Size = UDim2.new(1, 0, 0.5, -8), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__2.backgroundPrimary, 
		LayoutOrder = 3
	};
	local v67 = {};
	local v68 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 or not p5.props.BattlePass.paid then
		local v69 = l__ImageId__6.LOCK_SOLID;
	elseif v20 ~= 0 and v20 == v20 and v20 then
		v69 = l__ImageId__6.CHECK_CIRCLE_SOLID;
	else
		v69 = nil;
	end;
	v68.Image = v69;
	if v20 ~= 0 and v20 == v20 and v20 then
		local v70 = 0;
	else
		v70 = 0.4;
	end;
	v68.ImageTransparency = v70;
	v68.ZIndex = 200;
	v67[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v67[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v67[3] = v3.createElement("ImageLabel", v68);
	local function v71(p12, p13)
		local v72 = u7.values(l__BPRewardDisplayType__8);
		local function v73(p14)
			return p12[p14] ~= nil;
		end;
		local v74 = nil;
		for v75, v76 in ipairs(v72) do
			if v73(v76, v75 - 1, v72) == true then
				v74 = v76;
				break;
			end;
		end;
		return v3.createElement(u9, {
			Reward = p12, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v74, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p13, 
			Locked = v6 or not p5.props.BattlePass.paid
		});
	end;
	local v77 = table.create(#v15);
	for v78, v79 in ipairs(v15) do
		v77[v78] = v71(v79, v78 - 1, v15);
	end;
	local v80 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v81 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v82 = #v81;
	for v83, v84 in ipairs(v77) do
		v81[v82 + v83] = v84;
	end;
	v67[#v67 + 1] = v3.createElement("Frame", v80, v81);
	v35.BattlePassRewards = v3.createElement("Frame", v66, v67);
	return v3.createFragment({
		LevelRewardsCardContainer = v3.createElement("Frame", v34, v35)
	});
end;
return {
	BattlePassLevelRewardsListLevelCard = v4
};
