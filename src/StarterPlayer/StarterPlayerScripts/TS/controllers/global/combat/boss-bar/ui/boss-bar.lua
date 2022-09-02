-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__2 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__3 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u5 = ColorSequence.new(l__ColorUtil__2.hexColor(16711726), l__ColorUtil__2.hexColor(10682368));
return {
	BossBarApp = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {
			Health = p1.Bedwars.bossBar.health, 
			MaxHealth = p1.Bedwars.bossBar.maxHealth
		};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p3, p4)
		local l__useState__6 = p4.useState;
		local v7, v8 = l__useState__6(p3.Health);
		local v9, v10 = l__useState__6(p3.Health);
		local u6 = u1.new();
		p4.useEffect(function()
			local v11 = u1.new();
			u6:DoCleaning();
			if p3.Health < v7 then
				local u7 = l__default__2(0.08, l__Linear__3, function(p5)
					v8(p3.Health * p5 + v7 * (1 - p5));
				end);
				u6:GiveTask(function()
					u7:Cancel();
				end);
				task.delay(0.3, function()
					local v12 = l__default__2(0.3, l__Linear__3, function(p6)
						v10(p3.Health * p6 + v9 * (1 - p6));
					end);
				end);
			else
				v8(p3.Health);
				v10(p3.Health);
			end;
			local u8 = true;
			return function()
				u6:DoCleaning();
				v11:DoCleaning();
				u8 = false;
			end;
		end, { p3.Health });
		local v13 = {};
		local v14 = {
			Size = UDim2.fromScale(0.3865546218487395, 0.0275), 
			BackgroundTransparency = 0.8, 
			Position = UDim2.fromScale(0.5, 0.0575), 
			AnchorPoint = Vector2.new(0.5, 0), 
			BorderSizePixel = 0
		};
		local v15 = { u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 25.09090909090909
			}) };
		local v16 = #v15;
		local v17 = {
			BackgroundColor3 = l__ColorUtil__2.WHITE, 
			BorderSizePixel = 0
		};
		local v18 = p3.MaxHealth;
		if v18 == nil then
			v18 = 1;
		end;
		v17.Size = UDim2.fromScale(v9 / v18, 1);
		v15[v16 + 1] = u4.createElement("Frame", v17);
		local v19 = {
			BackgroundColor3 = l__ColorUtil__2.WHITE
		};
		local v20 = p3.MaxHealth;
		if v20 == nil then
			v20 = 1;
		end;
		v19.Size = UDim2.fromScale(v7 / v20, 1);
		v19.BorderSizePixel = 0;
		v15[v16 + 2] = u4.createElement("Frame", v19, { u4.createElement("UIGradient", {
				Color = p3.Gradient or u5
			}) });
		v13[#v13 + 1] = u4.createElement("Frame", v14, v15);
		return u4.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v13);
	end)))
};
