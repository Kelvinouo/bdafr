-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = {
	DEFAULT_CLAN_TAG_COLOR = v2.ColorUtil.hexColor(15658734), 
	CLAN_NAME_CHAR_LIMIT = 20, 
	CLAN_INTRO_CHAR_LIMIT = 160, 
	ANNOUNCEMENT_INTRO_CHAR_LIMIT = 160, 
	CONTRIBUTION_AFTER_CAP_MULT = 0.1, 
	CLAN_DAILY_LIMIT_MULT = 1, 
	MAX_DAILY_CONTRIBUTION = 1000, 
	DAILY_RESET_HOUR = 23
};
local v4 = v2.ResetTime.new(os.time({
	year = 2022, 
	month = 2, 
	day = 18, 
	hour = 23
}));
v3.resetTime = v4;
function v3.getContributionDayId()
	return tostring(tonumber(v4:getDailyResetId()) % 7);
end;
function v3.getWeekId()
	return tostring(os.date("!*t", os.time()).year) .. "_" .. tostring((tonumber(v4:getWeeklyResetId())));
end;
local u1 = nil;
function v3.calcXPMultiplier(p1, p2)
	local v5 = math.clamp(math.ceil(p1 / 1000), 1, p2);
	return (u1(v5) - u1(v5 - 1)) / 1000;
end;
u1 = function(p3)
	if p3 <= 0 then
		return 0;
	end;
	return (-0.009182736455463728 * math.pow(p3 - 100, 2) + 100) * 1000 * 1;
end;
v3.calcClanMaxDailyCoins = u1;
function v3.hasClanRank(p4, p5)
	return p5 <= p4.rank;
end;
function v3.setClanPassPaid(p6, p7)
	p6:SetAttribute("ClanPassPaid", p7);
end;
function v3.hasClanPass(p8)
	return p8:GetAttribute("ClanPassPaid");
end;
return {
	ClanUtil = v3
};
