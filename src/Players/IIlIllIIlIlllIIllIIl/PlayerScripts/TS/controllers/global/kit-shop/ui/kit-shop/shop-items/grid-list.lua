-- Script Hash: 2508232ed0596f5fa08afacf6ddfa90d4be8efacae274853a32596cb505572a2c59d3f690a0da9fa25956d79feab4a20
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Empty__2 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).Empty;
return {
	GridList = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = {
			Position = UDim2.fromScale(0, 0.01), 
			Size = UDim2.fromScale(0.99, 0.9)
		};
		local l__Container__4 = p1.Container;
		if l__Container__4 then
			for v5, v6 in pairs(l__Container__4) do
				v3[v5] = v6;
			end;
		end;
		local v7 = {};
		local v8 = #v7;
		local v9 = {
			CellSize = UDim2.fromOffset(p1.CellInfo.width, p1.CellInfo.height), 
			CellPadding = UDim2.fromOffset(p1.CellInfo.paddingX, p1.CellInfo.paddingY), 
			HorizontalAlignment = "Center", 
			VerticalAlignment = "Top", 
			SortOrder = "LayoutOrder", 
			FillDirectionMaxCells = 4
		};
		local l__UIGridLaout__10 = p1.UIGridLaout;
		if l__UIGridLaout__10 then
			for v11, v12 in pairs(l__UIGridLaout__10) do
				v9[v11] = v12;
			end;
		end;
		v7[v8 + 1] = u1.createElement("UIGridLayout", v9);
		local v13 = p1[u1.Children];
		if v13 then
			local v14, v15, v16 = pairs(v13);
			while true do
				local v17 = nil;
				local v18 = nil;
				v18, v17 = v14(v15, v16);
				if not v18 then
					break;
				end;
				v16 = v18;
				if type(v18) == "number" then
					v7[v8 + 1 + v18] = v17;
				else
					v7[v18] = v17;
				end;			
			end;
		end;
		return u1.createElement(l__Empty__2, v3, v7);
	end)
};
