-- Script Hash: 832764f7ea40f7cc3a7d11ed9903a32e31181c81b0d8ac3485f95a082d0832776dbfef28af3f8b5d608c185f3deac2a5
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	SectionDivider = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		return u1.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.5), 
			Size = UDim2.new(1, 0, 0, 1), 
			BackgroundColor3 = l__Theme__2.backgroundSecondary, 
			BackgroundTransparency = 0.2, 
			BorderSizePixel = 0
		});
	end)
};
