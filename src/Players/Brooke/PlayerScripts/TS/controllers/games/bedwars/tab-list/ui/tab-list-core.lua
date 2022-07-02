-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config");
local l__calcCardsDimensions__1 = v2.calcCardsDimensions;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TabListTeamCards__3 = v1.import(script, script.Parent, "tab-list-team-cards").TabListTeamCards;
local u4 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__tabListLayout__5 = v2.tabListLayout;
local l__DeviceUtil__6 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).DeviceUtil;
local l__TabListColumnHeaders__7 = v1.import(script, script.Parent, "tab-list-column-headers").TabListColumnHeaders;
return {
	TabListCore = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local u8 = l__calcCardsDimensions__1();
		local v3 = { p1.store.TabList.teams, p1.store.TabList.players, p1.store.TabList.ranks };
		local v4 = #v3;
		local v5 = u4.values(p1.store.Bedwars.kills);
		local v6 = table.create(#v5);
		for v7, v8 in ipairs(v5) do
			v6[v7] = v8;
		end;
		local v9 = #v6;
		table.move(v6, 1, v9, v4 + 1, v3);
		local v10 = v4 + v9;
		local v11 = u4.values(p1.store.Bedwars.finalDeaths);
		local v12 = table.create(#v11);
		for v13, v14 in ipairs(v11) do
			v12[v13] = v14;
		end;
		local v15 = #v12;
		table.move(v12, 1, v15, v10 + 1, v3);
		local v16 = v10 + v15;
		local v17 = u4.values(p1.store.Bedwars.teamBedAlive);
		local v18 = table.create(#v17);
		for v19, v20 in ipairs(v17) do
			v18[v19] = v20;
		end;
		local v21 = #v18;
		table.move(v18, 1, v21, v16 + 1, v3);
		local v22 = v16 + v21;
		v3[v22 + 1] = p1.store.Game.earlyLeaves;
		v3[v22 + 2] = p1.store.Game.matchState;
		v3[v22 + 3] = p1.store.Bedwars.kits;
		local v23 = {};
		local v24 = {
			Size = UDim2.fromScale(l__tabListLayout__5.heightScale, l__tabListLayout__5.widthScale), 
			AnchorPoint = Vector2.new(0.5, 0)
		};
		if l__DeviceUtil__6.isHoarceKat() then
			local v25 = UDim2.new(l__tabListLayout__5.openedPositionX, 0, l__tabListLayout__5.openedPositionY, 0);
		else
			v25 = UDim2.new(l__tabListLayout__5.closedPositionX, 0, l__tabListLayout__5.closedPositionX, 0);
		end;
		v24.Position = v25;
		v24.BorderSizePixel = 0;
		v24.BackgroundTransparency = 1;
		v23.TabListFrame = u2.createElement("Frame", v24, { u2.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(960, 540), 
				MinSize = Vector2.new(16, 9)
			}), u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical, 
				VerticalAlignment = Enum.VerticalAlignment.Top, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}), u2.createElement(l__TabListColumnHeaders__7), (p2.useMemo(function()
				return u2.createElement(l__TabListTeamCards__3, {
					store = p1.store, 
					CardDimensions = u8
				});
			end, v3)) });
		return u2.createFragment(v23);
	end)
};
