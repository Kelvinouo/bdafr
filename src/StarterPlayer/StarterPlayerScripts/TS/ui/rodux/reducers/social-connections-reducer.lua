-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = {
	supportTasks = {
		joinedGroup = false
	}, 
	connections = {
		discord = {
			verificationCode = "", 
			validated = false, 
			legacyDiscordVerification = false
		}
	}
};
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	SocialConnectionsReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		local l__type__5 = p2.type;
		if l__type__5 == "SocialConnectionsSetAll" then
			v2.supportTasks = p2.supportTasks;
			v2.connections = p2.connections;
			return v2;
		end;
		if l__type__5 == "SetAllSupportTasks" then
			v2.supportTasks = p2.supportTasks;
			return v2;
		end;
		if l__type__5 == "SetAllConnections" then
			v2.connections = p2.connections;
			return v2;
		end;
		if l__type__5 == "SetSomeSupportTasks" then
			for v6, v7 in ipairs(u2.keys(p2.supportTasks)) do
				v2.supportTasks[v7] = p2.supportTasks[v7];
			end;
			return v2;
		end;
		if l__type__5 ~= "SetSomeConnections" then
			if l__type__5 == "SetDiscordValidated" then
				v2.connections.discord.validated = p2.validated;
				return v2;
			else
				return v2;
			end;
		end;
		for v8, v9 in ipairs(u2.keys(p2.connections)) do
			v2.connections[v9] = p2.connections[v9];
		end;
		return v2;
	end
};
