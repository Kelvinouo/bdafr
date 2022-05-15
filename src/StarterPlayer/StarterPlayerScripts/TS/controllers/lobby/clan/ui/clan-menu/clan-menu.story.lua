
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClanMemberRank__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__ClanMenu__4 = v1.import(script, script.Parent, "clan-menu-core").ClanMenu;
local u5 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = {
		offlinePlayer = {
			name = "oiogy", 
			userId = 123, 
			displayName = "Sprux"
		}, 
		rank = l__ClanMemberRank__1.LEADER, 
		contribution = 2346, 
		dateJoined = 1
	};
	l__ClientStore__2:dispatch({
		type = "ClanInviteIncoming", 
		clanId = "123", 
		clanProfile = {
			name = "Doms Clan", 
			tag = "Dom", 
			introduction = "string", 
			level = 1, 
			leader = v2, 
			members = {
				["123"] = v2
			}, 
			maxMembers = 10
		}
	});
	local u6 = l__CreateRoduxApp__3("ClanMenu", l__ClanMenu__4, {}, {}, {
		Parent = p1
	});
	return function()
		return u5.unmount(u6);
	end;
end;

