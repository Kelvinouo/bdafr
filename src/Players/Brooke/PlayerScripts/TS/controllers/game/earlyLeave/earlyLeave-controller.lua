-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__KnitController__2 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v3 = setmetatable({}, {
	__tostring = function()
		return "EarlyLeaveController";
	end, 
	__index = l__KnitController__2
});
v3.__index = v3;
local u1 = v3;
function u1.new(...)
	local v4 = setmetatable({}, u1);
	return v4:constructor(...) and v4;
end;
function u1.constructor(p1)
	l__KnitController__2.constructor(p1);
	p1.Name = "EarlyLeaveController";
end;
local l__default__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local l__ClientStore__3 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
function u1.KnitStart(p2)
	l__default__2.Client:WaitFor("RemoteName"):andThen(function(p3)
		p3:Connect(function(p4)
			print("early leave for", p4.player.userId);
			l__ClientStore__3:dispatch({
				type = "GameSetEarlyLeaves", 
				userId = p4.player.userId, 
				earlyLeaveData = {
					earlyLeave = true, 
					time = p4.time
				}
			});
			l__ClientStore__3:dispatch({
				type = "BedwarsSetFinalDeaths", 
				userId = p4.player.userId, 
				dead = true
			});
		end);
	end);
end;
u1 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient.CreateController;
u1 = u1(u1.new());
return nil;
