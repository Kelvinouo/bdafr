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
				v11(v12, v13);
				if not v11 then
					break;
				end;
				local v14 = false;
				if v12.id ~= l__VendingMachineRewardId__5.NONE then
					v14 = not v12.disabled;
				end;
				if v14 == true then
					v10 = v10 + 1;
					v9[v10] = v12;
				end;			
			end;
			table.insert(v6, (u1.createElement(l__CarouselReward__6, {
				totalRewardCount = 10, 
				rewardId = v9[v7 % #v9 + 1].id, 
				Position = UDim2.fromScale(v7 - 5, 0.5)
			})));		
		end;
		local v15 = {
			Size = UDim2.fromScale(1, 1), 
			Position = UDim2.fromScale(0, 0)
		};
		local v16 = {};
		local v17 = #v16;
		local v18, v19, v20 = ipairs(v3);
		while true do
			v18(v19, v20);
			if not v18 then
				break;
			end;
			v20 = v18;
			v16[v17 + v18] = v19;		
		end;
		local v21 = {
			Size = UDim2.fromScale(1, 0.45), 
			BorderSizePixel = 0, 
			Position = UDim2.fromScale(0.5, 0.47), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v22 = { u1.createElement("UIGradient", {
				Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)), 
				Transparency = NumberSequence.new(0.6, 0.35), 
				Rotation = 90
			}) };
		local v23 = {
			Size = UDim2.fromScale(1, 1), 
			SizeConstraint = "RelativeYY", 
			Position = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5)
		};
		local v24 = {};
		local v25 = #v24;
		local v26, v27, v28 = ipairs(v6);
		while true do
			v26(v27, v28);
			if not v26 then
				break;
			end;
			v28 = v26;
			v24[v25 + v26] = v27;		
		end;
		v22[#v22 + 1] = u1.createElement(l__Empty__7, v23, v24);
		v16[#v16 + 1] = u1.createElement("Frame", v21, v22);
		return u1.createElement(l__Empty__7, v15, v16);
	end)
};
