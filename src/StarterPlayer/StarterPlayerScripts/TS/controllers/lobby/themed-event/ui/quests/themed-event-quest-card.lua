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
		local v5, v6, v7 = ipairs((u1.entries(p1.Quest.collectReqs)));
		while true do
			v5(v6, v7);
			if not v5 then
				break;
			end;
			v7 = v5;
			local v8 = p1.PersonalCollectables[p1.ThemedEventType];
			if not v8 then
				local v9 = false;
			else
				v9 = v6[2] <= v8[v6[1]].amountCollected;
			end;
			if not v9 then
				v4 = false;
				break;
			end;		
		end;
		local function v10(p3)
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
		if v4 then
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
		local function v23(p4)
			local v24 = p4[1];
			local v25 = p4[2];
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
		local v32, v33, v34 = ipairs(v22);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			local v35 = v23(v33, v32 - 1, v22);
			if v35 ~= nil then
				v31 = v31 + 1;
				v30[v31] = v35;
			end;		
		end;
		local v36 = {
			Size = UDim2.fromScale(1, 0.65), 
			BackgroundColor3 = l__ColorUtil__3.BLACK, 
			BackgroundTransparency = 0.75, 
			BorderSizePixel = 0
		};
		local v37 = { u2.createElement("UIPadding", {
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
		local v38 = #v37;
		local v39, v40, v41 = ipairs(v30);
		while true do
			v39(v40, v41);
			if not v39 then
				break;
			end;
			v41 = v39;
			v37[v38 + v39] = v40;		
		end;
		v19[#v19 + 1] = u2.createElement("Frame", v36, v37);
		v16[#v16 + 1] = u2.createElement(l__Empty__7, v18, v19);
		v14.Content = u2.createElement(l__Empty__7, v15, v16);
		v12.Left = u2.createElement("Frame", v13, v14);
		local v42 = {
			Size = UDim2.fromScale(0.35, 1), 
			BackgroundColor3 = l__ColorUtil__3.darken(l__Theme__4.backgroundSecondary, 0.9), 
			BorderSizePixel = 0
		};
		local v43 = { u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 6)
			}), u2.createElement(l__CornerFiller__5, {
				TopLeft = true, 
				BottomLeft = true
			}) };
		local v44 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v45 = { u2.createElement("UIPadding", {
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
		local v46 = {
			Size = UDim2.fromScale(1, 0.7)
		};
		local v47 = { u2.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0.1, 0), 
				HorizontalAlignment = "Center"
			}) };
		local v48 = p1.Quest.badgeReward and u2.createElement(v10, {
			Name = p1.Quest.badgeReward.name .. " (Badge)"
		});
		if v48 then
			v47[#v47 + 1] = v48;
		end;
		local v49 = #v47;
		local v50 = p1.Quest.lockerRewards;
		if v50 then
			local v51 = u1.entries(p1.Quest.lockerRewards);
			local function v52(p5)
				local v53 = p5[2];
				local u12 = p5[1];
				local function v54(p6)
					local v55 = "";
					if u12 == "emotes" then
						v55 = l__EmoteMeta__8[p6].name .. " (Emote)";
					elseif u12 == "killEffects" then
						v55 = l__KillEffectMeta__9[p6].name .. " (Kill Effect)";
					elseif u12 == "lobbyGadgets" then
						v55 = l__LobbyGadgetMeta__10[p6].name .. " (Lobby Gadget)";
					elseif u12 == "titles" then
						v55 = l__TitleMeta__11[p6].text .. " (Title)";
					end;
					return u2.createElement(v10, {
						Name = v55
					});
				end;
				local v56 = table.create(#v53);
				local v57, v58, v59 = ipairs(v53);
				while true do
					v57(v58, v59);
					if not v57 then
						break;
					end;
					v59 = v57;
					v56[v57] = v54(v58, v57 - 1, v53);				
				end;
				local v60 = {};
				local v61 = #v60;
				local v62, v63, v64 = ipairs(v56);
				while true do
					v62(v63, v64);
					if not v62 then
						break;
					end;
					v64 = v62;
					v60[v61 + v62] = v63;				
				end;
				return u2.createFragment(v60);
			end;
			local v65 = {};
			local v66 = 0;
			local v67, v68, v69 = ipairs(v51);
			while true do
				v67(v68, v69);
				if not v67 then
					break;
				end;
				v69 = v67;
				local v70 = v52(v68, v67 - 1, v51);
				if v70 ~= nil then
					v66 = v66 + 1;
					v65[v66] = v70;
				end;			
			end;
			v50 = v65;
		end;
		if v50 then
			local v71, v72, v73 = ipairs(v50);
			while true do
				v71(v72, v73);
				if not v71 then
					break;
				end;
				v73 = v71;
				v47[v49 + v71] = v72;			
			end;
		end;
		v45[#v45 + 1] = u2.createElement(l__Empty__7, v46, v47);
		v43[#v43 + 1] = u2.createElement(l__Empty__7, v44, v45);
		v12.Right = u2.createElement("Frame", v42, v43);
		return u2.createElement(l__Empty__7, v11, v12);
	end)
};
