-- Script Hash: 2ed2b46fac3c2530f9a98453ba62a726531a5783f3276c2ef059bf8c22eec8807d9bc6467c3ce222bb6f39cd45c05c29
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__ImageId__3 = v2.ImageId;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__StringUtil__5 = v2.StringUtil;
return {
	MissionDescriptionRow = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		return u1.createFragment({
			MissionDescriptionWrapper = u1.createElement("Frame", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = Enum.AutomaticSize.Y, 
				BorderSizePixel = 0, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}, { u1.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal, 
					HorizontalAlignment = Enum.HorizontalAlignment.Left, 
					VerticalAlignment = Enum.VerticalAlignment.Center, 
					Padding = UDim.new(0, 8), 
					SortOrder = Enum.SortOrder.LayoutOrder
				}), u1.createElement(function()
					return u1.createFragment({
						MissionDescription = u1.createElement("TextLabel", {
							Size = UDim2.fromScale(0.6, 0), 
							AutomaticSize = Enum.AutomaticSize.Y, 
							BackgroundTransparency = 1, 
							Text = "<b>" .. p1.Mission.description .. "</b>", 
							TextXAlignment = Enum.TextXAlignment.Left, 
							TextColor3 = l__ColorUtil__2.WHITE, 
							RichText = true, 
							Font = Enum.Font.Roboto, 
							TextSize = 18, 
							LayoutOrder = 1
						})
					});
				end), u1.createElement(function()
					local v3 = {};
					local v4 = { u1.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal, 
							HorizontalAlignment = Enum.HorizontalAlignment.Right, 
							VerticalAlignment = Enum.VerticalAlignment.Center, 
							Padding = UDim.new(0, 6), 
							SortOrder = Enum.SortOrder.LayoutOrder
						}), (u1.createElement("ImageLabel", {
							Image = l__ImageId__3.TICKET, 
							Size = UDim2.fromOffset(18, 18), 
							ScaleType = "Fit", 
							BackgroundTransparency = 1
						})) };
					local v5 = {};
					if l__DeviceUtil__4.isSmallScreen() then
						local v6 = 38;
					else
						v6 = 0;
					end;
					v5.Size = UDim2.new(0, v6, 0, 18);
					v5.AutomaticSize = Enum.AutomaticSize.XY;
					v5.BackgroundTransparency = 1;
					v5.Text = "<b>" .. l__StringUtil__5.formatNumberWithCommas(p1.Mission.rewardAmount) .. "</b>";
					v5.TextXAlignment = Enum.TextXAlignment.Center;
					v5.TextColor3 = l__ColorUtil__2.WHITE;
					v5.RichText = true;
					v5.Font = Enum.Font.Roboto;
					v5.TextSize = 18;
					v4.MissionReward = u1.createElement("TextLabel", v5);
					v3.MissionRewardWrapper = u1.createElement("Frame", {
						Size = UDim2.fromScale(0.4, 0), 
						AutomaticSize = Enum.AutomaticSize.Y, 
						BorderSizePixel = 0, 
						BackgroundTransparency = 1, 
						LayoutOrder = 2
					}, v4);
					return u1.createFragment(v3);
				end) })
		});
	end)
};
