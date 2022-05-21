-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__ColorUtil__3 = v2.ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	ClanProfileGeneralHeader = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local function v4(p3)
			return u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(1, 0.2)
			}, { u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					TextColor3 = l__ColorUtil__3.WHITE, 
					Font = "Roboto", 
					Text = p3.Stat, 
					TextXAlignment = "Left", 
					TextScaled = true, 
					RichText = true, 
					TextTransparency = 0.3, 
					BackgroundTransparency = 1
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 16
					}) }), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					Position = UDim2.fromScale(1, 0), 
					AnchorPoint = Vector2.new(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					TextColor3 = l__ColorUtil__3.WHITE, 
					Font = "Roboto", 
					Text = "<b>" .. p3.Value .. "</b>", 
					TextXAlignment = "Right", 
					TextScaled = true, 
					RichText = true, 
					BackgroundTransparency = 1, 
					AutoLocalize = false
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 16
					}) }) });
		end;
		local v5 = {};
		for v6, v7 in pairs(p1) do
			v5[v6] = v7;
		end;
		v5.Clan = nil;
		local v8 = {};
		for v9, v10 in pairs(v5) do
			v8[v9] = v10;
		end;
		local v11 = {
			Left = u1.createElement(l__Empty__2, {
				Size = UDim2.fromScale(0.5, 1)
			}, {
				ClanNames = u1.createElement(l__Empty__2, {
					Size = UDim2.fromScale(1, 0.45), 
					LayoutOrder = 1
				}, { u1.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						VerticalAlignment = "Top", 
						HorizontalAlignment = "Left", 
						Padding = UDim.new(0.05, 0)
					}), u1.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0.55), 
						TextColor3 = l__Theme__4.textPrimary, 
						Font = "Roboto", 
						Text = "<b>" .. p1.Clan.name .. "</b>", 
						TextXAlignment = "Left", 
						TextYAlignment = "Top", 
						TextScaled = true, 
						RichText = true, 
						AutoLocalize = false, 
						BackgroundTransparency = 1
					}, { u1.createElement("UITextSizeConstraint", {
							MaxTextSize = 32
						}) }), u1.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0.4), 
						TextColor3 = l__ColorUtil__3.WHITE, 
						Font = "Roboto", 
						Text = "<b>[" .. p1.Clan.tag .. "]</b>", 
						TextXAlignment = "Left", 
						TextYAlignment = "Top", 
						TextScaled = true, 
						RichText = true, 
						AutoLocalize = false, 
						TextTransparency = 0.3, 
						BackgroundTransparency = 1
					}, { u1.createElement("UITextSizeConstraint", {
							MaxTextSize = 22
						}) }) }), 
				ClanLevel = u1.createElement(l__Empty__2, {
					Size = UDim2.fromScale(1, 0.4), 
					LayoutOrder = 2
				}, { u1.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.15, 0), 
						VerticalAlignment = "Bottom"
					}), u1.createElement(l__Empty__2, {
						Size = UDim2.fromScale(1, 1)
					}, { u1.createElement("UIListLayout", {
							FillDirection = "Horizontal", 
							VerticalAlignment = "Bottom"
						}), u1.createElement("TextLabel", {
							Size = UDim2.fromScale(0.5, 1), 
							TextColor3 = l__Theme__4.mcYellow, 
							Font = "Roboto", 
							Text = "<b>Lv. " .. tostring(p1.Clan.level) .. "</b>", 
							TextXAlignment = "Left", 
							TextYAlignment = "Bottom", 
							TextScaled = true, 
							RichText = true, 
							BackgroundTransparency = 1
						}, { u1.createElement("UITextSizeConstraint", {
								MaxTextSize = 28
							}) }) }) }),
				(u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					VerticalAlignment = "Top", 
					HorizontalAlignment = "Left", 
					Padding = UDim.new(0.15, 0), 
					SortOrder = "LayoutOrder"
				}))
			}),
			u1.createElement("UIPadding", {
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0), 
				PaddingBottom = UDim.new(0.1, 0), 
				PaddingTop = UDim.new(0.1, 0)
			}), (u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				Padding = UDim.new(0.1, 0), 
				SortOrder = "LayoutOrder"
			}))
		};
		local v12 = {
			Size = UDim2.fromScale(0.4, 1)
		};
		local v13 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				VerticalAlignment = "Top", 
				HorizontalAlignment = "Left", 
				Padding = UDim.new(0.05, 0)
			}) };
		local v14 = #v13;
		local v15 = {
			Stat = "Members"
		};
		local v16 = 0;
		for v17, v18 in pairs(p1.Clan.members) do
			v16 = v16 + 1;
		end;
		v15.Value = tostring(v16) .. "/" .. tostring(p1.Clan.maxMembers);
		v13[v14 + 1] = u1.createElement(v4, v15);
		v13[v14 + 2] = u1.createElement(v4, {
			Stat = "Leader", 
			Value = p1.Clan.leader.offlinePlayer.name
		});
		v11.Right = u1.createElement(l__Empty__2, v12, v13);
		return u1.createFragment({
			ClanHeader = u1.createElement("Frame", v8, v11)
		});
	end)
};
