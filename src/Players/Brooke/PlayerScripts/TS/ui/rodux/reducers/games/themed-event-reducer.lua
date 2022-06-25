-- Script Hash: aa1c0d8c3db2c3a9e0889e6d179873f429165171782afa767ea3d617da8340097cbf67a7449ae87f8f47491e7a90e443
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "themed-event", "themed-event-types");
local u1 = {
	personalCollectables = {
		[v1.ThemedEventType.EASTER_2022] = {
			[v1.ThemedCollectableType.EASTER_EGG] = {
				amountCollected = 0
			}
		}
	}
};
return {
	ThemedEventReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "SetPteCollectables" then
			p1.personalCollectables = p2.personalCollectables;
			return p1;
		end;
		if p2.type == "SetPteCollectable" then
			local v2 = p1.personalCollectables[p2.eventType];
			if v2 then
				v2[p2.personalCollectable].amountCollected = p2.amountCollected;
			end;
		end;
		return p1;
	end
};
