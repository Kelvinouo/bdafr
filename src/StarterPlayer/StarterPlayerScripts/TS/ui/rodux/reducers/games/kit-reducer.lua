-- Script Hash: 56f1097e342239deccff83a1786e6c80eb6f01d91c4b52fdc605d8ce05b08116e16674c3f1e8473ec81f79f392cc11ad
-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	barbarianRage = 0, 
	engineerSelectedTurret = nil, 
	wizardAbility = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-ability-type").WizardAbilityType.LightningStrike, 
	iceQueenProgress = 0, 
	canUseYetiAbilityNext = math.huge, 
	lumenProgress = 0, 
	emberProgress = 0
};
return {
	KitReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		local l__type__1 = p2.type;
		if l__type__1 == "KitBarbarianSetRage" then
			local v2 = {};
			for v3, v4 in pairs(p1) do
				v2[v3] = v4;
			end;
			v2.barbarianRage = p2.rage;
			return v2;
		end;
		if l__type__1 == "KitWizardSetAbility" then
			local v5 = {};
			for v6, v7 in pairs(p1) do
				v5[v6] = v7;
			end;
			v5.wizardAbility = p2.ability;
			return v5;
		end;
		if l__type__1 == "KitEngineerSetTurret" then
			local v8 = {};
			for v9, v10 in pairs(p1) do
				v8[v9] = v10;
			end;
			v8.engineerSelectedTurret = p2.selectedTurret;
			return v8;
		end;
		if l__type__1 == "KitBountyHunterSetTarget" then
			local v11 = {};
			for v12, v13 in pairs(p1) do
				v11[v12] = v13;
			end;
			v11.bountyHunterTarget = p2.bountyHunterTarget;
			return v11;
		end;
		if l__type__1 == "KitAngelIncrementProgress" then
			local v14 = {};
			for v15, v16 in pairs(p1) do
				v14[v15] = v16;
			end;
			local v17 = p1.angelProgress;
			if v17 == nil then
				v17 = 0;
			end;
			v14.angelProgress = v17 + p2.progress;
			return v14;
		end;
		if l__type__1 == "KitIceQueenSetProgress" then
			local v18 = {};
			for v19, v20 in pairs(p1) do
				v18[v19] = v20;
			end;
			v18.iceQueenProgress = p2.progress;
			return v18;
		end;
		if l__type__1 == "KitYetiSetWhenCanUseAbility" then
			local v21 = {};
			for v22, v23 in pairs(p1) do
				v21[v22] = v23;
			end;
			v21.canUseYetiAbilityNext = p2.when;
			return v21;
		end;
		if l__type__1 == "KitLumenIncrementProgress" then
			local v24 = {};
			for v25, v26 in pairs(p1) do
				v24[v25] = v26;
			end;
			local v27 = p1.lumenProgress;
			if v27 == nil then
				v27 = 0;
			end;
			v24.lumenProgress = v27 + p2.progress;
			return v24;
		end;
		if l__type__1 ~= "KitEmberIncrementProgress" then
			return p1;
		end;
		local v28 = {};
		for v29, v30 in pairs(p1) do
			v28[v29] = v30;
		end;
		local v31 = p1.emberProgress;
		if v31 == nil then
			v31 = 0;
		end;
		v28.emberProgress = v31 + p2.progress;
		return v28;
	end
};
