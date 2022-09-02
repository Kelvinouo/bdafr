-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local v3 = {};
local l__EventMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
function v3.getMissionId(p1, p2)
	local v4 = nil;
	local v5, v6, v7 = ipairs(l__EventMeta__1[p2].missions);
	while true do
		v5(v6, v7);
		if not v5 then
			break;
		end;
		v7 = v5;
		if v6.name == p1 == true then
			v4 = v6;
			break;
		end;	
	end;
	if not v4 then
		return nil;
	end;
	local v8 = v4;
	if v8 ~= nil then
		v8 = v8.id;
	end;
	return "EVENT_" .. p2 .. "_MISSION_" .. v8;
end;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__EventCurrencyType__3 = v2.EventCurrencyType;
local l__EventType__4 = v2.EventType;
function v3.makeStarterEventData()
	local v9 = nil;
	local v10 = nil;
	local v11 = {};
	local v12 = u2.values(l__EventCurrencyType__3);
	v9 = {};
	for v13 = 1, #v12 do
		v9[v12[v13]] = {
			currAmount = 0, 
			amountEarned = 0, 
			amountSpent = 0
		};
		v9 = v9;
	end;
	v11.currencies = local v14;
	local v15 = u2.values(l__EventType__4);
	local function v16(p3, p4)
		p3[p4] = {
			itemsPurchased = {}, 
			missionsClaimed = {}
		};
		return p3;
	end;
	v10 = {};
	for v17 = 1, #v15 do
		v10 = v16(v10, v15[v17], v17 - 1, v15);
	end;
	v11.events = local v18;
	return v11;
end;
function v3.getItemColorRarity(p5)
	if p5 >= 10000 then
		return Color3.fromHex("#FF3B3B");
	end;
	if p5 >= 5000 then
		return Color3.fromHex("#F2FF5F");
	end;
	if p5 >= 1000 then
		return Color3.fromHex("#5FA9FF");
	end;
	if p5 >= 500 then
		return Color3.fromHex("#4FFF6B");
	end;
	return Color3.fromHex("#FFFFFF");
end;
return {
	GameEventUtil = v3
};
