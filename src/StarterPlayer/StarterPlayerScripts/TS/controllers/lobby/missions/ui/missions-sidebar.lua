-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__3 = v2.DeviceUtil;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__5 = v2.ColorUtil;
local l__ImageId__6 = v2.ImageId;
local l__ButtonComponent__7 = v2.ButtonComponent;
local l__KnitClient__8 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local l__Flamework__9 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
return {
	MissionsSidebar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useEffect__3 = p2.useEffect;
		local v4 = {};
		local v5 = {
			PaddingTop = UDim.new(0, 5)
		};
		if l__DeviceUtil__3.isSmallScreen() then
			local v6 = 0;
		else
			v6 = 5;
		end;
		v5.PaddingLeft = UDim.new(0, v6);
		if l__DeviceUtil__3.isSmallScreen() then
			local v7 = 0;
		else
			v7 = 5;
		end;
		v5.PaddingRight = UDim.new(0, v7);
		local v8 = {};
		local v9 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v10 = 0.9;
		else
			v10 = 0.85;
		end;
		if l__DeviceUtil__3.isSmallScreen() then
			local v11 = 32;
		else
			v11 = 16;
		end;
		v9.Size = UDim2.new(v10, 0, 0, v11);
		if l__DeviceUtil__3.isSmallScreen() then
			local v12 = Enum.AutomaticSize.None;
		else
			v12 = Enum.AutomaticSize.Y;
		end;
		v9.AutomaticSize = v12;
		v9.Text = "Complete <b>daily</b> and <b>weekly</b> missions for Battle Pass XP";
		v9.TextColor3 = l__ColorUtil__5.WHITE;
		v9.RichText = true;
		v9.Font = Enum.Font.Roboto;
		v9.TextSize = 16;
		if l__DeviceUtil__3.isSmallScreen() then
			local v13 = true;
		else
			v13 = false;
		end;
		v9.TextScaled = v13;
		v9.TextWrapped = true;
		v9.BackgroundTransparency = 1;
		v9.LayoutOrder = 2;
		local v14 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v15 = 0.9;
		else
			v15 = 0.85;
		end;
		v14.Size = UDim2.new(v15, 0, 0, 16);
		v14.AutomaticSize = Enum.AutomaticSize.Y;
		v14.BackgroundTransparency = 0.6;
		v14.BackgroundColor3 = l__ColorUtil__5.BLACK;
		v14.BorderSizePixel = 0;
		v14.LayoutOrder = 2;
		v8[1] = u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Top, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 14)
		});
		v8[2] = u2.createElement("ImageLabel", {
			Size = UDim2.fromScale(0.5, 0.25), 
			Image = l__BedwarsImageId__4.MISSION, 
			ScaleType = "Fit", 
			LayoutOrder = 1, 
			BackgroundTransparency = 1
		});
		v8[3] = u2.createElement("TextLabel", v9);
		v8[4] = u2.createElement("Frame", v14, { u2.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingBottom = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 2), 
				PaddingRight = UDim.new(0, 2)
			}), u2.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u2.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0), 
				AutomaticSize = "Y", 
				Text = "<b>Daily Refresh:</b> 12pm PST\n<b>Weekly Refresh:</b> Fri 12pm PST", 
				TextColor3 = l__ColorUtil__5.WHITE, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 14, 
				TextWrapped = true, 
				BackgroundTransparency = 1
			}) });
		v4[1] = u2.createElement("UISizeConstraint", {
			MinSize = Vector2.new(0, p1.MinSizeY), 
			MaxSize = Vector2.new(math.huge, p1.MaxSizeY)
		});
		v4[2] = u2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v4[3] = u2.createElement("UIPadding", v5);
		v4[4] = u2.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, p1.MaxSizeY / 2), 
			BackgroundTransparency = 1
		}, v8);
		local v16 = {
			AnchorPoint = Vector2.new(0, 1), 
			Position = UDim2.fromScale(0, 1), 
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundColor3 = l__Theme__1.backgroundPrimary, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0
		};
		local v17 = {};
		local v18 = {};
		if l__DeviceUtil__3.isSmallScreen() then
			local v19 = 32;
		else
			v19 = 16;
		end;
		v18.Size = UDim2.new(1, 0, 0, v19);
		if l__DeviceUtil__3.isSmallScreen() then
			local v20 = Enum.AutomaticSize.None;
		else
			v20 = Enum.AutomaticSize.Y;
		end;
		v18.AutomaticSize = v20;
		if p1.BattlePass.paid then
			local v21 = "<b>20% mission XP bonus <font color=\"" .. l__ColorUtil__5.richTextColor(l__ColorUtil__5.hexColor(2600544)) .. "\">ACTIVATED</font></b>";
		else
			v21 = "<b>Earn 20% more XP from missions & matches with the Battle Pass</b>";
		end;
		v18.Text = v21;
		v18.TextColor3 = l__Theme__1.textPrimary;
		v18.TextYAlignment = Enum.TextYAlignment.Bottom;
		v18.RichText = true;
		v18.Font = Enum.Font.Roboto;
		v18.TextSize = 16;
		if l__DeviceUtil__3.isSmallScreen() then
			local v22 = true;
		else
			v22 = false;
		end;
		v18.TextScaled = v22;
		v18.TextWrapped = true;
		v18.BackgroundTransparency = 1;
		v18.LayoutOrder = 1;
		v17[1] = u2.createElement("UICorner", {
			CornerRadius = UDim.new(0, 5)
		});
		v17[2] = u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Bottom, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 6)
		});
		v17[3] = u2.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 10), 
			PaddingBottom = UDim.new(0, 10), 
			PaddingLeft = UDim.new(0, 10), 
			PaddingRight = UDim.new(0, 10)
		});
		v17[4] = u2.createElement("Frame", {
			Size = UDim2.new(0, 60, 0, 60), 
			BackgroundColor3 = l__Theme__1.backgroundTertiary, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 0
		}, { u2.createElement("UICorner", {
				CornerRadius = UDim.new(1, 0)
			}), u2.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				Size = UDim2.fromScale(0.7, 0.7), 
				Image = l__ImageId__6.TICKET, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1
			}) });
		v17[5] = u2.createElement("TextLabel", v18);
		local v23 = not p1.BattlePass.paid and u2.createElement(l__ButtonComponent__7, {
			Size = UDim2.new(1, 0, 0, 32), 
			TextSize = 14, 
			Text = "BUY BATTLE PASS", 
			BackgroundColor3 = l__Theme__1.backgroundSuccess, 
			LayoutOrder = 2, 
			OnClick = function()
				l__KnitClient__8.Controllers.BattlePassController:promptBattlePassPurchase();
			end
		});
		if v23 then
			v17[#v17 + 1] = v23;
		end;
		v17[#v17 + 1] = u2.createElement(l__ButtonComponent__7, {
			Size = UDim2.new(1, 0, 0, 32), 
			TextSize = 14, 
			Text = "VIEW REWARDS", 
			BackgroundColor3 = l__Theme__1.backgroundSecondary, 
			LayoutOrder = 3, 
			OnClick = function()
				l__Flamework__9.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__10.BATTLEPASS, {});
			end
		});
		v4.BattlePassPerkInfo = u2.createElement("Frame", v16, v17);
		return u2.createFragment({
			LeftWrapper = u2.createElement("Frame", {
				Size = p1.Size, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				BackgroundColor3 = l__Theme__1.backgroundPrimary, 
				LayoutOrder = -1
			}, v4)
		});
	end)
};
