-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__StatusEffectMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	StatusEffectTag = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = l__StatusEffectMeta__1[p1.ActiveStatusEffect.statusEffect];
		local v4 = nil;
		if v3.item then
			v4 = l__getItemMeta__2(v3.item);
		end;
		local v5 = {
			Size = UDim2.fromScale(1, 1), 
			ScaleType = "Fit", 
			SizeConstraint = "RelativeYY"
		};
		local v6 = v4;
		if v6 ~= nil then
			v6 = v6.image;
		end;
		v5.Image = v6;
		v5.BackgroundTransparency = 1;
		return u3.createElement("ImageLabel", v5);
	end)
};
