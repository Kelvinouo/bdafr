-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__BalanceFile__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__default__3 = v1.import(script, v1.getModule(script, "@rbxts", "tween")).default;
local l__Linear__4 = v1.import(script, v1.getModule(script, "@rbxts", "easing-functions")).Linear;
local l__ColorUtil__5 = v2.ColorUtil;
local l__GameTheme__6 = v2.GameTheme;
local u7 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ProgressBar__8 = v2.ProgressBar;
return {
	HannahCombo = v1.import(script, v1.getModule(script, "@rbxts", "roact-rodux").src).connect(function(p1, p2)
		local v3 = {};
		for v4, v5 in pairs(p2) do
			v3[v4] = v5;
		end;
		v3.combo = p1.Kit.hannahCombo;
		return v3;
	end)((v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u7)(function(p3, p4)
		local v6, v7 = p4.useState(l__BalanceFile__1.HANNAH_COMBO_EXPIRATION_SEC);
		p4.useEffect(function()
			local v8 = u2.new();
			local u9 = l__default__3(l__BalanceFile__1.HANNAH_COMBO_EXPIRATION_SEC, l__Linear__4, function(p5)
				v7(1 - p5);
			end);
			v8:GiveTask(function()
				u9:Cancel();
			end);
			return function()
				v8:DoCleaning();
			end;
		end, { p3.combo });
		local v9 = l__ColorUtil__5.hexColor(16686918);
		if p3.combo > 1 then
			v9 = l__ColorUtil__5.hexColor(16676678);
		end;
		if p3.combo > 2 then
			v9 = l__ColorUtil__5.hexColor(16664149);
		end;
		local v10 = {
			Size = l__GameTheme__6.actionBarButtonSize, 
			BorderSizePixel = 0
		};
		if p3.combo == 0 then
			local v11 = 1;
		else
			v11 = 0.4;
		end;
		v10.BackgroundTransparency = v11;
		v10.BackgroundColor3 = Color3.fromRGB(20, 20, 20);
		local v12 = {};
		local v13 = false;
		if p3.combo > 0 then
			v13 = u7.createFragment({
				HannahCombo = u7.createFragment({
					HannahCombo = u7.createElement("TextLabel", {
						Size = UDim2.fromScale(0.9, 0.9), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						RichText = true, 
						Position = UDim2.fromScale(0.5, 0.5), 
						LayoutOrder = 100, 
						Text = "<font color=\"" .. l__ColorUtil__5.richTextColor(l__ColorUtil__5.WHITE) .. "\">COMBO:</font> <b><font color=\"" .. l__ColorUtil__5.richTextColor(v9) .. "\">" .. tostring(p3.combo) .. "</font></b>", 
						Font = Enum.Font.JosefinSans, 
						TextColor3 = l__ColorUtil__5.WHITE, 
						TextScaled = true, 
						BackgroundTransparency = 1
					})
				}),
				u7.createElement(l__ProgressBar__8, {
					Size = UDim2.fromScale(1, 0.12), 
					Position = UDim2.fromScale(0.5, 1), 
					AnchorPoint = Vector2.new(0.5, 0), 
					BarColor = l__ColorUtil__5.hexColor(16772019), 
					Progress = v6
				})
			});
		end;
		if v13 then
			v12[#v12 + 1] = v13;
		end;
		v12[#v12 + 1] = u7.createElement("UIAspectRatioConstraint", {
			AspectRatio = 4
		});
		return u7.createElement("ImageLabel", v10, v12);
	end)))
};
