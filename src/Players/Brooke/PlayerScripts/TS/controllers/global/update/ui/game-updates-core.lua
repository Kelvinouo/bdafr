-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__1 = v2.ColorUtil;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__DeviceUtil__3 = v2.DeviceUtil;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__5 = v2.Empty;
local l__GameUpdateCard__6 = v1.import(script, script.Parent, "game-update-card").GameUpdateCard;
local l__DividerComponent__7 = v2.DividerComponent;
local l__AutoCanvasScrollingFrame__8 = v2.AutoCanvasScrollingFrame;
local l__GameUpdatePromoCardsList__9 = v1.import(script, script.Parent, "promo-cards", "game-update-promo-cards-list").GameUpdatePromoCardsList;
local l__WidgetComponent__10 = v2.WidgetComponent;
return {
	GameUpdatesCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local v3 = nil;
		local l__useState__4 = p2.useState;
		local u11 = nil;
		u11 = 0;
		local l__updates__5 = p1.store.GameUpdates.updates;
		v3 = {
			newUpdates = {}, 
			oldUpdates = {}
		};
		for v6 = 1, #l__updates__5 do
			local v7 = l__updates__5[v6];
			if v7.new then
				table.insert(v3.newUpdates, v7);
				u11 = u11 + 1;
			else
				table.insert(v3.oldUpdates, v7);
			end;
			v3 = v3;
		end;
		local v8 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		if l__DeviceUtil__3.isSmallScreen() then
			local v9 = UDim2.fromScale(0.95, 0.85);
		else
			v9 = UDim2.fromScale(0.75, 0.75);
		end;
		v8.Size = v9;
		local v10 = {};
		local v11 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v12 = 1.5454545454545454;
		else
			v12 = 1.5454545454545454;
		end;
		v11.AspectRatio = v12;
		v11.AspectType = "FitWithinMaxSize";
		v10[1] = u4.createElement("UIAspectRatioConstraint", v11);
		v10[2] = u4.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(1062.5, 687.5)
		});
		local v13 = {
			AppId = p1.AppId, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.fromScale(1, 1), 
			ClipsDescendents = false
		};
		if u11 ~= 0 and u11 == u11 and u11 then
			if u11 > 1 then
				local v14 = "s";
			else
				v14 = "";
			end;
			local v15 = "<font size=\"16\" color=\"" .. l__ColorUtil__1.richTextColor(l__Theme__2.backgroundSuccess) .. "\">" .. tostring(u11) .. " new update" .. v14 .. "</font>";
		else
			v15 = "";
		end;
		v13.Title = "Patch Notes   " .. v15;
		local v16 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 14)
			}) };
		local v17 = {
			Size = UDim2.new(0.7, -14, 1, 0), 
			LayoutOrder = 1
		};
		local v18 = { u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 12)
			}) };
		local l__newUpdates__19 = local v20.newUpdates;
		local function v21(p3, p4)
			return u4.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = p4
			}, { u4.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}), u4.createElement(l__GameUpdateCard__6, {
					store = p1.store, 
					GameUpdate = p3, 
					Size = UDim2.fromScale(0.97, 0), 
					LayoutOrder = 2
				}) });
		end;
		local v22 = table.create(#l__newUpdates__19);
		for v23, v24 in ipairs(l__newUpdates__19) do
			v22[v23] = v21(v24, v23 - 1, l__newUpdates__19);
		end;
		local v25 = {
			GameUpdateCardsListLayout = u4.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 12)
			})
		};
		local v26 = #v25;
		for v27, v28 in ipairs(v22) do
			v25[v26 + v27] = v28;
		end;
		local v29 = #v25;
		v25[v29 + 1] = u4.createElement(l__DividerComponent__7, {
			LengthScale = 0.97, 
			BarColor = {
				Color = Color3.fromRGB(255, 59, 59), 
				Transparency = 0
			}, 
			Text = "YOU'RE ALL CAUGHT UP!", 
			TextLabel = {
				Color = Color3.fromRGB(255, 255, 255), 
				Transparency = 0
			}, 
			LayoutOrder = u11 + 1
		});
		local l__oldUpdates__30 = v20.oldUpdates;
		local function v31(p5, p6)
			return u4.createElement(l__Empty__5, {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				LayoutOrder = u11 + 1 + p6
			}, { u4.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 6)
				}), u4.createElement(l__GameUpdateCard__6, {
					store = p1.store, 
					GameUpdate = p5, 
					Size = UDim2.fromScale(0.97, 0), 
					LayoutOrder = 2
				}) });
		end;
		local v32 = table.create(#l__oldUpdates__30);
		for v33, v34 in ipairs(l__oldUpdates__30) do
			v32[v33] = v31(v34, v33 - 1, l__oldUpdates__30);
		end;
		for v35, v36 in ipairs(v32) do
			v25[v29 + 1 + v35] = v36;
		end;
		v18[#v18 + 1] = u4.createElement(l__AutoCanvasScrollingFrame__8, {
			ScrollingFrameProps = {
				LayoutOrder = 2
			}
		}, v25);
		v16.UpdateContents = u4.createElement(l__Empty__5, v17, v18);
		v16[#v16 + 1] = u4.createElement(l__GameUpdatePromoCardsList__9, {
			store = p1.store, 
			Size = UDim2.new(0.3, 0, 1, 0), 
			LayoutOrder = 2
		});
		v10[#v10 + 1] = u4.createElement(l__WidgetComponent__10, v13, v16);
		return u4.createElement(l__Empty__5, v8, v10);
	end)
};
