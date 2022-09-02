-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GetUIScaleAncestors__2 = v2.GetUIScaleAncestors;
local l__ColorUtil__3 = v2.ColorUtil;
return {
	BattlePassRewardsListPassTitles = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local u4 = u1.createRef();
		p2.useEffect(function()
			local function u5()
				local v4 = nil;
				local v5 = u4:getValue();
				local v6 = l__GetUIScaleAncestors__2(v5);
				local v7 = table.create(#v6);
				local v8, v9, v10 = ipairs(v6);
				while true do
					v8(v9, v10);
					if not v8 then
						break;
					end;
					v10 = v8;
					v7[v8] = v9.Scale;				
				end;
				v4 = 1;
				for v11 = 1, #v7 do
					v4 = v4 * v7[v11];
				end;
				if v5 then
					local v12 = v5.Parent.AbsoluteSize.Y * p1.Size.Y.Scale / local v13;
					v5.Position = UDim2.new(0, (-v5.AbsoluteSize.X + 8) / 2 / v13, 0, (v12 - 11) / 2);
					v5.Size = UDim2.new(0, v12, 0, 16);
				end;
			end;
			local u6 = u4:getValue():GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				u5();
			end);
			return function()
				u6:Disconnect();
			end;
		end, {});
		return u1.createFragment({
			BattlePassTitles = u1.createElement("Frame", {
				Position = UDim2.fromScale(0, 0), 
				Size = UDim2.new(0, 0, 1, 0), 
				Rotation = -90, 
				BackgroundTransparency = 1, 
				LayoutOrder = p1.LayoutOrder, 
				[u1.Ref] = u4
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Center, 
					VerticalAlignment = Enum.VerticalAlignment.Top, 
					SortOrder = Enum.SortOrder.LayoutOrder, 
					Padding = UDim.new(0, 2)
				}), u1.createElement("Frame", {
					Size = UDim2.new(0.1, 0, 0, 16), 
					BackgroundTransparency = 1, 
					LayoutOrder = 3
				}), u1.createElement("TextLabel", {
					Size = UDim2.new(0.4, 0, 0, 16), 
					Text = "Free Pass", 
					TextTransparency = 0.3, 
					TextXAlignment = Enum.TextXAlignment.Center, 
					TextColor3 = l__ColorUtil__3.WHITE, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 16, 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					LayoutOrder = 2
				}), u1.createElement("TextLabel", {
					Size = UDim2.new(0.5, -8, 0, 16), 
					Text = "<b>Battle Pass</b>", 
					TextXAlignment = Enum.TextXAlignment.Center, 
					TextColor3 = l__ColorUtil__3.WHITE, 
					RichText = true, 
					Font = Enum.Font.Roboto, 
					TextSize = 16, 
					BorderSizePixel = 0, 
					BackgroundTransparency = 1, 
					LayoutOrder = 1
				}) })
		});
	end)
};
