
-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__tabListLayout__1 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__ColorUtil__3 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__Theme__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
return {
	PlayerStats = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local v2 = {
			Size = UDim2.new(l__tabListLayout__1.columns.right.totalWidth, 0, 1, 0), 
			BorderSizePixel = 0, 
			BackgroundTransparency = 1
		};
		local v3 = { u2.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Left, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 0)
			}) };
		local v4 = #v3;
		local v5 = {
			Size = UDim2.new(l__tabListLayout__1.columns.right.kills.width, 0, 1, 0), 
			TextXAlignment = Enum.TextXAlignment.Center, 
			BackgroundTransparency = l__tabListLayout__1.bgTransparency.playerRow, 
			BackgroundColor3 = l__ColorUtil__3.hexColor(3750752), 
			BorderSizePixel = 0, 
			TextTransparency = p1.ContentTransparency
		};
		local v6 = p1.store.Bedwars.kills[p1.Player.userId];
		if v6 == nil then
			v6 = 0;
		end;
		v5.Text = "<b>" .. tostring(v6) .. "</b>";
		v5.Font = "Roboto";
		v5.TextSize = 16;
		v5.RichText = true;
		v5.TextColor3 = l__ColorUtil__3.WHITE;
		v3[v4 + 1] = u2.createElement("TextLabel", v5);
		local v7 = {
			Size = UDim2.new(l__tabListLayout__1.columns.right.breaks.width, 0, 1, 0), 
			TextXAlignment = Enum.TextXAlignment.Center, 
			BackgroundTransparency = l__tabListLayout__1.bgTransparency.playerRow, 
			BackgroundColor3 = l__Theme__4.backgroundSecondary, 
			BorderSizePixel = 0, 
			TextTransparency = p1.ContentTransparency
		};
		if p1.store.Bedwars.teamBedAlive[p1.Team.id] then
			local v8 = "\226\156\133";
		else
			v8 = "\226\157\140";
		end;
		v7.Text = v8;
		v7.Font = "Roboto";
		v7.TextSize = 16;
		v7.RichText = true;
		v7.TextColor3 = l__ColorUtil__3.WHITE;
		v3[v4 + 2] = u2.createElement("TextLabel", v7);
		return u2.createElement("Frame", v2, v3);
	end)
};

