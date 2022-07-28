-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Flamework__1 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__3 = v2.ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__5 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__UILayers__6 = v2.UILayers;
local l__MapSettingsModal__7 = v1.import(script, script.Parent, "map-settings-modal").MapSettingsModal;
local u8 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__getEmoteAsset__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local l__EmoteType__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__Empty__11 = v2.Empty;
local l__IconButton__12 = v2.IconButton;
local l__BedwarsImageId__13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__QueueMeta__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__CornerFiller__15 = v2.CornerFiller;
local l__CodesUtil__16 = v2.CodesUtil;
return {
	MapSaveCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u8)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = os.date("%x %I:%M %p", p1.MapSave.lastUpdated);
		local v5 = {
			Size = UDim2.fromScale(0.3, 1), 
			BackgroundColor3 = l__Theme__4.backgroundTertiary, 
			BorderSizePixel = 0, 
			AutoButtonColor = false, 
			[u8.Event.Activated] = function(p3)
				local l__OnClick__6 = p1.OnClick;
				if l__OnClick__6 ~= nil then
					l__OnClick__6();
				end;
			end, 
			[u8.Event.MouseEnter] = function(p4)
				local l__OnHover__7 = p1.OnHover;
				if l__OnHover__7 ~= nil then
					l__OnHover__7(p4);
				end;
			end, 
			[u8.Event.MouseLeave] = function(p5)
				local l__OnHoverOut__8 = p1.OnHoverOut;
				if l__OnHoverOut__8 ~= nil then
					l__OnHoverOut__8(p5);
				end;
			end
		};
		local l__FrameProps__9 = p1.FrameProps;
		if l__FrameProps__9 then
			for v10, v11 in pairs(l__FrameProps__9) do
				v5[v10] = v11;
			end;
		end;
		local v12 = { u8.createElement("UIListLayout", {
				FillDirection = "Vertical"
			}), u8.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}) };
		local v13 = #v12;
		local v14 = {
			Size = UDim2.fromScale(1, 0.45)
		};
		local v15 = {};
		local v16 = #v15;
		local v17 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		local v18 = p1.MapSave.image;
		if v18 == nil then
			v18 = l__getEmoteAsset__9(l__EmoteType__10.DUCK_CELEBRATION);
		end;
		v17.Image = v18;
		v17.ScaleType = "Fit";
		v17.BackgroundTransparency = 1;
		v15[v16 + 1] = u8.createElement("ImageLabel", v17);
		local v19 = {};
		local v20 = {};
		local v21 = {
			Size = UDim2.fromScale(0.8, 0.6), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		if p1.MapSave.isPublic then
			local v22 = "PUBLIC";
		else
			v22 = "PRIVATE";
		end;
		v21.Text = v22 .. " MAP";
		v21.TextScaled = true;
		v21.Font = "GothamBold";
		v21.TextColor3 = l__ColorUtil__3.WHITE;
		v21.BackgroundTransparency = 1;
		v20[1] = u8.createElement("UICorner", {
			CornerRadius = UDim.new(0.5, 0)
		});
		v20[2] = u8.createElement("TextLabel", v21);
		local v23 = {};
		local v24 = {
			Size = UDim2.fromScale(0.25, 1), 
			Image = l__BedwarsImageId__13.SETTING_ICON, 
			BackgroundTransparency = 1
		};
		local function u17()
			l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
				appId = "MapSettingsModal", 
				app = l__MapSettingsModal__7
			}, {
				MapSaveDisplayInfo = p1.MapSave
			}, l__UILayers__6.OVERLAY);
		end;
		function v24.OnClick()
			u17();
		end;
		v24.IconProps = {
			ScaleType = "Fit", 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		v24.Tooltip = "Edit Map Save";
		local v25 = {
			Size = UDim2.fromScale(0.25, 1), 
			Image = l__BedwarsImageId__13.TRASH_SOLID, 
			BackgroundTransparency = 1
		};
		local function u18()
			l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__2.CONFIRMATION_MODAL, {
				Title = "Delete Map Save?", 
				Body = "Are you sure you want to delete the map <font color=\"" .. l__ColorUtil__3.richTextColor(l__Theme__4.mcAqua) .. "\"><b>" .. p1.MapSave.name .. "</b></font>? You can't undo this action!", 
				PrimaryBtnProps = {
					Text = "Delete", 
					BackgroundColor3 = l__Theme__4.backgroundError
				}, 
				SecondaryBtnProps = {
					Text = "Cancel"
				}, 
				OnPrimaryBtnClick = function()
					l__KnitClient__5.Controllers.CustomMatchController:deleteMapSave(p1.MapSave.code);
				end, 
				OnSecondaryBtnClick = function()
					l__Flamework__1.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__6.OVERLAY);
				end
			});
		end;
		function v25.OnClick()
			u18();
		end;
		v25.IconProps = {
			ScaleType = "Fit", 
			Size = UDim2.fromScale(0.8, 0.8), 
			ImageColor3 = l__Theme__4.mcRed
		};
		v25.Tooltip = "Delete Map Save";
		v23[1] = u8.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			Padding = UDim.new(0.05, 0)
		});
		v23[2] = u8.createElement(l__IconButton__12, v24, { u8.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
		v23[3] = u8.createElement(l__IconButton__12, v25, { u8.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
		v19[1] = u8.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.075, 0), 
			PaddingRight = UDim.new(0.075, 0), 
			PaddingTop = UDim.new(0.05, 0)
		});
		v19[2] = u8.createElement("Frame", {
			Size = UDim2.fromScale(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__3.BLACK, 
			BackgroundTransparency = 0.4, 
			BorderSizePixel = 0
		}, v20);
		v19[3] = u8.createElement(l__Empty__11, {
			Size = UDim2.fromScale(0.5, 1), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(1, 0)
		}, v23);
		v15[v16 + 2] = u8.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0.25), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(1, 0.05)
		}, v19);
		v12.HeroBanner = u8.createElement(l__Empty__11, v14, v15);
		v12.MapDisplayInfo = u8.createElement(l__Empty__11, {
			Size = UDim2.fromScale(1, 0.55), 
			BackgroundTransparency = 1
		}, {
			TopSection = u8.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.45), 
				BackgroundColor3 = l__ColorUtil__3.hexColor(8554484), 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}, { u8.createElement("UIPadding", {
					PaddingTop = UDim.new(0.15, 0), 
					PaddingBottom = UDim.new(0.15, 0), 
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u8.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.1, 0), 
					VerticalAlignment = "Center", 
					SortOrder = "LayoutOrder"
				}), u8.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.5), 
					Text = "<b>" .. p1.MapSave.name .. "</b>", 
					RichText = true, 
					TextScaled = true, 
					TextColor3 = l__ColorUtil__3.WHITE, 
					TextXAlignment = "Left", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}), u8.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.3), 
					Text = l__QueueMeta__14[p1.MapSave.queueType].title, 
					RichText = true, 
					TextScaled = true, 
					TextTransparency = 0.3, 
					TextColor3 = l__ColorUtil__3.WHITE, 
					TextXAlignment = "Left", 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				}) }), 
			BottomSection = u8.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.55), 
				BackgroundColor3 = l__ColorUtil__3.hexColor(7764697), 
				BorderSizePixel = 0, 
				LayoutOrder = 2
			}, { u8.createElement("UICorner", {
					CornerRadius = UDim.new(0, 10)
				}), u8.createElement(l__CornerFiller__15, {
					TopLeft = true, 
					TopRight = true
				}), u8.createElement(l__Empty__11, {
					Size = UDim2.fromScale(1, 1)
				}, { u8.createElement("UIPadding", {
						PaddingTop = UDim.new(0.15, 0), 
						PaddingBottom = UDim.new(0.15, 0), 
						PaddingLeft = UDim.new(0.075, 0), 
						PaddingRight = UDim.new(0.075, 0)
					}), u8.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.1, 0), 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center", 
						SortOrder = "LayoutOrder"
					}), u8.createElement("Frame", {
						Size = UDim2.fromScale(1, 0.7), 
						BackgroundColor3 = l__ColorUtil__3.hexColor(6185658), 
						BackgroundTransparency = 0.4, 
						BorderSizePixel = 0, 
						LayoutOrder = 1
					}, {
						MapCode = u8.createElement("TextBox", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.8, 0.7), 
							Text = l__CodesUtil__16.displayCode(p1.MapSave.code, "-", 4), 
							TextScaled = true, 
							Font = Enum.Font.GothamBold, 
							TextColor3 = l__Theme__4.textPrimary, 
							TextXAlignment = "Left", 
							BackgroundTransparency = 1, 
							ClearTextOnFocus = false, 
							TextEditable = false
						}),
						(u8.createElement("UICorner", {
							CornerRadius = UDim.new(0.5, 0)
						}))
					}), u8.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0.2), 
						Text = "<b>MAP CODE</b>", 
						RichText = true, 
						TextScaled = true, 
						TextTransparency = 0.3, 
						TextColor3 = l__ColorUtil__3.WHITE, 
						TextXAlignment = "Center", 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}) }) }),
			(u8.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Left", 
				SortOrder = "LayoutOrder"
			}))
		});
		local v26 = p1[u8.Children];
		if v26 then
			local v27, v28, v29 = pairs(v26);
			while true do
				local v30 = nil;
				local v31 = nil;
				v31, v30 = v27(v28, v29);
				if not v31 then
					break;
				end;
				v29 = v31;
				if type(v31) == "number" then
					v12[v13 + v31] = v30;
				else
					v12[v31] = v30;
				end;			
			end;
		end;
		return u8.createFragment({
			MapSaveCard = u8.createElement("ImageButton", v5, v12)
		});
	end)
};
