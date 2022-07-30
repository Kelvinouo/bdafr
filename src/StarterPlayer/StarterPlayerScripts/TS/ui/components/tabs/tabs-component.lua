-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = {};
local v3 = setmetatable({}, {
	__index = v2
});
v3.STANDARD = 0;
v2[0] = "STANDARD";
v3.UNDERLINE = 1;
v2[1] = "UNDERLINE";
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TabButton__2 = v1.import(script, script.Parent, "tab-button-standard").TabButton;
local l__TabButtonUnderline__3 = v1.import(script, script.Parent, "tab-button-underline").TabButtonUnderline;
local l__Empty__4 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	TabComponentVariant = v3, 
	TabsComponent = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v4, v5 = p2.useState(p1.Value);
		p2.useEffect(function()
			v5(p1.Value);
		end, { p1.Value });
		local v6 = {
			Size = UDim2.new(1, 0, 0, 30)
		};
		local l__FrameProps__7 = p1.FrameProps;
		if l__FrameProps__7 then
			for v8, v9 in pairs(l__FrameProps__7) do
				v6[v8] = v9;
			end;
		end;
		local v10 = {};
		local v11 = #v10;
		local v12 = {
			FillDirection = "Horizontal", 
			SortOrder = "LayoutOrder", 
			Padding = UDim.new(0, 6)
		};
		local v13 = p1.UIConfig;
		if v13 ~= nil then
			v13 = v13.Alignment;
		end;
		local v14 = v13;
		if v14 == nil then
			v14 = "Center";
		end;
		v12.HorizontalAlignment = v14;
		v10[v11 + 1] = u1.createElement("UIListLayout", v12);
		local l__Tabs__15 = p1.Tabs;
		local function v16(p3, p4)
			local v17 = p3 == v4;
			local l__Variant__18 = p1.Variant;
			local v19 = false;
			if l__Variant__18 == v3.STANDARD then
				local v20 = u1.createElement(l__TabButton__2, {
					Text = p3, 
					Active = v17, 
					OnChange = p1.OnChange, 
					UIConfig = p1.UIConfig
				});
				v19 = true;
			end;
			if v19 or l__Variant__18 == v3.UNDERLINE then
				local v21 = u1.createElement(l__TabButtonUnderline__3, {
					Text = p3, 
					Active = v17, 
					OnChange = p1.OnChange, 
					UIConfig = p1.UIConfig
				});
			end;
			return u1.createElement(l__TabButton__2, {
				Text = p3, 
				Active = v17, 
				OnChange = p1.OnChange, 
				UIConfig = p1.UIConfig
			});
		end;
		local v22 = table.create(#l__Tabs__15);
		for v23, v24 in ipairs(l__Tabs__15) do
			v22[v23] = v16(v24, v23 - 1, l__Tabs__15);
		end;
		for v25, v26 in ipairs(v22) do
			v10[v11 + 1 + v25] = v26;
		end;
		return u1.createElement(l__Empty__4, v6, v10);
	end)
};
