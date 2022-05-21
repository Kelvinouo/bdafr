-- Script Hash: 1384b9ad30db37db9de5696092ad71dd1c66a84f7ecead5bf9062ba18b226a6f1af77ba75b04ef6a7b13d1aec71753c0
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BrewingCauldron__3 = v1.import(script, script.Parent, "brewing-cauldron").BrewingCauldron;
local l__CraftingStatus__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
return function(p1)
	local u5 = u2.mount(u2.createElement(l__BrewingCauldron__3, {
		Inventory = { l__ItemType__1.WOOL_PINK, l__ItemType__1.WOOL_PINK }, 
		CraftingStatus = l__CraftingStatus__4.crafting, 
		Text = "Ingredients", 
		timeToCraft = 3
	}), p1);
	return function()
		return u2.unmount(u5);
	end;
end;
