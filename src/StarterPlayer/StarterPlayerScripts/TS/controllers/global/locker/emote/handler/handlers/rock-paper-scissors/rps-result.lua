-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__KnitClient__4 = v1.import(script, v1.getModule(script, "@easy-games", "knit").src).KnitClient;
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	RPSResult = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local u6 = u1.createRef();
		p2.useEffect(function()
			local v3 = u6:getValue();
			if not v3 then
				return nil;
			end;
			local v4 = l__TweenService__3:Create(v3, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
				StudsOffsetWorldSpace = Vector3.new(0, 3, 0)
			}):Play();
			local v5 = l__TweenService__3:Create(v3, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
				Size = UDim2.fromScale(1.5, 1.5)
			}):Play();
			local u7 = l__TweenService__3:Create(v3, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
				StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0)
			});
			local u8 = l__TweenService__3:Create(v3, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
				Size = UDim2.fromScale(0, 0)
			});
			local u9 = u2.new();
			task.delay(3, function()
				local l__rpsTree__6 = l__KnitClient__4.Controllers.RockPaperScissorsHandlerController.rpsTree;
				if l__rpsTree__6 then
					u7:Play();
					u8:Play();
					u9:GiveTask(u8.Completed:Connect(function()
						u1.unmount(l__rpsTree__6);
					end));
				end;
			end);
			return function()
				u9:DoCleaning();
			end;
		end, {});
		return u1.createFragment({
			RockPaperScissorsEmoteGui = u1.createElement("BillboardGui", {
				Size = UDim2.fromScale(0, 0), 
				StudsOffsetWorldSpace = Vector3.new(0, 2.5, 0), 
				Adornee = p1.Character.Head, 
				[u1.Ref] = u6
			}, {
				RockPaperScissorsEmoteResult = u1.createElement("Frame", {
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = l__ColorUtil__5.WHITE, 
					BorderSizePixel = 0
				}, {
					Result = u1.createElement("ImageLabel", {
						Size = UDim2.fromScale(0.7, 0.7), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						Position = UDim2.fromScale(0.5, 0.5), 
						Image = p1.ResultImage, 
						ImageColor3 = Color3.fromRGB(51, 51, 51), 
						ScaleType = "Fit", 
						BackgroundTransparency = 1
					}),
					(u1.createElement("UICorner", {
						CornerRadius = UDim.new(0.1, 0)
					}))
				})
			})
		});
	end)
};
