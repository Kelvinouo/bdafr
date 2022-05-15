
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Button__2 = v2.Button;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Flamework__4 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsAppIds__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local l__ImageId__6 = v2.ImageId;
return {
	KitShopBattlePassButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		return u1.createElement(l__Button__2, {
			Size = p1.Size, 
			BackgroundColor3 = l__Theme__3.backgroundSuccess, 
			Selectable = false, 
			OnClick = function()
				l__Flamework__4.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(l__BedwarsAppIds__5.BATTLEPASS, {});
			end, 
			LayoutOrder = p1.LayoutOrder
		}, { u1.createElement("ImageLabel", {
				Image = l__ImageId__6.TICKET, 
				ImageColor3 = Color3.fromRGB(255, 255, 255), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Size = UDim2.fromScale(0.67, 0.65), 
				SizeConstraint = "RelativeYY", 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0.2, 0.5), 
				ScaleType = "Fit"
			}), u1.createElement("TextLabel", {
				Text = "<b>BATTLE PASS</b>", 
				Size = UDim2.fromScale(0.42, 0.45), 
				Position = UDim2.fromScale(0.36, 0.5), 
				AnchorPoint = Vector2.new(0, 0.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				TextScaled = true, 
				RichText = true, 
				Font = "Roboto", 
				TextXAlignment = "Left"
			}) });
	end)
};

