-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = setmetatable({}, {
	__tostring = function()
		return "RelicUtil";
	end
});
v2.__index = v2;
function v2.new(...)
	local v3 = setmetatable({}, v2);
	return v3:constructor(...) and v3;
end;
function v2.constructor(p1)

end;
function v2.playerHasActiveRelic(p2, p3, p4)
	return v2:getActiveRelicForPlayer(p3) == p4;
end;
function v2.userIdHasActiveRelic(p5, p6, p7)
	return v2:getActiveRelicForUserId(p6) == p7;
end;
function v2.getActiveRelicForTeam(p8, p9)
	local v4 = p9:GetAttribute("active_relic");
	if v4 ~= 0 and v4 == v4 and v4 ~= "" and v4 then
		return v4;
	end;
	return nil;
end;
function v2.getActiveRelicForPlayer(p10, p11)
	if not p11.Team then
		return nil;
	end;
	return v2:getActiveRelicForTeam(p11.Team);
end;
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
function v2.getActiveRelicForUserId(p12, p13)
	local v5 = l__Players__1:GetPlayerByUserId(p13);
	if not v5 then
		return nil;
	end;
	if not v5.Team then
		return nil;
	end;
	return v2:getActiveRelicForTeam(v5.Team);
end;
function v2.getActiveRelicForTeamId(p14, p15)
	local v6 = nil;
	local v7, v8, v9 = ipairs((l__Players__1:GetPlayers()));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		if v8:GetAttribute("Team") == p15 == true then
			v6 = v8;
			break;
		end;	
	end;
	if not v6 then
		return nil;
	end;
	if not v6.Team then
		return nil;
	end;
	return v2:getActiveRelicForTeam(v6.Team);
end;
return {
	RELIC_ATTRIBUTE_KEY = "active_relic", 
	RELIC_VOTE_END_SECS_BEFORE_START = 5, 
	RelicUtil = v2
};
