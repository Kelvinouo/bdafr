-- Decompiled with the Synapse X Luau decompiler.

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local l__ColorUtil__1 = v1.import(script, v1.getModule(script, "@easy-games", "game-core").out).ColorUtil;
local u2 = v1.import(script, v1.getModule(script, "@rbxts", "roact").src);
local l__BedwarsImageId__3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
return {
	HudTeamBox = v1.import(script, v1.getModule(script, "@rbxts", "roact-hooks").src).new(u2)(function(p1, p2)
		local l__useState__2 = p2.useState;
		local l__useEffect__3 = p2.useEffect;
		local v4, v5 = l__useState__2(true);
		local v6, v7 = l__useState__2(0);
		if type(p1.teamColor) == "number" then
			local v8 = l__ColorUtil__1.hexColor(p1.teamColor);
		else
			v8 = p1.teamColor;
		end;
		local v9 = p1.store.Game.myTeam;
		if v9 ~= nil then
			v9 = v9.id;
		end;
		local v10 = p1.team;
		if v10 ~= nil then
			v10 = v10.id;
		end;
		l__useEffect__3(function()
			if p1.team then
				local v11 = p1.team;
				if v11 ~= nil then
					v11 = v11.id;
				end;
				local v12 = p1.store.Bedwars.teamBedAlive[v11];
				if v12 == nil then
					v12 = true;
				end;
				v5(v12);
			end;
		end, { p1.store.Bedwars.teamBedAlive });
		l__useEffect__3(function()
			if p1.team then
				local v13 = nil;
				local v14, v15, v16 = ipairs(p1.store.TabList.teams);
				while true do
					v14(v15, v16);
					if not v14 then
						break;
					end;
					local v17 = p1.team;
					if v17 ~= nil then
						v17 = v17.id;
					end;
					if v15.id == v17 == true then
						v13 = v15;
						break;
					end;				
				end;
				local v18 = v13;
				if v18 ~= nil then
					v18 = v18.members;
				end;
				if v18 then
					local v19 = nil;
					local v20 = {};
					local v21 = #v20;
					for v22, v23 in pairs(v18) do
						v21 = v21 + 1;
						v20[v21] = { v22, v23 };
					end;
					v19 = 0;
					for v24 = 1, #v20 do
						local v25 = nil;
						v25 = v19;
						local v26 = v20[v24];
						local v27 = v26[1];
						if p1.store.Bedwars.finalDeaths[v26[2].userId] then
							local v28 = v25;
						else
							v28 = v25 + 1;
						end;
						v19 = v28;
					end;
					local v29 = local v30;
					if v29 == nil then
						v29 = 0;
					end;
					v7(v29);
				end;
			end;
		end, { p1.store.Bedwars.finalDeaths });
		local u4 = v9 == v10;
		local v31 = {};
		if v4 then
			local v32 = u2.createElement(function()
				local v33 = {};
				local v34 = {
					Size = UDim2.fromScale(1, 1)
				};
				if u4 then
					local v35 = l__BedwarsImageId__3.HUD_MY_TEAM_BOX_STROKE;
				else
					v35 = l__BedwarsImageId__3.HUD_TEAM_BOX_STROKE;
				end;
				v34.Image = v35;
				if u4 then
					local v36 = l__ColorUtil__1.WHITE;
				else
					v36 = nil;
				end;
				v34.ImageColor3 = v36;
				v34.BackgroundTransparency = 1;
				v34.BorderSizePixel = 0;
				v34.ZIndex = 100;
				v33[1] = u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				});
				v33[2] = u2.createElement("ImageLabel", v34, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) });
				v33[3] = u2.createElement("Frame", {
					Size = UDim2.fromScale(1, 1), 
					BackgroundColor3 = v8, 
					BorderSizePixel = 0, 
					ZIndex = 99
				}, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) });
				return u2.createElement("Frame", {
					Size = UDim2.fromOffset(20, 20), 
					BorderSizePixel = 0, 
					BackgroundTransparency = 0, 
					LayoutOrder = p1.layoutOrder
				}, v33);
			end);
		else
			v32 = u2.createElement(function()
				local v37 = { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) };
				local v38 = false;
				if v6 > 0 then
					v38 = u2.createElement("TextLabel", {
						Position = UDim2.fromScale(0.5, 0.5), 
						AnchorPoint = Vector2.new(0.5, 0.5), 
						BackgroundTransparency = 1, 
						BorderSizePixel = 0, 
						Text = "<b>" .. tostring(v6) .. "</b>", 
						Font = "Roboto", 
						TextSize = 16, 
						RichText = true, 
						TextColor3 = Color3.fromRGB(255, 255, 255), 
						TextStrokeColor3 = l__ColorUtil__1.BLACK, 
						TextStrokeTransparency = 0
					});
				end;
				if v38 then
					v37[#v37 + 1] = v38;
				end;
				return u2.createElement("ImageLabel", {
					Size = UDim2.fromOffset(20, 20), 
					Image = l__BedwarsImageId__3.HUD_BED_DESTROYED, 
					ImageColor3 = v8, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					LayoutOrder = p1.layoutOrder
				}, v37);
			end);
		end;
		v31[1] = v32;
		return u2.createFragment(v31);
	end)
};
