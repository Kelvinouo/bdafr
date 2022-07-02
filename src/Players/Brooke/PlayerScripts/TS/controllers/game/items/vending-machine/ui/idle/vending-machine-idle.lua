-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__VendingMachineFloater__2 = v1.import(script, script.Parent.Parent, "vending-machine-floater").VendingMachineFloater;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__VendingMachineRewardMeta__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local l__VendingMachineRewardId__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local l__CarouselReward__6 = v1.import(script, script.Parent, "carousel-reward").CarouselReward;
local l__Empty__7 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
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
			local v9 = {};
			local v10 = 0;
			local v11, v12, v13 = ipairs((u3.values(l__VendingMachineRewardMeta__4)));
			while true do
				local v14, v15 = v11(v12, v13);
				if not v14 then
					break;
				end;
				local v16 = false;
				if v15.id ~= l__VendingMachineRewardId__5.NONE then
					v16 = not v15.disabled;
				end;
				if v16 == true then
					v10 = v10 + 1;
					v9[v10] = v15;
				end;			
			end;
			table.insert(v6, (u1.createElement(l__CarouselReward__6, {
				totalRewardCount = 10, 
				rewardId = v9[v7 % #v9 + 1].id, 
				Position = UDim2.fromScale(v7 - 5, 0.5)
			})));		
		end;
		local v17 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, 0)
		};
		local v18 = {};
		local v19 = #v18;
		for v20, v21 in ipairs(v3) do
			v18[v19 + v20] = v21;
		end;
		local v22 = {
			Size = UDim2.fromScale(1, 0.45), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, 0.47), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v23 = { u1.createElement("UIGradient", {
				Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)), 
				Transparency = NumberSequence.new(0.6, 0.35), 
				Rotation = 90
			}) };
		local v24 = {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v25 = {};
		local v26 = #v25;
		for v27, v28 in ipairs(v6) do
			v25[v26 + v27] = v28;
		end;
		v23[#v23 + 1] = u1.createElement(l__Empty__7, v24, v25);
		v18[#v18 + 1] = u1.createElement("Frame", v22, v23);
		return u1.createElement(l__Empty__7, v17, v18);
	end)
};
