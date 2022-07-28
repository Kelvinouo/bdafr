-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	ToggleButtonGroup = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4, v5 = l__useState__2(p1.Value);
		local v6, v7 = l__useState__2({});
		l__useEffect__3(function()
			local v8 = {};
			local v9 = p1[u1.Children];
			if v9 ~= nil then
				local function v10(p3)
					local l__props__11 = p3.props;
					local v12 = {};
					local v13 = p1[u1.Children];
					if v13 ~= nil then
						local v14 = 0;
						for v15 in pairs(v13) do
							v14 = v14 + 1;
						end;
						v13 = v14;
					end;
					local v16 = v13;
					if v16 == nil then
						v16 = 2;
					end;
					v12.Size = UDim2.fromScale(1 / v16, 1);
					l__props__11.FrameProps = v12;
					function l__props__11.SetValue(p4)
						v5(p4);
						p1.OnChange(p4);
					end;
					l__props__11.Active = v4 == l__props__11.Value;
					table.insert(v8, (u1.createElement(p3.component, l__props__11)));
				end;
				for v17, v18 in pairs(v9) do
					v10(v18, v17, v9);
				end;
			end;
			v7(v8);
		end, { p1[u1.Children], v4 });
		l__useEffect__3(function()
			v5(p1.Value);
		end, { p1.Value });
		local v19 = {
			Size = UDim2.fromScale(1, 1)
		};
		local l__FrameProps__20 = p1.FrameProps;
		if l__FrameProps__20 then
			for v21, v22 in pairs(l__FrameProps__20) do
				v19[v21] = v22;
			end;
		end;
		local v23 = { u1.createElement("UIListLayout", {
				FillDirection = "Horizontal", 
				HorizontalAlignment = "Center"
			}) };
		local v24 = #v23;
		for v25, v26 in ipairs(v6) do
			v23[v24 + v25] = v26;
		end;
		return u1.createElement(l__Empty__2, v19, v23);
	end)
};
