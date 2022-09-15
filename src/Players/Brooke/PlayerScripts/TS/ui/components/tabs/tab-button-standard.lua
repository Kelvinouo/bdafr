-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__TextService__1 = v1.import(script, v1.getModule(script, "@rbxts", "services")).TextService;
local l__ColorUtil__2 = v2.ColorUtil;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__SoundManager__4 = v2.SoundManager;
local l__GameSound__5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
return {
	TabButton = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v3, v4 = p2.useState(false);
		local v5 = {
			Size = UDim2.new(0, l__TextService__1:GetTextSize(p1.Text, 15, Enum.Font.Roboto, Vector2.new(1000, 1000)).X + 1, 1, 0), 
			AutomaticSize = "X"
		};
		if p1.Active then
			local v6 = p1.UIConfig;
			if v6 ~= nil then
				v6 = v6.ActiveColor;
			end;
			local v7 = v6;
			if v7 == nil then
				v7 = l__ColorUtil__2.hexColor(7040959);
			end;
			local v8 = v7;
		else
			v8 = l__ColorUtil__2.BLACK;
		end;
		v5.BackgroundColor3 = v8;
		if p1.Active then
			local v9 = p1.UIConfig;
			if v9 ~= nil then
				v9 = v9.ActiveBGTransparency;
			end;
			local v10 = v9;
			if v10 == nil then
				v10 = 0;
			end;
			local v11 = v10;
		else
			if v3 then
				local v12 = 0.9;
			else
				local v13 = p1.UIConfig;
				if v13 ~= nil then
					v13 = v13.InactiveBGTransparency;
				end;
				local v14 = v13;
				if v14 == nil then
					v14 = 0.9;
				end;
				v12 = v14;
			end;
			v11 = v12;
		end;
		v5.BackgroundTransparency = v11;
		v5.Font = "Roboto";
		v5.Text = "<b>" .. p1.Text .. "</b>";
		if p1.Active then
			local v15 = p1.UIConfig;
			if v15 ~= nil then
				v15 = v15.ActiveTextColor;
			end;
			local v16 = v15;
			if v16 == nil then
				v16 = l__ColorUtil__2.hexColor(12172543);
			end;
			local v17 = v16;
		else
			v17 = l__ColorUtil__2.WHITE;
		end;
		v5.TextColor3 = v17;
		v5.TextSize = 15;
		v5.RichText = true;
		if v3 or p1.Active then
			local v18 = 0;
		else
			v18 = 0.3;
		end;
		v5.TextTransparency = v18;
		v5.TextXAlignment = "Center";
		v5.TextYAlignment = "Center";
		v5[u3.Event.Activated] = function()
			p1.OnChange(p1.Text);
			l__SoundManager__4:playSound(l__GameSound__5.UI_CLICK);
		end;
		v5[u3.Event.MouseEnter] = function(p3)
			v4(true);
		end;
		v5[u3.Event.MouseLeave] = function(p4)
			v4(false);
		end;
		v5.AutoButtonColor = false;
		return u3.createElement("TextButton", v5, { u3.createElement("UICorner", {
				CornerRadius = UDim.new(0, 5)
			}), u3.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 4), 
				PaddingBottom = UDim.new(0, 4), 
				PaddingLeft = UDim.new(0, 6), 
				PaddingRight = UDim.new(0, 6)
			}), u3.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
	end)
};
