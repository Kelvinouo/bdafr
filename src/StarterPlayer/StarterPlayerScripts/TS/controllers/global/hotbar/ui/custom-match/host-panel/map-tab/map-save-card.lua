-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__PlaceUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ColorUtil__4 = v2.ColorUtil;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__KnitClient__6 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__UILayers__7 = v2.UILayers;
local l__MapSettingsModal__8 = v1.import(script, script.Parent, "map-settings-modal").MapSettingsModal;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__getEmoteAsset__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local l__EmoteType__11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local l__Empty__12 = v2.Empty;
local l__IconButton__13 = v2.IconButton;
local l__BedwarsImageId__14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__QueueMeta__15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local l__CornerFiller__16 = v2.CornerFiller;
local l__CodesUtil__17 = v2.CodesUtil;
return {
	MapSaveCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u9)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local v5 = os.date("%x %I:%M %p", p1.MapSave.lastUpdated);
		local v6 = l__PlaceUtil__1.isGameServer();
		local v7 = {
			Size = UDim2.fromScale(0.3, 1)
		};
		local v8 = {};
		local v9 = v6 and u9.createElement("UIListLayout", {
			FillDirection = "Vertical", 
			Padding = UDim.new(0.035, 0)
		});
		if v9 then
			v8[#v8 + 1] = v9;
		end;
		local v10 = {};
		if v6 then
			local v11 = 0.85;
		else
			v11 = 1;
		end;
		v10.Size = UDim2.fromScale(1, v11);
		v10.BackgroundColor3 = l__Theme__5.backgroundTertiary;
		v10.BorderSizePixel = 0;
		v10.AutoButtonColor = false;
		v10[u9.Event.Activated] = function(p3)
			local l__OnClick__12 = p1.OnClick;
			if l__OnClick__12 ~= nil then
				l__OnClick__12();
			end;
		end;
		v10[u9.Event.MouseEnter] = function(p4)
			local l__OnHover__13 = p1.OnHover;
			if l__OnHover__13 ~= nil then
				l__OnHover__13(p4);
			end;
		end;
		v10[u9.Event.MouseLeave] = function(p5)
			local l__OnHoverOut__14 = p1.OnHoverOut;
			if l__OnHoverOut__14 ~= nil then
				l__OnHoverOut__14(p5);
			end;
		end;
		local l__FrameProps__15 = p1.FrameProps;
		if l__FrameProps__15 then
			for v16, v17 in pairs(l__FrameProps__15) do
				v10[v16] = v17;
			end;
		end;
		local v18 = { u9.createElement("UIListLayout", {
				FillDirection = "Vertical"
			}), u9.createElement("UICorner", {
				CornerRadius = UDim.new(0, 10)
			}) };
		local v19 = #v18;
		local v20 = {
			Size = UDim2.fromScale(1, 0.45)
		};
		local v21 = {};
		local v22 = #v21;
		local v23 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		local v24 = p1.MapSave.image;
		if v24 == nil then
			v24 = l__getEmoteAsset__10(l__EmoteType__11.DUCK_CELEBRATION);
		end;
		v23.Image = v24;
		v23.ScaleType = "Fit";
		v23.BackgroundTransparency = 1;
		v21[v22 + 1] = u9.createElement("ImageLabel", v23);
		local v25 = {};
		local v26 = {};
		local v27 = {
			Size = UDim2.fromScale(0.8, 0.6), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		if p1.MapSave.isPublic then
			local v28 = "PUBLIC";
		else
			v28 = "PRIVATE";
		end;
		v27.Text = v28 .. " MAP";
		v27.TextScaled = true;
		v27.Font = "GothamBold";
		v27.TextColor3 = l__ColorUtil__4.WHITE;
		v27.BackgroundTransparency = 1;
		v26[1] = u9.createElement("UICorner", {
			CornerRadius = UDim.new(0.5, 0)
		});
		v26[2] = u9.createElement("TextLabel", v27);
		local v29 = {};
		local v30 = {
			Size = UDim2.fromScale(0.25, 1), 
			Image = l__BedwarsImageId__14.SETTING_ICON, 
			BackgroundTransparency = 1
		};
		local function u18()
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
				appId = "MapSettingsModal", 
				app = l__MapSettingsModal__8
			}, {
				MapSaveDisplayInfo = p1.MapSave
			}, l__UILayers__7.OVERLAY);
		end;
		function v30.OnClick()
			u18();
		end;
		v30.IconProps = {
			ScaleType = "Fit", 
			Size = UDim2.fromScale(0.8, 0.8)
		};
		v30.Tooltip = "Edit Map Save";
		local v31 = {
			Size = UDim2.fromScale(0.25, 1), 
			Image = l__BedwarsImageId__14.TRASH_SOLID, 
			BackgroundTransparency = 1
		};
		local function u19()
			l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__3.CONFIRMATION_MODAL, {
				Title = "Delete Map Save?", 
				Body = "Are you sure you want to delete the map <font color=\"" .. l__ColorUtil__4.richTextColor(l__Theme__5.mcAqua) .. "\"><b>" .. p1.MapSave.name .. "</b></font>? You can't undo this action!", 
				PrimaryBtnProps = {
					Text = "Delete", 
					BackgroundColor3 = l__Theme__5.backgroundError
				}, 
				SecondaryBtnProps = {
					Text = "Cancel"
				}, 
				OnPrimaryBtnClick = function()
					l__KnitClient__6.Controllers.CustomMatchController:deleteMapSave(p1.MapSave.code);
				end, 
				OnSecondaryBtnClick = function()
					l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__7.OVERLAY);
				end
			});
		end;
		function v31.OnClick()
			u19();
		end;
		v31.IconProps = {
			ScaleType = "Fit", 
			Size = UDim2.fromScale(0.8, 0.8), 
			ImageColor3 = l__Theme__5.mcRed
		};
		v31.Tooltip = "Delete Map Save";
		v29[1] = u9.createElement("UIListLayout", {
			FillDirection = "Horizontal", 
			HorizontalAlignment = "Right", 
			Padding = UDim.new(0.05, 0)
		});
		v29[2] = u9.createElement(l__IconButton__13, v30, { u9.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
		v29[3] = u9.createElement(l__IconButton__13, v31, { u9.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1
			}) });
		v25[1] = u9.createElement("UIPadding", {
			PaddingLeft = UDim.new(0.075, 0), 
			PaddingRight = UDim.new(0.075, 0), 
			PaddingTop = UDim.new(0.05, 0)
		});
		v25[2] = u9.createElement("Frame", {
			Size = UDim2.fromScale(0.5, 1), 
			BackgroundColor3 = l__ColorUtil__4.BLACK, 
			BackgroundTransparency = 0.4, 
			BorderSizePixel = 0
		}, v26);
		v25[3] = u9.createElement(l__Empty__12, {
			Size = UDim2.fromScale(0.5, 1), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(1, 0)
		}, v29);
		v21[v22 + 2] = u9.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 0.25), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(1, 0.05)
		}, v25);
		v18.HeroBanner = u9.createElement(l__Empty__12, v20, v21);
		v18.MapDisplayInfo = u9.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 0.55), 
			BackgroundTransparency = 1
		}, {
			TopSection = u9.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.45), 
				BackgroundColor3 = l__ColorUtil__4.hexColor(8554484), 
				BorderSizePixel = 0, 
				LayoutOrder = 1
			}, { u9.createElement("UIPadding", {
					PaddingTop = UDim.new(0.15, 0), 
					PaddingBottom = UDim.new(0.15, 0), 
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u9.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0.1, 0), 
					VerticalAlignment = "Center", 
					SortOrder = "LayoutOrder"
				}), u9.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.5), 
					Text = "<b>" .. p1.MapSave.name .. "</b>", 
					RichText = true, 
					TextScaled = true, 
					TextColor3 = l__ColorUtil__4.WHITE, 
					TextXAlignment = "Left", 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}), u9.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0.3), 
					Text = l__QueueMeta__15[p1.MapSave.queueType].title, 
					RichText = true, 
					TextScaled = true, 
					TextTransparency = 0.3, 
					TextColor3 = l__ColorUtil__4.WHITE, 
					TextXAlignment = "Left", 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				}) }), 
			BottomSection = u9.createElement("Frame", {
				Size = UDim2.fromScale(1, 0.55), 
				BackgroundColor3 = l__ColorUtil__4.hexColor(7764697), 
				BorderSizePixel = 0, 
				LayoutOrder = 2
			}, { u9.createElement("UICorner", {
					CornerRadius = UDim.new(0, 10)
				}), u9.createElement(l__CornerFiller__16, {
					TopLeft = true, 
					TopRight = true
				}), u9.createElement(l__Empty__12, {
					Size = UDim2.fromScale(1, 1)
				}, { u9.createElement("UIPadding", {
						PaddingTop = UDim.new(0.15, 0), 
						PaddingBottom = UDim.new(0.15, 0), 
						PaddingLeft = UDim.new(0.075, 0), 
						PaddingRight = UDim.new(0.075, 0)
					}), u9.createElement("UIListLayout", {
						FillDirection = "Vertical", 
						Padding = UDim.new(0.1, 0), 
						HorizontalAlignment = "Center", 
						VerticalAlignment = "Center", 
						SortOrder = "LayoutOrder"
					}), u9.createElement("Frame", {
						Size = UDim2.fromScale(1, 0.7), 
						BackgroundColor3 = l__ColorUtil__4.hexColor(6185658), 
						BackgroundTransparency = 0.4, 
						BorderSizePixel = 0, 
						LayoutOrder = 1
					}, {
						MapCode = u9.createElement("TextBox", {
							AnchorPoint = Vector2.new(0.5, 0.5), 
							Position = UDim2.fromScale(0.5, 0.5), 
							Size = UDim2.fromScale(0.8, 0.7), 
							Text = l__CodesUtil__17.displayCode(p1.MapSave.code, "-", 4), 
							TextScaled = true, 
							Font = Enum.Font.GothamBold, 
							TextColor3 = l__Theme__5.textPrimary, 
							TextXAlignment = "Left", 
							BackgroundTransparency = 1, 
							ClearTextOnFocus = false, 
							TextEditable = false
						}),
						(u9.createElement("UICorner", {
							CornerRadius = UDim.new(0.5, 0)
						}))
					}), u9.createElement("TextLabel", {
						Size = UDim2.fromScale(1, 0.2), 
						Text = "<b>MAP CODE</b>", 
						RichText = true, 
						TextScaled = true, 
						TextTransparency = 0.3, 
						TextColor3 = l__ColorUtil__4.WHITE, 
						TextXAlignment = "Center", 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}) }) }),
			(u9.createElement("UIListLayout", {
				FillDirection = "Vertical", 
				HorizontalAlignment = "Left", 
				SortOrder = "LayoutOrder"
			}))
		});
		local v32 = p1[u9.Children];
		if v32 then
			local v33, v34, v35 = pairs(v32);
			while true do
				local v36 = nil;
				local v37 = nil;
				v37, v36 = v33(v34, v35);
				if not v37 then
					break;
				end;
				v35 = v37;
				if type(v37) == "number" then
					v18[v19 + v37] = v36;
				else
					v18[v37] = v36;
				end;			
			end;
		end;
		v8.MapSaveCard = u9.createElement("ImageButton", v10, v18);
		local v38 = v6;
		if v38 then
			local v39 = {};
			local v40 = {
				Size = UDim2.fromScale(1, 0.115)
			};
			if v3 then
				local v41 = "UPDATING...";
			else
				v41 = "UPDATE MAP";
			end;
			v40.Text = v41;
			v40.BackgroundColor3 = l__ColorUtil__4.hexColor(6185658);
			v40.TextColor3 = l__Theme__5.textPrimary;
			v40.TextScaled = true;
			v40.Font = "GothamBold";
			v40.LayoutOrder = 2;
			v40[u9.Event.Activated] = function()
				l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__3.CONFIRMATION_MODAL, {
					Title = "Overwrite Map Save?", 
					Body = "Are you sure you want to ovewrite the map save <font color=\"" .. l__ColorUtil__4.richTextColor(l__Theme__5.mcAqua) .. "\"><b>" .. p1.MapSave.name .. "</b></font> with the current map?\n\n<font color=\"" .. l__ColorUtil__4.richTextColor(l__Theme__5.mcRed) .. "\" transparency=\"0\"><b>You can't undo this action!</b></font>", 
					PrimaryBtnProps = {
						Text = "Overwrite", 
						BackgroundColor3 = l__Theme__5.backgroundTertiary
					}, 
					SecondaryBtnProps = {
						Text = "Cancel"
					}, 
					OnPrimaryBtnClick = function()
						v4(true);
						l__KnitClient__6.Controllers.CustomMatchController:saveMap(p1.MapSave.code):andThen(function(p6)
							v4(false);
						end);
					end, 
					OnSecondaryBtnClick = function()
						l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(l__UILayers__7.OVERLAY);
					end
				});
			end;
			v39.ResaveMapButton = u9.createElement("TextButton", v40, { u9.createElement("UIPadding", {
					PaddingTop = UDim.new(0.15, 0), 
					PaddingBottom = UDim.new(0.15, 0), 
					PaddingLeft = UDim.new(0.075, 0), 
					PaddingRight = UDim.new(0.075, 0)
				}), u9.createElement("UICorner", {
					CornerRadius = UDim.new(0, 6)
				}) });
			v38 = u9.createFragment(v39);
		end;
		if v38 then
			v8[#v8 + 1] = v38;
		end;
		return u9.createFragment({
			MapSaveCardContainer = u9.createElement(l__Empty__12, v7, v8)
		});
	end)
};
