-- Script Hash: cfb457bfa9f8d5389d1771be733025f2da8de876b4e2d51f0366899447f20b87a1f766ebbc08f715fd18e3e24894cb14
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v2.Empty;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__4 = v2.ColorUtil;
local l__SoundManager__5 = v2.SoundManager;
local l__GameSound__6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	HostPanelToggle = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.Value = nil;
		v4.SetValue = nil;
		local v7 = {
			Size = UDim2.fromScale(1, 1)
		};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = {};
		local v11 = {
			Size = UDim2.fromScale(0.5, 1)
		};
		if p1.Value then
			local v12 = l__Theme__3.backgroundSuccess;
		else
			v12 = l__Theme__3.backgroundTertiary;
		end;
		v11.BackgroundColor3 = v12;
		v11.BorderSizePixel = 0;
		v11.TextColor3 = l__ColorUtil__4.WHITE;
		v11.Font = "Roboto";
		if p1.Value then
			local v13 = "<b>On</b>";
		else
			v13 = "On";
		end;
		v11.Text = v13;
		v11.TextXAlignment = "Center";
		v11.TextScaled = true;
		v11.RichText = true;
		v11[u1.Event.Activated] = function(p3)
			l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
			if p1.Value == true then
				return nil;
			end;
			p1.SetValue(true);
		end;
		local v14 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0.5, 0), 
			Size = UDim2.fromScale(0.5, 1)
		};
		if not p1.Value then
			local v15 = l__Theme__3.backgroundError;
		else
			v15 = l__Theme__3.backgroundTertiary;
		end;
		v14.BackgroundColor3 = v15;
		v14.BorderSizePixel = 0;
		v14.TextColor3 = l__ColorUtil__4.WHITE;
		v14.Font = "Roboto";
		if not p1.Value then
			local v16 = "<b>Off</b>";
		else
			v16 = "Off";
		end;
		v14.Text = v16;
		v14.TextXAlignment = "Center";
		v14.TextScaled = true;
		v14.RichText = true;
		v14[u1.Event.Activated] = function()
			l__SoundManager__5:playSound(l__GameSound__6.UI_CLICK);
			if p1.Value == false then
				return nil;
			end;
			p1.SetValue(false);
		end;
		v10[1] = u1.createElement("TextButton", v11, { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v10[2] = u1.createElement("TextButton", v14, { u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		return u1.createElement(l__Empty__2, v7, v10);
	end)
};
