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
			v9(v10, v11);
			if not v9 then
				break;
			end;
			local v12 = false;
			if v10.id ~= l__VendingMachineRewardId__4.NONE then
				v12 = false;
				if v10.id ~= u13 then
					v12 = not v10.disabled;
				end;
			end;
			if v12 == true then
				v8 = v8 + 1;
				v7[v8] = v10;
			end;		
		end;
		local v13 = table.create(#v7);
		local v14, v15, v16 = ipairs(v7);
		while true do
			v14(v15, v16);
			if not v14 then
				break;
			end;
			v16 = v14;
			v13[v14] = v15.id;		
		end;
		local v17, v18 = l__useState__4(tick());
		local v19, v20 = l__useState__4((function()
			return l__RandomUtil__5.fromList(unpack(v13));
		end)());
		local v21, v22 = l__useState__4(false);
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
					v20(p1.choosenReward);
					v22(true);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_PRIZE, {
							position = p1.soundPosition
						});
					end);
				end);
				while true do
					local v23 = tick() - v17;
					local v24 = l__RandomUtil__5.fromList(unpack(v13));
					u13 = v24;
					v20(v24);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_TICK, {
							position = p1.soundPosition
						});
					end);
					local v25 = task.wait(math.clamp(v23 / 4, 0.1, 1) * 0.8);
					if v25 ~= 0 and v25 == v25 and v25 then
						v25 = u15 and not u14;
					end;
					if v25 == 0 then
						break;
					end;
					if v25 ~= v25 then
						break;
					end;
					if not v25 then
						break;
					end;				
				end;
			end);
			return function()
				u15 = false;
			end;
		end, { p1.choosenReward, v17, p1.dispenseTime });
		l__useEffect__5(function()
			if not v21 then
				return nil;
			end;
			local v26 = v6:getValue();
			if not v26 then
				return nil;
			end;
			local u16 = true;
			task.spawn(function()
				local v27 = true;
				while true do
					local v28 = {};
					if v27 then
						local v29 = 0.4;
					else
						v29 = 0.6;
					end;
					v28.ImageTransparency = v29;
					if v27 then
						local v30 = UDim2.fromScale(0.2, 0.2);
					else
						v30 = UDim2.fromScale(-0.2, -0.2);
					end;
					v28.Size = v26.Size + v30;
					local v31 = l__TweenService__9:Create(v26, TweenInfo.new(2.5, Enum.EasingStyle.Quad), v28);
					v31:Play();
					v31.Completed:Wait();
					v27 = not v27;
					if not u16 then
						break;
					end;				
				end;
			end);
			return function()
				u16 = false;
			end;
		end, { v21 });
		print("shown item:", v19);
		local v32 = nil;
		if v19 ~= 0 and v19 == v19 and v19 then
			v32 = l__VendingMachineRewardMeta__3[v19];
		end;
		local v33 = UDim2.fromScale(0.5, 0.5);
		if v21 then
			v33 = UDim2.fromScale(0.7, 0.7);
		end;
		local v34 = v32 ~= nil;
		if v34 then
			local v35 = {};
			local v36 = v21 and u1.createElement("ImageLabel", {
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
			if v36 then
				v35[#v35 + 1] = v36;
			end;
			local v37 = false;
			if v32.item ~= nil then
				v37 = u1.createElement(l__ItemViewport__11, {
					ItemType = v32.item.itemType, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v33, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v37 then
				v35[#v35 + 1] = v37;
			end;
			local v38 = false;
			if v32.custom ~= nil then
				v38 = u1.createElement("ImageLabel", {
					Image = v32.custom.image, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v33, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v38 then
				v35[#v35 + 1] = v38;
			end;
			v34 = u1.createFragment(v35);
		end;
		local v39 = {};
		if v34 then
			v39[#v39 + 1] = v34;
		end;
		return u1.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 1)
		}, v39);
	end)
};
