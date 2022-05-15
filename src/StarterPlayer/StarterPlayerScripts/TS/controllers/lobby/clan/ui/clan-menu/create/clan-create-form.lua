
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__SoundManager__3 = v2.SoundManager;
local l__GameSound__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__DeviceUtil__5 = v2.DeviceUtil;
local l__ClanUtil__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__Players__7 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__HostPanelSetting__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local l__HostPanelTextBox__9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "hotbar", "ui", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local l__Empty__10 = v2.Empty;
local l__GiftingCharacterCounter__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "gifting-character-counter").GiftingCharacterCounter;
local l__ColorUtil__12 = v2.ColorUtil;
local l__Theme__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ButtonComponent__15 = v2.ButtonComponent;
return {
	ClanCreateForm = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = u1.createRef();
		local v5, v6 = l__useState__3("");
		local v7, v8 = l__useState__3("");
		local v9, v10 = l__useState__3("");
		local v11, v12 = l__useState__3(false);
		local v13, v14 = l__useState__3("");
		if not l__DeviceUtil__5.isHoarceKat() then
			local v15 = l__ClanUtil__6.hasClanPass(l__Players__7.LocalPlayer);
		end;
		local v16 = {
			Size = UDim2.fromScale(1, 1)
		};
		local v17 = {};
		local v18 = #v17;
		local v19 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Center", 
				SortOrder = "LayoutOrder", 
				Padding = UDim.new(0.05, 0)
			}), u1.createElement(l__HostPanelSetting__8, {
				Name = "Name", 
				Hint = "(Max " .. tostring(l__ClanUtil__6.CLAN_NAME_CHAR_LIMIT) .. " Characters)"
			}, { u1.createElement(l__HostPanelTextBox__9, {
					MaxCharacters = l__ClanUtil__6.CLAN_NAME_CHAR_LIMIT, 
					PlaceholderText = "Your clan name", 
					OnFocusLost = v6
				}) }), u1.createElement(l__HostPanelSetting__8, {
				Name = "Tag", 
				Hint = "(2-4 Characters)"
			}, { u1.createElement(l__HostPanelTextBox__9, {
					MaxCharacters = 4, 
					PlaceholderText = "Your clan tag", 
					OnFocusLost = v8
				}) }), u1.createElement(l__Empty__10, {
				Size = UDim2.fromScale(1, 0.45)
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.05, 0)
				}), u1.createElement(l__HostPanelTextBox__9, {
					Size = UDim2.fromScale(1, 0.9), 
					MaxCharacters = l__ClanUtil__6.CLAN_INTRO_CHAR_LIMIT, 
					PlaceholderText = "Please enter an introduction for players viewing your clan. This can be changed later.", 
					Label = "Clan Introduction", 
					OnFocusLost = v10, 
					Font = "Roboto", 
					TextXAlignment = "Left", 
					TextYAlignment = "Top", 
					MultiLine = true, 
					[u1.Ref] = v4
				}, {
					uipadding = u1.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 10), 
						PaddingBottom = UDim.new(0, 10), 
						PaddingLeft = UDim.new(0, 10), 
						PaddingRight = UDim.new(0, 10)
					}),
					u1.createElement("UICorner", {
						CornerRadius = UDim.new(0, 6)
					})
				}), u1.createElement(l__GiftingCharacterCounter__11, {
					Size = UDim2.new(1, 0, 0, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					TextXAlignment = Enum.TextXAlignment.Right, 
					TextBox = v4, 
					MaxCharCount = l__ClanUtil__6.CLAN_INTRO_CHAR_LIMIT
				}) }) };
		local v20 = false;
		if v13 ~= "" then
			v20 = u1.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.1), 
				BackgroundColor3 = l__ColorUtil__12.hexColor(16735324), 
				BorderSizePixel = 0
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}), u1.createElement("TextLabel", {
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = "<b>Error:</b> " .. v13, 
					TextScaled = true, 
					RichText = true, 
					Font = "Roboto", 
					TextColor3 = l__ColorUtil__12.WHITE, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Center", 
					TextYAlignment = "Center"
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }) });
		end;
		if v20 then
			v19[#v19 + 1] = v20;
		end;
		v17[v18 + 1] = u1.createElement(l__Empty__10, {
			Size = UDim2.fromScale(1, 0.8)
		}, v19);
		local v21 = {
			Size = UDim2.fromScale(1, 0.2), 
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1)
		};
		local v22 = { u1.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				Padding = UDim.new(0, 6), 
				VerticalAlignment = "Bottom"
			}) };
		local v23 = {
			Size = UDim2.new(1, 0, 0, 50), 
			BackgroundColor3 = l__Theme__13.backgroundSuccess, 
			Selectable = false, 
			OnClick = function()
				if v5 == "" then
					v14("Your clan must have a name.");
					return nil;
				end;
				if v7 == "" then
					v14("Your clan must have tag.");
					return nil;
				end;
				if #v7 < 2 then
					v14("Your clan tag must be atleast 2 characters.");
					return nil;
				end;
				v12(true);
				v14("");
				l__KnitClient__2.Controllers.ClanController:submitClanCreateForm({
					name = v5, 
					tag = v7, 
					introduction = v9
				}):andThen(function(p3)
					v12(false);
					local l__errorMessage__24 = p3.errorMessage;
					if l__errorMessage__24 ~= "" and l__errorMessage__24 then
						v14(p3.errorMessage);
						l__SoundManager__3:createSound(l__GameSound__4.ERROR_NOTIFICATION);
					end;
				end);
			end, 
			Loading = v11
		};
		local v25 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				HorizontalAlignment = "Center", 
				Padding = UDim.new(0, 10)
			}) };
		local v26 = not v11 and u1.createElement("ImageLabel", {
			Image = l__BedwarsImageId__14.CLAN, 
			ImageColor3 = Color3.fromRGB(255, 255, 255), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Size = UDim2.fromScale(0.65, 0.55), 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY", 
			AnchorPoint = Vector2.new(1, 0.5)
		});
		if v26 then
			v25[#v25 + 1] = v26;
		end;
		local v27 = {};
		if v11 then
			local v28 = "Loading";
		else
			v28 = "Create Clan";
		end;
		v27.Text = "<b>" .. v28 .. "</b>";
		v27.Size = UDim2.fromScale(0, 0.5);
		v27.AutomaticSize = "X";
		v27.SizeConstraint = "RelativeXX";
		v27.Position = UDim2.fromScale(0.5, 0.5);
		v27.AnchorPoint = Vector2.new(0.5, 0.5);
		v27.BackgroundTransparency = 1;
		v27.BorderSizePixel = 0;
		v27.TextColor3 = Color3.fromRGB(255, 255, 255);
		v27.TextScaled = true;
		v27.RichText = true;
		v27.Font = "Roboto";
		v27.TextXAlignment = "Left";
		v25[#v25 + 1] = u1.createElement("TextLabel", v27, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		v22[#v22 + 1] = u1.createElement(l__ButtonComponent__15, v23, v25);
		v17[v18 + 2] = u1.createElement(l__Empty__10, v21, v22);
		return u1.createElement(l__Empty__10, v16, v17);
	end)
};

