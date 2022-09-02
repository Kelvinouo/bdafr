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
	local v4, v5, v6 = ipairs(v2.keys(p1));
	while true do
		v4(v5, v6);
		if not v4 then
			break;
		end;
		v6 = v4;
		if table.find(u4, v5) ~= nil and type(v5) == "string" then
			u6[v5] = l__GetTarmacAsset__5(v5, p1).Image;
		end;	
	end;
end;
(function()
	u2((l__GetTarmacAssetFromPath__1({ "emotes" })));
	local v7, v8, v9 = ipairs((v2.values(l__BattlePassSeason__3)));
	while true do
		v7(v8, v9);
		if not v7 then
			break;
		end;
		v9 = v7;
		local v10 = l__GetTarmacAssetFromPath__1({ "emotes", v8 });
		if v10 then
			u2(v10);
		end;	
	end;
end)();
return {
	getEmoteAsset = function(p2)
		return u6[p2];
	end, 
	EmoteAssets = u6
};
