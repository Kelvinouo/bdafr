-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Players__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Players;
local l__ClientStore__2 = v1.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
return {
	default = function(p1)
		local v2 = l__Players__1:GetPlayerByUserId((p1:GetAttribute("PlacedByUserId")));
		if v2 == nil then
			return nil;
		end;
		local v3 = nil;
		local v4, v5, v6 = ipairs(l__ClientStore__2:getState().Game.teams);
		while true do
			v4(v5, v6);
			if not v4 then
				break;
			end;
			local v7 = v2.Team;
			if v7 ~= nil then
				v7 = v7.Name;
			end;
			if v5.name == v7 == true then
				v3 = v5;
				break;
			end;		
		end;
		return v3;
	end
};
