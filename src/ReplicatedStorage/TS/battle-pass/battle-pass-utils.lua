-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	MAX_LEVEL = 50, 
	PAID_MULTIPLIER = 1.2, 
	SOCIAL_CONNECTIONS_MULTIPLIER = 1.2, 
	EXPERIENCE_BOOST_ENABLED = false, 
	EXPERIENCE_BOOST_MULT = 2
};
local l__season5__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason.season5;
v2.BATTLE_PASS_SEASON = l__season5__3;
v2.BATTLE_PASS_ICON = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId.BattlePassIcons[l__season5__3];
v2.BATTLE_PASS_SEASON_NUMBER = tonumber(string.split(l__season5__3, "season")[2]);
v2.BATTLE_PASS_GAMEPASS = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass.BATTLE_PASS_S5;
v2.BATTLE_PASS_END_TIME = 1663970400;
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
function v2.getExperienceForLevel(p2)
	if p2 == 0 then
		return 0;
	end;
	return 2000 + p2 * 1000;
end;
u1 = function(p3)
	local v7 = 0;
	local v8 = 0;
	local v9 = false;
	while true do
		if v9 then
			v8 = v8 + 1;
		else
			v9 = true;
		end;
		if not (v8 <= p3) then
			break;
		end;
		if v8 == 0 then
			local v10 = 0;
		else
			v10 = 2000 + v8 * 1000;
		end;
		v7 = v7 + v10;	
	end;
	return v7;
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
	local v15, v16, v17 = ipairs(v14[#v14 - p8 + 1]);
	while true do
		v15(v16, v17);
		if not v15 then
			break;
		end;
		v17 = v15;
		if v16.kit == p7 then
			return v16.level;
		end;	
	end;
end;
local l__BPRewardDisplayMeta__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local l__Theme__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
function v2.getRewardThemeColor(p9)
	local v18 = p9.kit ~= nil;
	if not v18 then
		local v19 = p9.comingSoon;
		if v19 ~= nil then
			v19 = v19.kit;
		end;
		v18 = v19 ~= nil;
	end;
	if v18 then
		return l__BPRewardDisplayMeta__7.kit.backgroundColor;
	end;
	local v20 = p9.kitSkin ~= nil;
	if not v20 then
		local v21 = p9.comingSoon;
		if v21 ~= nil then
			v21 = v21.kitSkin;
		end;
		v20 = v21 ~= nil;
	end;
	if v20 then
		return l__BPRewardDisplayMeta__7.kitSkin.backgroundColor;
	end;
	local v22 = p9.killEffect ~= nil;
	if not v22 then
		local v23 = p9.comingSoon;
		if v23 ~= nil then
			v23 = v23.killEffect;
		end;
		v22 = v23 ~= nil;
	end;
	if v22 then
		return l__BPRewardDisplayMeta__7.killEffect.backgroundColor;
	end;
	local v24 = p9.lobbyGadget ~= nil;
	if not v24 then
		local v25 = p9.comingSoon;
		if v25 ~= nil then
			v25 = v25.lobbyGadget;
		end;
		v24 = v25 ~= nil;
	end;
	if v24 then
		return l__BPRewardDisplayMeta__7.lobbyGadget.backgroundColor;
	end;
	local v26 = p9.emote ~= nil;
	if not v26 then
		local v27 = p9.comingSoon;
		if v27 ~= nil then
			v27 = v27.emote;
		end;
		v26 = v27 ~= nil;
	end;
	if not v26 then
		return l__Theme__8.backgroundTertiary;
	end;
	if not p9.emote then
		return;
	end;
	if not l__EmoteMeta__3[p9.emote].animation then
		return l__Theme__8.backgroundTertiary;
	end;
	return l__BPRewardDisplayMeta__7.emote.backgroundColor;
end;
return {
	BattlePassUtils = v2
};
