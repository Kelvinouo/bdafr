-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
for v3, v4 in pairs(v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").starterHostPanelSettings) do
	v2[v3] = v4;
end;
v2.mapSaves = {};
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	CustomMatchReducer = function(p1, p2)
		if p1 == nil then
			p1 = v2;
		end;
		if p2.type == "CustomMatchSetMapSaves" then
			p1.mapSaves = p2.mapSaves;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateKit" then
			p1.disabledKits[p2.kit] = p2.value;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateAllKits" then
			p1.disabledKits = p2.disabledKits;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateAll" then
			local v5 = {};
			for v6, v7 in pairs(p1) do
				v5[v6] = v7;
			end;
			for v8, v9 in pairs(p2.settings) do
				v5[v8] = v9;
			end;
			return v5;
		end;
		if p2.type == "CustomMatchUpdateSome" then
			local v10 = u1.deepCopy(p1);
			local v11, v12, v13 = ipairs(u1.keys(p2.settings));
			while true do
				v11(v12, v13);
				if not v11 then
					break;
				end;
				v13 = v11;
				v10[v12] = p2.settings[v12];			
			end;
			return v10;
		end;
		if p2.type == "CustomMatchUpdateItem" then
			p1.disabledItems[p2.item] = p2.value;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateAllItems" then
			p1.disabledItems = p2.disabledItems;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateGlobalOreGen" then
			p1.globalGenerators[p2.itemType] = p2.multiplier;
			return p1;
		end;
		if p2.type == "CustomMatchUpdateTeamOreGen" then
			p1.teamGenerators[p2.teamDisplayName] = p2.genSpeedMultiplier;
			return p1;
		end;
		if p2.type ~= "CustomMatchUpdateGeneralToggle" then
			return p1;
		end;
		p1.generalToggles[p2.toggle] = p2.value;
		return p1;
	end
};
