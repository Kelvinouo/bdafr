-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	experience = 0, 
	paid = false, 
	level = 1
};
local l__BattlePassUtils__2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
return {
	BattlePassReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "BattlePassUpdateAll" then
			local v1 = {};
			for v2, v3 in pairs(p1) do
				v1[v2] = v3;
			end;
			for v4, v5 in pairs(p2.battlePass) do
				v1[v4] = v5;
			end;
			v1.level = l__BattlePassUtils__2.getLevelFromExperience(p2.battlePass.experience);
			return v1;
		end;
		if p2.type ~= "BattlePassSetXP" then
			if p2.type == "BattlePassSetPaid" then
				local v6 = {};
				for v7, v8 in pairs(p1) do
					v6[v7] = v8;
				end;
				v6.paid = p2.paid;
				return v6;
			else
				return p1;
			end;
		end;
		local v9 = {};
		for v10, v11 in pairs(p1) do
			v9[v10] = v11;
		end;
		v9.experience = p2.experience;
		v9.level = l__BattlePassUtils__2.getLevelFromExperience(p2.experience);
		return v9;
	end
};
