-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ItemType__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local l__VendingMachineRarity__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-rarity").VendingMachineRarity;
local l__VendingMachineRewardId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
return {
	VendingMachineRewardMeta = {
		[l__VendingMachineRewardId__4.NONE] = {
			id = l__VendingMachineRewardId__4.NONE, 
			rarity = l__VendingMachineRarity__3.COMMON
		}, 
		[l__VendingMachineRewardId__4.DODO_BIRD] = {
			id = l__VendingMachineRewardId__4.DODO_BIRD, 
			rarity = l__VendingMachineRarity__3.COMMON, 
			custom = {
				image = "rbxassetid://9112234692", 
				title = "Dodo Bird"
			}
		}, 
		[l__VendingMachineRewardId__4.PAINT_BLASTER] = {
			id = l__VendingMachineRewardId__4.PAINT_BLASTER, 
			rarity = l__VendingMachineRarity__3.COMMON, 
			item = {
				itemType = l__ItemType__2.PAINT_SHOTGUN, 
				amount = 1
			}
		}, 
		[l__VendingMachineRewardId__4.TWIRLBLADE] = {
			id = l__VendingMachineRewardId__4.TWIRLBLADE, 
			rarity = l__VendingMachineRarity__3.COMMON, 
			item = {
				itemType = l__ItemType__2.TWIRLBLADE, 
				amount = 1
			}
		}, 
		[l__VendingMachineRewardId__4.CARROT_CANNON] = {
			id = l__VendingMachineRewardId__4.CARROT_CANNON, 
			rarity = l__VendingMachineRarity__3.COMMON, 
			item = {
				itemType = l__ItemType__2.CARROT_CANNON, 
				amount = 1
			}
		}, 
		[l__VendingMachineRewardId__4.BEAR_CLAWS] = {
			id = l__VendingMachineRewardId__4.BEAR_CLAWS, 
			rarity = l__VendingMachineRarity__3.COMMON, 
			item = {
				itemType = l__ItemType__2.BEAR_CLAWS, 
				amount = 1
			}
		}
	}
};
