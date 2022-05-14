-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineState__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local l__VendingMachineIdle__3 = v1.import(script, script.Parent, "idle", "vending-machine-idle").VendingMachineIdle;
local l__VendingMachineRoll__4 = v1.import(script, script.Parent, "roll", "vending-machine-roll").VendingMachineRoll;
return {
	VendingMachineApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u5 = u1.createRef();
		p2.useEffect(function()
			local u6 = true;
			task.spawn(function()
				while u6 do
					local v3 = u5:getValue();
					if not v3 then
						return nil;
					end;
					v3.Position = UDim2.fromScale(0.5 + math.random() * 0.05, 0.5 + math.random() * 0.05);
					task.delay(0.01, function()
						if u6 then
							v3.Position = UDim2.fromScale(0.5, 0.5);
						end;
					end);
					task.wait(math.random(20, 150) / 100);				
				end;
			end);
			return function()
				u6 = false;
			end;
		end, {});
		local v4 = { u1.createElement("UIGradient", {
				Color = ColorSequence.new(Color3.fromHex("D730F2"), Color3.fromHex("C167E3")), 
				Rotation = 90
			}), u1.createElement("ImageLabel", {
				[u1.Ref] = u5, 
				Image = "rbxassetid://9111090691", 
				Size = UDim2.fromScale(1.5, 1.5), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				ImageTransparency = 0.7, 
				BackgroundTransparency = 1
			}) };
		local v5 = false;
		if p1.vendingMachineState == l__VendingMachineState__2.IDLE then
			v5 = u1.createElement(l__VendingMachineIdle__3);
		end;
		if v5 then
			v4[#v4 + 1] = v5;
		end;
		local v6 = false;
		if p1.vendingMachineState == l__VendingMachineState__2.ROLLING then
			v6 = u1.createElement(l__VendingMachineRoll__4, {
				choosenReward = p1.choosenReward, 
				soundPosition = p1.soundPosition, 
				dispenseTime = p1.dispenseTime
			});
		end;
		if v6 then
			v4[#v4 + 1] = v6;
		end;
		return u1.createElement("Frame", {
			Size = UDim2.fromScale(1, 1), 
			BorderSizePixel = 0, 
			ClipsDescendants = true
		}, v4);
	end)
};
