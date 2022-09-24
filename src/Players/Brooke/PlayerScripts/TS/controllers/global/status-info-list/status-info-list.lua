-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__DeviceUtil__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
return {
	StatusInfoList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u3 = u1.createRef();
		p2.useEffect(function()
			local v3 = u3:getValue();
			if v3 then
				p1.SetupRef(v3);
			end;
		end, {});
		local v4 = {};
		local v5 = {};
		local v6 = {};
		if l__DeviceUtil__2.isSmallScreen() then
			local v7 = 0.13;
		else
			v7 = 0.08;
		end;
		v6.Size = UDim2.fromScale(0.6, v7);
		v6.BackgroundTransparency = 1;
		v6.BorderSizePixel = 0;
		v6.AnchorPoint = Vector2.new(0.5, 1);
		if l__DeviceUtil__2.isSmallScreen() then
			local v8 = 0.95;
		else
			v8 = 0.99;
		end;
		v6.Position = UDim2.fromScale(0.5, v8);
		v5.FakeHotbar = u1.createElement("Frame", v6, {
			StatusInfoList = u1.createElement("Frame", {
				AnchorPoint = Vector2.new(0, 1), 
				Position = UDim2.fromScale(0.08, -0.47), 
				Size = UDim2.fromScale(1, 0.5), 
				BackgroundTransparency = 1, 
				[u1.Ref] = u3
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					VerticalAlignment = "Center", 
					Padding = UDim.new(0, 2), 
					SortOrder = "LayoutOrder"
				}) }),
			(u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = 9
			}))
		});
		v4.StatusInfoListGui = u1.createElement("ScreenGui", {
			ResetOnSpawn = false
		}, v5);
		return u1.createFragment(v4);
	end)
};
