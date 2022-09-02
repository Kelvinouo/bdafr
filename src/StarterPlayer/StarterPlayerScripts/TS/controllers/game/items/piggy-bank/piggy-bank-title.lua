-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__PiggyBankUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "piggy-bank", "piggy-bank-util").PiggyBankUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	PiggyBankTitle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		local v4 = l__PiggyBankUtil__1:getStageFromCoins(p1.coins);
		local v5 = 0;
		local v6 = false;
		while true do
			if v6 then
				v5 = v5 + 1;
			else
				v6 = true;
			end;
			if not (v5 < v4) then
				break;
			end;
			table.insert(v3, (u2.createElement("ImageLabel", {
				Size = UDim2.fromScale(1, 1), 
				Image = "rbxassetid://9363757731", 
				BackgroundTransparency = 1
			}, { u2.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1
				}) })));		
		end;
		local v7 = {
			BackgroundTransparency = 1, 
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v8 = {};
		local v9 = #v8;
		local v10 = {
			BackgroundTransparency = 1, 
			Size = UDim2.fromScale(1, 0.5), 
			Position = UDim2.fromScale(0.5, 0), 
			AnchorPoint = Vector2.new(0.5, 0)
		};
		local v11 = { u2.createElement("UIGridLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center", 
				CellSize = UDim2.fromScale(0.18, 0.9), 
				CellPadding = UDim2.fromScale(0.02)
			}) };
		local v12 = #v11;
		local v13, v14, v15 = ipairs(v3);
		while true do
			v13(v14, v15);
			if not v13 then
				break;
			end;
			v15 = v13;
			v11[v12 + v13] = v14;		
		end;
		v8[v9 + 1] = u2.createElement("Frame", v10, v11);
		v8[v9 + 2] = u2.createElement("TextLabel", {
			Text = tostring(p1.coins) .. " Candy", 
			TextColor3 = p1.color, 
			Font = "LuckiestGuy", 
			TextScaled = true, 
			BackgroundTransparency = 1, 
			Size = UDim2.fromScale(0.95, 0.3), 
			Position = UDim2.fromScale(0.5, 0.8), 
			AnchorPoint = Vector2.new(0.5, 1)
		}, { u2.createElement("UIStroke", {
				Thickness = 2
			}) });
		return u2.createElement("Frame", v7, v8);
	end)
};
