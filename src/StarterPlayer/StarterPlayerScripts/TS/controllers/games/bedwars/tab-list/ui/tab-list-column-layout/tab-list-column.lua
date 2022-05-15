
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
return {
	TabListColumn = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		if p1.AllElements then
			local v2 = {};
			local v3 = #v2;
			for v4, v5 in pairs(p1.AllElements) do
				v3 = v3 + 1;
				v2[v3] = { v4, v5 };
			end;
			local function v6(p3)
				local v7 = p3[1];
				if table.find(p1.ColumnData.children, p3[2].props.Team.id) ~= nil then
					return true;
				end;
				return false;
			end;
			local v8 = {};
			local v9 = 0;
			for v10, v11 in ipairs(v2) do
				if v6(v11, v10 - 1, v2) == true then
					v9 = v9 + 1;
					v8[v9] = v11;
				end;
			end;
			local function v12(p4)
				local v13 = p4[1];
				return p4[2];
			end;
			local v14 = table.create(#v8);
			for v15, v16 in ipairs(v8) do
				v14[v15] = v12(v16, v15 - 1, v8);
			end;
			local v17 = v14;
		else
			v17 = nil;
		end;
		local v18 = {
			Size = UDim2.fromScale(1 / p1.Columns, 1), 
			AutomaticSize = "Y", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.ColumnData.columnId
		};
		local v19 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v20 = #v19;
		if v17 then
			for v21, v22 in ipairs(v17) do
				v19[v20 + v21] = v22;
			end;
		end;
		return u1.createElement("Frame", v18, v19);
	end)
};

