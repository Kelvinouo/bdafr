-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__starterHostPanelSettings__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").starterHostPanelSettings;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	CustomMatchReducer = function(p1, p2)
		if p1 == nil then
			p1 = l__starterHostPanelSettings__1;
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
			return p2.settings;
		end;
		if p2.type == "CustomMatchUpdateSome" then
			local v2 = u2.deepCopy(p1);
			for v3, v4 in ipairs(u2.keys(p2.settings)) do
				v2[v4] = p2.settings[v4];
			end;
			return v2;
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
