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
			local v7 = u2.values(p5);
			local u7 = p5[0].totalRows;
			local u8 = p5[0];
			local function v8(p6)
				if p6.totalRows < u7 then
					u7 = p6.totalRows;
					u8 = p6;
				end;
			end;
			local v9 = {};
			local v10 = 0;
			for v11, v12 in ipairs(v7) do
				local v13 = v8(v12, v11 - 1, v7);
				if v13 ~= nil then
					v10 = v10 + 1;
					v9[v10] = v13;
				end;
			end;
			return u8.columnId;
		end;
		local function u9()
			local v14 = u5();
			local function v15(p7)
				local v16 = u6(u4);
				table.insert(u4[v16].children, p7[2].props.Team.id);
				local v17 = 0;
				for v18, v19 in pairs(p7[2].props.Team.members) do
					v17 = v17 + 1;
				end;
				local v20 = v17;
				if v20 == nil then
					v20 = 0;
				end;
				local v21 = u4[v16];
				v21.totalRows = v21.totalRows + v20;
				return 0;
			end;
			local v22 = table.create(#v14);
			for v23, v24 in ipairs(v14) do
				v22[v23] = v15(v24, v23 - 1, v14);
			end;
			return u4;
		end;
		local function u10(p8)
			local v25 = u2.values(p8);
			local function v26(p9)
				return u1.createElement(l__TabListColumn__3, {
					Columns = p1.Columns, 
					ColumnData = p9, 
					AllElements = p1[u1.Children]
				});
			end;
			local v27 = table.create(#v25);
			for v28, v29 in ipairs(v25) do
				v27[v28] = v26(v29, v28 - 1, v25);
			end;
			return v27;
		end;
		local u11 = l__useMemo__2(function()
			return u9();
		end, { p1.store.TabList.teams, p1.store.TabList.players });
		local v30 = { p1.store.TabList.ranks };
		local v31 = #v30;
		local v32 = u2.values(p1.store.Bedwars.kills);
		local function v33(p10)
			return p10;
		end;
		local v34 = table.create(#v32);
		for v35, v36 in ipairs(v32) do
			v34[v35] = v33(v36, v35 - 1, v32);
		end;
		local v37 = #v34;
		table.move(v34, 1, v37, v31 + 1, v30);
		local v38 = v31 + v37;
		local v39 = u2.values(p1.store.Bedwars.finalDeaths);
		local function v40(p11)
			return p11;
		end;
		local v41 = table.create(#v39);
		for v42, v43 in ipairs(v39) do
			v41[v42] = v40(v43, v42 - 1, v39);
		end;
		local v44 = #v41;
		table.move(v41, 1, v44, v38 + 1, v30);
		local v45 = v38 + v44;
		local v46 = u2.values(p1.store.Bedwars.teamBedAlive);
		local function v47(p12)
			return p12;
		end;
		local v48 = table.create(#v46);
		for v49, v50 in ipairs(v46) do
			v48[v49] = v47(v50, v49 - 1, v46);
		end;
		local v51 = #v48;
		table.move(v48, 1, v51, v45 + 1, v30);
		local v52 = v45 + v51;
		v30[v52 + 1] = p1.store.Game.earlyLeaves;
		v30[v52 + 2] = p1.store.Game.matchState;
		v30[v52 + 3] = p1.store.Bedwars.kits;
		v30[v52 + 4] = u11;
		local v53 = l__useMemo__2(function()
			return u10(u11);
		end, v30);
		local v54 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v55 = #v54;
		for v56, v57 in ipairs(v53) do
			v54[v55 + v56] = v57;
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, v54);
	end)
};
