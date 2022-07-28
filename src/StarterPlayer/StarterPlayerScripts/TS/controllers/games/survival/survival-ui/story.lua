-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__Workspace__1 = v2.Workspace;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SurvivalUi__3 = v1.import(script, script.Parent, "survival-ui").SurvivalUi;
local l__RunService__4 = v2.RunService;
return function(p1)
	local v3 = l__Workspace__1:GetServerTimeNow() + 30;
	local v4 = u2.mount(u2.createElement(l__SurvivalUi__3, {
		health = 100, 
		maxHealth = 100, 
		waveCount = 10, 
		endTime = v3, 
		state = 1
	}), p1);
	local u5 = 0;
	local u6 = os.clock() + 12;
	local u7 = 100;
	local u8 = v4;
	local u9 = l__RunService__4.Heartbeat:Connect(function()
		if os.clock() - u5 > 0.2 and os.clock() < u6 then
			u5 = os.clock();
			u7 = u7 - 2;
			u8 = u2.update(u8, u2.createElement(l__SurvivalUi__3, {
				health = u7, 
				maxHealth = 100, 
				waveCount = 10, 
				endTime = v3, 
				state = 1
			}));
		end;
	end);
	return function()
		u9:Disconnect();
		u2.unmount(u8);
	end;
end;
