-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local v3 = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EventCurrencyType__2 = v2.EventCurrencyType;
local l__EventType__3 = v2.EventType;
function v3.makeStarterEventData()
	local v4 = nil;
	local v5 = nil;
	local v6 = {};
	local v7 = u1.values(l__EventCurrencyType__2);
	v4 = {};
	for v8 = 1, #v7 do
		v4[v7[v8]] = {
			currAmount = 0, 
			amountEarned = 0, 
			amountSpent = 0
		};
		v4 = v4;
	end;
	v6.currencies = local v9;
	local v10 = u1.values(l__EventType__3);
	local function v11(p1, p2)
		p1[p2] = {
			itemsPurchased = {}, 
			missionsClaimed = {}
		};
		return p1;
	end;
	v5 = {};
	for v12 = 1, #v10 do
		v5 = v11(v5, v10[v12], v12 - 1, v10);
	end;
	v6.events = local v13;
	return v6;
end;
function v3.getItemColorRarity(p3)
	if p3 >= 10000 then
		return Color3.fromHex("#FF3B3B");
	end;
	if p3 >= 5000 then
		return Color3.fromHex("#F2FF5F");
	end;
	if p3 >= 1000 then
		return Color3.fromHex("#5FA9FF");
	end;
	if p3 >= 500 then
		return Color3.fromHex("#4FFF6B");
	end;
	return Color3.fromHex("#FFFFFF");
end;
return {
	GameEventUtil = v3
};
