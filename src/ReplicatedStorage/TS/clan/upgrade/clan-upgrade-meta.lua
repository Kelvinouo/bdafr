-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local l__ClanUpgradeTier__2 = v1.ClanUpgradeTier;
local l__ClanUpgradeType__3 = v1.ClanUpgradeType;
return {
	ClanUpgradeTypeMeta = {
		[l__ClanUpgradeType__3.CLAN_LEVEL] = {
			name = "Clan Level", 
			firstUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL1
		}, 
		[l__ClanUpgradeType__3.MEMBER_CAP] = {
			name = "Member Cap", 
			firstUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP1
		}, 
		[l__ClanUpgradeType__3.KIT_SHOP] = {
			name = "Kit Shop", 
			firstUpgrade = l__ClanUpgradeTier__2.KIT_SHOP1
		}, 
		[l__ClanUpgradeType__3.BATTLE_PASS_XP] = {
			name = "Battle Pass XP", 
			firstUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP1
		}
	}, 
	ClanUpgradeMeta = {
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP1] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "0 \226\134\146 1% xp" }, 
			level = 1, 
			value = 1.01, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP2, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP2] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "1 \226\134\146 2% xp" }, 
			level = 2, 
			value = 1.02, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP3, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP3] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "2 \226\134\146 3% xp" }, 
			level = 3, 
			value = 1.03, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP4, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP4] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "3 \226\134\146 4% xp" }, 
			level = 4, 
			value = 1.04, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP5, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP5] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "4 \226\134\146 5% xp" }, 
			level = 5, 
			value = 1.05, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP6, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP6] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "5 \226\134\146 6% xp" }, 
			level = 6, 
			value = 1.06, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP7, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP7] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "6 \226\134\146 7% xp" }, 
			level = 7, 
			value = 1.07, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP8, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP8] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "7 \226\134\146 8% xp" }, 
			level = 8, 
			value = 1.08, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP9, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP9] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "8 \226\134\146 9% xp" }, 
			level = 9, 
			value = 1.09, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP10, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP10] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "9 \226\134\146 10% xp" }, 
			level = 10, 
			value = 1.1, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP11, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP11] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "10 \226\134\146 11% xp" }, 
			level = 11, 
			value = 1.11, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP12, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP12] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "11 \226\134\146 12% xp" }, 
			level = 12, 
			value = 1.12, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP13, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP13] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "12 \226\134\146 13% xp" }, 
			level = 13, 
			value = 1.13, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP14, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP14] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "13 \226\134\146 14% xp" }, 
			level = 14, 
			value = 1.14, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP15, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP15] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "14 \226\134\146 15% xp" }, 
			level = 15, 
			value = 1.15, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP16, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP16] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "15 \226\134\146 16% xp" }, 
			level = 16, 
			value = 1.16, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP17, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP17] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "16 \226\134\146 17% xp" }, 
			level = 17, 
			value = 1.17, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP18, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP18] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "17 \226\134\146 18% xp" }, 
			level = 18, 
			value = 1.18, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP19, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP19] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "18 \226\134\146 19% xp" }, 
			level = 19, 
			value = 1.19, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP20, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP20] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "19 \226\134\146 20% xp" }, 
			level = 20, 
			value = 1.2, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP21, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP21] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "20 \226\134\146 21% xp" }, 
			level = 21, 
			value = 1.21, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP22, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP22] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "21 \226\134\146 22% xp" }, 
			level = 22, 
			value = 1.22, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP23, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP23] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "22 \226\134\146 23% xp" }, 
			level = 23, 
			value = 1.23, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP24, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP24] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "23 \226\134\146 24% xp" }, 
			level = 24, 
			value = 1.24, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP25, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP25] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "24 \226\134\146 25% xp" }, 
			level = 25, 
			value = 1.25, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP26, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP26] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "25 \226\134\146 26% xp" }, 
			level = 26, 
			value = 1.26, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP27, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP27] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "26 \226\134\146 27% xp" }, 
			level = 27, 
			value = 1.27, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP28, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP28] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "27 \226\134\146 28% xp" }, 
			level = 28, 
			value = 1.28, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP29, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP29] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "28 \226\134\146 29% xp" }, 
			level = 29, 
			value = 1.29, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP30, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP30] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "19 \226\134\146 20% xp" }, 
			level = 20, 
			value = 1.2, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP21, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP31] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "20 \226\134\146 31% xp" }, 
			level = 31, 
			value = 1.31, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP32, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP32] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "31 \226\134\146 32% xp" }, 
			level = 32, 
			value = 1.32, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP33, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP33] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "32 \226\134\146 33% xp" }, 
			level = 33, 
			value = 1.33, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP34, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP34] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "33 \226\134\146 34% xp" }, 
			level = 34, 
			value = 1.34, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP35, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP35] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "34 \226\134\146 35% xp" }, 
			level = 35, 
			value = 1.35, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP36, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP36] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "35 \226\134\146 36% xp" }, 
			level = 36, 
			value = 1.36, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP37, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP37] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "36 \226\134\146 37% xp" }, 
			level = 37, 
			value = 1.37, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP38, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP38] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "37 \226\134\146 38% xp" }, 
			level = 38, 
			value = 1.38, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP39, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP39] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "38 \226\134\146 39% xp" }, 
			level = 39, 
			value = 1.39, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP40, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP40] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "19 \226\134\146 20% xp" }, 
			level = 40, 
			value = 1.2, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP31, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP41] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "20 \226\134\146 41% xp" }, 
			level = 41, 
			value = 1.41, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP42, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP42] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "41 \226\134\146 42% xp" }, 
			level = 42, 
			value = 1.42, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP43, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP43] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "42 \226\134\146 43% xp" }, 
			level = 43, 
			value = 1.43, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP44, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP44] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "43 \226\134\146 44% xp" }, 
			level = 44, 
			value = 1.44, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP45, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP45] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "44 \226\134\146 45% xp" }, 
			level = 45, 
			value = 1.45, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP46, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP46] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "45 \226\134\146 46% xp" }, 
			level = 46, 
			value = 1.46, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP47, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP47] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "46 \226\134\146 47% xp" }, 
			level = 47, 
			value = 1.47, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP48, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP48] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "47 \226\134\146 48% xp" }, 
			level = 48, 
			value = 1.48, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP49, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP49] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "48 \226\134\146 49% xp" }, 
			level = 49, 
			value = 1.49, 
			cost = 250000, 
			nextUpgrade = l__ClanUpgradeTier__2.BATTLE_PASS_XP50, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.BATTLE_PASS_XP50] = {
			description = "Upgrade the amount of battle pass xp your clan members gain by +1%", 
			rewards = { "19 \226\134\146 20% xp" }, 
			level = 50, 
			value = 1.2, 
			cost = 250000, 
			type = l__ClanUpgradeType__3.BATTLE_PASS_XP
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL1] = {
			description = "Upgrade to Clan Level 1", 
			rewards = { "0 \226\134\146 1 level" }, 
			level = 1, 
			value = 1, 
			cost = 200000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL2, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL2] = {
			description = "Upgrade to Clan Level 2", 
			rewards = { "1 \226\134\146 2 level" }, 
			level = 2, 
			value = 2, 
			cost = 400000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL3, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL3] = {
			description = "Upgrade to Clan Level 3", 
			rewards = { "2 \226\134\146 3 level" }, 
			level = 3, 
			value = 3, 
			cost = 700000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL4, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL4] = {
			description = "Upgrade to Clan Level 4", 
			rewards = { "3 \226\134\146 4 level" }, 
			level = 4, 
			value = 4, 
			cost = 1500000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL5, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL5] = {
			description = "Upgrade to Clan Level 5", 
			rewards = { "4 \226\134\146 5 level" }, 
			level = 5, 
			value = 5, 
			cost = 2000000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL6, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL6] = {
			description = "Upgrade to Clan Level 6", 
			rewards = { "5 \226\134\146 6 level" }, 
			level = 6, 
			value = 6, 
			cost = 3000000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL7, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL7] = {
			description = "Upgrade to Clan Level 7", 
			rewards = { "6 \226\134\146 7 level" }, 
			level = 7, 
			value = 7, 
			cost = 3500000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL8, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL8] = {
			description = "Upgrade to Clan Level 8", 
			rewards = { "7 \226\134\146 8 level" }, 
			level = 8, 
			value = 8, 
			cost = 4000000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL9, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL9] = {
			description = "Upgrade to Clan Level 9", 
			rewards = { "8 \226\134\146 9 level" }, 
			level = 9, 
			value = 9, 
			cost = 4500000, 
			nextUpgrade = l__ClanUpgradeTier__2.CLAN_LEVEL10, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.CLAN_LEVEL10] = {
			description = "Upgrade to Clan Level 10", 
			rewards = { "9 \226\134\146 10 level" }, 
			level = 10, 
			value = 10, 
			cost = 5000000, 
			type = l__ClanUpgradeType__3.CLAN_LEVEL
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP1] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "10 \226\134\146 15 members" }, 
			level = 1, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			value = 15, 
			cost = 50000, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP2
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP2] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "15 \226\134\146 20 members" }, 
			level = 2, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			value = 20, 
			cost = 100000, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP3
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP3] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "20 \226\134\146 25 members" }, 
			level = 3, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			value = 25, 
			cost = 150000, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP4
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP4] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "25 \226\134\146 30 members" }, 
			level = 4, 
			value = 30, 
			cost = 200000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP5
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP5] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "30 \226\134\146 35 members" }, 
			level = 5, 
			value = 35, 
			cost = 300000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP6
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP6] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "35 \226\134\146 40 members" }, 
			level = 6, 
			value = 40, 
			cost = 400000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP7
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP7] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "40 \226\134\146 45 members" }, 
			level = 7, 
			value = 45, 
			cost = 500000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP8
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP8] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "45 \226\134\146 50 members" }, 
			level = 8, 
			value = 50, 
			cost = 750000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP9
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP9] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "50 \226\134\146 55 members" }, 
			level = 9, 
			value = 55, 
			cost = 1000000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP10
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP10] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "55 \226\134\146 60 members" }, 
			level = 10, 
			value = 60, 
			cost = 1250000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP11
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP11] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "60 \226\134\146 65 members" }, 
			level = 11, 
			value = 65, 
			cost = 1500000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP12
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP12] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "65 \226\134\146 70 members" }, 
			level = 12, 
			value = 70, 
			cost = 2000000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP13
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP13] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "70 \226\134\146 75 members" }, 
			level = 13, 
			value = 75, 
			cost = 2500000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP14
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP14] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "75 \226\134\146 80 members" }, 
			level = 14, 
			value = 80, 
			cost = 3000000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP15
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP15] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "80 \226\134\146 85 members" }, 
			level = 15, 
			value = 85, 
			cost = 3500000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP16
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP16] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "85 \226\134\146 90 members" }, 
			level = 16, 
			value = 90, 
			cost = 4000000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP17
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP17] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "90 \226\134\146 95 members" }, 
			level = 17, 
			value = 95, 
			cost = 5000000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP, 
			nextUpgrade = l__ClanUpgradeTier__2.MEMBER_CAP18
		}, 
		[l__ClanUpgradeTier__2.MEMBER_CAP18] = {
			description = "Upgrade your clan's max member slots by +5", 
			rewards = { "95 \226\134\146 100 members" }, 
			level = 18, 
			value = 100, 
			cost = 7500000, 
			type = l__ClanUpgradeType__3.MEMBER_CAP
		}, 
		[l__ClanUpgradeTier__2.KIT_SHOP1] = {
			description = "Increase the amount of possible kits that you can unlock in the kit shop by +1", 
			rewards = { "1 \226\134\146 2 kits" }, 
			level = 1, 
			type = l__ClanUpgradeType__3.KIT_SHOP, 
			value = 2, 
			cost = 2500000, 
			nextUpgrade = l__ClanUpgradeTier__2.KIT_SHOP2, 
			prerequisites = { l__ClanUpgradeTier__2.CLAN_LEVEL5 }
		}, 
		[l__ClanUpgradeTier__2.KIT_SHOP2] = {
			description = "Increase the amount of possible kits that you can unlock in the kit shop by +1", 
			rewards = { "2 \226\134\146 3 kits" }, 
			level = 2, 
			type = l__ClanUpgradeType__3.KIT_SHOP, 
			value = 3, 
			cost = 5000000, 
			prerequisites = { l__ClanUpgradeTier__2.CLAN_LEVEL7 }
		}
	}
};
