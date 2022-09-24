-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__BedwarsImageId__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__4 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Empty__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local l__EnchantRuneWheel__6 = v1.import(script, script.Parent, "enchant-rune-wheel").EnchantRuneWheel;
return {
	EnchantShowCase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		v2.ThemeColor = nil;
		v2.EnchantTableType = nil;
		local v5 = l__BedwarsImageId__1.ENCHANTING_TABLE;
		if p1.EnchantTableType == l__ItemType__2.ENCHANT_TABLE_GLITCHED then
			v5 = l__BedwarsImageId__1.GLITCHED_ENCHANTING_TABLE;
		end;
		local u7 = u3.createRef();
		p2.useEffect(function()
			local v6 = u7:getValue();
			if v6 then
				l__TweenService__4:Create(v6, TweenInfo.new(1.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
					Position = UDim2.fromScale(0.5, 0.475)
				}):Play();
			end;
		end, {});
		local v7 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		for v8, v9 in pairs(v2) do
			v7[v8] = v9;
		end;
		return u3.createElement(l__Empty__5, v7, {
			EnchantTableRender = u3.createElement("ImageLabel", {
				Image = v5, 
				Size = UDim2.fromScale(0.95, 0.95), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.525), 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				[u3.Ref] = u7
			}),
			(u3.createElement(l__EnchantRuneWheel__6, {
				Color = p1.ThemeColor, 
				Size = UDim2.fromScale(1, 1), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				RuneTransparency = 0.4
			}))
		});
	end)
};
