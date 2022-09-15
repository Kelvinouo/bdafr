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
		local v7, v8, v9 = ipairs(v5);
		while true do
			v7(v8, v9);
			if not v7 then
				break;
			end;
			v9 = v7;
			v6[v7] = v8;		
		end;
		local v10 = #v6;
		table.move(v6, 1, v10, v4 + 1, v3);
		local v11 = v4 + v10;
		local v12 = u4.values(p1.store.Bedwars.finalDeaths);
		local v13 = table.create(#v12);
		local v14, v15, v16 = ipairs(v12);
		while true do
			v14(v15, v16);
			if not v14 then
				break;
			end;
			v16 = v14;
			v13[v14] = v15;		
		end;
		local v17 = #v13;
		table.move(v13, 1, v17, v11 + 1, v3);
		local v18 = v11 + v17;
		local v19 = u4.values(p1.store.Bedwars.teamBedAlive);
		local v20 = table.create(#v19);
		local v21, v22, v23 = ipairs(v19);
		while true do
			v21(v22, v23);
			if not v21 then
				break;
			end;
			v23 = v21;
			v20[v21] = v22;		
		end;
		local v24 = #v20;
		table.move(v20, 1, v24, v18 + 1, v3);
		local v25 = v18 + v24;
		v3[v25 + 1] = p1.store.Game.earlyLeaves;
		v3[v25 + 2] = p1.store.Game.matchState;
		v3[v25 + 3] = p1.store.Bedwars.kits;
		local v26 = {};
		local v27 = {
			Size = UDim2.fromScale(l__tabListLayout__5.heightScale, l__tabListLayout__5.widthScale), 
			AnchorPoint = Vector2.new(0.5, 0)
		};
		if l__DeviceUtil__6.isHoarceKat() then
			local v28 = UDim2.new(l__tabListLayout__5.openedPositionX, 0, l__tabListLayout__5.openedPositionY, 0);
		else
			v28 = UDim2.new(l__tabListLayout__5.closedPositionX, 0, l__tabListLayout__5.closedPositionX, 0);
		end;
		v27.Position = v28;
		v27.BorderSizePixel = 0;
		v27.BackgroundTransparency = 1;
		v26.TabListFrame = u2.createElement("Frame", v27, { u2.createElement("UISizeConstraint", {
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
		return u2.createFragment(v26);
	end)
};
