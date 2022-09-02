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
			local v6 = {};
			local v7 = 0;
			local v8, v9, v10 = ipairs(v2);
			while true do
				v8(v9, v10);
				if not v8 then
					break;
				end;
				local v11 = v9[1];
				if table.find(p1.ColumnData.children, v9[2].props.Team.id) ~= nil == true then
					v7 = v7 + 1;
					v6[v7] = v9;
				end;			
			end;
			local v12 = table.create(#v6);
			local v13, v14, v15 = ipairs(v6);
			while true do
				v13(v14, v15);
				if not v13 then
					break;
				end;
				v15 = v13;
				local v16 = v14[1];
				v12[v13] = v14[2];			
			end;
			local v17 = v12;
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
			local v21, v22, v23 = ipairs(v17);
			while true do
				v21(v22, v23);
				if not v21 then
					break;
				end;
				v23 = v21;
				v19[v20 + v21] = v22;			
			end;
		end;
		return u1.createElement("Frame", v18, v19);
	end)
};
