
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__tabListLayout__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__TeamCard__3 = v1.import(script, script.Parent, "tab-list-card", "team-card").TeamCard;
local l__TabListColumnLayout__4 = v1.import(script, script.Parent, "tab-list-column-layout", "tab-list-column-layout").TabListColumnLayout;
return {
	TabListTeamCards = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2 = l__tabListLayout__1.visible.teamCards;
		if v2 then
			local l__teams__3 = p1.store.TabList.teams;
			local function v4(p3, p4)
				local v5 = {};
				local v6 = p1.store.Game.myTeam;
				if v6 ~= nil then
					v6 = v6.id;
				end;
				if p3.id == v6 then
					local v7 = -1;
				else
					v7 = p4;
				end;
				v5.LayoutOrder = v7;
				v5.Team = p3;
				v5.CardDimensions = p1.CardDimensions;
				v5.store = p1.store;
				return u2.createElement(l__TeamCard__3, v5);
			end;
			local v8 = table.create(#l__teams__3);
			for v9, v10 in ipairs(l__teams__3) do
				v8[v9] = v4(v10, v9 - 1, l__teams__3);
			end;
			local v11 = {
				Columns = 2, 
				Size = UDim2.fromScale(1, 1), 
				store = p1.store
			};
			local v12 = {};
			local v13 = #v12;
			for v14, v15 in ipairs(v8) do
				v12[v13 + v14] = v15;
			end;
			v2 = u2.createElement(l__TabListColumnLayout__4, v11, v12);
		end;
		local v16 = {};
		if v2 then
			v16[#v16 + 1] = v2;
		end;
		return u2.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, l__tabListLayout__1.rows.cards.height), 
			CanvasSize = UDim2.fromScale(1, l__tabListLayout__1.rows.cards.height), 
			AutomaticCanvasSize = "Y", 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1, 
			ScrollingDirection = Enum.ScrollingDirection.Y, 
			ScrollBarThickness = 0
		}, v16);
	end)
};

