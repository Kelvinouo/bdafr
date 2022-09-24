-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-meta");
local l__getRelicMeta__1 = v3.getRelicMeta;
local l__getRelicCategoryMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-category-meta").getRelicCategoryMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__RunService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).RunService;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__AutoSizedText__6 = v2.AutoSizedText;
local l__getRelicDescription__7 = v3.getRelicDescription;
local l__TooltipContainer__8 = v2.TooltipContainer;
local l__BedwarsImageId__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__Empty__10 = v2.Empty;
return {
	RelicIcon = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u5)(function(p1, p2)
		local v4 = l__getRelicMeta__1(p1.Relic);
		local v5 = l__getRelicCategoryMeta__2(v4.relicCategory);
		local v6, v7 = p2.useState(0);
		p2.useEffect(function()
			local v8 = u3.new();
			local u11 = math.random() * 30;
			local u12 = math.random() * 0.2 + 0.9;
			v8:GiveTask(l__RunService__4.Heartbeat:Connect(function(p3)
				u11 = u11 + p3 * u12;
				v7(u11);
			end));
			return function()
				v8:DoCleaning();
			end;
		end, {});
		local v9 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__FrameProps__10 = p1.FrameProps;
		if l__FrameProps__10 then
			for v11, v12 in pairs(l__FrameProps__10) do
				v9[v11] = v12;
			end;
		end;
		local v13 = p1.EnableTooltip;
		if v13 then
			local v14 = { u5.createElement(l__AutoSizedText__6, {
					Text = v4.displayName, 
					Font = Enum.Font.SourceSansBold, 
					TextSize = 16, 
					Limits = Vector2.new(300, 60)
				}) };
			local v15 = false;
			if v5.title ~= nil then
				v15 = u5.createElement(l__AutoSizedText__6, {
					Text = v5.title.displayName .. " Relic", 
					Font = Enum.Font.SourceSans, 
					TextColor3 = v5.title.color, 
					TextSize = 14, 
					Limits = Vector2.new(300, 60)
				});
			end;
			if v15 then
				v14[#v14 + 1] = v15;
			end;
			v14[#v14 + 1] = u5.createElement(l__AutoSizedText__6, {
				Text = l__getRelicDescription__7(p1.Relic, true), 
				Font = Enum.Font.SourceSans, 
				TextColor3 = Color3.fromRGB(191, 191, 191), 
				TextSize = 14, 
				Limits = Vector2.new(300, 60)
			});
			v13 = u5.createElement(l__TooltipContainer__8, {}, v14);
		end;
		local v16 = {
			OuterHexagon = u5.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.915, 1), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				Image = "rbxassetid://10899316316", 
				ZIndex = 2, 
				Rotation = 90
			}, { u5.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1.1504424778761062
				}), u5.createElement("UIGradient", {
					Color = v5.hexagonOutlineGradient, 
					Rotation = 45 + v6 * 150
				}) }), 
			CutoutImage = u5.createElement("ImageLabel", {
				Size = UDim2.fromScale(0.97, 1), 
				Position = UDim2.new(0.5, 0, 0.5, 0), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				BackgroundTransparency = 1, 
				Image = l__BedwarsImageId__9.NO_STAMP, 
				ZIndex = 4
			}, { u5.createElement("UIAspectRatioConstraint", {
					AspectRatio = 1.1497584541062802
				}) })
		};
		if v13 then
			v16[#v16 + 1] = v13;
		end;
		return u5.createFragment({
			RelicIcon = u5.createElement(l__Empty__10, v9, v16)
		});
	end)
};
