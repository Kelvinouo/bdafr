-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	ToggleButtonGroup = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3, v4 = l__useState__2(p1.Value);
		local v5, v6 = l__useState__2({});
		p2.useEffect(function()
			local v7 = {};
			local v8 = p1[u1.Children];
			if v8 ~= nil then
				local function v9(p3)
					local l__props__10 = p3.props;
					local v11 = {};
					local v12 = p1[u1.Children];
					if v12 ~= nil then
						local v13 = 0;
						for v14 in pairs(v12) do
							v13 = v13 + 1;
						end;
						v12 = v13;
					end;
					local v15 = v12;
					if v15 == nil then
						v15 = 2;
					end;
					v11.Size = UDim2.fromScale(1 / v15, 1);
					l__props__10.FrameProps = v11;
					function l__props__10.SetValue(p4)
						v4(p4);
						p1.OnChange(p4);
					end;
					l__props__10.Active = v3 == l__props__10.Value;
					table.insert(v7, (u1.createElement(p3.component, l__props__10)));
				end;
				for v16, v17 in pairs(v8) do
					v9(v17, v16, v8);
				end;
			end;
			v6(v7);
		end, { p1[u1.Children] });
		local v18 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__FrameProps__19 = p1.FrameProps;
		if l__FrameProps__19 then
			for v20, v21 in pairs(l__FrameProps__19) do
				v18[v20] = v21;
			end;
		end;
		local v22 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center"
			}) };
		local v23 = #v22;
		for v24, v25 in ipairs(v5) do
			v22[v23 + v24] = v25;
		end;
		return u1.createElement(l__Empty__2, v18, v22);
	end)
};
