
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
			local function v7(p3, p4)
				local v8 = p4[1];
				if p1.store.Bedwars.finalDeaths[p4[2].userId] then
					return p3;
				end;
				p3 = p3 + 1;
				return p3;
			end;
			for v9 = 1, #v3 do
				v2 = v7(v2, v3[v9], v9 - 1, v3);
			end;
			return local v10;
		end)();
		local u6 = (function()
			local v11 = nil;
			local v12 = {};
			local v13 = #v12;
			for v14, v15 in pairs(p1.Team.members) do
				v13 = v13 + 1;
				v12[v13] = { v14, v15 };
			end;
			v11 = 0;
			local function v16(p5, p6)
				local v17 = p6[1];
				local v18 = p1.store.Bedwars.kills[p6[2].userId];
				if v18 ~= 0 and v18 == v18 and v18 then
					return p5 + v18;
				end;
				return p5;
			end;
			for v19 = 1, #v12 do
				v11 = v16(v11, v12[v19], v19 - 1, v12);
			end;
			return local v20;
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
				local v21 = {};
				local v22 = {
					Size = UDim2.new(l__tabListLayout__2.columns.right.breaks.width, 0, 1, 0), 
					TextXAlignment = Enum.TextXAlignment.Center, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				};
				if u7 then
					local v23 = "\226\156\133";
				else
					v23 = "\226\157\140";
				end;
				v22.Text = v23;
				v22.Font = "Roboto";
				v22.TextSize = 16;
				v22.RichText = true;
				v22.TextColor3 = l__ColorUtil__3.WHITE;
				v21[1] = u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 0)
				});
				v21[2] = u1.createElement("TextLabel", {
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
				v21[3] = u1.createElement("TextLabel", v22);
				return u1.createElement("Frame", {
					Size = UDim2.new(l__tabListLayout__2.columns.right.totalWidth, 0, 1, 0), 
					BackgroundColor3 = l__Theme__4.backgroundPrimary, 
					BackgroundTransparency = l__tabListLayout__2.bgTransparency.cardHeader, 
					BorderSizePixel = 0
				}, v21);
			end) });
	end)
};

