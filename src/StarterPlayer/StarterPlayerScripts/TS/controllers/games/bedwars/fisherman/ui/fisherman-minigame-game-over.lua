-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	FisherMinigameGameOver = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = nil;
		local l__useState__3 = p2.useState;
		local v4 = string.split(p1.fishType, "_");
		local v5 = #v4;
		v4[v5] = nil;
		v2 = v4[v5];
		local v6 = {};
		local v7 = {
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.fromScale(0, 0.1), 
			AutomaticSize = "X", 
			BackgroundColor3 = l__ColorUtil__2.BLACK, 
			BackgroundTransparency = 0.6, 
			BorderSizePixel = 0, 
			TextColor3 = l__ColorUtil__2.WHITE, 
			Font = Enum.Font.Roboto, 
			TextScaled = true, 
			RichText = true
		};
		if p1.win then
			local v8 = "You caught a <b>" .. tostring(v2) .. " fish</b>!";
		else
			v8 = "The <b>" .. tostring(v2) .. " fish</b> got away";
		end;
		v7.Text = v8;
		v6.GameOverScreen = u1.createElement("TextLabel", v7, { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.05, 0), 
				PaddingBottom = UDim.new(0.05, 0), 
				PaddingLeft = UDim.new(0, 6), 
				PaddingRight = UDim.new(0, 6)
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 20
			}) });
		return u1.createFragment(v6);
	end)
};
