-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local l__OfflinePlayerUtil__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local l__ClanMemberRank__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__ClanUtil__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local l__ClanUpgradeType__5 = v2.ClanUpgradeType;
local l__ClanUpgradeTier__6 = v2.ClanUpgradeTier;
local l__BedwarsKit__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local l__CreateRoduxApp__8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__ClanProfileCore__9 = v1.import(script, script.Parent, "clan-profile-core").ClanProfileCore;
local u10 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v3 = {
		offlinePlayer = {
			name = "oiogy", 
			userId = l__OfflinePlayerUtil__1.Dummy.oiogy.userId, 
			displayName = "Sprux"
		}, 
		rank = l__ClanMemberRank__2.LEADER, 
		contribution = 2346, 
		dateJoined = 100
	};
	local v4 = {
		offlinePlayer = {
			name = l__OfflinePlayerUtil__1.Dummy.SnickTrix.name, 
			userId = l__OfflinePlayerUtil__1.Dummy.SnickTrix.userId, 
			displayName = l__OfflinePlayerUtil__1.Dummy.SnickTrix.displayName
		}, 
		rank = l__ClanMemberRank__2.ADMIN, 
		contribution = 345, 
		dateJoined = 100
	};
	local v5 = {
		offlinePlayer = {
			name = l__OfflinePlayerUtil__1.Dummy.Chase.name, 
			userId = l__OfflinePlayerUtil__1.Dummy.Chase.userId, 
			displayName = l__OfflinePlayerUtil__1.Dummy.Chase.displayName
		}, 
		rank = l__ClanMemberRank__2.MEMBER, 
		contribution = 2346, 
		dateJoined = 100
	};
	l__ClientStore__3:dispatch({
		type = "ClanUpdate", 
		myClanId = "123", 
		myClan = {
			id = "123", 
			name = "Doms Clan", 
			tag = "Dom", 
			announcement = "Cap daily or else >:(", 
			introduction = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m", 
			level = 4, 
			coins = 100, 
			totalCoinsEarned = 100, 
			clanContribution = {
				id = l__ClanUtil__4.getContributionDayId(), 
				totalXPEarned = 0, 
				dailyClanContribution = {}, 
				dailyMemberContributions = {}
			}, 
			leader = v3, 
			members = {
				["123"] = v3, 
				["1"] = v4, 
				["12"] = v4, 
				["13"] = v4, 
				["14"] = v5, 
				["15"] = v5, 
				["16"] = v5, 
				["17"] = v5, 
				["18"] = v5, 
				["19"] = v5, 
				["20"] = v5
			}, 
			maxMembers = 10, 
			upgrades = {
				[l__ClanUpgradeType__5.CLAN_LEVEL] = l__ClanUpgradeTier__6.CLAN_LEVEL5
			}, 
			kitShop = {
				id = l__ClanUtil__4.getWeekId(), 
				stock = 1, 
				kits = { l__BedwarsKit__7.BARBARIAN, l__BedwarsKit__7.BIGMAN, l__BedwarsKit__7.DASHER }, 
				unlocks = {
					[l__BedwarsKit__7.AERY] = {
						kit = l__BedwarsKit__7.AERY, 
						purchaseTime = 1645663458, 
						endTime = 1646981858, 
						duration = 518400
					}
				}
			}, 
			dateCreated = 100
		}, 
		me = v4
	});
	local u11 = l__CreateRoduxApp__8("ClanProfileApp", l__ClanProfileCore__9, {
		ClanId = "123"
	}, {}, {
		Parent = p1
	});
	return function()
		return u10.unmount(u11);
	end;
end;
