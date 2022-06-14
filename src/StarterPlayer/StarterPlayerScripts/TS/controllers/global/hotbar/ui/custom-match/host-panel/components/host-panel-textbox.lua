-- Script Hash: c7675ea96349b2cdd5b27b31ce2cfbe442528bc2738562a98a8b8428afd85681d03f06d386dc8fc6fc5d529b72c6747d
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__2 = v2.ColorUtil;
local l__Theme__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__Empty__4 = v2.Empty;
return {
	HostPanelTextBox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local l__useEffect__4 = p2.useEffect;
		local v5 = {};
		for v6, v7 in pairs(p1) do
			v5[v6] = v7;
		end;
		v5[u1.Children] = nil;
		v5.Text = nil;
		v5.PlaceholderText = v5.Text;
		v5.NumbersOnly = nil;
		v5.OnFocusLost = nil;
		v5.MaxCharacters = nil;
		v5.Label = nil;
		local v8 = {
			Size = v5.Size, 
			Position = v5.Position, 
			AnchorPoint = v5.AnchorPoint
		};
		v5.AnchorPoint = nil;
		v5.Position = v5.AnchorPoint;
		v5.Size = v5.Position;
		local v9 = p1.Text;
		if v9 == nil then
			v9 = "";
		end;
		local v10, v11 = l__useState__3(v9);
		local v12 = p1.Text;
		if v12 == nil then
			v12 = "";
		end;
		local v13, v14 = l__useState__3(v12);
		local v15 = {
			Size = v8.Size or UDim2.fromScale(1, 1), 
			Position = v8.Position, 
			AnchorPoint = v8.AnchorPoint
		};
		local v16 = {};
		local v17 = false;
		if p1.Label ~= nil then
			v17 = u1.createFragment({ u1.createElement("UIListLayout", {
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
		if v17 then
			v16[#v16 + 1] = v17;
		end;
		local v18 = {};
		local l__Label__19 = p1.Label;
		if l__Label__19 ~= "" and l__Label__19 then
			local v20 = UDim2.new(1, 0, 0.9, -6);
		else
			v20 = UDim2.fromScale(1, 1);
		end;
		v18.Size = v20;
		local v21 = p1.PlaceholderText;
		if v21 == nil then
			v21 = "";
		end;
		v18.PlaceholderText = tostring(v21);
		local v22 = p1.Text;
		if v22 == nil then
			v22 = "";
		end;
		v18.Text = tostring(v22);
		v18.TextScaled = true;
		v18.RichText = true;
		v18.Font = "ArialBold";
		v18.TextColor3 = l__ColorUtil__2.WHITE;
		v18.BackgroundColor3 = l__Theme__3.backgroundTertiary;
		v18.BorderSizePixel = 0;
		v18.ClearTextOnFocus = false;
		v18[u1.Event.FocusLost] = function(p3)
			if p3.Text == v13 then
				return nil;
			end;
			if p1.NumbersOnly then
				local v23 = tonumber(p3.Text);
				if v23 ~= 0 and v23 == v23 and v23 then
					p3.Text = p3.Text;
				else
					p3.Text = v10;
				end;
			end;
			p1.OnFocusLost(p3.Text);
			v14(p3.Text);
		end;
		v18[u1.Change.Text] = function(p4)
			if p4.Text == v10 then
				return nil;
			end;
			if p1.NumbersOnly then
				local v24 = tonumber(p4.Text);
				if v24 == 0 or v24 ~= v24 or not v24 then
					return nil;
				end;
			end;
			local v25 = p1.MaxCharacters;
			if v25 ~= 0 and v25 == v25 and v25 then
				v25 = p1.MaxCharacters < #p4.Text;
			end;
			if v25 ~= 0 and v25 == v25 and v25 then
				p4.Text = string.sub(p4.Text, 0, p1.MaxCharacters);
			end;
			v11(p4.Text);
		end;
		for v26, v27 in pairs(v5) do
			v18[v26] = v27;
		end;
		local v28 = p1[u1.Children];
		if v28 ~= nil then
			v28 = v28.uipadding ~= nil;
		end;
		local v29 = not v28 and u1.createElement("UIPadding", {
			PaddingTop = UDim.new(0.15, 0), 
			PaddingBottom = UDim.new(0.15, 0), 
			PaddingLeft = UDim.new(0.1, 0), 
			PaddingRight = UDim.new(0.1, 0)
		});
		local v30 = {};
		if v29 then
			v30[#v30 + 1] = v29;
		end;
		local v31 = #v30;
		v30[v31 + 1] = u1.createElement("UITextSizeConstraint", {
			MaxTextSize = 18
		});
		local v32 = p1[u1.Children];
		if v32 then
			local v33, v34, v35 = pairs(v32);
			while true do
				local v36 = nil;
				local v37 = nil;
				v37, v36 = v33(v34, v35);
				if not v37 then
					break;
				end;
				v35 = v37;
				if type(v37) == "number" then
					v30[v31 + 1 + v37] = v36;
				else
					v30[v37] = v36;
				end;			
			end;
		end;
		v16[#v16 + 1] = u1.createElement("TextBox", v18, v30);
		return u1.createElement(l__Empty__4, v15, v16);
	end)
};
