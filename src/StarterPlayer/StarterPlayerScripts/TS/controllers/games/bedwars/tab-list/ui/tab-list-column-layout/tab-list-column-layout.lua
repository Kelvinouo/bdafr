-- Script Hash: 3585d9cefc5e4894af7b5a47c26af000c92ccaa861ba19bf277a259615c59dac055cfe08916ec5d202b0ad3db7b04d6b
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
				for v18 in pairs(p7[2].props.Team.members) do
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
		local function u10(p8)
			local v24 = u2.values(p8);
			local function v25(p9)
				return u1.createElement(l__TabListColumn__3, {
					Columns = p1.Columns, 
					ColumnData = p9, 
					AllElements = p1[u1.Children]
				});
			end;
			local v26 = table.create(#v24);
			for v27, v28 in ipairs(v24) do
				v26[v27] = v25(v28, v27 - 1, v24);
			end;
			return v26;
		end;
		local u11 = l__useMemo__2(function()
			return u9();
		end, { p1.store.TabList.teams, p1.store.TabList.players });
		local v29 = { p1.store.TabList.ranks };
		local v30 = #v29;
		local v31 = u2.values(p1.store.Bedwars.kills);
		local function v32(p10)
			return p10;
		end;
		local v33 = table.create(#v31);
		for v34, v35 in ipairs(v31) do
			v33[v34] = v32(v35, v34 - 1, v31);
		end;
		local v36 = #v33;
		table.move(v33, 1, v36, v30 + 1, v29);
		local v37 = v30 + v36;
		local v38 = u2.values(p1.store.Bedwars.finalDeaths);
		local function v39(p11)
			return p11;
		end;
		local v40 = table.create(#v38);
		for v41, v42 in ipairs(v38) do
			v40[v41] = v39(v42, v41 - 1, v38);
		end;
		local v43 = #v40;
		table.move(v40, 1, v43, v37 + 1, v29);
		local v44 = v37 + v43;
		local v45 = u2.values(p1.store.Bedwars.teamBedAlive);
		local function v46(p12)
			return p12;
		end;
		local v47 = table.create(#v45);
		for v48, v49 in ipairs(v45) do
			v47[v48] = v46(v49, v48 - 1, v45);
		end;
		local v50 = #v47;
		table.move(v47, 1, v50, v44 + 1, v29);
		local v51 = v44 + v50;
		v29[v51 + 1] = p1.store.Game.earlyLeaves;
		v29[v51 + 2] = p1.store.Game.matchState;
		v29[v51 + 3] = p1.store.Bedwars.kits;
		v29[v51 + 4] = u11;
		local v52 = l__useMemo__2(function()
			return u10(u11);
		end, v29);
		local v53 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v54 = #v53;
		for v55, v56 in ipairs(v52) do
			v53[v54 + v55] = v56;
		end;
		return u1.createElement("Frame", {
			Size = p1.Size, 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		}, v53);
	end)
};
