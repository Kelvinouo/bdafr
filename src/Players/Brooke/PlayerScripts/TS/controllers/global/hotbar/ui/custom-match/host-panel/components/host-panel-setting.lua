-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__3 = v2.ColorUtil;
local l__Empty__4 = v2.Empty;
return {
	HostPanelSetting = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		v4.Name = nil;
		v4.Hint = nil;
		v4.LeftSize = nil;
		v4.RightSize = nil;
		v4[u1.Children] = nil;
		local v7 = {
			Size = UDim2.new(1, 0, 0, 50)
		};
		for v8, v9 in pairs(v4) do
			v7[v8] = v9;
		end;
		local v10 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				SortOrder = "LayoutOrder"
			}) };
		local v11 = #v10;
		local v12 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center"
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.2, 0), 
				PaddingBottom = UDim.new(0.2, 0), 
				PaddingLeft = UDim.new(0.05, 0), 
				PaddingRight = UDim.new(0.05, 0)
			}) };
		local v13 = {
			Size = UDim2.fromScale(1, 1), 
			TextColor3 = l__ColorUtil__3.WHITE, 
			Font = "Roboto"
		};
		local l__Hint__14 = p1.Hint;
		if l__Hint__14 ~= "" and l__Hint__14 then
			local v15 = "  <font transparency='.4'><i>" .. p1.Hint .. "</i></font>";
		else
			v15 = "";
		end;
		v13.Text = "<b>" .. p1.Name .. "</b>" .. v15;
		v13.TextXAlignment = "Left";
		v13.TextScaled = true;
		v13.RichText = true;
		v13.BackgroundTransparency = 1;
		v12[#v12 + 1] = u1.createElement("TextLabel", v13, { u1.createElement("UITextSizeConstraint", {
				MaxTextSize = 18
			}) });
		v10[v11 + 1] = u1.createElement("Frame", {
			Size = p1.LeftSize or UDim2.fromScale(0.6, 1), 
			BackgroundColor3 = l__Theme__2.backgroundPrimary, 
			BorderSizePixel = 0, 
			LayoutOrder = 1
		}, v12);
		local v16 = {
			Size = p1.RightSize or UDim2.fromScale(0.4, 1), 
			BackgroundTransparency = 1, 
			LayoutOrder = 2
		};
		local v17 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				VerticalAlignment = "Center", 
				SortOrder = "LayoutOrder"
			}) };
		local v18 = #v17;
		local v19 = p1[u1.Children];
		if v19 then
			local v20, v21, v22 = pairs(v19);
			while true do
				local v23 = nil;
				local v24 = nil;
				v24, v23 = v20(v21, v22);
				if not v24 then
					break;
				end;
				v22 = v24;
				if type(v24) == "number" then
					v17[v18 + v24] = v23;
				else
					v17[v24] = v23;
				end;			
			end;
		end;
		v10[v11 + 2] = u1.createElement("Frame", v16, v17);
		return u1.createElement(l__Empty__4, v7, v10);
	end)
};
