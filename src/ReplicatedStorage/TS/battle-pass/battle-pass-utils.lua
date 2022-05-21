-- Script Hash: f9a7707284612a8242dac80b0df130dbf85bd2f5019b0c2d1fce6eca8609df6558d988b067bdb656255ebf3373bd7321
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	MAX_LEVEL = 50, 
	PAID_MULTIPLIER = 1.2, 
	SOCIAL_CONNECTIONS_MULTIPLIER = 1.2, 
	EXPERIENCE_BOOST_ENABLED = false, 
	EXPERIENCE_BOOST_MULT = 2
};
local l__season4__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason.season4;
v2.BATTLE_PASS_SEASON = l__season4__3;
v2.BATTLE_PASS_ICON = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId.BattlePassIcons[l__season4__3];
v2.BATTLE_PASS_SEASON_INDEX = tonumber(string.split(l__season4__3, "season")[2]);
v2.BATTLE_PASS_END_TIME = 1654898400;
local u1 = nil;
function v2.getLevelFromExperience(p1)
	local v4 = 0;
	local v5 = 1;
	local v6 = false;
	while true do
		if v6 then
			v5 = v5 + 1;
		else
			v6 = true;
		end;
		if not (v5 <= 50) then
			break;
		end;
		if p1 < u1(v5) then
			return v4;
		end;
		v4 = v4 + 1;	
	end;
	return v4;
end;
local function v7(p2)
	if p2 == 0 then
		return 0;
	end;
	return 2000 + p2 * 1000;
end;
v2.getExperienceForLevel = v7;
u1 = function(p3)
	local v8 = 0;
	local v9 = 0;
	local v10 = false;
	while true do
		if v10 then
			v9 = v9 + 1;
		else
			v10 = true;
		end;
		if not (v9 <= p3) then
			break;
		end;
		v8 = v8 + v7(v9);	
	end;
	return v8;
end;
v2.getTotalExperienceForLevel = u1;
function v2.getCurrExperienceProgression(p4, p5)
	return p4 - u1(p5);
end;
local l__KillEffectMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local l__EmoteMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local l__getLobbyGadgetImage__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage;
function v2.getRewardImageId(p6)
	local v11 = "";
	if p6.killEffect then
		local v12 = l__KillEffectMeta__2[p6.killEffect].image;
		if v12 == nil then
			v12 = l__KillEffectMeta__2[p6.killEffect].name;
		end;
		return v12;
	end;
	if p6.emote then
		return l__EmoteMeta__3[p6.emote].image;
	end;
	if p6.lobbyGadget then
		local v13 = l__getLobbyGadgetImage__4(p6.lobbyGadget);
		if v13 == nil then
			v13 = "";
		end;
		v11 = v13;
	end;
	return v11;
end;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__BattlePassRewards__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
function v2.getRequiredLevelForKit(p7, p8)
	local v14 = u5.values(l__BattlePassRewards__6);
	for v15, v16 in ipairs(v14[#v14 - p8 + 1]) do
		if v16.kit == p7 then
			return v16.level;
		end;
	end;
end;
return {
	BattlePassUtils = v2
};
