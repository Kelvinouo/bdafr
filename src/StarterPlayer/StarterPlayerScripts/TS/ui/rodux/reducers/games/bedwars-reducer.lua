-- Script Hash: afb1edc9737e0cc734e8fdc64cb192d0e81999b8bf09adf52666587fedbc3d8eab9f6f0d64607a7de160b0c1b8ab9c10
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = {
	kills = {}, 
	bedBreaks = {}, 
	finalDeaths = {}, 
	kits = {}, 
	othersUsingKitSkin = {}, 
	teamBedAlive = {}, 
	itemTiersPurchased = {}, 
	teamUpgrades = {}, 
	kit = nil, 
	equippedKitSkins = nil, 
	ownedKits = {}, 
	ownedKitSkins = {}, 
	useKitSkin = true
};
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	BedwarsReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "BedwarsSetKills" then
			local v2 = {};
			for v3, v4 in pairs(p1) do
				v2[v3] = v4;
			end;
			local v5 = {};
			for v6, v7 in pairs(p1.kills) do
				v5[v6] = v7;
			end;
			v5[p2.userId] = p2.kills;
			v2.kills = v5;
			return v2;
		end;
		if p2.type == "BedwarsIncrementKills" then
			local v8 = p1.kills[p2.userId];
			if v8 ~= 0 and v8 == v8 and v8 then
				local l__kills__9 = p1.kills;
				local l__userId__10 = p2.userId;
				l__kills__9[l__userId__10] = l__kills__9[l__userId__10] + 1;
				return p1;
			else
				local v11 = {};
				for v12, v13 in pairs(p1) do
					v11[v12] = v13;
				end;
				local v14 = {};
				for v15, v16 in pairs(p1.kills) do
					v14[v15] = v16;
				end;
				v14[p2.userId] = 1;
				v11.kills = v14;
				return v11;
			end;
		end;
		if p2.type == "BedwarsSetBedBreaks" then
			local l__userId__17 = p2.userId;
			if l__userId__17 ~= 0 and l__userId__17 == l__userId__17 and l__userId__17 then
				local v18 = p1.bedBreaks[p2.userId];
				if v18 ~= 0 and v18 == v18 and v18 then
					local l__bedBreaks__19 = p1.bedBreaks;
					local l__userId__20 = p2.userId;
					l__bedBreaks__19[l__userId__20] = l__bedBreaks__19[l__userId__20] + 1;
					local v21 = {};
					for v22, v23 in pairs(p1) do
						v21[v22] = v23;
					end;
					return v21;
				else
					local v24 = {};
					for v25, v26 in pairs(p1) do
						v24[v25] = v26;
					end;
					local v27 = {};
					for v28, v29 in pairs(p1.bedBreaks) do
						v27[v28] = v29;
					end;
					v27[p2.userId] = 1;
					v24.bedBreaks = v27;
					return v24;
				end;
			end;
		end;
		if p2.type == "BedwarsSetFinalDeaths" then
			local v30 = {};
			for v31, v32 in pairs(p1) do
				v30[v31] = v32;
			end;
			local v33 = {};
			for v34, v35 in pairs(p1.finalDeaths) do
				v33[v34] = v35;
			end;
			v33[p2.userId] = p2.dead;
			v30.finalDeaths = v33;
			return v30;
		end;
		if p2.type == "BedwarsSetKits" then
			local v36 = {};
			for v37, v38 in pairs(p1) do
				v36[v37] = v38;
			end;
			local v39 = {};
			for v40, v41 in pairs(p1.kits) do
				v39[v40] = v41;
			end;
			v39[p2.userId] = p2.kit;
			v36.kits = v39;
			return v36;
		end;
		if p2.type == "BedwarsSetOtherUsingKitSkin" then
			local v42 = {};
			for v43, v44 in pairs(p1) do
				v42[v43] = v44;
			end;
			local v45 = {};
			for v46, v47 in pairs(p1.othersUsingKitSkin) do
				v45[v46] = v47;
			end;
			v45[p2.userId] = p2.usingKitSkin;
			v42.othersUsingKitSkin = v45;
			return v42;
		end;
		if p2.type == "BedwarsSetBedAlive" then
			local v48 = {};
			for v49, v50 in pairs(p1) do
				v48[v49] = v50;
			end;
			local v51 = {};
			for v52, v53 in pairs(p1.teamBedAlive) do
				v51[v52] = v53;
			end;
			v51[p2.teamId] = p2.alive;
			v48.teamBedAlive = v51;
			return v48;
		end;
		if p2.type == "BedwarsSetBedAliveSuddenDeath" then
			print("Reducer: Before", p1.teamBedAlive);
			local v54 = u2.keys(p1.teamBedAlive);
			local u3 = {};
			local function v55(p3)
				u3[p3] = false;
				return u3[p3];
			end;
			for v56, v57 in ipairs(v54) do
				v55(v57, v56 - 1, v54);
			end;
			print("Reducer: After", p1.teamBedAlive);
			local v58 = {};
			for v59, v60 in pairs(p1) do
				v58[v59] = v60;
			end;
			v58.teamBedAlive = u3;
			return v58;
		end;
		if p2.type == "BedwarsAddItemPurchased" then
			local v61 = {};
			for v62, v63 in pairs(p1) do
				v61[v62] = v63;
			end;
			local v64 = {};
			local v65 = #v64;
			local l__itemTiersPurchased__66 = p1.itemTiersPurchased;
			local v67 = #l__itemTiersPurchased__66;
			table.move(l__itemTiersPurchased__66, 1, v67, v65 + 1, v64);
			v64[v65 + v67 + 1] = p2.itemType;
			v61.itemTiersPurchased = v64;
			return v61;
		end;
		if p2.type == "BedwarsSetTeamUpgradeTier" then
			local v68 = {};
			for v69, v70 in pairs(p1) do
				v68[v69] = v70;
			end;
			local v71 = {};
			for v72, v73 in pairs(p1.teamUpgrades) do
				v71[v72] = v73;
			end;
			if p2.tier > -1 then
				local v74 = p2.tier;
			else
				v74 = nil;
			end;
			v71[p2.upgradeId] = v74;
			v68.teamUpgrades = v71;
			return v68;
		end;
		if p2.type == "BedwarsSetAllTeamUpgrades" then
			local v75 = {};
			for v76, v77 in pairs(p1) do
				v75[v76] = v77;
			end;
			v75.teamUpgrades = p2.teamUpgrades;
			return v75;
		end;
		if p2.type == "SetBedwarsKit" then
			local v78 = {};
			for v79, v80 in pairs(p1) do
				v78[v79] = v80;
			end;
			v78.kit = p2.kit;
			return v78;
		end;
		if p2.type == "AddOwnedKits" then
			local v81 = {};
			for v82, v83 in pairs(p1) do
				v81[v82] = v83;
			end;
			local v84 = {};
			local v85 = #v84;
			local l__ownedKits__86 = p1.ownedKits;
			local v87 = #l__ownedKits__86;
			table.move(l__ownedKits__86, 1, v87, v85 + 1, v84);
			local l__kits__88 = p2.kits;
			table.move(l__kits__88, 1, #l__kits__88, v85 + v87 + 1, v84);
			v81.ownedKits = v84;
			return v81;
		end;
		if p2.type == "SetOwnedKitSkins" then
			local v89 = {};
			for v90, v91 in pairs(p1) do
				v89[v90] = v91;
			end;
			v89.ownedKitSkins = p2.ownedKitSkins;
			return v89;
		end;
		if p2.type == "SetUseKitSkin" then
			local v92 = {};
			for v93, v94 in pairs(p1) do
				v92[v93] = v94;
			end;
			v92.useKitSkin = p2.useKitSkin;
			return v92;
		end;
		if p2.type == "SetEquippedKitSkins" then
			local v95 = {};
			for v96, v97 in pairs(p1) do
				v95[v96] = v97;
			end;
			v95.equippedKitSkins = p2.equippedKitSkins;
			return v95;
		end;
		if p2.type ~= "EquipKitSkin" then
			return p1;
		end;
		local v98 = {};
		for v99, v100 in pairs(p1) do
			v98[v99] = v100;
		end;
		local v101 = {};
		for v102, v103 in pairs(p1.equippedKitSkins) do
			v101[v102] = v103;
		end;
		v101[p2.kit] = p2.kitSkin;
		v98.equippedKitSkins = v101;
		return v98;
	end
};
