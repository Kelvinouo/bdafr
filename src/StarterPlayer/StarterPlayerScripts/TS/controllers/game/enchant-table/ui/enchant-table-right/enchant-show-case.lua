-- Script Hash: 5a6346de1caafc82a40aaf3188d1dc53cf8efd513302724f446ab9831e928bc0f39777ceaa1cf98ed4251cd5a6152adc
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local l__EnchantRuneWheel__3 = v1.import(script, script.Parent, "enchant-rune-wheel").EnchantRuneWheel;
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	EnchantShowCase = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5)
		};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		return u1.createElement(l__Empty__2, v2, {
			EnchantTableRender = u1.createElement("ImageLabel", {
				Image = l__BedwarsImageId__4.ENCHANTING_TABLE, 
				Size = UDim2.fromScale(0.95, 0.95), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				ScaleType = "Fit", 
				BackgroundTransparency = 1
			}),
			(u1.createElement(l__EnchantRuneWheel__3, {
				Size = UDim2.fromScale(1, 1), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Position = UDim2.fromScale(0.5, 0.5)
			}))
		});
	end)
};
