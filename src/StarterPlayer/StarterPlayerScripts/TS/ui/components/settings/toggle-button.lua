-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__Theme__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__2 = v2.ColorUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	ToggleButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {
			AnchorPoint = Vector2.new(0, 0), 
			Position = UDim2.fromScale(0.5, 0), 
			Size = UDim2.fromScale(0.5, 1)
		};
		if p1.Active then
			local v5 = p1.ActiveColor or l__Theme__1.backgroundSuccess;
		else
			v5 = l__Theme__1.backgroundTertiary;
		end;
		v4.BackgroundColor3 = v5;
		v4.BorderSizePixel = 0;
		local v6 = p1.FrameProps;
		if v6 ~= nil then
			v6 = v6.BackgroundTransparency;
		end;
		v4.BackgroundTransparency = v6;
		v4.TextColor3 = l__ColorUtil__2.WHITE;
		v4.Font = "Roboto";
		if p1.Active then
			local v7 = "<b>" .. p1.Text .. "</b>";
		else
			v7 = p1.Text;
		end;
		v4.Text = v7;
		v4.TextXAlignment = "Center";
		v4.TextScaled = true;
		v4.RichText = true;
		v4[u3.Event.Activated] = function()
			l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
			local l__SetValue__8 = p1.SetValue;
			if l__SetValue__8 ~= nil then
				l__SetValue__8(p1.Value);
			end;
		end;
		local l__FrameProps__9 = p1.FrameProps;
		if l__FrameProps__9 then
			for v10, v11 in pairs(l__FrameProps__9) do
				v4[v10] = v11;
			end;
		end;
		return u3.createElement("TextButton", v4, { u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0.15, 0), 
				PaddingBottom = UDim.new(0.15, 0), 
				PaddingLeft = UDim.new(0.1, 0), 
				PaddingRight = UDim.new(0.1, 0)
			}), u3.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
	end)
};
