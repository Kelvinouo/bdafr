-- Script Hash: 600787d7a4a92f9d14f885b2de420aa64a8f2873caf0cc0ed9a02ae1813c3c5eb12a97b55139fbe15f44722c67218579
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
		local v7 = u2.values(l__VendingMachineRewardMeta__3);
		local u13 = nil;
		local function v8(p3)
			local v9 = false;
			if p3.id ~= l__VendingMachineRewardId__4.NONE then
				v9 = false;
				if p3.id ~= u13 then
					v9 = not p3.disabled;
				end;
			end;
			return v9;
		end;
		local v10 = {};
		local v11 = 0;
		for v12, v13 in ipairs(v7) do
			if v8(v13, v12 - 1, v7) == true then
				v11 = v11 + 1;
				v10[v11] = v13;
			end;
		end;
		local function v14(p4)
			return p4.id;
		end;
		local v15 = table.create(#v10);
		for v16, v17 in ipairs(v10) do
			v15[v16] = v14(v17, v16 - 1, v10);
		end;
		local function v18()
			return l__RandomUtil__5.fromList(unpack(v15));
		end;
		local v19, v20 = l__useState__4(tick());
		local v21, v22 = l__useState__4(v18());
		local v23, v24 = l__useState__4(false);
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
					v22(p1.choosenReward);
					v24(true);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_PRIZE, {
							position = p1.soundPosition
						});
					end);
				end);
				while true do
					local v25 = tick() - v19;
					local v26 = v18();
					u13 = v26;
					v22(v26);
					task.spawn(function()
						l__SoundManager__7:playSound(l__GameSound__8.VENDING_ROLL_TICK, {
							position = p1.soundPosition
						});
					end);
					local v27 = task.wait(math.clamp(v25 / 4, 0.1, 1) * 0.8);
					if v27 ~= 0 and v27 == v27 and v27 then
						v27 = u15 and not u14;
					end;
					if v27 == 0 then
						break;
					end;
					if v27 ~= v27 then
						break;
					end;
					if not v27 then
						break;
					end;				
				end;
			end);
			return function()
				u15 = false;
			end;
		end, { p1.choosenReward, v19, p1.dispenseTime });
		l__useEffect__5(function()
			if not v23 then
				return nil;
			end;
			local v28 = v6:getValue();
			if not v28 then
				return nil;
			end;
			local u16 = true;
			task.spawn(function()
				local v29 = true;
				while true do
					local v30 = {};
					if v29 then
						local v31 = 0.4;
					else
						v31 = 0.6;
					end;
					v30.ImageTransparency = v31;
					if v29 then
						local v32 = UDim2.fromScale(0.2, 0.2);
					else
						v32 = UDim2.fromScale(-0.2, -0.2);
					end;
					v30.Size = v28.Size + v32;
					local v33 = l__TweenService__9:Create(v28, TweenInfo.new(2.5, Enum.EasingStyle.Quad), v30);
					v33:Play();
					v33.Completed:Wait();
					v29 = not v29;
					if not u16 then
						break;
					end;				
				end;
			end);
			return function()
				u16 = false;
			end;
		end, { v23 });
		print("shown item:", v21);
		local v34 = nil;
		if v21 ~= 0 and v21 == v21 and v21 then
			v34 = l__VendingMachineRewardMeta__3[v21];
		end;
		local v35 = UDim2.fromScale(0.5, 0.5);
		if v23 then
			v35 = UDim2.fromScale(0.7, 0.7);
		end;
		local v36 = v34 ~= nil;
		if v36 then
			local v37 = {};
			local v38 = v23 and u1.createElement("ImageLabel", {
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
			if v38 then
				v37[#v37 + 1] = v38;
			end;
			local v39 = false;
			if v34.item ~= nil then
				v39 = u1.createElement(l__ItemViewport__11, {
					ItemType = v34.item.itemType, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v35, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v39 then
				v37[#v37 + 1] = v39;
			end;
			local v40 = false;
			if v34.custom ~= nil then
				v40 = u1.createElement("ImageLabel", {
					Image = v34.custom.image, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Size = v35, 
					Position = UDim2.fromScale(0.5, 0.5), 
					AnchorPoint = Vector2.new(0.5, 0.5), 
					SizeConstraint = "RelativeXX"
				});
			end;
			if v40 then
				v37[#v37 + 1] = v40;
			end;
			v36 = u1.createFragment(v37);
		end;
		local v41 = {};
		if v36 then
			v41[#v41 + 1] = v36;
		end;
		return u1.createElement(l__Empty__12, {
			Size = UDim2.fromScale(1, 1)
		}, v41);
	end)
};
