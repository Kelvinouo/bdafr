-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	eventData = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "game-event-utils").GameEventUtil.makeStarterEventData(), 
	currencyGuiLocations = {}
};
return {
	EventReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "SetEventDataAll" then
			local v1 = {};
			for v2, v3 in pairs(p1) do
				v1[v2] = v3;
			end;
			v1.eventData = p2.eventData;
			return v1;
		end;
		if p2.type ~= "SetEventDataSome" then
			if p2.type == "SetEventPartial" then
				local v4 = {};
				for v5, v6 in pairs(p1) do
					v4[v5] = v6;
				end;
				for v7, v8 in pairs(p2.data) do
					v4[v7] = v8;
				end;
				return v4;
			else
				return p1;
			end;
		end;
		local v9 = {};
		for v10, v11 in pairs(p1) do
			v9[v10] = v11;
		end;
		local v12 = {};
		for v13, v14 in pairs(p1.eventData) do
			v12[v13] = v14;
		end;
		for v15, v16 in pairs(p2.eventData) do
			v12[v15] = v16;
		end;
		v9.eventData = v12;
		return v9;
	end
};
