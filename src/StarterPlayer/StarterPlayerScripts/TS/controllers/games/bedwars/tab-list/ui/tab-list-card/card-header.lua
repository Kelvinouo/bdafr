-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__tabListLayout__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	CardHeader = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local u5 = (function()
			local v2 = nil;
			local v3 = {};
			local v4 = #v3;
			for v5, v6 in pairs(p1.Team.members) do
				v4 = v4 + 1;
				v3[v4] = { v5, v6 };
			end;
			v2 = 0;
			for v7 = 1, #v3 do
				local v8 = nil;
				v8 = v2;
				local v9 = v3[v7];
				local v10 = v9[1];
				if p1.store.Bedwars.finalDeaths[v9[2].userId] then
					local v11 = v8;
				else
					v11 = v8 + 1;
				end;
				v2 = v11;
			end;
			return local v12;
		end)();
		local u6 = (function()
			local v13 = {};
			local v14 = #v13;
			for v15, v16 in pairs(p1.Team.members) do
				v14 = v14 + 1;
				v13[v14] = { v15, v16 };
			end;
			for v17 = 1, #v13 do
				local v18 = v13[v17];
				local v19 = v18[1];
				local v20 = p1.store.Bedwars.kills[v18[2].userId];
				if v20 ~= 0 and v20 == v20 and v20 then
					local v21 = 0 + v20;
				else
					v21 = 0;
				end;
			end;
			return v21;
		end)();
		local u7 = p1.store.Bedwars.teamBedAlive[p1.Team.id];
		return u1.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, { u1.createElement("UISizeConstraint", {
				MaxSize = l__tabListLayout__2.maxRowSize, 
				MinSize = Vector2.new(0, 0)
			}), u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u1.createElement(function()
				return u1.createElement("Frame", {
					Size = UDim2.new(l__tabListLayout__2.columns.left.totalWidth, 0, 1, 0), 
					BackgroundColor3 = p1.Team.color, 
					BackgroundTransparency = l__tabListLayout__2.bgTransparency.cardHeader, 
					BorderSizePixel = 0
				}, { u1.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal, 
						VerticalAlignment = Enum.VerticalAlignment.Center, 
						HorizontalAlignment = Enum.HorizontalAlignment.Left, 
						SortOrder = Enum.SortOrder.LayoutOrder, 
						Padding = UDim.new(0, 8)
					}), u1.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 0), 
						PaddingBottom = UDim.new(0, 0), 
						PaddingLeft = UDim.new(0, 10), 
						PaddingRight = UDim.new(0, 10)
					}), u1.createElement("TextLabel", {
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						AutomaticSize = Enum.AutomaticSize.XY, 
						TextXAlignment = "Left", 
						Text = "<b>" .. p1.Team.name .. " Team (" .. tostring(u5) .. ")</b>", 
						Font = "Roboto", 
						TextSize = 16, 
						RichText = true, 
						TextColor3 = l__ColorUtil__3.WHITE
					}) });
			end), u1.createElement(function()
				local v22 = {};
				local v23 = {
					Size = UDim2.new(l__tabListLayout__2.columns.right.breaks.width, 0, 1, 0), 
					TextXAlignment = Enum.TextXAlignment.Center, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				};
				if u7 then
					local v24 = "\226\156\133";
				else
					v24 = "\226\157\140";
				end;
				v23.Text = v24;
				v23.Font = "Roboto";
				v23.TextSize = 16;
				v23.RichText = true;
				v23.TextColor3 = l__ColorUtil__3.WHITE;
				v22[1] = u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				});
				v22[2] = u1.createElement("TextLabel", {
					Size = UDim2.new(l__tabListLayout__2.columns.right.kills.width, 0, 1, 0), 
					TextXAlignment = Enum.TextXAlignment.Center, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Text = "<b>" .. tostring(u6) .. "</b>", 
					Font = "Roboto", 
					TextSize = 16, 
					RichText = true, 
					TextColor3 = l__ColorUtil__3.WHITE
				});
				v22[3] = u1.createElement("TextLabel", v23);
				return u1.createElement("Frame", {
					Size = UDim2.new(l__tabListLayout__2.columns.right.totalWidth, 0, 1, 0), 
					BackgroundColor3 = l__Theme__4.backgroundPrimary, 
					BackgroundTransparency = l__tabListLayout__2.bgTransparency.cardHeader, 
					BorderSizePixel = 0
				}, v22);
			end) });
	end)
};
