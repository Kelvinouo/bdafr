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
				local v12, v13 = v9(v10, v11);
				if not v12 then
					break;
				end;
				if v13.totalRows < u7 then
					u7 = v13.totalRows;
					u8 = v13;
				end;
				if nil ~= nil then
					v8 = v8 + 1;
					v7[v8] = nil;
				end;			
			end;
			return u8.columnId;
		end;
		local function u9()
			local v14 = u5();
			local function v15(p6)
				local v16 = u6(u4);
				table.insert(u4[v16].children, p6[2].props.Team.id);
				local v17 = 0;
				for v18 in pairs(p6[2].props.Team.members) do
					v17 = v17 + 1;
				end;
				local v19 = v17;
				if v19 == nil then
					v19 = 0;
				end;
				local v20 = u4[v16];
				v20.totalRows = v20.totalRows + v19;
				return 0;
			end;
			local v21 = table.create(#v14);
			for v22, v23 in ipairs(v14) do
				v21[v22] = v15(v23, v22 - 1, v14);
			end;
			return u4;
		end;
		local function u10(p7)
			local v24 = u2.values(p7);
			local v25 = table.create(#v24);
			for v26, v27 in ipairs(v24) do
				v25[v26] = u1.createElement(l__TabListColumn__3, {
					Columns = p1.Columns, 
					ColumnData = v27, 
					AllElements = p1[u1.Children]
				});
			end;
			return v25;
		end;
		local u11 = l__useMemo__2(function()
			return u9();
		end, { p1.store.TabList.teams, p1.store.TabList.players });
		local v28 = { p1.store.TabList.ranks };
		local v29 = #v28;
		local v30 = u2.values(p1.store.Bedwars.kills);
		local v31 = table.create(#v30);
		for v32, v33 in ipairs(v30) do
			v31[v32] = v33;
		end;
		local v34 = #v31;
		table.move(v31, 1, v34, v29 + 1, v28);
		local v35 = v29 + v34;
		local v36 = u2.values(p1.store.Bedwars.finalDeaths);
		local v37 = table.create(#v36);
		for v38, v39 in ipairs(v36) do
			v37[v38] = v39;
		end;
		local v40 = #v37;
		table.move(v37, 1, v40, v35 + 1, v28);
		local v41 = v35 + v40;
		local v42 = u2.values(p1.store.Bedwars.teamBedAlive);
		local v43 = table.create(#v42);
		for v44, v45 in ipairs(v42) do
			v43[v44] = v45;
		end;
		local v46 = #v43;
		table.move(v43, 1, v46, v41 + 1, v28);
		local v47 = v41 + v46;
		v28[v47 + 1] = p1.store.Game.earlyLeaves;
		v28[v47 + 2] = p1.store.Game.matchState;
		v28[v47 + 3] = p1.store.Bedwars.kits;
		v28[v47 + 4] = u11;
		local v48 = l__useMemo__2(function()
			return u10(u11);
		end, v28);
		local v49 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v50 = #v49;
		for v51, v52 in ipairs(v48) do
			v49[v50 + v51] = v52;
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, v49);
	end)
};
