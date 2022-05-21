-- Script Hash: 930b9c7f5c2b173c292d527771cebebbc9122a611b7f8d97afa04c34d6bfe8a4aa1e18cd0c3b8fbe68ceb4ff59c22b20
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {
	DEFAULT_CLAN_TAG_COLOR = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil.hexColor(15658734), 
	CLAN_NAME_CHAR_LIMIT = 20, 
	CLAN_INTRO_CHAR_LIMIT = 160, 
	ANNOUNCEMENT_INTRO_CHAR_LIMIT = 160, 
	CONTRIBUTION_AFTER_CAP_MULT = 0.1, 
	CLAN_DAILY_LIMIT_MULT = 1, 
	MAX_DAILY_CONTRIBUTION = 1000, 
	MAX_CLAN_LEVEL = 25, 
	BASE_CLAN_LEVEL = 0, 
	DAILY_RESET_HOUR = 23
};
local v3 = os.time({
	year = 2022, 
	month = 2, 
	day = 18, 
	hour = 23
});
v2.RESET_TIME = v3;
function v2.getUpcomingDailyResetTime()
	return v3 + 86400 * math.ceil((os.time() - v3) / 86400);
end;
function v2.getContributionDayId()
	return tostring(math.floor((os.time() - v3) / 86400) % 7);
end;
function v2.getUpcomingWeeklyResetTime()
	return v3 + 604800 * math.ceil((os.time() - v3) / 604800);
end;
function v2.getWeekId()
	return tostring(os.date("!*t", os.time()).year) .. "_" .. tostring((math.floor((os.time() - v3) / 604800)));
end;
local u1 = nil;
function v2.calcXPMultiplier(p1, p2)
	local v4 = math.clamp(math.ceil(p1 / 1000), 1, p2);
	return (u1(v4) - u1(v4 - 1)) / 1000;
end;
u1 = function(p3)
	if p3 <= 0 then
		return 0;
	end;
	return (-0.009182736455463728 * math.pow(p3 - 100, 2) + 100) * 1000 * 1;
end;
v2.calcClanMaxDailyCoins = u1;
function v2.hasClanRank(p4, p5)
	return p5 <= p4.rank;
end;
function v2.setClanPassPaid(p6, p7)
	p6:SetAttribute("ClanPassPaid", p7);
end;
function v2.hasClanPass(p8)
	return p8:GetAttribute("ClanPassPaid");
end;
return {
	ClanUtil = v2
};
