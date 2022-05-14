-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineFloater__2 = v1.import(script, script.Parent.Parent, "vending-machine-floater").VendingMachineFloater;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__VendingMachineRewardId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local l__CarouselReward__5 = v1.import(script, script.Parent, "carousel-reward").CarouselReward;
local l__Empty__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	VendingMachineIdle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {};
		local v4 = 0;
		local v5 = false;
		while true do
			if v5 then
				v4 = v4 + 1;
			else
				v5 = true;
			end;
			if not (v4 < 4) then
				break;
			end;
			table.insert(v3, (u1.createElement(l__VendingMachineFloater__2)));		
		end;
		local v6 = {};
		local v7 = 0;
		local v8 = false;
		while true do
			if v8 then
				v7 = v7 + 1;
			else
				v8 = true;
			end;
			if not (v7 < 10) then
				break;
			end;
			table.insert(v6, (u1.createElement(l__CarouselReward__5, {
				totalRewardCount = 10, 
				rewardId = v7 % (#u3.values(l__VendingMachineRewardId__4) - 1) + 1, 
				Position = UDim2.fromScale(v7 - 5, 0.5)
			})));		
		end;
		local v9 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, 0)
		};
		local v10 = {};
		local v11 = #v10;
		for v12, v13 in ipairs(v3) do
			v10[v11 + v12] = v13;
		end;
		local v14 = {
			Size = UDim2.fromScale(1, 0.45), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, 0.47), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v15 = { u1.createElement("UIGradient", {
				Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)), 
				Transparency = NumberSequence.new(0.6, 0.35), 
				Rotation = 90
			}) };
		local v16 = {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v17 = {};
		local v18 = #v17;
		for v19, v20 in ipairs(v6) do
			v17[v18 + v19] = v20;
		end;
		v15[#v15 + 1] = u1.createElement(l__Empty__6, v16, v17);
		v10[#v10 + 1] = u1.createElement("Frame", v14, v15);
		return u1.createElement(l__Empty__6, v9, v10);
	end)
};
