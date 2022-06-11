-- Script Hash: 558b3b150625e0bee36a8564d242c87dd84988ab8a3a20a29fb6c34f3fbca33d8c25d4407770cb277ed8a487af196d60
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking");
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__StatCardContainer__2 = v1.import(script, script.Parent, "stat-card-container").StatCardContainer;
local l__StatType__3 = v2.StatType;
local l__TrackType__4 = v2.TrackType;
local l__OfflinePlayerUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).OfflinePlayerUtil;
return function(p1)
	local u6 = u1.mount(u1.createElement(l__StatCardContainer__2, {
		cards = { {
				amount = 33, 
				statType = l__StatType__3.SUPPORT, 
				trackType = l__TrackType__4.BLOCKBREAKS, 
				player = l__OfflinePlayerUtil__5.Dummy.Asen
			}, {
				amount = 3356.544, 
				statType = l__StatType__3.OFFENSIVE, 
				trackType = l__TrackType__4.DAMAGE, 
				player = l__OfflinePlayerUtil__5.Dummy.Asen
			}, {
				amount = 7, 
				statType = l__StatType__3.OFFENSIVE, 
				trackType = l__TrackType__4.KILLS, 
				player = l__OfflinePlayerUtil__5.Dummy.Asen
			} }
	}), p1);
	return function()
		return u1.unmount(u6);
	end;
end;
