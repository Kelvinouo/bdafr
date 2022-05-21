-- Script Hash: eb9917192364ba7492ee5b6528e98ab7c927dabea96777d34963726b2ddcf1db21f5b3b98fa9c1e46ac276b93428c930
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__Maid__1 = v1.import(script, v1.getModule(script, "@rbxts", "knit").src).Maid;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineApp__3 = v1.import(script, script.Parent, "vending-machine-app").VendingMachineApp;
return {
	VendingMachineAppWrapper = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3, v4 = l__useState__2(p1.vendingMachine:GetAttribute("VendingMachineState"));
		local v5, v6 = l__useState__2(p1.vendingMachine:GetAttribute("ChoosenReward"));
		local v7, v8 = l__useState__2(p1.vendingMachine:GetAttribute("VendingMachineDispenseTime"));
		p2.useEffect(function()
			local v9 = l__Maid__1.new();
			v9:GiveTask(p1.vendingMachine:GetAttributeChangedSignal("VendingMachineState"):Connect(function()
				v4(p1.vendingMachine:GetAttribute("VendingMachineState"));
			end));
			v9:GiveTask(p1.vendingMachine:GetAttributeChangedSignal("ChoosenReward"):Connect(function()
				v6(p1.vendingMachine:GetAttribute("ChoosenReward"));
			end));
			v9:GiveTask(p1.vendingMachine:GetAttributeChangedSignal("VendingMachineDispenseTime"):Connect(function()
				v8(p1.vendingMachine:GetAttribute("VendingMachineDispenseTime"));
			end));
			return function()
				v9:DoCleaning();
			end;
		end, {});
		return u2.createElement(l__VendingMachineApp__3, {
			vendingMachineState = v3, 
			choosenReward = v5, 
			soundPosition = p1.vendingMachine.Position, 
			dispenseTime = v7
		});
	end)
};
