-- Script Hash: 8c18cdaaa5567e1c173aa2a2194eb31349f9261555e69c46b349d681772b59b1ca92152979ba1a8d2c872d48a7a2b9cf
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
		local u11 = false;
		local u12 = false;
		local u13 = false;
		local u14 = false;
		local u15 = false;
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
				u11 = true;
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
				u12 = true;
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
				u13 = true;
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
				u14 = true;
				return;
			end;
			local v32 = p8.emote ~= nil;
			if not v32 then
				local v33 = p8.comingSoon;
				if v33 ~= nil then
					v33 = v33.emote;
				end;
				v32 = v33 ~= nil;
			end;
			if v32 and p8.emote then
				if l__EmoteMeta__1[p8.emote].animation then
					u15 = true;
					return;
				end;
			else
				return;
			end;
			return nil;
		end;
		for v34, v35 in ipairs(l__LevelRewards__22) do
			v23(v35, v34 - 1, l__LevelRewards__22);
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
	local v36 = {
		Size = UDim2.new(p5.props.Size.X.Scale, p5.props.Size.X.Offset, p5.props.Size.Y.Scale, p5.props.Size.Y.Scale), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__3.backgroundSecondary, 
		LayoutOrder = p5.props.LayoutOrder
	};
	local v37 = {};
	local v38 = v5 and v3.createElement("UIStroke", {
		Color = l__ColorUtil__4.WHITE, 
		Thickness = 1
	});
	if v38 then
		v37[#v37 + 1] = v38;
	end;
	local v39 = #v37;
	v37[v39 + 1] = v3.createElement("UISizeConstraint", {
		MinSize = Vector2.new(90, 0)
	});
	v37[v39 + 2] = v3.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical, 
		HorizontalAlignment = Enum.HorizontalAlignment.Center, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 4)
	});
	local v40 = {
		Size = UDim2.fromScale(1, 0.1), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BackgroundColor3 = v21, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	};
	local v41 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement(l__CornerFiller__5, {
			BottomRight = true, 
			BottomLeft = true
		}) };
	local v42 = not v6;
	if v42 then
		local v43 = {};
		local v44 = {};
		local v45 = {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		if v5 then
			local v46 = math.min(l__BattlePassUtils__6.getCurrExperienceProgression(p5.props.BattlePass.experience, p5.props.BattlePass.level) / l__BattlePassUtils__6.getExperienceForLevel(p5.props.BattlePass.level + 1), 1);
		else
			v46 = 1;
		end;
		v45.Size = UDim2.new(v46, 0, 0, 3);
		v45.BorderSizePixel = 0;
		v45.BackgroundTransparency = 0;
		v45.BackgroundColor3 = l__Theme__3.backgroundSuccess;
		v45.LayoutOrder = 1;
		v45.ZIndex = 100;
		v44.BottomBorderProgress = v3.createElement("Frame", v45, { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) });
		v43.BottomBorderProgress = v3.createFragment(v44);
		v43.BottomBorderBG = v3.createFragment({
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
		v42 = v3.createFragment(v43);
	end;
	if v42 then
		v41[#v41 + 1] = v42;
	end;
	local v47 = {
		Size = UDim2.fromScale(0, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	if v6 then
		local v48 = 0.3;
	else
		v48 = 0;
	end;
	v47.TextTransparency = v48;
	v47.Text = "<b>" .. tostring(p5.props.LevelRewards[1].level) .. "</b>";
	v47.TextXAlignment = Enum.TextXAlignment.Center;
	v47.TextYAlignment = Enum.TextYAlignment.Center;
	v47.TextColor3 = l__ColorUtil__4.WHITE;
	v47.RichText = true;
	v47.Font = Enum.Font.Roboto;
	v47.TextSize = 16;
	v41.LevelText = v3.createElement("TextLabel", v47);
	v37.LevelColumnHeader = v3.createElement("Frame", v40, v41);
	local v49 = {
		Size = UDim2.fromScale(1, 0.4), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__4.darken(l__Theme__3.backgroundPrimary, 0.9), 
		LayoutOrder = 2
	};
	local v50 = {};
	local v51 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 then
		local v52 = l__ImageId__7.LOCK_SOLID;
	elseif v19 ~= 0 and v19 == v19 and v19 then
		v52 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v52 = nil;
	end;
	v51.Image = v52;
	if v19 ~= 0 and v19 == v19 and v19 then
		local v53 = 0;
	else
		v53 = 0.4;
	end;
	v51.ImageTransparency = v53;
	v51.ZIndex = 200;
	v50[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v50[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v50[3] = v3.createElement("ImageLabel", v51);
	local function v54(p9, p10)
		local v55 = u8.values(l__BPRewardDisplayType__9);
		local function v56(p11)
			return p9[p11] ~= nil;
		end;
		local v57 = nil;
		for v58, v59 in ipairs(v55) do
			if v56(v59, v58 - 1, v55) == true then
				v57 = v59;
				break;
			end;
		end;
		return v3.createElement(u10, {
			Reward = p9, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v57, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p10, 
			Locked = v6
		});
	end;
	local v60 = table.create(#v9);
	for v61, v62 in ipairs(v9) do
		v60[v61] = v54(v62, v61 - 1, v9);
	end;
	local v63 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v64 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v65 = #v64;
	for v66, v67 in ipairs(v60) do
		v64[v65 + v66] = v67;
	end;
	v50[#v50 + 1] = v3.createElement("Frame", v63, v64);
	v37.FreePassRewards = v3.createElement("Frame", v49, v50);
	local v68 = {
		Size = UDim2.new(1, 0, 0.5, -8), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__3.backgroundPrimary, 
		LayoutOrder = 3
	};
	local v69 = {};
	local v70 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 or not p5.props.BattlePass.paid then
		local v71 = l__ImageId__7.LOCK_SOLID;
	elseif v20 ~= 0 and v20 == v20 and v20 then
		v71 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v71 = nil;
	end;
	v70.Image = v71;
	if v20 ~= 0 and v20 == v20 and v20 then
		local v72 = 0;
	else
		v72 = 0.4;
	end;
	v70.ImageTransparency = v72;
	v70.ZIndex = 200;
	v69[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v69[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v69[3] = v3.createElement("ImageLabel", v70);
	local function v73(p12, p13)
		local v74 = u8.values(l__BPRewardDisplayType__9);
		local function v75(p14)
			return p12[p14] ~= nil;
		end;
		local v76 = nil;
		for v77, v78 in ipairs(v74) do
			if v75(v78, v77 - 1, v74) == true then
				v76 = v78;
				break;
			end;
		end;
		return v3.createElement(u10, {
			Reward = p12, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v76, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p13, 
			Locked = v6 or not p5.props.BattlePass.paid
		});
	end;
	local v79 = table.create(#v15);
	for v80, v81 in ipairs(v15) do
		v79[v80] = v73(v81, v80 - 1, v15);
	end;
	local v82 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v83 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v84 = #v83;
	for v85, v86 in ipairs(v79) do
		v83[v84 + v85] = v86;
	end;
	v69[#v69 + 1] = v3.createElement("Frame", v82, v83);
	v37.BattlePassRewards = v3.createElement("Frame", v68, v69);
	return v3.createFragment({
		LevelRewardsCardContainer = v3.createElement("Frame", v36, v37)
	});
end;
return {
	BattlePassLevelRewardsListLevelCard = v4
};
