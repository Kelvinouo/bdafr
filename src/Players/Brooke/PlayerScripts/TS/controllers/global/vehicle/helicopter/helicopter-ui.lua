-- Script Hash: 9f0303dcdd4cb9a5cd15524ac981a912b883c76b9073bf99b64a7a15fe7a42a4c77f5ee99803d1b8a8b42022a0108ccf
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "maid").Maid);
local l__Flamework__2 = v1.import(script, v1.getModule(script, "@flamework", "core").out).Flamework;
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__DeviceUtil__4 = v2.DeviceUtil;
local l__BedwarsUI__5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local u6 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__MobileButton__7 = v2.MobileButton;
local l__ProgressBar__8 = v2.ProgressBar;
local l__Theme__9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	HelicopterUi = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u6)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4, v5 = l__useState__3(p1.vehicleModel:GetAttribute("Health"));
		local v6, v7 = l__useState__3(p1.vehicleModel:GetAttribute("MaxHealth"));
		p2.useEffect(function()
			local v8 = u1.new();
			v8:GiveTask(p1.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function()
				v5(p1.vehicleModel:GetAttribute("Health"));
			end));
			v8:GiveTask(p1.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function()
				v7(p1.vehicleModel:GetAttribute("MaxHealth"));
			end));
			return function()
				v8:DoCleaning();
			end;
		end);
		local v9 = l__Flamework__2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue();
		local v10 = {};
		local v11 = #v10;
		local v12 = {
			Image = l__BedwarsImageId__3.UP_MOBILE
		};
		if l__DeviceUtil__4.isMobileControls() then
			local v13 = l__BedwarsUI__5:getActionMobileButtonPosition();
		else
			v13 = UDim2.fromScale(0.2, l__BedwarsUI__5:getActionBarPosition().Y.Scale);
		end;
		v12.Position = v13;
		function v12.OnPressDown()
			p1.upChanged(true);
		end;
		function v12.OnPressUp()
			p1.upChanged(false);
		end;
		local v14 = {};
		local v15 = not l__DeviceUtil__4.isMobileControls() and u6.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.fromScale(0.3, 0.3), 
			Position = UDim2.fromScale(1.2, 0.5), 
			BackgroundTransparency = 1, 
			TextScaled = true, 
			Text = "[E]", 
			Font = "RobotoCondensed", 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextStrokeTransparency = 0, 
			TextXAlignment = "Left", 
			TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
		});
		if v15 then
			v14[#v14 + 1] = v15;
		end;
		v10[v11 + 1] = u6.createElement(l__MobileButton__7, v12, v14);
		local v16 = {
			Image = l__BedwarsImageId__3.DOWN_MOBILE
		};
		if l__DeviceUtil__4.isMobileControls() then
			local v17 = l__BedwarsUI__5:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0);
		else
			v17 = UDim2.fromScale(0.8, l__BedwarsUI__5:getActionBarPosition().Y.Scale);
		end;
		v16.Position = v17;
		function v16.OnPressDown()
			p1.downChanged(true);
		end;
		function v16.OnPressUp()
			p1.downChanged(false);
		end;
		local v18 = {};
		local v19 = not l__DeviceUtil__4.isMobileControls() and u6.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Size = UDim2.fromScale(0.3, 0.3), 
			Position = UDim2.fromScale(-0.2, 0.5), 
			BackgroundTransparency = 1, 
			TextScaled = true, 
			Text = "[Q]", 
			Font = "RobotoCondensed", 
			TextColor3 = Color3.fromRGB(255, 255, 255), 
			TextXAlignment = "Right", 
			TextStrokeTransparency = 0, 
			TextStrokeColor3 = Color3.fromRGB(18, 18, 18)
		});
		if v19 then
			v18[#v18 + 1] = v19;
		end;
		v10[v11 + 2] = u6.createElement(l__MobileButton__7, v16, v18);
		if v9 then
			local v20 = u6.createElement(u6.Portal, {
				target = v9
			}, { u6.createElement(l__ProgressBar__8, {
					Size = l__Theme__9.actionBarProgressBarSize, 
					Progress = v4 / v6, 
					BarGradient = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18)), 
					AcceptZero = true
				}) });
		else
			v20 = nil;
		end;
		if v20 then
			v10[v11 + 3] = v20;
		end;
		return u6.createFragment(v10);
	end)
};
