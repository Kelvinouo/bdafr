
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u3 = nil;
local l__ProgressBar__4 = v2.ProgressBar;
local l__Theme__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__6 = v2.ColorUtil;
local l__AngelType__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "angel", "angel-kit").AngelType;
local u8 = nil;
u3 = function(p1)
	local v3 = {
		AnchorPoint = Vector2.new(0.5, 1), 
		Size = l__Theme__5.actionBarButtonSize, 
		BackgroundTransparency = 1, 
		BorderSizePixel = 0
	};
	local v4 = { u2.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal, 
			HorizontalAlignment = Enum.HorizontalAlignment.Center, 
			VerticalAlignment = Enum.VerticalAlignment.Center, 
			SortOrder = Enum.SortOrder.LayoutOrder, 
			Padding = UDim.new(0.05, 0)
		}) };
	local v5 = #v4;
	local v6 = {
		Angel = l__AngelType__7.LIGHT
	};
	for v7, v8 in pairs(p1) do
		v6[v7] = v8;
	end;
	v4[v5 + 1] = u2.createElement(u8, v6);
	local v9 = {
		Angel = l__AngelType__7.VOID
	};
	for v10, v11 in pairs(p1) do
		v9[v10] = v11;
	end;
	v4[v5 + 2] = u2.createElement(u8, v9);
	return u2.createElement("Frame", v3, v4);
end;
local l__UIUtil__9 = v2.UIUtil;
u8 = function(p2)
	local l__Angel__12 = p2.Angel;
	local v13 = {
		Size = UDim2.fromScale(1, 1), 
		Position = l__UIUtil__9:getActionBarPosition(), 
		AnchorPoint = Vector2.new(0.5, 1), 
		BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
		BackgroundTransparency = 0.6, 
		BorderSizePixel = 0
	};
	if l__Angel__12 == l__AngelType__7.LIGHT then
		local v14 = 0;
	else
		v14 = 1;
	end;
	v13.LayoutOrder = v14;
	local l__SelectAngel__10 = p2.SelectAngel;
	v13[u2.Event.Activated] = function()
		l__SelectAngel__10(l__Angel__12);
	end;
	return u2.createElement("ImageButton", v13, { u2.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4.675675675675675
		}), u2.createElement("TextLabel", {
			Size = UDim2.fromScale(0.8, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			Text = "<b>" .. l__Angel__12 .. " Angel</b>", 
			Font = "Roboto", 
			RichText = true, 
			TextScaled = true, 
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}) });
end;
return {
	AngelUi = function(p3)
		local v15 = l__Players__1.LocalPlayer:GetAttribute("AngelType");
		local v16 = false;
		if v15 ~= 0 then
			v16 = false;
			if v15 == v15 then
				v16 = false;
				if v15 ~= "" then
					v16 = v15;
				end;
			end;
		end;
		if not (not v16) then
			return nil;
		end;
		local v17 = p3.store.Kit.angelProgress;
		if v17 == nil then
			v17 = 0;
		end;
		local v18 = math.max(0.05, v17);
		if not (v18 >= 1) then
			return u2.createElement(l__ProgressBar__4, {
				Size = l__Theme__5.actionBarProgressBarSize, 
				Progress = v18, 
				BarGradient = ColorSequence.new(l__ColorUtil__6.hexColor(14363435), l__ColorUtil__6.hexColor(14573407))
			});
		end;
		local v19 = {};
		for v20, v21 in pairs(p3) do
			v19[v20] = v21;
		end;
		return u2.createElement(u3, v19);
	end
};

