-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__LobbyGadgetMeta__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local l__getItemMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
return {
	getLobbyGadgetImage = function(p1)
		local v2 = l__LobbyGadgetMeta__1[p1];
		local l__image__3 = v2.image;
		if l__image__3 ~= "" and l__image__3 then
			return v2.image;
		end;
		if not v2.items then
			return;
		end;
		return l__getItemMeta__2(v2.items[1].itemType).image;
	end
};
