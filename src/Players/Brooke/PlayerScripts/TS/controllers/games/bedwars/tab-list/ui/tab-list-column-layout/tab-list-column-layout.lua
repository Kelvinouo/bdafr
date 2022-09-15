-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__TabListColumn__3 = v1.import(script, script.Parent, "tab-list-column").TabListColumn;
return {
	TabListColumnLayout = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useMemo__2 = p2.useMemo;
		local u4 = {
			[0] = {
				columnId = 0, 
				children = {}, 
				totalRows = 0
			},
			{
				columnId = 1, 
				children = {}, 
				totalRows = 0
			}
		};
		local function u5()
			if not p1 then
				return {};
			end;
			local v3 = {};
			local v4 = #v3;
			for v5, v6 in pairs(p1[u1.Children]) do
				v4 = v4 + 1;
				v3[v4] = { v5, v6 };
			end;
			table.sort(v3, function(p3, p4)
				if p3[2].props.LayoutOrder < p4[2].props.LayoutOrder then
					return true;
				end;
				return false;
			end);
			return v3;
		end;
		local function u6(p5)
			local u7 = p5[0].totalRows;
			local u8 = p5[0];
			local v7 = {};
			local v8 = 0;
			local v9, v10, v11 = ipairs((u2.values(p5)));
			while true do
				v9(v10, v11);
				if not v9 then
					break;
				end;
				if v10.totalRows < u7 then
					u7 = v10.totalRows;
					u8 = v10;
				end;
				if nil ~= nil then
					v8 = v8 + 1;
					v7[v8] = nil;
				end;			
			end;
			return u8.columnId;
		end;
		local function u9()
			local v12 = u5();
			local function v13(p6)
				local v14 = u6(u4);
				table.insert(u4[v14].children, p6[2].props.Team.id);
				local v15 = 0;
				for v16 in pairs(p6[2].props.Team.members) do
					v15 = v15 + 1;
				end;
				local v17 = v15;
				if v17 == nil then
					v17 = 0;
				end;
				local v18 = u4[v14];
				v18.totalRows = v18.totalRows + v17;
				return 0;
			end;
			local v19 = table.create(#v12);
			local v20, v21, v22 = ipairs(v12);
			while true do
				v20(v21, v22);
				if not v20 then
					break;
				end;
				v22 = v20;
				v19[v20] = v13(v21, v20 - 1, v12);			
			end;
			return u4;
		end;
		local function u10(p7)
			local v23 = u2.values(p7);
			local v24 = table.create(#v23);
			local v25, v26, v27 = ipairs(v23);
			while true do
				v25(v26, v27);
				if not v25 then
					break;
				end;
				v27 = v25;
				v24[v25] = u1.createElement(l__TabListColumn__3, {
					Columns = p1.Columns, 
					ColumnData = v26, 
					AllElements = p1[u1.Children]
				});			
			end;
			return v24;
		end;
		local u11 = l__useMemo__2(function()
			return u9();
		end, { p1.store.TabList.teams, p1.store.TabList.players });
		local v28 = { p1.store.TabList.ranks };
		local v29 = #v28;
		local v30 = u2.values(p1.store.Bedwars.kills);
		local v31 = table.create(#v30);
		local v32, v33, v34 = ipairs(v30);
		while true do
			v32(v33, v34);
			if not v32 then
				break;
			end;
			v34 = v32;
			v31[v32] = v33;		
		end;
		local v35 = #v31;
		table.move(v31, 1, v35, v29 + 1, v28);
		local v36 = v29 + v35;
		local v37 = u2.values(p1.store.Bedwars.finalDeaths);
		local v38 = table.create(#v37);
		local v39, v40, v41 = ipairs(v37);
		while true do
			v39(v40, v41);
			if not v39 then
				break;
			end;
			v41 = v39;
			v38[v39] = v40;		
		end;
		local v42 = #v38;
		table.move(v38, 1, v42, v36 + 1, v28);
		local v43 = v36 + v42;
		local v44 = u2.values(p1.store.Bedwars.teamBedAlive);
		local v45 = table.create(#v44);
		local v46, v47, v48 = ipairs(v44);
		while true do
			v46(v47, v48);
			if not v46 then
				break;
			end;
			v48 = v46;
			v45[v46] = v47;		
		end;
		local v49 = #v45;
		table.move(v45, 1, v49, v43 + 1, v28);
		local v50 = v43 + v49;
		v28[v50 + 1] = p1.store.Game.earlyLeaves;
		v28[v50 + 2] = p1.store.Game.matchState;
		v28[v50 + 3] = p1.store.Bedwars.kits;
		v28[v50 + 4] = u11;
		local v51 = l__useMemo__2(function()
			return u10(u11);
		end, v28);
		local v52 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v53 = #v52;
		local v54, v55, v56 = ipairs(v51);
		while true do
			v54(v55, v56);
			if not v54 then
				break;
			end;
			v56 = v54;
			v52[v53 + v54] = v55;		
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, v52);
	end)
};
