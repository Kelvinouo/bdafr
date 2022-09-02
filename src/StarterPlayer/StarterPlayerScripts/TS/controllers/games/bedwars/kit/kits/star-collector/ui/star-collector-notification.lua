-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__default__1 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__OutExpo__2 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).OutExpo;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__UIUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).UIUtil;
return {
	StarCollectorNotification = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2, v3 = p2.useBinding(1);
		p2.useEffect(function()
			local u6 = task.spawn(function()
				l__default__1(0.5, l__OutExpo__2, function(p3)
					v3(p3);
				end, 1, 0):Wait();
				l__default__1(0.3, l__OutExpo__2, function(p4)
					v3(p4);
				end, 0, 1);
			end);
			return function()
				task.cancel(u6);
			end;
		end);
		return u3.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 1), 
			LayoutOrder = l__Theme__4.abilityActionBarPriority, 
			Position = l__UIUtil__5:getActionBarPosition(), 
			Text = p1.text, 
			Font = "LuckiestGuy", 
			TextColor3 = p1.textColor3, 
			TextStrokeColor3 = Color3.fromRGB(0, 0, 0), 
			BackgroundTransparency = 1, 
			TextScaled = true, 
			TextTransparency = v2, 
			Size = l__Theme__4.actionBarButtonSize
		});
	end)
};
