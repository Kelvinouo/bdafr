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
	local v9, v10, v11 = ipairs(p5.props.LevelRewards);
	while true do
		v9(v10, v11);
		if not v9 then
			break;
		end;
		v11 = v9;
		if not v10.paid == true then
			v8 = v8 + 1;
			v7[v8] = v10;
		end;	
	end;
	local v12 = {};
	local v13 = 0;
	local v14, v15, v16 = ipairs(p5.props.LevelRewards);
	while true do
		v14(v15, v16);
		if not v14 then
			break;
		end;
		v16 = v14;
		if v15.paid == true then
			v13 = v13 + 1;
			v12[v13] = v15;
		end;	
	end;
	local v17 = not v6 and #v7;
	local v18 = not v6 and (p5.props.BattlePass.paid and #v12);
	local v19 = (function()
		local l__LevelRewards__20 = p5.props.LevelRewards;
		local u11 = false;
		local u12 = false;
		local u13 = false;
		local u14 = false;
		local u15 = false;
		local function v21(p6)
			local v22 = p6.kit ~= nil;
			if not v22 then
				local v23 = p6.comingSoon;
				if v23 ~= nil then
					v23 = v23.kit;
				end;
				v22 = v23 ~= nil;
			end;
			if v22 then
				u11 = true;
				return;
			end;
			local v24 = p6.kitSkin ~= nil;
			if not v24 then
				local v25 = p6.comingSoon;
				if v25 ~= nil then
					v25 = v25.kitSkin;
				end;
				v24 = v25 ~= nil;
			end;
			if v24 then
				u12 = true;
				return;
			end;
			local v26 = p6.killEffect ~= nil;
			if not v26 then
				local v27 = p6.comingSoon;
				if v27 ~= nil then
					v27 = v27.killEffect;
				end;
				v26 = v27 ~= nil;
			end;
			if v26 then
				u13 = true;
				return;
			end;
			local v28 = p6.lobbyGadget ~= nil;
			if not v28 then
				local v29 = p6.comingSoon;
				if v29 ~= nil then
					v29 = v29.lobbyGadget;
				end;
				v28 = v29 ~= nil;
			end;
			if v28 then
				u14 = true;
				return;
			end;
			local v30 = p6.emote ~= nil;
			if not v30 then
				local v31 = p6.comingSoon;
				if v31 ~= nil then
					v31 = v31.emote;
				end;
				v30 = v31 ~= nil;
			end;
			if v30 and p6.emote then
				if l__EmoteMeta__1[p6.emote].animation then
					u15 = true;
					return;
				end;
			else
				return;
			end;
			return nil;
		end;
		local v32, v33, v34 = ipairs(l__LevelRewards__20);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v21(v33, v32 - 1, l__LevelRewards__20);		
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
	local v35 = {
		Size = UDim2.new(p5.props.Size.X.Scale, p5.props.Size.X.Offset, p5.props.Size.Y.Scale, p5.props.Size.Y.Scale), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__Theme__3.backgroundSecondary, 
		LayoutOrder = p5.props.LayoutOrder
	};
	local v36 = {};
	local v37 = v5 and v3.createElement("UIStroke", {
		Color = l__ColorUtil__4.WHITE, 
		Thickness = 1
	});
	if v37 then
		v36[#v36 + 1] = v37;
	end;
	local v38 = #v36;
	v36[v38 + 1] = v3.createElement("UISizeConstraint", {
		MinSize = Vector2.new(90, 0)
	});
	v36[v38 + 2] = v3.createElement("UIListLayout", {
		FillDirection = Enum.FillDirection.Vertical, 
		HorizontalAlignment = Enum.HorizontalAlignment.Center, 
		VerticalAlignment = Enum.VerticalAlignment.Center, 
		SortOrder = Enum.SortOrder.LayoutOrder, 
		Padding = UDim.new(0, 4)
	});
	local v39 = {
		Size = UDim2.fromScale(1, 0.1), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BackgroundColor3 = v19, 
		BackgroundTransparency = 0, 
		BorderSizePixel = 0, 
		LayoutOrder = 1
	};
	local v40 = { v3.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		}), v3.createElement(l__CornerFiller__5, {
			BottomRight = true, 
			BottomLeft = true
		}) };
	local v41 = not v6;
	if v41 then
		local v42 = {};
		local v43 = {};
		local v44 = {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		if v5 then
			local v45 = math.min(l__BattlePassUtils__6.getCurrExperienceProgression(p5.props.BattlePass.experience, p5.props.BattlePass.level) / l__BattlePassUtils__6.getExperienceForLevel(p5.props.BattlePass.level + 1), 1);
		else
			v45 = 1;
		end;
		v44.Size = UDim2.new(v45, 0, 0, 3);
		v44.BorderSizePixel = 0;
		v44.BackgroundTransparency = 0;
		v44.BackgroundColor3 = l__Theme__3.backgroundSuccess;
		v44.LayoutOrder = 1;
		v44.ZIndex = 100;
		v43.BottomBorderProgress = v3.createElement("Frame", v44, { v3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) });
		v42.BottomBorderProgress = v3.createFragment(v43);
		v42.BottomBorderBG = v3.createFragment({
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
		v41 = v3.createFragment(v42);
	end;
	if v41 then
		v40[#v40 + 1] = v41;
	end;
	local v46 = {
		Size = UDim2.fromScale(0, 1), 
		AnchorPoint = Vector2.new(0.5, 0.5), 
		Position = UDim2.fromScale(0.5, 0.5), 
		BackgroundTransparency = 1
	};
	if v6 then
		local v47 = 0.3;
	else
		v47 = 0;
	end;
	v46.TextTransparency = v47;
	v46.Text = "<b>" .. tostring(p5.props.LevelRewards[1].level) .. "</b>";
	v46.TextXAlignment = Enum.TextXAlignment.Center;
	v46.TextYAlignment = Enum.TextYAlignment.Center;
	v46.TextColor3 = l__ColorUtil__4.WHITE;
	v46.RichText = true;
	v46.Font = Enum.Font.Roboto;
	v46.TextSize = 16;
	v40.LevelText = v3.createElement("TextLabel", v46);
	v36.LevelColumnHeader = v3.createElement("Frame", v39, v40);
	local v48 = {
		Size = UDim2.fromScale(1, 0.4), 
		AutomaticSize = Enum.AutomaticSize.X, 
		BorderSizePixel = 0, 
		BackgroundTransparency = 0, 
		BackgroundColor3 = l__ColorUtil__4.darken(l__Theme__3.backgroundPrimary, 0.9), 
		LayoutOrder = 2
	};
	local v49 = {};
	local v50 = {
		AnchorPoint = Vector2.new(0.5, 0), 
		Position = UDim2.new(1, 0, 0, 8), 
		Size = UDim2.fromOffset(16, 16), 
		BackgroundTransparency = 1, 
		ScaleType = "Fit"
	};
	if v6 then
		local v51 = l__ImageId__7.LOCK_SOLID;
	elseif v17 ~= 0 and v17 == v17 and v17 then
		v51 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v51 = nil;
	end;
	v50.Image = v51;
	if v17 ~= 0 and v17 == v17 and v17 then
		local v52 = 0;
	else
		v52 = 0.4;
	end;
	v50.ImageTransparency = v52;
	v50.ZIndex = 200;
	v49[1] = v3.createElement("UICorner", {
		CornerRadius = UDim.new(0, 5)
	});
	v49[2] = v3.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, 16), 
		PaddingRight = UDim.new(0, 16)
	});
	v49[3] = v3.createElement("ImageLabel", v50);
	local function v53(p7, p8)
		local v54 = nil;
		local v55, v56, v57 = ipairs((u8.values(l__BPRewardDisplayType__9)));
		while true do
			v55(v56, v57);
			if not v55 then
				break;
			end;
			v57 = v55;
			if p7[v56] ~= nil == true then
				v54 = v56;
				break;
			end;		
		end;
		return v3.createElement(u10, {
			Reward = p7, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v54, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p8, 
			Locked = v6
		});
	end;
	local v58 = table.create(#v7);
	local v59, v60, v61 = ipairs(v7);
	while true do
		v59(v60, v61);
		if not v59 then
			break;
		end;
		v61 = v59;
		v58[v59] = v53(v60, v59 - 1, v7);	
	end;
	local v62 = {
		Size = UDim2.fromScale(1, 1), 
		BackgroundTransparency = 1
	};
	local v63 = { v3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		}) };
	local v64 = #v63;
	local v65, v66, v67 = ipairs(v58);
	while true do
		v65(v66, v67);
		if not v65 then
			break;
		end;
		v67 = v65;
		v63[v64 + v65] = v66;	
	end;
	v49[#v49 + 1] = v3.createElement("Frame", v62, v63);
	v36.FreePassRewards = v3.createElement("Frame", v48, v49);
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
	elseif v18 ~= 0 and v18 == v18 and v18 then
		v71 = l__ImageId__7.CHECK_CIRCLE_SOLID;
	else
		v71 = nil;
	end;
	v70.Image = v71;
	if v18 ~= 0 and v18 == v18 and v18 then
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
	local function v73(p9, p10)
		local v74 = nil;
		local v75, v76, v77 = ipairs((u8.values(l__BPRewardDisplayType__9)));
		while true do
			v75(v76, v77);
			if not v75 then
				break;
			end;
			v77 = v75;
			if p9[v76] ~= nil == true then
				v74 = v76;
				break;
			end;		
		end;
		return v3.createElement(u10, {
			Reward = p9, 
			SetReward = p5.props.SetReward, 
			RewardDisplayType = v74, 
			SetActive = p5.props.SetActive, 
			Active = p5.props.Active, 
			LayoutOrder = p10, 
			Locked = v6 or not p5.props.BattlePass.paid
		});
	end;
	local v78 = table.create(#v12);
	local v79, v80, v81 = ipairs(v12);
	while true do
		v79(v80, v81);
		if not v79 then
			break;
		end;
		v81 = v79;
		v78[v79] = v73(v80, v79 - 1, v12);	
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
	local v85, v86, v87 = ipairs(v78);
	while true do
		v85(v86, v87);
		if not v85 then
			break;
		end;
		v87 = v85;
		v83[v84 + v85] = v86;	
	end;
	v69[#v69 + 1] = v3.createElement("Frame", v82, v83);
	v36.BattlePassRewards = v3.createElement("Frame", v68, v69);
	return v3.createFragment({
		LevelRewardsCardContainer = v3.createElement("Frame", v35, v36)
	});
end;
return {
	BattlePassLevelRewardsListLevelCard = v4
};
