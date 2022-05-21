-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions"));
local u1 = UDim2.fromScale(0.18, 0.1);
local l__SoundManager__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).SoundManager;
local l__GameSound__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__default__4 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__InOutCubic__5 = v2.InOutCubic;
local l__OutElastic__6 = v2.OutElastic;
local u7 = UDim2.fromScale(0.22, 0.11);
local l__OutExpo__8 = v2.OutExpo;
local u9 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	DasherProgressBar = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u9)(function(p1, p2)
		local l__useBinding__3 = p2.useBinding;
		local v4, v5 = l__useBinding__3(0);
		local v6, v7 = l__useBinding__3(u1);
		local u10 = l__SoundManager__2:playSound(l__GameSound__3.DAO_CHARGING);
		p2.useEffect(function()
			local u11 = true;
			v1.Promise.try(function()
				l__default__4(p1.chargeTime, l__InOutCubic__5, function(p3)
					v5(p3 / p1.chargeTime);
				end, 0, p1.chargeTime):Wait();
				task.delay(0.05, function()
					if u11 then
						l__SoundManager__2:playSound(l__GameSound__3.DAO_CHARGE_COMPLETE);
					end;
				end);
				l__default__4(0.15, l__OutElastic__6, function(p4)
					v7(p4);
				end, u1, u7):Wait();
				l__default__4(0.2, l__OutExpo__8, function(p5)
					v7(p5);
				end, u7, u1);
			end);
			return function()
				u11 = false;
				if u10 ~= nil then
					u10:Stop();
				end;
			end;
		end);
		return u9.createElement("Frame", {
			Size = v6, 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.7), 
			BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
			BackgroundTransparency = 0.7, 
			BorderSizePixel = 0
		}, { u9.createElement("UIAspectRatioConstraint", {
				AspectRatio = 10.95890410958904, 
				DominantAxis = "Height"
			}), u9.createElement("Frame", {
				Size = v4:map(function(p6)
					return UDim2.fromScale(p6, 1);
				end), 
				BorderSizePixel = 0
			}, { u9.createElement("UIGradient", {
					Color = ColorSequence.new(Color3.fromRGB(255, 33, 33), Color3.fromRGB(255, 89, 89))
				}) }) });
	end)
};
