-- Script Hash: f0217c67165c79827185e44a30c18d2c9c4478b86067fee83feb8e22019396c0bffc6c85328122b08bf0dc87ba8c2c75
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ClientStore__1 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local l__CreateRoduxApp__2 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local l__PostGameApp__3 = v1.import(script, script.Parent, "postgame-app").PostGameApp;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return function(p1)
	l__ClientStore__1:dispatch({
		type = "BedwarsSetMatchExperienceEarned", 
		matchExperienceEarned = {
			startingExperience = 3100, 
			totalExperienceEarned = 2100, 
			reasons = { {
					experience = 900, 
					name = "Victory"
				}, {
					experience = 200, 
					name = "Game Finish"
				}, {
					experience = 2000, 
					name = "Battle Pass XP Bonus"
				}, {
					experience = 8000, 
					name = "Battle Pass XP Bonus"
				} }
		}
	});
	l__ClientStore__1:dispatch({
		type = "BattlePassUpdateAll", 
		battlePass = {
			paid = true, 
			timePaid = 1, 
			experience = 3100
		}
	});
	local u5 = l__CreateRoduxApp__2("PostGame", l__PostGameApp__3, {
		NewLeaderboardPos = 12673, 
		PreviousLeaderboardPos = 63864
	}, {}, {
		Parent = p1
	});
	return function()
		u4.unmount(u5);
	end;
end;
