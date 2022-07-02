-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__VendingMachineRewardMeta__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local l__VendingMachineRewardId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local l__RandomUtil__5 = v2.RandomUtil;
local l__Workspace__6 = v3.Workspace;
local l__SoundManager__7 = v2.SoundManager;
local l__GameSound__8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__9 = v3.TweenService;
local l__BedwarsImageId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemViewport__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__12 = v2.Empty;
return {
	VendingMachineRoll = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local l__useEffect__5 = p2.useEffect;
		local v6 = u1.createRef();
		local u13 = nil;
		local v7 = {};
		local v8 = 0;
		local v9, v10, v11 = ipairs((u2.values(l__VendingMachineRewardMeta__3)));
		while true do
			local v12, v13 = v9(v10, v11);
			if not v12 then
				break;
			end;
			local v14 = false;
			if v13.id ~= l__VendingMachineRewardId__4.NONE then
				v14 = false;
				if v13.id ~= u13 then
					v14 = not v13.disabled;
				end;
			end;
			if v14 == true then
				v8 = v8 + 1;
				v7[v8] = v13;
			end;		
		end;
		local v15 = table.create(#v7);
		for v16, v17 in ipairs(v7) do
			v15[v16] = v17.id;
		end;
		local v18, v19 = l__useState__4(tick());
		local v20, v21 = l__useState__4((function()
			return l__RandomUtil__5.fromList(unpack(v15));
		end)());
		local v22, v23 = l__useState__4(false);
		local u14 = false;
		l__useEffect__5(function()
			if u14 == true then
				return nil;
			end;
			local u15 = true;
			task.spawn(function()
				if p1.dispenseTime == 0 then
					return nil;
				end;
				task.delay(p1.dispenseTime - l__Workspace__6:GetServerTimeNow(), function()
					if not u15 then
						return nil;
					end;
					u14 = true;
					v21(p1.choosenReward);
					v23(true);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_PRIZE, {
							position = p1.soundPosition
						});
					end);
				end);
				while true do
					local v24 = tick() - v18;
					local v25 = l__RandomUtil__5.fromList(unpack(v15));
					u13 = v25;
					v21(v25);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_TICK, {
							position = p1.soundPosition
						});
					end);
					local v26 = task.wait(math.clamp(v24 / 4, 0.1, 1) * 0.8);
					if v26 ~= 0 and v26 == v26 and v26 then
						v26 = u15 and not u14;
					end;
					if v26 == 0 then
						break;
					end;
					if v26 ~= v26 then
						break;
					end;
					if not v26 then
						break;
					end;				
				end;
			end);
			return function()
				u15 = false;
			end;
		end, { p1.choosenReward, v18, p1.dispenseTime });
		l__useEffect__5(function()
			if not v22 then
				return nil;
			end;
			local v27 = v6:getValue();
			if not v27 then
				return nil;
			end;
			local u16 = true;
			task.spawn(function()
				local v28 = true;
				while true do
					local v29 = {};
					if v28 then
						local v30 = 0.4;
					else
						v30 = 0.6;
					end;
					v29.ImageTransparency = v30;
					if v28 then
						local v31 = UDim2.fromScale(0.2, 0.2);
					else
						v31 = UDim2.fromScale(-0.2, -0.2);
					end;
					v29.Size = v27.Size + v31;
					local v32 = l__TweenService__9:Create(v27, TweenInfo.new(2.5, Enum.EasingStyle.Quad), v29);
					v32:Play();
					v32.Completed:Wait();
					v28 = not v28;
					if not u16 then
						break;
					end;				
				end;
			end);
			return function()
				u16 = false;
			end;
		end, { v22 });
		print("shown item:", v20);
		local v33 = nil;
		if v20 ~= 0 and v20 == v20 and v20 then
			v33 = l__VendingMachineRewardMeta__3[v20];
		end;
		local v34 = UDim2.fromScale(0.5, 0.5);
		if v22 then
			v34 = UDim2.fromScale(0.7, 0.7);
		end;
		local v35 = v33 ~= nil;
		if v35 then
			local v36 = {};
			local v37 = v22 and u1.createElement("ImageLabel", {
				[u1.Ref] = v6, 
				Image = l__BedwarsImageId__10.VENDING_RING, 
				Size = UDim2.fromScale(2.5, 2.5), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0, 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				SizeConstraint = "RelativeXX", 
				ImageTransparency = 0.8
			});
			if v37 then
				v36[#v36 + 1] = v37;
			end;
			local v38 = false;
			if v33.item ~= nil then
				v38 = u1.createElement(l__ItemViewport__11, {
					ItemType = v33.item.itemType, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v34, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v38 then
				v36[#v36 + 1] = v38;
			end;
			local v39 = false;
			if v33.custom ~= nil then
				v39 = u1.createElement("ImageLabel", {
					Image = v33.custom.image, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v34, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v39 then
				v36[#v36 + 1] = v39;
			end;
			v35 = u1.createFragment(v36);
		end;
		local v40 = {};
		if v35 then
			v40[#v40 + 1] = v35;
		end;
		return u1.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 1)
		}, v40);
	end)
};
