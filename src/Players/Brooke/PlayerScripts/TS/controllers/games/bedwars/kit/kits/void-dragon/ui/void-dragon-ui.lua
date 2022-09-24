-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u4 = nil;
local l__ProgressBar__5 = v2.ProgressBar;
local l__ColorUtil__6 = v2.ColorUtil;
local l__UIUtil__7 = v2.UIUtil;
u4 = function(p1)
	local v3 = {
		Size = UDim2.fromScale(1, 1), 
		Position = l__UIUtil__7:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0
	};
	local l__VoidDragonActive__8 = p1.VoidDragonActive;
	v3[u3.Event.Activated] = function()
		l__VoidDragonActive__8();
	end;
	return u3.createElement("ImageButton", v3, { u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.675675675675675
		}), u3.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Text = "Transform [v]", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
end;
return {
	VoidDragonUi = function(p2)
		local v4 = p2.store.Kit.voidDragonProgress;
		if v4 == nil then
			v4 = 0;
		end;
		local v5 = math.min(1, (math.max(0.01, v4)));
		local v6 = v5 >= 1;
		if v6 then
			local v7 = l__Players__1.LocalPlayer:GetAttribute("VoidDragon");
			local v8 = false;
			if v7 ~= 0 then
				v8 = false;
				if v7 == v7 then
					v8 = false;
					if v7 ~= "" then
						v8 = v7;
					end;
				end;
			end;
			v6 = not v8;
		end;
		if not v6 then
			return u3.createElement(l__ProgressBar__5, {
				Size = l__Theme__2.actionBarProgressBarSize, 
				Progress = v5, 
				BarGradient = ColorSequence.new(l__ColorUtil__6.hexColor(14363435), l__ColorUtil__6.hexColor(14573407))
			});
		end;
		local v9 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0.05, 0)
			}) };
		local v10 = {};
		for v11, v12 in pairs(p2) do
			v10[v11] = v12;
		end;
		v9[#v9 + 1] = u3.createElement(u4, v10);
		return u3.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 1), 
			Size = l__Theme__2.actionBarButtonSize, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, v9);
	end
};
