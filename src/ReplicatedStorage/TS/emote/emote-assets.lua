
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers");
local l__GetTarmacAssetFromPath__1 = v3.GetTarmacAssetFromPath;
local u2 = nil;
local l__BattlePassSeason__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-seasons").BattlePassSeason;
local u4 = v2.values(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType);
local l__GetTarmacAsset__5 = v3.GetTarmacAsset;
local u6 = {};
u2 = function(p1)
	for v4, v5 in ipairs(v2.keys(p1)) do
		if table.find(u4, v5) ~= nil and type(v5) == "string" then
			u6[v5] = l__GetTarmacAsset__5(v5, p1).Image;
		end;
	end;
end;
(function()
	u2((l__GetTarmacAssetFromPath__1({ "emotes" })));
	local v6 = v2.values(l__BattlePassSeason__3);
	local function v7(p2)
		local v8 = l__GetTarmacAssetFromPath__1({ "emotes", p2 });
		if v8 then
			u2(v8);
		end;
	end;
	for v9, v10 in ipairs(v6) do
		v7(v10, v9 - 1, v6);
	end;
end)();
return {
	getEmoteAsset = function(p3)
		return u6[p3];
	end, 
	EmoteAssets = u6
};

