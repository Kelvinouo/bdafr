
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
		local function v4(p3, p4)
			local v5 = p4[1];
			if p4[2] then
				return p3;
			end;
			p3 = p3 + 1;
			return p3;
		end;
		for v6 = 1, #v3 do
			v2 = v4(v2, v3[v6], v6 - 1, v3);
		end;
		local v7 = nil;
		if p1.store.Game.queueType then
			v7 = l__QueueMeta__2[p1.store.Game.queueType];
		end;
		local v8 = { u3.createElement("ImageLabel", {
				Image = l__BedwarsImageId__4.USERS_SOLID, 
				Size = UDim2.new(0, 16, 0, 16), 
				ScaleType = "Fit", 
				BackgroundTransparency = 1, 
				BorderSizePixel = 0
			}) };
		local v9 = v7;
		if v9 then
			local v10 = {};
			local v11 = local v12;
			if v11 == nil then
				v11 = 0;
			end;
			v10.Text = "<b>" .. tostring(v11) .. " / " .. tostring((function(p5)
				local v13 = nil;
				local l__teams__14 = p5.teams;
				v13 = 0;
				local function v15(p6, p7)
					p6 = p6 + p7.maxPlayers;
					return p6;
				end;
				for v16 = 1, #l__teams__14 do
					v13 = v15(v13, l__teams__14[v16], v16 - 1, l__teams__14);
				end;
				return local v17;
			end)(v7)) .. "</b>";
			v10.BackgroundTransparency = 1;
			v10.BorderSizePixel = 0;
			v10.AutomaticSize = Enum.AutomaticSize.X;
			v10.Font = Enum.Font.Roboto;
			v10.TextSize = 16;
			v10.RichText = true;
			v10.TextXAlignment = Enum.TextXAlignment.Left;
			v10.TextColor3 = l__ColorUtil__5.WHITE;
			v9 = u3.createElement("TextLabel", v10);
		end;
		local v18 = { u3.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal, 
				VerticalAlignment = Enum.VerticalAlignment.Center, 
				HorizontalAlignment = Enum.HorizontalAlignment.Center, 
				SortOrder = Enum.SortOrder.LayoutOrder, 
				Padding = UDim.new(0, 8)
			}) };
		if v9 then
			v18[#v18 + 1] = v9;
		end;
		v8[#v8 + 1] = u3.createElement("Frame", {
			Size = UDim2.new(0, 0, 1, 0), 
			AutomaticSize = Enum.AutomaticSize.X, 
			BackgroundTransparency = 1, 
			BorderSizePixel = 0
		}, v18);
		return u3.createElement(l__HudCard__6, {
			LayoutOrder = p1.LayoutOrder
		}, v8);
	end)
};

