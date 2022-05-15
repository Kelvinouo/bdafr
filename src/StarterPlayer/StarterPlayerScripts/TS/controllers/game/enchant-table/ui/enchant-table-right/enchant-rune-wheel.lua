
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__Empty__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	EnchantRuneWheel = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		v2.Color = nil;
		v2.RuneTransparency = nil;
		v2.RuneSize = nil;
		local v5 = p1.Color or Color3.fromRGB(242, 156, 48);
		local v6 = p1.RuneTransparency;
		if v6 == nil then
			v6 = 0.6;
		end;
		local v7 = p1.RuneSize or UDim2.fromScale(1, 1);
		local v8 = u1.createRef();
		local u4 = u1.createRef();
		local u5 = u1.createRef();
		local u6 = u1.createRef();
		local u7 = u1.createRef();
		p2.useEffect(function()
			local v9 = u4:getValue();
			local v10 = u5:getValue();
			local v11 = u6:getValue();
			local v12 = u7:getValue();
			if v9 then
				l__TweenService__2:Create(v9, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
					Rotation = 180
				}):Play();
			end;
			if v10 then
				l__TweenService__2:Create(v10, TweenInfo.new(12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
					Rotation = 180
				}):Play();
			end;
			if v11 then
				l__TweenService__2:Create(v11, TweenInfo.new(16, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
					Rotation = -180
				}):Play();
			end;
			if v12 then
				l__TweenService__2:Create(v12, TweenInfo.new(18, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {
					Rotation = -180
				}):Play();
			end;
		end, {});
		local v13 = {};
		for v14, v15 in pairs(v2) do
			v13[v14] = v15;
		end;
		return u1.createElement(l__Empty__3, v13, {
			OuterRuneWheel = u1.createElement("ImageLabel", {
				Image = "rbxassetid://8247934954", 
				Size = v7, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ImageColor3 = v5, 
				ImageTransparency = v6, 
				[u1.Ref] = u4
			}), 
			Square = u1.createElement("ImageLabel", {
				Image = "rbxassetid://8247934767", 
				Size = v7, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ImageColor3 = v5, 
				ImageTransparency = v6, 
				[u1.Ref] = u5
			}), 
			SquareDiamond = u1.createElement("ImageLabel", {
				Image = "rbxassetid://8247934648", 
				Size = v7, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ImageColor3 = v5, 
				ImageTransparency = v6, 
				[u1.Ref] = u6
			}), 
			InnerRuneWheel = u1.createElement("ImageLabel", {
				Image = "rbxassetid://8247934516", 
				Size = v7, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ImageColor3 = v5, 
				ImageTransparency = v6, 
				[u1.Ref] = u7
			}), 
			CenterPiece = u1.createElement("ImageLabel", {
				Image = "rbxassetid://8247934380", 
				Size = v7, 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				ImageColor3 = v5, 
				ImageTransparency = v6, 
				[u1.Ref] = v8
			})
		});
	end)
};

