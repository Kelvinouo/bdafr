-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LockerTab__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab;
local l__LobbyTitleDefaults__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").LobbyTitleDefaults;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__EmoteShowcase__5 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local l__Theme__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	LockerShowcase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u7 = p1.Tab == l__LockerTab__1.TITLES;
		return u3.createFragment({
			LockerShowcase = u3.createElement("Frame", {
				Size = p1.Size, 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u3.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					Padding = UDim.new(0, 12)
				}), u3.createElement(function()
					if u7 then
						local v3 = {};
						local v4 = p1.Element.title;
						if v4 ~= nil then
							v4 = v4.text;
						end;
						v3.Text = v4;
						v3.AnchorPoint = Vector2.new(0.5, 0.5);
						v3.Position = UDim2.fromScale(0.5, 0.5);
						v3.Size = UDim2.new(1, 0, 0, 26);
						v3.TextScaled = true;
						local v5 = p1.Element.title;
						if v5 ~= nil then
							v5 = v5.color;
						end;
						local v6 = v5;
						if v6 == nil then
							v6 = l__LobbyTitleDefaults__2.color;
						end;
						v3.TextColor3 = v6;
						local v7 = p1.Element.title;
						if v7 ~= nil then
							v7 = v7.font;
						end;
						local v8 = v7;
						if v8 == nil then
							v8 = l__LobbyTitleDefaults__2.font;
						end;
						v3.Font = v8;
						local v9 = p1.Element.title;
						if v9 ~= nil then
							v9 = v9.backgroundColor;
						end;
						local v10 = v9;
						if v10 == nil then
							v10 = l__LobbyTitleDefaults__2.backgroundColor;
						end;
						v3.BackgroundColor3 = v10;
						v3.BorderSizePixel = 0;
						local v11 = p1.Element.title;
						if v11 ~= nil then
							v11 = v11.backgroundTransparency;
						end;
						local v12 = v11;
						if v12 == nil then
							v12 = 1;
						end;
						v3.BackgroundTransparency = v12;
						v3.RichText = true;
						local v13 = u3.createElement("TextLabel", v3, { u3.createElement("UIPadding", {
								PaddingTop = UDim.new(0, 4), 
								PaddingBottom = UDim.new(0, 4), 
								PaddingRight = UDim.new(0, 6), 
								PaddingLeft = UDim.new(0, 6)
							}) });
					else
						local v14 = false;
						if p1.Tab == l__LockerTab__1.KILL_EFFECTS then
							v14 = p1.Element.image.imageId;
						end;
						if v14 ~= "" and v14 then
							v13 = u3.createElement("ImageLabel", {
								Image = p1.Element.image.imageId, 
								AnchorPoint = Vector2.new(0.5, 0.5), 
								Position = UDim2.fromScale(0.5, 0.5), 
								Size = UDim2.fromScale(0.75, 0.75), 
								ScaleType = "Fit", 
								BackgroundTransparency = 1
							});
						elseif p1.Tab == l__LockerTab__1.KILL_EFFECTS then
							v13 = u3.createElement("TextLabel", {
								Text = p1.Element.image.name, 
								AnchorPoint = Vector2.new(0.5, 0.5), 
								Position = UDim2.fromScale(0.5, 0.5), 
								Size = UDim2.new(1, 0, 0, 26), 
								TextScaled = true, 
								TextColor3 = l__ColorUtil__4.WHITE, 
								BorderSizePixel = 0, 
								BackgroundTransparency = 1, 
								RichText = true
							}, { u3.createElement("UIPadding", {
									PaddingTop = UDim.new(0, 4), 
									PaddingBottom = UDim.new(0, 4), 
									PaddingRight = UDim.new(0, 6), 
									PaddingLeft = UDim.new(0, 6)
								}) });
						elseif p1.Tab == l__LockerTab__1.EMOTES then
							v13 = u3.createElement(l__EmoteShowcase__5, {
								Emote = p1.Element.itemEnum
							});
						else
							v13 = u3.createElement("ImageLabel", {
								Image = p1.Element.image.imageId, 
								AnchorPoint = Vector2.new(0.5, 0.5), 
								Position = UDim2.fromScale(0.5, 0.5), 
								Size = UDim2.fromScale(0.75, 0.75), 
								ScaleType = "Fit", 
								BackgroundTransparency = 1
							});
						end;
					end;
					local v15 = {};
					if u7 then
						local v16 = 1;
					else
						v16 = 0.75;
					end;
					v15.Size = UDim2.new(v16, 0, 0.75, 0);
					v15.BackgroundColor3 = l__Theme__6.backgroundTertiary;
					v15.BorderColor3 = l__ColorUtil__4.WHITE;
					v15.BorderSizePixel = 2;
					v15.BorderMode = Enum.BorderMode.Inset;
					if u7 then
						local v17 = 1;
					else
						v17 = 0;
					end;
					v15.BackgroundTransparency = v17;
					local v18 = { u3.createElement("UIAspectRatioConstraint", {
							AspectRatio = 1
						}) };
					v18[#v18 + 1] = v13;
					return u3.createElement("Frame", v15, v18);
				end), u3.createElement("Frame", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					BackgroundTransparency = 1
				}, { u3.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical, 
						HorizontalAlignment = Enum.HorizontalAlignment.Center, 
						VerticalAlignment = Enum.VerticalAlignment.Top, 
						Padding = UDim.new(0, 8)
					}), u3.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, 20), 
						BackgroundTransparency = 1, 
						Text = "<b>" .. p1.Element.image.name .. "</b>", 
						TextColor3 = l__ColorUtil__4.WHITE, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						TextSize = 20
					}), u3.createElement("TextLabel", {
						Size = UDim2.new(1, 0, 0, 18), 
						BackgroundTransparency = 1, 
						Text = "<b>" .. p1.Element.type .. "</b>", 
						TextColor3 = l__Theme__6.textPrimary, 
						RichText = true, 
						Font = Enum.Font.Roboto, 
						TextSize = 18
					}) }) })
		});
	end)
};
