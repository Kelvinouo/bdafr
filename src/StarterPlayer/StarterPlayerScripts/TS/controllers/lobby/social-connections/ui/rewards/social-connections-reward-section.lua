-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__DeviceUtil__1 = v2.DeviceUtil;
local l__KnitClient__2 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).KnitClient;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ImageId__4 = v2.ImageId;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__6 = v2.ColorUtil;
local l__BattlePassUtils__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
return {
	SocialConnectionsRewardSection = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		if not l__DeviceUtil__1.isHoarceKat() then
			if l__KnitClient__2.Controllers.SocialConnectionsController.policyDiscordAllowed then
				local v4 = 2;
			else
				v4 = 1;
			end;
		else
			v4 = 2;
		end;
		local v5 = p1.CompletedCount == v4;
		local v6 = {};
		local v7 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.1, 0.5), 
			Size = UDim2.fromOffset(36, 36)
		};
		if v5 then
			local v8 = l__ImageId__4.UNLOCK_SOLID;
		else
			v8 = l__ImageId__4.LOCK_SOLID;
		end;
		v7.Image = v8;
		v7.ScaleType = "Fit";
		v7.SizeConstraint = "RelativeYY";
		v7.BackgroundTransparency = 1;
		local v9 = {};
		local v10 = {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = Enum.AutomaticSize.Y
		};
		if v5 then
			local v11 = "<b><font color=\"#30C35C\">Unlocked</font></b>";
		else
			v11 = "Complete all tasks to unlock";
		end;
		v10.Text = v11 .. " (<font color=\"#FFFFFF\">" .. tostring(p1.CompletedCount) .. "</font>/" .. tostring(v4) .. ")";
		v10.TextColor3 = l__Theme__5.textSecondary;
		v10.TextXAlignment = Enum.TextXAlignment.Center;
		v10.RichText = true;
		v10.Font = Enum.Font.Roboto;
		v10.TextSize = 16;
		v10.BackgroundTransparency = 1;
		v10.LayoutOrder = 1;
		local v12 = {};
		if l__DeviceUtil__1.isSmallScreen() then
			local v13 = 0.5;
		else
			v13 = 0;
		end;
		v12.Size = UDim2.new(v13, 0, 0, 0);
		v12.AutomaticSize = "XY";
		v12.BackgroundColor3 = l__ColorUtil__6.BLACK;
		v12.BackgroundTransparency = 0.7;
		v12.LayoutOrder = 2;
		v9[1] = u3.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0, 8)
		});
		v9[2] = u3.createElement("TextLabel", v10);
		v9[3] = u3.createElement("Frame", v12, { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8), 
				PaddingBottom = UDim.new(0, 8), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}), u3.createElement("ImageLabel", {
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0, 0.5), 
				Size = UDim2.fromOffset(16, 16), 
				Image = l__BattlePassUtils__7.BATTLE_PASS_ICON, 
				ScaleType = "Fit", 
				SizeConstraint = "RelativeYY", 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}), u3.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.new(0, 28, 0.5, 0), 
				Size = UDim2.new(0, 0, 0, 0), 
				AutomaticSize = Enum.AutomaticSize.XY, 
				Text = "<b>+20%</b> Battle Pass XP", 
				TextColor3 = l__ColorUtil__6.WHITE, 
				TextXAlignment = Enum.TextXAlignment.Left, 
				RichText = true, 
				Font = Enum.Font.Roboto, 
				TextSize = 16, 
				BackgroundTransparency = 1, 
				LayoutOrder = 1
			}) });
		v6[1] = u3.createElement("ImageLabel", v7);
		v6[2] = u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1
		}, v9);
		return u3.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0), 
			AutomaticSize = "Y", 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.LayoutOrder
		}, v6);
	end)
};
