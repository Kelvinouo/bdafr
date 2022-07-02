-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = v1.import(script, v1.getModule(script, "@rbxts", "object-utils"));
local l__QueueMeta__2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local u3 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local l__ColorUtil__5 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local l__HudCard__6 = v1.import(script, script.Parent, "hud-card").HudCard;
return {
	HudAlivePlayersCount = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u3)(function(p1, p2)
		local v2 = nil;
		local v3 = u1.entries(p1.store.Bedwars.finalDeaths);
		v2 = 0;
		for v4 = 1, #v3 do
			local v5 = nil;
			v5 = v2;
			local v6 = v3[v4];
			local v7 = v6[1];
			if not v6[2] then
				local v8 = v5 + 1;
			else
				v8 = v5;
			end;
			v2 = v8;
		end;
		local v9 = nil;
		if p1.store.Game.queueType then
			v9 = l__QueueMeta__2[p1.store.Game.queueType];
		end;
		local v10 = { u3.createElement("ImageLabel", {
				Image = l__BedwarsImageId__4.USERS_SOLID, 
				Size = UDim2.new(0, 16, 0, 16), 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}) };
		local v11 = v9;
		if v11 then
			local v12 = {};
			local v13 = local v14;
			if v13 == nil then
				v13 = 0;
			end;
			v12.Text = "<b>" .. tostring(v13) .. " / " .. tostring(((function(p3)
				local v15 = nil;
				local l__teams__16 = p3.teams;
				v15 = 0;
				for v17 = 1, #l__teams__16 do
					v15 = v15 + l__teams__16[v17].maxPlayers;
				end;
				return local v18;
			end)(v9))) .. "</b>";
			v12.BackgroundTransparency = 1;
			v12.BorderSizePixel = 0;
			v12.AutomaticSize = Enum.AutomaticSize.X;
			v12.Font = Enum.Font.Roboto;
			v12.TextSize = 16;
			v12.RichText = true;
			v12.TextXAlignment = Enum.TextXAlignment.Left;
			v12.TextColor3 = l__ColorUtil__5.WHITE;
			v11 = u3.createElement("TextLabel", v12);
		end;
		local v19 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		if v11 then
			v19[#v19 + 1] = v11;
		end;
		v10[#v10 + 1] = u3.createElement("Frame", {
			Size = UDim2.new(0, 0, 1, 0), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, v19);
		return u3.createElement(l__HudCard__6, {
			LayoutOrder = p1.LayoutOrder
		}, v10);
	end)
};
