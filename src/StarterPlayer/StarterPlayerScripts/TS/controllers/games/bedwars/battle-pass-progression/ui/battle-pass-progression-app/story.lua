-- Script Hash: 53b4cf7e773d29560ec3c40b2a59390d61e774f6a06f021cc20ba30d4b30b4ee7d749f398edeed029bb76fb258ac87b2
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local u3 = v1.import(script, script.Parent, "battle-pass-progession-app").BattlePassProgressionAppWrapper;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	local v2 = {
		startingExperience = 20000, 
		totalExperienceEarned = 850, 
		reasons = { {
				experience = 500, 
				name = "Victory"
			}, {
				experience = 150, 
				name = "Game Finish"
			}, {
				experience = 200, 
				name = "Battle Pass XP Bonus"
			} }
	};
	l__ClientStore__1:dispatch({
		type = "BedwarsSetMatchExperienceEarned", 
		matchExperienceEarned = v2
	});
	l__ClientStore__1:dispatch({
		type = "BattlePassUpdateAll", 
		battlePass = {
			paid = true, 
			timePaid = 1, 
			experience = 20000
		}
	});
	local u5 = l__CreateRoduxApp__2("BattlePassProgressionApp", u3, {
		MatchExperienceEarned = v2
	}, {}, {
		Parent = p1
	});
	return function()
		u4.unmount(u5);
	end;
end;
