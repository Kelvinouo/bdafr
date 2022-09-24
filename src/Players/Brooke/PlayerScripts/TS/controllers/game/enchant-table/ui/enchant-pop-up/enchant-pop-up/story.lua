-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__EnchantPopUp__2 = v1.import(script, script.Parent, "enchant-pop-up").EnchantPopUp;
local l__EnchantType__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").EnchantType;
local l__ItemType__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
return function(p1)
	local u5 = u1.mount(u1.createElement(l__EnchantPopUp__2, {
		Enchant = l__EnchantType__3.STATIC_3, 
		EnchantTableType = l__ItemType__4.ENCHANT_TABLE_GLITCHED
	}), p1);
	return function()
		return u1.unmount(u5);
	end;
end;
