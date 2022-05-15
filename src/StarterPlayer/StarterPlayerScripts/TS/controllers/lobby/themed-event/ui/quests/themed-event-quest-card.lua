
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v2.ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__CornerFiller__5 = v2.CornerFiller;
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-meta").ThemedEventCollectableMeta;
local l__Empty__7 = v2.Empty;
local l__EmoteMeta__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__KillEffectMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__LobbyGadgetMeta__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__TitleMeta__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;
return {
	ThemedEventQuestCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.entries(p1.Quest.collectReqs);
		local function v5(p3)
			local v6 = p1.PersonalCollectables[p1.ThemedEventType];
			if not v6 then
				return false;
			end;
			return p3[2] <= v6[p3[1]].amountCollected;
		end;
		local v7 = true;
		for v8, v9 in ipairs(v4) do
			if not v5(v9, v8 - 1, v4) then
				v7 = false;
				break;
			end;
		end;
		local function v10(p4)
			return u2.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.5), 
				Text = "<b>" .. p4.Name .. "</b>", 
				TextColor3 = l__ColorUtil__3.WHITE, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextXAlignment = "Center", 
				TextYAlignment = "Top", 
				BackgroundTransparency = 1
			}, { u2.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) });
		end;
		local v11 = {
			Size = UDim2.new(0.95, 0, 0.2, 0)
		};
		local v12 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal"
			}) };
		local v13 = {
			Size = UDim2.fromScale(0.65, 1), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v14 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement(l__CornerFiller__5, {
				TopRight = true, 
				BottomRight = true
			}) };
		local v15 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v16 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}), u2.createElement("UIListLayout", {
				FillDirection = "Horizontal"
			}) };
		local v17 = false;
		if p1.Quest.image ~= nil then
			v17 = u2.createElement("ImageLabel", {
				Image = p1.Quest.image
			});
		end;
		if v17 then
			v16[#v16 + 1] = v17;
		end;
		local v18 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v19 = {};
		local v20 = {
			Size = UDim2.fromScale(1, 0.25)
		};
		if v7 then
			local v21 = " \226\156\133";
		else
			v21 = "";
		end;
		v20.Text = "<b>" .. p1.Quest.name .. "</b> " .. v21;
		v20.TextColor3 = l__Theme__4.mcYellow;
		v20.TextScaled = true;
		v20.RichText = true;
		v20.Font = "Roboto";
		v20.TextXAlignment = "Left";
		v20.TextYAlignment = "Top";
		v20.BackgroundTransparency = 1;
		v19[1] = u2.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.1, 0)
		});
		v19[2] = u2.createElement("TextLabel", v20);
		local v22 = u1.entries(p1.Quest.collectReqs);
		local function v23(p5)
			local v24 = p5[1];
			local v25 = p5[2];
			local v26 = p1.PersonalCollectables[p1.ThemedEventType];
			if not v26 then
				return nil;
			end;
			local l__amountCollected__27 = v26[v24].amountCollected;
			local v28 = {
				Size = UDim2.new(1, 0, 0, 20)
			};
			if v25 <= l__amountCollected__27 then
				local v29 = l__ColorUtil__3.richTextColor(l__Theme__4.mcGreen);
			else
				v29 = l__ColorUtil__3.richTextColor(l__Theme__4.mcRed);
			end;
			v28.Text = "Collect " .. tostring(v25) .. " " .. u6[v24].name .. "s: <font color=\"" .. v29 .. "\"><b>(" .. tostring(math.min(v25, l__amountCollected__27)) .. "/" .. tostring(v25) .. ")</b></font>";
			v28.TextColor3 = l__ColorUtil__3.WHITE;
			v28.TextScaled = true;
			v28.RichText = true;
			v28.Font = "Roboto";
			v28.TextXAlignment = "Left";
			v28.TextYAlignment = "Top";
			v28.BackgroundTransparency = 1;
			return u2.createElement("TextLabel", v28, { u2.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) });
		end;
		local v30 = {};
		local v31 = 0;
		for v32, v33 in ipairs(v22) do
			local v34 = v23(v33, v32 - 1, v22);
			if v34 ~= nil then
				v31 = v31 + 1;
				v30[v31] = v34;
			end;
		end;
		local v35 = {
			Size = UDim2.fromScale(1, 0.65), 
			BackgroundColor3 = l__ColorUtil__3.BLACK, 
			BackgroundTransparency = 0.75, 
			BorderSizePixel = 0
		};
		local v36 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.025, 0), 
				PaddingRight = UDim.new(0.025, 0)
			}), u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0)
			}), u2.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}) };
		local v37 = #v36;
		for v38, v39 in ipairs(v30) do
			v36[v37 + v38] = v39;
		end;
		v19[#v19 + 1] = u2.createElement("Frame", v35, v36);
		v16[#v16 + 1] = u2.createElement(l__Empty__7, v18, v19);
		v14.Content = u2.createElement(l__Empty__7, v15, v16);
		v12.Left = u2.createElement("Frame", v13, v14);
		local v40 = {
			Size = UDim2.fromScale(0.35, 1), 
			BackgroundColor3 = l__ColorUtil__3.darken(l__Theme__4.backgroundSecondary, 0.9), 
			BorderSizePixel = 0
		};
		local v41 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement(l__CornerFiller__5, {
				TopLeft = true, 
				BottomLeft = true
			}) };
		local v42 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v43 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}), u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				HorizontalAlignment = "Center"
			}), u2.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.2), 
				Text = "<b>\240\159\146\142 Rewards</b>", 
				TextColor3 = l__Theme__4.textPrimary, 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextXAlignment = "Center", 
				TextYAlignment = "Top", 
				BackgroundTransparency = 1
			}) };
		local v44 = {
			Size = UDim2.fromScale(1, 0.7)
		};
		local v45 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				HorizontalAlignment = "Center"
			}) };
		local v46 = p1.Quest.badgeReward and u2.createElement(v10, {
			Name = p1.Quest.badgeReward.name .. " (Badge)"
		});
		if v46 then
			v45[#v45 + 1] = v46;
		end;
		local v47 = #v45;
		local v48 = p1.Quest.lockerRewards;
		if v48 then
			local v49 = u1.entries(p1.Quest.lockerRewards);
			local function v50(p6)
				local v51 = p6[2];
				local u12 = p6[1];
				local function v52(p7)
					local v53 = "";
					if u12 == "emotes" then
						v53 = l__EmoteMeta__8[p7].name .. " (Emote)";
					elseif u12 == "killEffects" then
						v53 = l__KillEffectMeta__9[p7].name .. " (Kill Effect)";
					elseif u12 == "lobbyGadgets" then
						v53 = l__LobbyGadgetMeta__10[p7].name .. " (Lobby Gadget)";
					elseif u12 == "titles" then
						v53 = l__TitleMeta__11[p7].text .. " (Title)";
					end;
					return u2.createElement(v10, {
						Name = v53
					});
				end;
				local v54 = table.create(#v51);
				for v55, v56 in ipairs(v51) do
					v54[v55] = v52(v56, v55 - 1, v51);
				end;
				local v57 = {};
				local v58 = #v57;
				for v59, v60 in ipairs(v54) do
					v57[v58 + v59] = v60;
				end;
				return u2.createFragment(v57);
			end;
			local v61 = {};
			local v62 = 0;
			for v63, v64 in ipairs(v49) do
				local v65 = v50(v64, v63 - 1, v49);
				if v65 ~= nil then
					v62 = v62 + 1;
					v61[v62] = v65;
				end;
			end;
			v48 = v61;
		end;
		if v48 then
			for v66, v67 in ipairs(v48) do
				v45[v47 + v66] = v67;
			end;
		end;
		v43[#v43 + 1] = u2.createElement(l__Empty__7, v44, v45);
		v41[#v41 + 1] = u2.createElement(l__Empty__7, v42, v43);
		v12.Right = u2.createElement("Frame", v40, v41);
		return u2.createElement(l__Empty__7, v11, v12);
	end)
};

