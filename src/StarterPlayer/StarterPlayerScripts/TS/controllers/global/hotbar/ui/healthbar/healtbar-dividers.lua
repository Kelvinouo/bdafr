-- Script Hash: e968e361ad2bc1607eba8b65cf066f538e92d83aca874fe7a0f6b8e6e94798b4cf265c8b9caa94ab1b12ba671876b9d8
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out);
local l__ColorUtil__1 = v2.ColorUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__3 = v2.Empty;
return {
	HealthbarDividers = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__3 = p2.useState;
		local v4 = {};
		for v5, v6 in pairs(p1) do
			v4[v5] = v6;
		end;
		local v7 = v4.Spacing;
		if v7 == nil then
			v7 = 0.1;
		end;
		local v8 = v4.Thickness;
		if v8 == nil then
			v8 = 1;
		end;
		local v9 = v4.Color;
		if v9 == nil then
			v9 = l__ColorUtil__1.hexColor(2700097);
		end;
		local function v10()
			return u2.createElement(l__Empty__3, {
				Size = UDim2.new(v7, 0, 1, 0), 
				ZIndex = 10
			}, { u2.createElement("Frame", {
					AnchorPoint = Vector2.new(1, 0), 
					Position = UDim2.new(1, -v8, 0, 0), 
					Size = UDim2.new(0, v8, 0.6, 0), 
					BackgroundColor3 = v9, 
					BorderSizePixel = 0, 
					ZIndex = 10
				}) });
		end;
		local v11 = {};
		local v12 = 0;
		local v13 = false;
		while true do
			if v13 then
				v12 = v12 + 1;
			else
				v13 = true;
			end;
			if not (v12 < 9) then
				break;
			end;
			table.insert(v11, (u2.createElement(v10)));		
		end;
		local v14 = {
			Size = UDim2.fromScale(1, 1), 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0, 
			ZIndex = 10
		};
		local v15 = { u2.createElement("UIListLayout", {
				FillDirection = "Horizontal"
			}) };
		local v16 = #v15;
		for v17, v18 in ipairs(v11) do
			v15[v16 + v17] = v18;
		end;
		return u2.createFragment({
			Dividers = u2.createElement("Frame", v14, v15)
		});
	end)
};
