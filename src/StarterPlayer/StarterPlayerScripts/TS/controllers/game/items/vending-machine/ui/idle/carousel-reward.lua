-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__VendingMachineRewardMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local l__ItemViewport__4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
return {
	CarouselReward = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u5 = u1.createRef();
		p2.useEffect(function()
			local u6 = true;
			task.spawn(function()
				local v3 = u5:getValue();
				if v3 == nil then
					return nil;
				end;
				local v4 = l__TweenService__2:Create(v3, TweenInfo.new((p1.Position.X.Scale + p1.totalRewardCount / 2) * 2, Enum.EasingStyle.Linear), {
					Position = UDim2.fromScale(-p1.totalRewardCount / 2, 0.5)
				});
				v4:Play();
				v4.Completed:Wait();
				while u6 do
					local v5 = u5:getValue();
					if v5 == nil then
						return nil;
					end;
					v5.Position = UDim2.fromScale(p1.totalRewardCount / 2, 0.5);
					(function()
						local v6 = l__TweenService__2:Create(v5, TweenInfo.new(2 * p1.totalRewardCount, Enum.EasingStyle.Linear), {
							Position = UDim2.fromScale(-p1.totalRewardCount / 2, 0.5)
						});
						v6:Play();
						v6.Completed:Wait();
					end)();				
				end;
			end);
			return function()
				u6 = false;
			end;
		end, {});
		local u7 = l__VendingMachineRewardMeta__3[p1.rewardId];
		return p2.useMemo(function()
			local v7 = {};
			local v8 = false;
			if u7.item ~= nil then
				v8 = u1.createElement(l__ItemViewport__4, {
					Size = UDim2.fromScale(0.85, 0.85), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					ImageTransparency = 0, 
					ItemType = u7.item.itemType
				});
			end;
			if v8 then
				v7[#v7 + 1] = v8;
			end;
			local v9 = false;
			if u7.custom ~= nil then
				v9 = u1.createElement("ImageLabel", {
					Image = u7.custom.image, 
					BorderSizePixel = 0, 
					Size = UDim2.fromScale(0.85, 0.85), 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					BackgroundTransparency = 1, 
					ImageTransparency = 0
				});
			end;
			if v9 then
				v7[#v7 + 1] = v9;
			end;
			return u1.createElement("Frame", {
				[u1.Ref] = u5, 
				Position = p1.Position, 
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, v7);
		end);
	end)
};
