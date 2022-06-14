-- Script Hash: 357b2f6d45654fb937cfa5c54b128aa354a20ed1d8a50623d652e803821b8e2436656aaca6a39b7fe555cc5957db7df6
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__Theme__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
return {
	HudCard = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local v2 = {};
		for v3, v4 in pairs(p1) do
			v2[v3] = v4;
		end;
		v2[u1.Children] = nil;
		local v5 = {
			Size = UDim2.new(0, 0, 0, l__Theme__2.topBarGuiSize), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundColor3 = l__ColorUtil__3.BLACK, 
			BackgroundTransparency = 0.5
		};
		for v6, v7 in pairs(v2) do
			v5[v6] = v7;
		end;
		local v8 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}), u1.createElement("UIPadding", {
				PaddingTop = UDim.new(0.05, 0), 
				PaddingBottom = UDim.new(0.05, 0), 
				PaddingLeft = UDim.new(0, 10), 
				PaddingRight = UDim.new(0, 10)
			}), u1.createElement("UICorner", {
				CornerRadius = UDim.new(0, 3)
			}) };
		local v9 = #v8;
		local v10 = p1[u1.Children];
		if v10 then
			local v11, v12, v13 = pairs(v10);
			while true do
				local v14 = nil;
				local v15 = nil;
				v15, v14 = v11(v12, v13);
				if not v15 then
					break;
				end;
				v13 = v15;
				if type(v15) == "number" then
					v8[v9 + v15] = v14;
				else
					v8[v15] = v14;
				end;			
			end;
		end;
		return u1.createElement("Frame", v5, v8);
	end)
};
