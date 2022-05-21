-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__FishermanUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "fisherman", "fisherman-util").FishermanUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	FishermanMinigameCountdown = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2, v3 = p2.useState(l__FishermanUtil__1.minigameDuration);
		p2.useEffect(function()
			local u4 = true;
			v1.Promise.defer(function()
				local v4 = l__FishermanUtil__1.minigameDuration;
				while u4 and not p1.GameOver do
					if v4 == 0 then
						p1.HandleRanOutOfTime(l__FishermanUtil__1.minigameDuration - v2);
						u4 = false;
					end;
					if u4 and not p1.GameOver then
						v4 = v4 - 1;
						v3(v4);
					end;
					wait(1);				
				end;
			end);
			return function()
				u4 = false;
			end;
		end, { p1.GameOver });
		return u2.createFragment({
			CountdownTimer = u2.createElement("TextLabel", {
				AnchorPoint = Vector2.new(1, 0), 
				Position = UDim2.fromScale(1, 0), 
				Size = UDim2.fromScale(0, 1), 
				AutomaticSize = "X", 
				BackgroundColor3 = l__ColorUtil__3.BLACK, 
				BackgroundTransparency = 0.6, 
				BorderSizePixel = 0, 
				TextColor3 = l__ColorUtil__3.WHITE, 
				Font = Enum.Font.Roboto, 
				TextScaled = true, 
				RichText = true, 
				Text = "Time Left: <font color=\"" .. l__ColorUtil__3.richTextColor(Color3.fromRGB(255, 208, 40)) .. "\">" .. tostring(v2) .. "</font>", 
				LayoutOrder = 1
			}, { u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 5)
				}), u2.createElement("UIPadding", {
					PaddingTop = UDim.new(0.05, 0), 
					PaddingBottom = UDim.new(0.05, 0), 
					PaddingLeft = UDim.new(0, 6), 
					PaddingRight = UDim.new(0, 6)
				}) })
		});
	end)
};
