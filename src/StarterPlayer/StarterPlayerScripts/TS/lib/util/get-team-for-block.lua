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
		local l__teams__3 = l__ClientStore__2:getState().Game.teams;
		local function v4(p2)
			local v5 = v2.Team;
			if v5 ~= nil then
				v5 = v5.Name;
			end;
			return p2.name == v5;
		end;
		local v6 = nil;
		for v7, v8 in ipairs(l__teams__3) do
			if v4(v8, v7 - 1, l__teams__3) == true then
				v6 = v8;
				break;
			end;
		end;
		return v6;
	end
};
