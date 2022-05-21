-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__QuestProgressApp__2 = v1.import(script, script.Parent, "quest-progress-app").QuestProgressApp;
local u3 = v1.import(script, script.Parent, "quest-progress-notification").QuestProgressNotification;
return function(p1)
	local u4 = u1.mount(u1.createElement("ScreenGui", {}, { u1.createElement(l__QuestProgressApp__2, {}, { u1.createElement(u3, {
				ItemName = "Easter Egg 2022", 
				CurrentAmount = 5, 
				GoalAmount = 50
			}), u1.createElement(u3, {
				ItemName = "Easter Egg 2023", 
				CurrentAmount = 13, 
				GoalAmount = 50
			}) }) }), p1);
	return function()
		return u1.unmount(u4);
	end;
end;
