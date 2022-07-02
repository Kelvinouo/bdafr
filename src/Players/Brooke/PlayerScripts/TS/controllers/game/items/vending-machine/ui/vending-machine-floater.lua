-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ItemViewport__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
return {
	VendingMachineFloater = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = u1.createRef();
		local v4 = math.random(-40, 40);
		local u4 = u1.createRef();
		local u5 = u1.createRef();
		local u6 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
		p2.useEffect(function()
			local u7 = true;
			task.spawn(function()
				while u7 do
					local v5 = u4:getValue();
					if not v5 then
						return nil;
					end;
					local v6 = UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
					local v7 = math.random(-40, 40);
					local v8 = math.random(800, 1600) / 100;
					local v9 = l__TweenService__2:Create(v5, TweenInfo.new(v8, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Position = v6, 
						Rotation = v7
					});
					v9:Play();
					local v10 = u5:getValue();
					if v10 then
						local v11 = l__TweenService__2:Create(v10, TweenInfo.new(v8 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
							TextTransparency = 0
						});
						v11:Play();
						v11.Completed:Connect(function()
							if not v5 or not u7 then
								return nil;
							end;
							l__TweenService__2:Create(v10, TweenInfo.new(v8 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
								TextTransparency = 1
							}):Play();
						end);
					end;
					v9.Completed:Wait();
					u6 = v6;				
				end;
			end);
			return function()
				u7 = false;
			end;
		end, {});
		return p2.useMemo(function()
			local v12 = {};
			local v13 = false;
			if p1.item ~= nil then
				v13 = u1.createElement(l__ItemViewport__3, {
					ImageTransparency = 0.1, 
					ItemType = p1.item
				});
			end;
			if v13 then
				v12[#v12 + 1] = v13;
			end;
			local v14 = false;
			if p1.image ~= nil then
				v14 = u1.createElement("ImageLabel", {
					[u1.Ref] = v3, 
					Image = p1.image, 
					BorderSizePixel = 0, 
					Size = UDim2.fromScale(1, 1), 
					BackgroundTransparency = 1, 
					ImageTransparency = 0.2
				});
			end;
			if v14 then
				v12[#v12 + 1] = v14;
			end;
			local v15 = false;
			if p1.item == nil then
				v15 = false;
				if p1.image == nil then
					v15 = u1.createElement("TextLabel", {
						[u1.Ref] = u5, 
						Text = "?", 
						Font = "LuckiestGuy", 
						TextColor3 = Color3.fromRGB(255, 255, 255), 
						TextScaled = true, 
						TextTransparency = math.random(), 
						BorderSizePixel = 0, 
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Size = UDim2.fromScale(1.5, 1.5), 
						BackgroundTransparency = 1
					});
				end;
			end;
			if v15 then
				v12[#v12 + 1] = v15;
			end;
			return u1.createElement("Frame", {
				[u1.Ref] = u4, 
				Size = UDim2.fromScale(0.3, 0.3), 
				Position = u6, 
				Rotation = v4, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				SizeConstraint = "RelativeXX", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1
			}, v12);
		end, {});
	end)
};
