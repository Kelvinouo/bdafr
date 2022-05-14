-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	clanInvites = {}, 
	paid = false
};
return {
	ClansReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "ClanUpdate" then
			p1.myClanId = p2.myClanId;
			p1.myClan = p2.myClan;
			p1.myClanMember = p2.me;
			return p1;
		end;
		if p2.type == "ClanInviteIncoming" then
			p1.clanInvites[p2.clanId] = p2.clanProfile;
			return p1;
		end;
		if p2.type == "ClanInviteDelete" then
			p1.clanInvites[p2.clanId] = nil;
			return p1;
		end;
		if p2.type == "ClanSetClanPassPaid" then
			p1.paid = p2.paid;
		end;
		return p1;
	end
};
