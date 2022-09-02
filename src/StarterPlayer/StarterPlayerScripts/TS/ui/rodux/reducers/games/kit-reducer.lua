-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	barbarianRage = 0, 
	wizardAbility = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-ability-type").WizardAbilityType.LightningStrike, 
	iceQueenProgress = 0, 
	canUseYetiAbilityNext = math.huge, 
	lumenProgress = 0, 
	emberProgress = 0, 
	pigsyResources = {
		coin = 0
	}
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
		if l__type__1 == "KitBountyHunterSetTarget" then
			local v8 = {};
			for v9, v10 in pairs(p1) do
				v8[v9] = v10;
			end;
			v8.bountyHunterTarget = p2.bountyHunterTarget;
			return v8;
		end;
		if l__type__1 == "KitAngelIncrementProgress" then
			local v11 = {};
			for v12, v13 in pairs(p1) do
				v11[v12] = v13;
			end;
			local v14 = p1.angelProgress;
			if v14 == nil then
				v14 = 0;
			end;
			v11.angelProgress = v14 + p2.progress;
			return v11;
		end;
		if l__type__1 == "KitIceQueenSetProgress" then
			local v15 = {};
			for v16, v17 in pairs(p1) do
				v15[v16] = v17;
			end;
			v15.iceQueenProgress = p2.progress;
			return v15;
		end;
		if l__type__1 == "KitYetiSetWhenCanUseAbility" then
			local v18 = {};
			for v19, v20 in pairs(p1) do
				v18[v19] = v20;
			end;
			v18.canUseYetiAbilityNext = p2.when;
			return v18;
		end;
		if l__type__1 == "KitLumenIncrementProgress" then
			local v21 = {};
			for v22, v23 in pairs(p1) do
				v21[v22] = v23;
			end;
			local v24 = p1.lumenProgress;
			if v24 == nil then
				v24 = 0;
			end;
			v21.lumenProgress = v24 + p2.progress;
			return v21;
		end;
		if l__type__1 ~= "KitEmberIncrementProgress" then
			if l__type__1 == "KitPigsyIncrementResource" then
				local v25 = {};
				for v26, v27 in pairs(p1) do
					v25[v26] = v27;
				end;
				v25.pigsyResources = p2.progress;
				return v25;
			else
				return p1;
			end;
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
