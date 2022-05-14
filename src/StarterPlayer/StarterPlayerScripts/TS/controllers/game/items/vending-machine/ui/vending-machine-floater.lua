-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TweenService__2 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__ItemViewport__3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
return {
	VendingMachineFloater = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = u1.createRef();
		local function v4()
			return UDim2.fromScale(math.random(2, 98) / 100, math.random(2, 98) / 100);
		end;
		local v5 = math.random(-40, 40);
		local u4 = u1.createRef();
		local u5 = u1.createRef();
		local u6 = v4();
		p2.useEffect(function()
			local u7 = true;
			task.spawn(function()
				while u7 do
					local v6 = u4:getValue();
					if not v6 then
						return nil;
					end;
					local v7 = v4();
					local v8 = math.random(-40, 40);
					local v9 = math.random(800, 1600) / 100;
					local v10 = l__TweenService__2:Create(v6, TweenInfo.new(v9, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						Position = v7, 
						Rotation = v8
					});
					v10:Play();
					local v11 = u5:getValue();
					if v11 then
						local v12 = l__TweenService__2:Create(v11, TweenInfo.new(v9 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
							TextTransparency = 0
						});
						v12:Play();
						v12.Completed:Connect(function()
							if not v6 or not u7 then
								return nil;
							end;
							l__TweenService__2:Create(v11, TweenInfo.new(v9 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
								TextTransparency = 1
							}):Play();
						end);
					end;
					v10.Completed:Wait();
					u6 = v7;				
				end;
			end);
			return function()
				u7 = false;
			end;
		end, {});
		return p2.useMemo(function()
			local v13 = {};
			local v14 = false;
			if p1.item ~= nil then
				v14 = u1.createElement(l__ItemViewport__3, {
					ImageTransparency = 0.1, 
					ItemType = p1.item
				});
			end;
			if v14 then
				v13[#v13 + 1] = v14;
			end;
			local v15 = false;
			if p1.image ~= nil then
				v15 = u1.createElement("ImageLabel", {
					[u1.Ref] = v3, 
					Image = p1.image, 
					BorderSizePixel = 0, 
					Size = UDim2.fromScale(1, 1), 
					BackgroundTransparency = 1, 
					ImageTransparency = 0.2
				});
			end;
			if v15 then
				v13[#v13 + 1] = v15;
			end;
			local v16 = false;
			if p1.item == nil then
				v16 = false;
				if p1.image == nil then
					v16 = u1.createElement("TextLabel", {
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
			if v16 then
				v13[#v13 + 1] = v16;
			end;
			return u1.createElement("Frame", {
				[u1.Ref] = u4, 
				Size = UDim2.fromScale(0.3, 0.3), 
				Position = u6, 
				Rotation = v5, 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				SizeConstraint = "RelativeXX", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 1
			}, v13);
		end, {});
	end)
};
