
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ImageId__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ImageId;
local l__TabListRank__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-ranks.dto").TabListRank;
local u1 = {
	[l__TabListRank__3.DEVELOPER] = {
		name = "Developer", 
		rankInGroup = { 255, 254, 230 }, 
		rolesInGroup = { "Owner", "Senior Developer", "Developer" }, 
		iconAssetId = l__ImageId__2.TabListRankIcons[l__TabListRank__3.DEVELOPER]
	}, 
	[l__TabListRank__3.BUILDER] = {
		name = "Builder", 
		rankInGroup = { 160 }, 
		rolesInGroup = { "Build Team" }
	}, 
	[l__TabListRank__3.STAR_CREATOR] = {
		name = "Star Creator", 
		rankInGroup = { 0 }, 
		rolesInGroup = {}, 
		iconAssetId = l__ImageId__2.TabListRankIcons[l__TabListRank__3.STAR_CREATOR]
	}, 
	[l__TabListRank__3.FAMOUS] = {
		name = "Famous", 
		rankInGroup = { 20 }, 
		rolesInGroup = { "Famous" }
	}, 
	[l__TabListRank__3.Lead_Moderator] = {
		name = "Lead Moderator", 
		rankInGroup = { 150 }, 
		rolesInGroup = { "Lead Moderator" }
	}, 
	[l__TabListRank__3.Senior_Moderator] = {
		name = "Senior Moderator", 
		rankInGroup = { 125 }, 
		rolesInGroup = { "Senior Moderator" }
	}, 
	[l__TabListRank__3.Moderator] = {
		name = "Moderator", 
		rankInGroup = { 120 }, 
		rolesInGroup = { "Moderator" }
	}, 
	[l__TabListRank__3.Junior_Moderator] = {
		name = "Junior Moderator", 
		rankInGroup = { 100 }, 
		rolesInGroup = { "Junior Moderator" }
	}, 
	[l__TabListRank__3.Default] = {
		name = "Default Player"
	}
};
return {
	getTablistRankMeta = function(p1)
		return u1[p1];
	end
};

