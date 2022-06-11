-- Script Hash: b84f0bdb1789d9a9b06b811da719795e1fc9eaa47787d7cfa3d67fbcc4ea7a2c8509e647f94b3424e4c6a9fc27ff2b5c
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__TweenService__3 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TweenService;
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__ColorUtil__6 = v2.ColorUtil;
local l__Empty__7 = v2.Empty;
return {
	HotbarButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			LayoutOrder = p1.LayoutOrder, 
			Size = UDim2.fromScale(0.3, 0.5), 
			BackgroundColor3 = p1.BackgroundColor or l__Theme__2.backgroundSecondary, 
			BorderSizePixel = 0
		};
		local u8 = u1.createRef();
		v4[u1.Event.MouseEnter] = function(p3)
			local v5 = l__TweenService__3:Create(u8:getValue(), TweenInfo.new(0.12), {
				BackgroundTransparency = 0.9
			});
			v5:Play();
			v5:Cancel();
		end;
		v4[u1.Event.MouseLeave] = function(p4)
			local v6 = l__TweenService__3:Create(u8:getValue(), TweenInfo.new(0.12), {
				BackgroundTransparency = 1
			});
			v6:Play();
			v6:Cancel();
		end;
		v4[u1.Event.MouseButton1Click] = function()
			l__SoundManager__4:playSound(l__GameSound__5.UI_OPEN);
			p1.OnClick();
		end;
		v4.AutoButtonColor = false;
		local v7 = { u1.createElement("UIAspectRatioConstraint", {
				AspectRatio = p1.AspectRatio
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0.1, 0)
			}), u1.createElement("Frame", {
				[u1.Ref] = u8, 
				Size = UDim2.fromScale(1, 1), 
				BackgroundColor3 = l__ColorUtil__6.WHITE, 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}, { u1.createElement("UICorner", {
					CornerRadius = UDim.new(0.05, 0)
				}) }), u1.createElement(l__Empty__7, {
				Size = UDim2.fromScale(1, 1)
			}, { u1.createElement("UIListLayout", {
					FillDirection = "Horizontal", 
					VerticalAlignment = "Center"
				}), u1.createElement(l__Empty__7, {
					Size = UDim2.fromScale(0.5, 0), 
					SizeConstraint = "RelativeYY"
				}), u1.createElement("ImageLabel", {
					Size = p1.IconSize or UDim2.fromScale(0.6, 0.6), 
					SizeConstraint = "RelativeYY", 
					Image = p1.Icon, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0
				}), u1.createElement("TextLabel", {
					Text = "<b>" .. p1.Text .. "</b>", 
					Size = UDim2.fromScale(p1.AspectRatio - 0.5 - 0.6 - 0.2, 0.55), 
					SizeConstraint = "RelativeYY", 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					Font = "Roboto", 
					TextColor3 = p1.TextColor or l__ColorUtil__6.WHITE, 
					RichText = true, 
					TextScaled = true
				}), u1.createElement(l__Empty__7, {
					Size = UDim2.fromScale(0.2, 0), 
					SizeConstraint = "RelativeYY"
				}) }) };
		local v8 = #v7;
		local v9 = p1[u1.Children];
		if v9 then
			local v10, v11, v12 = pairs(v9);
			while true do
				local v13 = nil;
				local v14 = nil;
				v14, v13 = v10(v11, v12);
				if not v14 then
					break;
				end;
				v12 = v14;
				if type(v14) == "number" then
					v7[v8 + v14] = v13;
				else
					v7[v14] = v13;
				end;			
			end;
		end;
		return u1.createElement("ImageButton", v4, v7);
	end)
};
