-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__2 = v2.ColorUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local l__Empty__6 = v2.Empty;
return {
	SettingSwitch = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__FrameProps__5 = p1.FrameProps;
		if l__FrameProps__5 then
			for v6, v7 in pairs(l__FrameProps__5) do
				v4[v6] = v7;
			end;
		end;
		local v8 = {};
		local v9 = #v8;
		local v10 = {
			Size = UDim2.fromScale(0.5, 1)
		};
		if p1.Value then
			local v11 = l__Theme__1.backgroundSuccess;
		else
			v11 = p1.ThemeColor or l__Theme__1.backgroundTertiary;
		end;
		v10.BackgroundColor3 = v11;
		v10.BorderSizePixel = 0;
		local v12 = p1.FrameProps;
		if v12 ~= nil then
			v12 = v12.BackgroundTransparency;
		end;
		v10.BackgroundTransparency = v12;
		v10.TextColor3 = l__ColorUtil__2.WHITE;
		v10.Font = "Roboto";
		if p1.Value then
			local v13 = "<b>On</b>";
		else
			v13 = "On";
		end;
		v10.Text = v13;
		v10.TextXAlignment = "Center";
		v10.TextScaled = true;
		v10.RichText = true;
		v10[u3.Event.Activated] = function(p3)
			l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
			if p1.Value == true then
				return nil;
			end;
			p1.SetValue(true);
		end;
		v8[v9 + 1] = u3.createElement("TextButton", v10, { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u3.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		local v14 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0.5, 0), 
			Size = UDim2.fromScale(0.5, 1)
		};
		if not p1.Value then
			local v15 = l__Theme__1.backgroundError;
		else
			v15 = p1.ThemeColor or l__Theme__1.backgroundTertiary;
		end;
		v14.BackgroundColor3 = v15;
		v14.BorderSizePixel = 0;
		local v16 = p1.FrameProps;
		if v16 ~= nil then
			v16 = v16.BackgroundTransparency;
		end;
		v14.BackgroundTransparency = v16;
		v14.TextColor3 = l__ColorUtil__2.WHITE;
		v14.Font = "Roboto";
		if not p1.Value then
			local v17 = "<b>Off</b>";
		else
			v17 = "Off";
		end;
		v14.Text = v17;
		v14.TextXAlignment = "Center";
		v14.TextScaled = true;
		v14.RichText = true;
		v14[u3.Event.Activated] = function()
			l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
			if p1.Value == false then
				return nil;
			end;
			p1.SetValue(false);
		end;
		v8[v9 + 2] = u3.createElement("TextButton", v14, { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u3.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		return u3.createElement(l__Empty__6, v4, v8);
	end)
};
