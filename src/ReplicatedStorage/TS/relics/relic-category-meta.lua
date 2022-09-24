-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__RelicCategory__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "relics", "relic-category").RelicCategory;
local u1 = {
	[l__RelicCategory__3.DEFAULT] = {
		hexagonOutlineGradient = ColorSequence.new(l__ColorUtil__2.hexColor(3866618), l__ColorUtil__2.hexColor(2928637))
	}, 
	[l__RelicCategory__3.CORRUPT] = {
		title = {
			displayName = "Corrupt", 
			color = l__ColorUtil__2.hexColor(16720604)
		}, 
		hexagonOutlineGradient = ColorSequence.new(l__ColorUtil__2.hexColor(16730742), l__ColorUtil__2.hexColor(16716761))
	}, 
	[l__RelicCategory__3.LEGENDARY] = {
		title = {
			displayName = "Legendary", 
			color = l__ColorUtil__2.hexColor(16763143)
		}, 
		hexagonOutlineGradient = ColorSequence.new(l__ColorUtil__2.hexColor(16770835), l__ColorUtil__2.hexColor(16744778))
	}
};
return {
	getRelicCategoryMeta = function(p1)
		local v4 = p1;
		if v4 == nil then
			v4 = l__RelicCategory__3.DEFAULT;
		end;
		return u1[v4];
	end
};
