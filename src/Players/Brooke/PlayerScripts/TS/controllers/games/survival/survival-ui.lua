-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local v3 = v1.import(script, v1.getModule(script, "@rbxts", "services"));
local l__useSpring__1 = v1.import(script, v1.getModule(script, "@rbxts", "roact-spring").src).useSpring;
local l__RunService__2 = v3.RunService;
local l__Workspace__3 = v3.Workspace;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__GetTarmacAsset__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;
local l__ColorUtil__6 = v2.ColorUtil;
local l__Empty__7 = v2.Empty;
return {
	SurvivalUi = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u4)(function(p1, p2)
		local u8 = p2.useMemo(function()
			return p1.health / p1.maxHealth;
		end, { p1.health, p1.maxHealth });
		local v4 = p2.useMemo(function()
			return 1 / u8;
		end, { u8 });
		local v5 = l__useSpring__1(p2, {
			config = {
				tension = 440, 
				friction = 26, 
				mass = 0.6
			}, 
			to = {
				size1 = UDim2.fromScale(u8, 1), 
				size2 = UDim2.fromScale(v4, 1)
			}
		}, { u8, v4 });
		local v6, v7 = l__useSpring__1(p2, function()
			return {
				alpha = 0
			};
		end);
		p2.useEffect(function()
			v7.start({
				config = {
					tension = 250, 
					friction = 14, 
					mass = 1
				}, 
				alpha = 0.9
			});
			task.delay(0.1, function()
				v7.start({
					config = {
						tension = 300, 
						friction = 14, 
						mass = 1
					}, 
					alpha = 0
				});
			end);
		end, { p1.health });
		local v8, v9 = p2.useBinding(0);
		p2.useEffect(function()
			local u9 = l__RunService__2.Heartbeat:Connect(function()
				if os.clock() - -1 > 1 then
					local v10 = p1.endTime - l__Workspace__3:GetServerTimeNow();
					if v10 < 0 then
						local v11 = 0;
					else
						v11 = math.floor(v10);
					end;
					v9(v11);
				end;
			end);
			return function()
				u9:Disconnect();
			end;
		end, { p1.endTime });
		local v12 = {
			HealthBarIcon = u4.createElement("ImageLabel", {
				Image = "rbxassetid://10320211982", 
				Size = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0, 0.5), 
				Position = UDim2.fromScale(0.1, 0.5), 
				SizeConstraint = "RelativeYY", 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}),
			u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 6.069306930693069
			}), u4.createElement("ImageLabel", {
				Image = l__GetTarmacAsset__5("healthbarstroke").Image, 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Size = UDim2.fromScale(1, 1), 
				BackgroundTransparency = 1, 
				ZIndex = 3
			}), (u4.createElement("ImageLabel", {
				Image = l__GetTarmacAsset__5("healthbarfill").Image, 
				BackgroundTransparency = 1, 
				AnchorPoint = Vector2.new(0, 0.5), 
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0, 0.5), 
				ImageColor3 = Color3.fromRGB(41, 41, 41), 
				ImageTransparency = 0.8
			}))
		};
		local v13 = {
			Size = UDim2.fromScale(0.5, 0.5), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.56), 
			TextScaled = true, 
			RichText = true
		};
		if p1.health > 0 then
			local v14 = "<b>" .. tostring(p1.health) .. "<font transparency=\".3\"> / " .. tostring(p1.maxHealth) .. "</font></b>";
		else
			v14 = "<stroke color=\"#000000\" thickness=\"2\"><font color=\"" .. l__ColorUtil__6.richTextColor(Color3.fromHex("FC4545")) .. "\"><b>BED GONE! RUN!</b></font></stroke>";
		end;
		v13.Text = v14;
		v13.TextColor3 = Color3.fromRGB(255, 255, 255);
		v13.BackgroundTransparency = 1;
		v13.Font = "RobotoCondensed";
		v13.ZIndex = 2;
		v12.HealthBarText = u4.createElement("TextLabel", v13);
		v12[4] = u4.createElement("Frame", {
			ClipsDescendants = true, 
			Size = v5.size1, 
			AnchorPoint = Vector2.new(0, 0.5), 
			Position = UDim2.fromScale(0, 0.5), 
			BackgroundTransparency = 1
		}, { u4.createElement("ImageLabel", {
				Image = l__GetTarmacAsset__5("healthbarfill").Image, 
				BackgroundTransparency = 1, 
				AnchorPoint = Vector2.new(0, 0.5), 
				Size = v5.size2, 
				Position = UDim2.fromScale(0, 0.5), 
				ImageColor3 = Color3.fromRGB(255, 255, 255)
			}, { u4.createElement("UIGradient", {
					Color = v6.alpha:map(function(p3)
						return ColorSequence.new(Color3.fromRGB(252, 48, 85):Lerp(Color3.fromRGB(255, 0, 0), p3), Color3.fromRGB(255, 101, 138):Lerp(Color3.fromRGB(255, 0, 0), p3));
					end), 
					Rotation = 90
				}) }) });
		v12.WaveCount = u4.createElement("ImageLabel", {
			Image = l__GetTarmacAsset__5("FunnyShape2").Image, 
			Size = UDim2.fromScale(0.7, 0.6), 
			BackgroundTransparency = 1, 
			AnchorPoint = Vector2.new(0.5, 0), 
			Position = UDim2.fromScale(0.07, 1.1), 
			Rotation = -1, 
			ImageColor3 = l__ColorUtil__6.hexColor(16632616)
		}, { u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 2.5247524752475248
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(0.8, 0.7), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Text = "<b>WAVE <font color=\"" .. l__ColorUtil__6.richTextColor(Color3.fromHex("fdcb28")) .. "\">" .. tostring(p1.waveCount) .. "</font></b>", 
				BackgroundTransparency = 1, 
				TextScaled = true, 
				RichText = true, 
				TextColor3 = Color3.fromRGB(255, 255, 255), 
				Font = "GothamBold"
			}) });
		v12.Timer = u4.createElement("ImageLabel", {
			Image = l__GetTarmacAsset__5("FunnyShape1").Image, 
			Size = UDim2.fromScale(0.45, 0.45), 
			BackgroundTransparency = 1, 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(1, 1.02), 
			ImageColor3 = l__ColorUtil__6.hexColor(1037307)
		}, { u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 2.1363636363636362
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 0.6), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Text = v8:map(function(p4)
					return tostring(p4) .. "s";
				end), 
				BackgroundTransparency = 1, 
				TextScaled = true, 
				TextColor3 = Color3.fromHex("363636") or Color3.fromRGB(255, 255, 255), 
				Font = "GothamBold"
			}) });
		v12.WaveStatus = u4.createElement(l__Empty__7, {
			Size = UDim2.fromScale(0.6, 0.45), 
			AnchorPoint = Vector2.new(1, 0), 
			Position = UDim2.fromScale(0.83, 1.02)
		}, { u4.createElement("UIAspectRatioConstraint", {
				AspectRatio = 3.3333333333333335
			}), u4.createElement("TextLabel", {
				Size = UDim2.fromScale(1, 1), 
				Position = UDim2.fromScale(0.5, 0.5), 
				AnchorPoint = Vector2.new(0.5, 0.5), 
				Text = p2.useMemo(function()
					if p1.state == 1 then
						return "DEFENDING";
					end;
					if p1.state == 0 then
						return "INTERMISSION";
					end;
					return "DEFENDING";
				end, { p1.state }), 
				BackgroundTransparency = 1, 
				TextScaled = true, 
				TextColor3 = l__ColorUtil__6.WHITE, 
				Font = "GothamBold"
			}, { u4.createElement("UIStroke", {
					Color = Color3.fromRGB(0, 0, 0), 
					Thickness = 1
				}) }) });
		return u4.createElement("Frame", {
			Size = UDim2.fromScale(1, 0.08), 
			AnchorPoint = Vector2.new(0.5, 0.5), 
			Position = UDim2.fromScale(0.5, 0.05), 
			BackgroundTransparency = 1
		}, v12);
	end, {
		componentType = "PureComponent"
	})
};
