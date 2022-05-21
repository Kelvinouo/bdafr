-- Script Hash: 847386677b89f767652622bb3ed5e091b83cc1ce3605a2e237fa13a582e9d0c6b98a467c8b0359f200eadac4451c86b0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v2.DeviceUtil;
local u3 = v1.import(script, script.Parent, "clan-chat-hoarcekat-messages").ClanChatHoarcekatMessages;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__GetUIScaleAncestors__5 = v2.GetUIScaleAncestors;
local l__CalcTotalUIScale__6 = v2.CalcTotalUIScale;
local l__Empty__7 = v2.Empty;
local l__PlayerRender__8 = v2.PlayerRender;
local l__ColorUtil__9 = v2.ColorUtil;
local l__AutoCanvasScrollingFrame__10 = v2.AutoCanvasScrollingFrame;
local l__TextInputComponent__11 = v2.TextInputComponent;
local l__Theme__12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ClanProfilePageLayout__13 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
return {
	ClanProfileChatTab = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(true);
		local v6, v7 = l__useState__3({});
		local v8, v9 = l__useState__3("");
		local u14 = u1.createRef();
		local u15 = u1.createRef();
		p2.useEffect(function()
			if l__DeviceUtil__2.isHoarceKat() then
				v7(u3);
				return nil;
			end;
			local v10 = u14:getValue();
			if not v10 or not u15:getValue() then
				return nil;
			end;
			task.spawn(function()
				local v11 = l__Flamework__4.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):getClanChatMessages();
				if v11 then
					v7(v11);
				end;
			end);
			local u16 = l__Flamework__4.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):clanChatUpdateEvent():Connect(function(p3)
				local v12 = l__CalcTotalUIScale__6((l__GetUIScaleAncestors__5(v10)));
				if math.abs((v10.AbsoluteCanvasSize.Y - v10.AbsoluteSize.Y) / v12 - v10.CanvasPosition.Y / v12) < 1 then
					v5(true);
				else
					v5(false);
				end;
				v7(p3);
			end);
			return function()
				u16:Disconnect();
			end;
		end, {});
		local v13 = {};
		local v14 = #v13;
		local v15 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v16 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 10), 
				SortOrder = "LayoutOrder"
			}) };
		local v17 = #v16;
		local function v18(p4)
			return u1.createFragment({
				MessageContainer = u1.createElement(l__Empty__7, {
					Size = UDim2.new(1, 0, 0, 32), 
					AutomaticSize = "Y"
				}, {
					MessageUserAvatar = u1.createElement(l__PlayerRender__8, {
						Size = UDim2.new(0, 32, 0, 32), 
						Player = {
							userId = p4.userId, 
							name = ""
						}, 
						LayoutOrder = 1, 
						BackgroundTransparency = 1
					}, { u1.createElement("UICorner", {
							CornerRadius = UDim.new(1, 0)
						}) }), 
					MessageWrapper = u1.createElement(l__Empty__7, {
						Size = UDim2.new(0.8, 0, 0, 32), 
						AutomaticSize = "Y", 
						LayoutOrder = 2
					}, {
						MessageHeader = u1.createElement(l__Empty__7, {
							Size = UDim2.new(1, 0, 0, 16), 
							LayoutOrder = 1
						}, {
							SenderName = u1.createElement("TextLabel", {
								Size = UDim2.fromScale(0, 1), 
								Text = "<b>" .. tostring(p4.displayName) .. "</b>", 
								TextColor3 = l__ColorUtil__9.WHITE, 
								Font = "Roboto", 
								AutomaticSize = "X", 
								TextXAlignment = "Left", 
								TextScaled = true, 
								RichText = true, 
								BackgroundTransparency = 1
							}, { u1.createElement("UITextSizeConstraint", {
									MaxTextSize = 16
								}) }), 
							TimeSent = u1.createElement("TextLabel", {
								Size = UDim2.fromScale(0.5, 1), 
								Text = DateTime.fromUnixTimestamp(p4.time):FormatLocalTime("L LTS", "en-us"), 
								TextColor3 = l__ColorUtil__9.WHITE, 
								Font = "Roboto", 
								TextXAlignment = "Left", 
								TextScaled = true, 
								RichText = true, 
								TextTransparency = 0.3, 
								BackgroundTransparency = 1
							}, { u1.createElement("UITextSizeConstraint", {
									MaxTextSize = 14
								}) }),
							(u1.createElement("UIListLayout", {
								FillDirection = "Horizontal", 
								HorizontalAlignment = "Left", 
								VerticalAlignment = "Center", 
								Padding = UDim.new(0.05, 0)
							}))
						}), 
						MessageText = u1.createElement("TextLabel", {
							Size = UDim2.fromScale(1, 0), 
							AutomaticSize = "Y", 
							Text = p4.message, 
							TextColor3 = l__ColorUtil__9.WHITE, 
							Font = "Roboto", 
							TextXAlignment = "Left", 
							TextYAlignment = "Top", 
							TextScaled = true, 
							RichText = true, 
							BackgroundTransparency = 1, 
							LayoutOrder = 2
						}, { u1.createElement("UITextSizeConstraint", {
								MaxTextSize = 16
							}) }),
						(u1.createElement("UIListLayout", {
							FillDirection = "Vertical", 
							HorizontalAlignment = "Left", 
							VerticalAlignment = "Top", 
							Padding = UDim.new(0, 4), 
							SortOrder = "LayoutOrder"
						}))
					}),
					(u1.createElement("UIListLayout", {
						FillDirection = "Horizontal", 
						HorizontalAlignment = "Left", 
						VerticalAlignment = "Top", 
						Padding = UDim.new(0, 10), 
						SortOrder = "LayoutOrder"
					}))
				})
			});
		end;
		local v19 = table.create(#v6);
		for v20, v21 in ipairs(v6) do
			v19[v20] = v18(v21, v20 - 1, v6);
		end;
		local v22 = {
			AdditionalSpace = 6, 
			ScrollingFrameRef = u14, 
			ScrollingFrameProps = {
				Size = UDim2.new(1, 0, 0.9, -10), 
				LayoutOrder = 1
			}
		};
		function v22.OnCalc(p5)
			if v4 then
				p5.CanvasPosition = Vector2.new(0, p5.AbsoluteCanvasSize.Y);
			end;
		end;
		local v23 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 6), 
				[u1.Ref] = u15
			}) };
		local v24 = #v23;
		for v25, v26 in ipairs(v19) do
			v23[v24 + v25] = v26;
		end;
		v16[v17 + 1] = u1.createElement(l__AutoCanvasScrollingFrame__10, v22, v23);
		local v27 = {};
		local function u17(p6)
			local v28 = l__Flamework__4.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):sendMessage(p6);
			if not v28.success then
				v9(v28.errorMessage);
				return;
			end;
			if v28.success and v8 ~= "" then
				v9("");
			end;
		end;
		function v27.OnEnter(p7)
			u17(p7);
		end;
		v27.ClearTextOnEnter = true;
		v27.TextBox = {
			Size = UDim2.fromScale(1, 0.1), 
			TextXAlignment = Enum.TextXAlignment.Left, 
			PlaceholderText = "Send a message", 
			LayoutOrder = 2, 
			ClearTextOnFocus = false
		};
		v16[v17 + 2] = u1.createElement(l__TextInputComponent__11, v27, { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.05, 0), 
				PaddingBottom = UDim.new(0.05, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}) });
		v13[v14 + 1] = u1.createElement(l__Empty__7, v15, v16);
		local v29 = false;
		if v8 ~= "" then
			v29 = u1.createFragment({
				ErrorMessage = u1.createElement("TextLabel", {
					Position = UDim2.fromScale(0, 1.01), 
					Size = UDim2.new(1, 0, 0, 16), 
					Text = v8, 
					TextColor3 = l__Theme__12.mcRed, 
					Font = "Roboto", 
					TextXAlignment = "Left", 
					TextScaled = true, 
					RichText = true, 
					BackgroundTransparency = 1, 
					LayoutOrder = 3
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 16
					}) })
			});
		end;
		if v29 then
			v13[v14 + 2] = v29;
		end;
		return u1.createElement(l__ClanProfilePageLayout__13, {
			Title = "CLAN CHAT", 
			PaddingBottom = true
		}, v13);
	end)
};
