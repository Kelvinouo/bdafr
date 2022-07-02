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
			local u3 = {};
			for v54, v55 in ipairs((u2.keys(p1.teamBedAlive))) do
				u3[v55] = false;
				local v56 = u3[v55];
			end;
			print("Reducer: After", p1.teamBedAlive);
			local v57 = {};
			for v58, v59 in pairs(p1) do
				v57[v58] = v59;
			end;
			v57.teamBedAlive = u3;
			return v57;
		end;
		if p2.type == "BedwarsAddItemPurchased" then
			local v60 = {};
			for v61, v62 in pairs(p1) do
				v60[v61] = v62;
			end;
			local v63 = {};
			local v64 = #v63;
			local l__itemTiersPurchased__65 = p1.itemTiersPurchased;
			local v66 = #l__itemTiersPurchased__65;
			table.move(l__itemTiersPurchased__65, 1, v66, v64 + 1, v63);
			v63[v64 + v66 + 1] = p2.itemType;
			v60.itemTiersPurchased = v63;
			return v60;
		end;
		if p2.type == "BedwarsSetTeamUpgradeTier" then
			local v67 = {};
			for v68, v69 in pairs(p1) do
				v67[v68] = v69;
			end;
			local v70 = {};
			for v71, v72 in pairs(p1.teamUpgrades) do
				v70[v71] = v72;
			end;
			if p2.tier > -1 then
				local v73 = p2.tier;
			else
				v73 = nil;
			end;
			v70[p2.upgradeId] = v73;
			v67.teamUpgrades = v70;
			return v67;
		end;
		if p2.type == "BedwarsSetAllTeamUpgrades" then
			local v74 = {};
			for v75, v76 in pairs(p1) do
				v74[v75] = v76;
			end;
			v74.teamUpgrades = p2.teamUpgrades;
			return v74;
		end;
		if p2.type == "SetBedwarsKit" then
			local v77 = {};
			for v78, v79 in pairs(p1) do
				v77[v78] = v79;
			end;
			v77.kit = p2.kit;
			return v77;
		end;
		if p2.type == "AddOwnedKits" then
			local v80 = {};
			for v81, v82 in pairs(p1) do
				v80[v81] = v82;
			end;
			local v83 = {};
			local v84 = #v83;
			local l__ownedKits__85 = p1.ownedKits;
			local v86 = #l__ownedKits__85;
			table.move(l__ownedKits__85, 1, v86, v84 + 1, v83);
			local l__kits__87 = p2.kits;
			table.move(l__kits__87, 1, #l__kits__87, v84 + v86 + 1, v83);
			v80.ownedKits = v83;
			return v80;
		end;
		if p2.type == "SetOwnedKitSkins" then
			local v88 = {};
			for v89, v90 in pairs(p1) do
				v88[v89] = v90;
			end;
			v88.ownedKitSkins = p2.ownedKitSkins;
			return v88;
		end;
		if p2.type == "SetUseKitSkin" then
			local v91 = {};
			for v92, v93 in pairs(p1) do
				v91[v92] = v93;
			end;
			v91.useKitSkin = p2.useKitSkin;
			return v91;
		end;
		if p2.type == "SetEquippedKitSkins" then
			local v94 = {};
			for v95, v96 in pairs(p1) do
				v94[v95] = v96;
			end;
			v94.equippedKitSkins = p2.equippedKitSkins;
			return v94;
		end;
		if p2.type ~= "EquipKitSkin" then
			return p1;
		end;
		local v97 = {};
		for v98, v99 in pairs(p1) do
			v97[v98] = v99;
		end;
		local v100 = {};
		for v101, v102 in pairs(p1.equippedKitSkins) do
			v100[v101] = v102;
		end;
		v100[p2.kit] = p2.kitSkin;
		v97.equippedKitSkins = v100;
		return v97;
	end
};
