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
		local v4 = true;
		for v5, v6 in ipairs((u1.entries(p1.Quest.collectReqs))) do
			local v7 = p1.PersonalCollectables[p1.ThemedEventType];
			if not v7 then
				local v8 = false;
			else
				v8 = v6[2] <= v7[v6[1]].amountCollected;
			end;
			if not v8 then
				v4 = false;
				break;
			end;
		end;
		local function v9(p3)
			return u2.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.5), 
				Text = "<b>" .. p3.Name .. "</b>", 
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
		local v10 = {
			Size = UDim2.new(0.95, 0, 0.2, 0)
		};
		local v11 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal"
			}) };
		local v12 = {
			Size = UDim2.fromScale(0.65, 1), 
			BackgroundColor3 = l__Theme__4.backgroundPrimary, 
			BorderSizePixel = 0
		};
		local v13 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement(l__CornerFiller__5, {
				TopRight = true, 
				BottomRight = true
			}) };
		local v14 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v15 = { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0.1, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}), u2.createElement("UIListLayout", {
				FillDirection = "Horizontal"
			}) };
		local v16 = false;
		if p1.Quest.image ~= nil then
			v16 = u2.createElement("ImageLabel", {
				Image = p1.Quest.image
			});
		end;
		if v16 then
			v15[#v15 + 1] = v16;
		end;
		local v17 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v18 = {};
		local v19 = {
			Size = UDim2.fromScale(1, 0.25)
		};
		if v4 then
			local v20 = " \226\156\133";
		else
			v20 = "";
		end;
		v19.Text = "<b>" .. p1.Quest.name .. "</b> " .. v20;
		v19.TextColor3 = l__Theme__4.mcYellow;
		v19.TextScaled = true;
		v19.RichText = true;
		v19.Font = "Roboto";
		v19.TextXAlignment = "Left";
		v19.TextYAlignment = "Top";
		v19.BackgroundTransparency = 1;
		v18[1] = u2.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.1, 0)
		});
		v18[2] = u2.createElement("TextLabel", v19);
		local v21 = u1.entries(p1.Quest.collectReqs);
		local function v22(p4)
			local v23 = p4[1];
			local v24 = p4[2];
			local v25 = p1.PersonalCollectables[p1.ThemedEventType];
			if not v25 then
				return nil;
			end;
			local l__amountCollected__26 = v25[v23].amountCollected;
			local v27 = {
				Size = UDim2.new(1, 0, 0, 20)
			};
			if v24 <= l__amountCollected__26 then
				local v28 = l__ColorUtil__3.richTextColor(l__Theme__4.mcGreen);
			else
				v28 = l__ColorUtil__3.richTextColor(l__Theme__4.mcRed);
			end;
			v27.Text = "Collect " .. tostring(v24) .. " " .. u6[v23].name .. "s: <font color=\"" .. v28 .. "\"><b>(" .. tostring(math.min(v24, l__amountCollected__26)) .. "/" .. tostring(v24) .. ")</b></font>";
			v27.TextColor3 = l__ColorUtil__3.WHITE;
			v27.TextScaled = true;
			v27.RichText = true;
			v27.Font = "Roboto";
			v27.TextXAlignment = "Left";
			v27.TextYAlignment = "Top";
			v27.BackgroundTransparency = 1;
			return u2.createElement("TextLabel", v27, { u2.createElement("UITextSizeConstraint", {
					MaxTextSize = 20
				}) });
		end;
		local v29 = {};
		local v30 = 0;
		for v31, v32 in ipairs(v21) do
			local v33 = v22(v32, v31 - 1, v21);
			if v33 ~= nil then
				v30 = v30 + 1;
				v29[v30] = v33;
			end;
		end;
		local v34 = {
			Size = UDim2.fromScale(1, 0.65), 
			BackgroundColor3 = l__ColorUtil__3.BLACK, 
			BackgroundTransparency = 0.75, 
			BorderSizePixel = 0
		};
		local v35 = { u2.createElement("UIPadding", {
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
		local v36 = #v35;
		for v37, v38 in ipairs(v29) do
			v35[v36 + v37] = v38;
		end;
		v18[#v18 + 1] = u2.createElement("Frame", v34, v35);
		v15[#v15 + 1] = u2.createElement(l__Empty__7, v17, v18);
		v13.Content = u2.createElement(l__Empty__7, v14, v15);
		v11.Left = u2.createElement("Frame", v12, v13);
		local v39 = {
			Size = UDim2.fromScale(0.35, 1), 
			BackgroundColor3 = l__ColorUtil__3.darken(l__Theme__4.backgroundSecondary, 0.9), 
			BorderSizePixel = 0
		};
		local v40 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement(l__CornerFiller__5, {
				TopLeft = true, 
				BottomLeft = true
			}) };
		local v41 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v42 = { u2.createElement("UIPadding", {
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
		local v43 = {
			Size = UDim2.fromScale(1, 0.7)
		};
		local v44 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				HorizontalAlignment = "Center"
			}) };
		local v45 = p1.Quest.badgeReward and u2.createElement(v9, {
			Name = p1.Quest.badgeReward.name .. " (Badge)"
		});
		if v45 then
			v44[#v44 + 1] = v45;
		end;
		local v46 = #v44;
		local v47 = p1.Quest.lockerRewards;
		if v47 then
			local v48 = u1.entries(p1.Quest.lockerRewards);
			local function v49(p5)
				local v50 = p5[2];
				local u12 = p5[1];
				local function v51(p6)
					local v52 = "";
					if u12 == "emotes" then
						v52 = l__EmoteMeta__8[p6].name .. " (Emote)";
					elseif u12 == "killEffects" then
						v52 = l__KillEffectMeta__9[p6].name .. " (Kill Effect)";
					elseif u12 == "lobbyGadgets" then
						v52 = l__LobbyGadgetMeta__10[p6].name .. " (Lobby Gadget)";
					elseif u12 == "titles" then
						v52 = l__TitleMeta__11[p6].text .. " (Title)";
					end;
					return u2.createElement(v9, {
						Name = v52
					});
				end;
				local v53 = table.create(#v50);
				for v54, v55 in ipairs(v50) do
					v53[v54] = v51(v55, v54 - 1, v50);
				end;
				local v56 = {};
				local v57 = #v56;
				for v58, v59 in ipairs(v53) do
					v56[v57 + v58] = v59;
				end;
				return u2.createFragment(v56);
			end;
			local v60 = {};
			local v61 = 0;
			for v62, v63 in ipairs(v48) do
				local v64 = v49(v63, v62 - 1, v48);
				if v64 ~= nil then
					v61 = v61 + 1;
					v60[v61] = v64;
				end;
			end;
			v47 = v60;
		end;
		if v47 then
			for v65, v66 in ipairs(v47) do
				v44[v46 + v65] = v66;
			end;
		end;
		v42[#v42 + 1] = u2.createElement(l__Empty__7, v43, v44);
		v40[#v40 + 1] = u2.createElement(l__Empty__7, v41, v42);
		v11.Right = u2.createElement("Frame", v39, v40);
		return u2.createElement(l__Empty__7, v10, v11);
	end)
};
