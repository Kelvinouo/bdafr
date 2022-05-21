-- Script Hash: dc2c5103952585f46854cdf34d895c435937061ae3aae1ad6e2ec9e076f2b7da2d05bfca0a1e09db7dc1d185e22b8b18
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__VendingMachineState__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local l__VendingMachineRewardId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineApp__4 = v1.import(script, script.Parent, "ui", "vending-machine-app").VendingMachineApp;
local l__Workspace__5 = v1.import(script, v1.getModule(script, "@rbxts", "services")).Workspace;
local l__Empty__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
	local l__useState__2 = p2.useState;
	local v3, v4 = l__useState__2(l__VendingMachineState__1.IDLE);
	local v5, v6 = l__useState__2(l__VendingMachineRewardId__2.DODO_BIRD);
	p2.useEffect(function()
		local u8 = true;
		return function()
			u8 = false;
		end;
	end);
	return u3.createElement(l__VendingMachineApp__4, {
		vendingMachineState = v3, 
		choosenReward = v5, 
		dispenseTime = l__Workspace__5:GetServerTimeNow() + 4
	});
end);
return function(p3)
	local u9 = u3.mount(u3.createElement(l__Empty__6, {
		Size = UDim2.fromScale(0.8, 0.8)
	}, { u3.createElement("UIAspectRatioConstraint", {
			AspectRatio = 0.7727110794442466
		}), u3.createElement(u7) }), p3);
	return function()
		u3.unmount(u9);
	end;
end;
