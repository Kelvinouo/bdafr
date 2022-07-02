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
				local v11, v12 = v8(v9, v10);
				if not v11 then
					break;
				end;
				local v13 = v12[1];
				if table.find(p1.ColumnData.children, v12[2].props.Team.id) ~= nil == true then
					v7 = v7 + 1;
					v6[v7] = v12;
				end;			
			end;
			local v14 = table.create(#v6);
			for v15, v16 in ipairs(v6) do
				local v17 = v16[1];
				v14[v15] = v16[2];
			end;
			local v18 = v14;
		else
			v18 = nil;
		end;
		local v19 = {
			Size = UDim2.fromScale(1 / p1.Columns, 1), 
			AutomaticSize = "Y", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			LayoutOrder = p1.ColumnData.columnId
		};
		local v20 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v21 = #v20;
		if v18 then
			for v22, v23 in ipairs(v18) do
				v20[v21 + v22] = v23;
			end;
		end;
		return u1.createElement("Frame", v19, v20);
	end)
};
