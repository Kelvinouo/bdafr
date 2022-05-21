-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__HudTeamBox__3 = v1.import(script, script.Parent, "hud-team-box").HudTeamBox;
local l__HudCard__4 = v1.import(script, script.Parent, "hud-card").HudCard;
return {
	HudBeds = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u1)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local v3 = { u1.createElement("ImageLabel", {
				Image = l__BedwarsImageId__2.HUD_BEDS_ICON, 
				Size = UDim2.new(0, 16, 0, 16), 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}) };
		local l__teams__4 = p1.teams;
		local function v5(p3, p4)
			local v6 = {
				teamColor = p3.colorHex, 
				team = p3, 
				store = p1.store
			};
			local v7 = p1.MyTeam;
			if v7 ~= nil then
				v7 = v7.id;
			end;
			if v7 == p3.id then
				local v8 = -1;
			else
				v8 = p4;
			end;
			v6.layoutOrder = v8;
			return u1.createElement(l__HudTeamBox__3, v6);
		end;
		local v9 = table.create(#l__teams__4);
		for v10, v11 in ipairs(l__teams__4) do
			v9[v10] = v5(v11, v10 - 1, l__teams__4);
		end;
		local v12 = {
			Size = UDim2.new(0, 0, 1, 0), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		};
		local v13 = { u1.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		local v14 = #v13;
		for v15, v16 in ipairs(v9) do
			v13[v14 + v15] = v16;
		end;
		v3[#v3 + 1] = u1.createElement("Frame", v12, v13);
		return u1.createElement(l__HudCard__4, {
			LayoutOrder = p1.LayoutOrder
		}, v3);
	end)
};
