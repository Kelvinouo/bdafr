
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__VendingMachineRewardId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local l__RandomUtil__4 = v2.RandomUtil;
local l__Workspace__5 = v3.Workspace;
local l__SoundManager__6 = v2.SoundManager;
local l__GameSound__7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__TweenService__8 = v3.TweenService;
local l__VendingMachineRewardMeta__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward-meta").VendingMachineRewardMeta;
local l__BedwarsImageId__10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ItemViewport__11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local l__Empty__12 = v2.Empty;
return {
	VendingMachineRoll = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__4 = p2.useState;
		local l__useEffect__5 = p2.useEffect;
		local v6 = u1.createRef();
		local u13 = nil;
		local function v7()
			local v8 = u2.values(l__VendingMachineRewardId__3);
			local function v9(p3)
				local v10 = false;
				if p3 ~= l__VendingMachineRewardId__3.NONE then
					v10 = p3 ~= u13;
				end;
				return v10;
			end;
			local v11 = {};
			local v12 = 0;
			for v13, v14 in ipairs(v8) do
				if v9(v14, v13 - 1, v8) == true then
					v12 = v12 + 1;
					v11[v12] = v14;
				end;
			end;
			return l__RandomUtil__4.fromList(unpack(v11));
		end;
		local v15, v16 = l__useState__4(tick());
		local v17, v18 = l__useState__4(v7());
		local v19, v20 = l__useState__4(false);
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
				task.delay(p1.dispenseTime - l__Workspace__5:GetServerTimeNow(), function()
					if not u15 then
						return nil;
					end;
					u14 = true;
					v18(p1.choosenReward);
					v20(true);
					task.spawn(function()
						l__SoundManager__6:playSound(l__GameSound__7.VENDING_ROLL_PRIZE, {
							position = p1.soundPosition
						});
					end);
				end);
				while true do
					local v21 = tick() - v15;
					local v22 = v7();
					u13 = v22;
					v18(v22);
					task.spawn(function()
						l__SoundManager__6:playSound(l__GameSound__7.VENDING_ROLL_TICK, {
							position = p1.soundPosition
						});
					end);
					local v23 = task.wait(math.clamp(v21 / 4, 0.1, 1) * 0.8);
					if v23 ~= 0 and v23 == v23 and v23 then
						v23 = u15 and not u14;
					end;
					if v23 == 0 then
						break;
					end;
					if v23 ~= v23 then
						break;
					end;
					if not v23 then
						break;
					end;				
				end;
			end);
			return function()
				u15 = false;
			end;
		end, { p1.choosenReward, v15, p1.dispenseTime });
		l__useEffect__5(function()
			if not v19 then
				return nil;
			end;
			local v24 = v6:getValue();
			if not v24 then
				return nil;
			end;
			local u16 = true;
			task.spawn(function()
				local v25 = true;
				while true do
					local v26 = {};
					if v25 then
						local v27 = 0.4;
					else
						v27 = 0.6;
					end;
					v26.ImageTransparency = v27;
					if v25 then
						local v28 = UDim2.fromScale(0.2, 0.2);
					else
						v28 = UDim2.fromScale(-0.2, -0.2);
					end;
					v26.Size = v24.Size + v28;
					local v29 = l__TweenService__8:Create(v24, TweenInfo.new(2.5, Enum.EasingStyle.Quad), v26);
					v29:Play();
					v29.Completed:Wait();
					v25 = not v25;
					if not u16 then
						break;
					end;				
				end;
			end);
			return function()
				u16 = false;
			end;
		end, { v19 });
		print("shown item:", v17);
		local v30 = nil;
		if v17 ~= 0 and v17 == v17 and v17 then
			v30 = l__VendingMachineRewardMeta__9[v17];
		end;
		local v31 = UDim2.fromScale(0.5, 0.5);
		if v19 then
			v31 = UDim2.fromScale(0.7, 0.7);
		end;
		local v32 = v30 ~= nil;
		if v32 then
			local v33 = {};
			local v34 = v19 and u1.createElement("ImageLabel", {
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
			if v34 then
				v33[#v33 + 1] = v34;
			end;
			local v35 = false;
			if v30.item ~= nil then
				v35 = u1.createElement(l__ItemViewport__11, {
					ItemType = v30.item.itemType, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v31, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v35 then
				v33[#v33 + 1] = v35;
			end;
			local v36 = false;
			if v30.custom ~= nil then
				v36 = u1.createElement("ImageLabel", {
					Image = v30.custom.image, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v31, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v36 then
				v33[#v33 + 1] = v36;
			end;
			v32 = u1.createFragment(v33);
		end;
		local v37 = {};
		if v32 then
			v37[#v37 + 1] = v32;
		end;
		return u1.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 1)
		}, v37);
	end)
};

