
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = {
	mobileShiftLock = false, 
	backgroundMusicVolume = 0
};
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
return {
	SettingsReducer = function(p1, p2)
		if p1 == nil then
			p1 = u1;
		end;
		if p2.type == "SettingsUpdateAll" then
			return p2.settings;
		end;
		if p2.type ~= "SettingsUpdateSome" then
			return p1;
		end;
		local v2 = u2.deepCopy(p1);
		for v3, v4 in ipairs(u2.keys(p2.settings)) do
			v2[v4] = p2.settings[v4];
		end;
		return v2;
	end
};

