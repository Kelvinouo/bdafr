-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__4 = v2.Empty;
return {
	SettingTextbox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = p1.Value;
		if v5 == nil then
			v5 = "";
		end;
		local v6, v7 = l__useState__3(v5);
		local v8 = p1.Value;
		if v8 == nil then
			v8 = "";
		end;
		local v9, v10 = l__useState__3(v8);
		local v11 = {};
		local l__FrameProps__12 = p1.FrameProps;
		if l__FrameProps__12 then
			for v13, v14 in pairs(l__FrameProps__12) do
				v11[v13] = v14;
			end;
		end;
		local v15 = {};
		local v16 = false;
		if p1.Label ~= nil then
			v16 = u1.createFragment({ u1.createElement("UIListLayout", {
					FillDirection = "Vertical", 
					Padding = UDim.new(0, 6)
				}), u1.createElement("TextLabel", {
					Size = UDim2.fromScale(1, 0), 
					AutomaticSize = "Y", 
					SizeConstraint = "RelativeXX", 
					Text = p1.Label, 
					TextScaled = true, 
					RichText = true, 
					Font = "ArialBold", 
					TextColor3 = l__ColorUtil__2.WHITE, 
					BackgroundTransparency = 1, 
					TextXAlignment = "Left"
				}, { u1.createElement("UITextSizeConstraint", {
						MaxTextSize = 18
					}) }) });
		end;
		if v16 then
			v15[#v15 + 1] = v16;
		end;
		local v17 = {};
		local l__Label__18 = p1.Label;
		if l__Label__18 ~= "" and l__Label__18 then
			local v19 = UDim2.new(1, 0, 0.9, -6);
		else
			v19 = UDim2.fromScale(1, 1);
		end;
		v17.Size = v19;
		local v20 = p1.TextBoxProps;
		if v20 ~= nil then
			v20 = v20.PlaceholderText;
		end;
		local v21 = v20;
		if v21 == nil then
			v21 = "";
		end;
		v17.PlaceholderText = v21;
		local v22 = p1.TextBoxProps;
		if v22 ~= nil then
			v22 = v22.Text;
		end;
		local v23 = v22;
		if v23 == nil then
			v23 = "";
		end;
		v17.Text = v23;
		v17.TextScaled = true;
		v17.RichText = true;
		v17.Font = "ArialBold";
		v17.TextColor3 = l__ColorUtil__2.WHITE;
		v17.BackgroundColor3 = l__Theme__3.backgroundTertiary;
		v17.BorderSizePixel = 0;
		v17.ClearTextOnFocus = false;
		v17[u1.Event.FocusLost] = function(p3)
			if p3.Text == v9 then
				return nil;
			end;
			if p1.NumbersOnly then
				local v24 = tonumber(p3.Text);
				if v24 ~= 0 and v24 == v24 and v24 then
					p3.Text = p3.Text;
				else
					p3.Text = v6;
				end;
			end;
			p1.OnFocusLost(p3.Text);
			v10(p3.Text);
		end;
		v17[u1.Change.Text] = function(p4)
			if p4.Text == v6 then
				return nil;
			end;
			if p1.NumbersOnly then
				local v25 = tonumber(p4.Text);
				if v25 == 0 or v25 ~= v25 or not v25 then
					return nil;
				end;
			end;
			local v26 = p1.MaxCharacters;
			if v26 ~= 0 and v26 == v26 and v26 then
				v26 = p1.MaxCharacters < #p4.Text;
			end;
			if v26 ~= 0 and v26 == v26 and v26 then
				p4.Text = string.sub(p4.Text, 0, p1.MaxCharacters);
			end;
			v7(p4.Text);
		end;
		local l__TextBoxProps__27 = p1.TextBoxProps;
		if l__TextBoxProps__27 then
			for v28, v29 in pairs(l__TextBoxProps__27) do
				v17[v28] = v29;
			end;
		end;
		local v30 = p1[u1.Children];
		if v30 ~= nil then
			v30 = v30.uipadding ~= nil;
		end;
		local v31 = not v30 and u1.createElement("UIPadding", {
			PaddingTop = UDim.new(0.15, 0), 
			PaddingBottom = UDim.new(0.15, 0), 
			PaddingLeft = UDim.new(0.1, 0), 
			PaddingRight = UDim.new(0.1, 0)
		});
		local v32 = {};
		if v31 then
			v32[#v32 + 1] = v31;
		end;
		local v33 = #v32;
		v32[v33 + 1] = u1.createElement("UITextSizeConstraint", {
			MaxTextSize = 18
		});
		local v34 = p1[u1.Children];
		if v34 then
			local v35, v36, v37 = pairs(v34);
			while true do
				local v38 = nil;
				local v39 = nil;
				v39, v38 = v35(v36, v37);
				if not v39 then
					break;
				end;
				v37 = v39;
				if type(v39) == "number" then
					v32[v33 + 1 + v39] = v38;
				else
					v32[v39] = v38;
				end;			
			end;
		end;
		v15[#v15 + 1] = u1.createElement("TextBox", v17, v32);
		return u1.createElement(l__Empty__4, v11, v15);
	end)
};
