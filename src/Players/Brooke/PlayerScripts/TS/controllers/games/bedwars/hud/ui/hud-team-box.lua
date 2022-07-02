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
					local v17, v18 = v14(v15, v16);
					if not v17 then
						break;
					end;
					local v19 = p1.team;
					if v19 ~= nil then
						v19 = v19.id;
					end;
					if v18.id == v19 == true then
						v13 = v18;
						break;
					end;				
				end;
				local v20 = v13;
				if v20 ~= nil then
					v20 = v20.members;
				end;
				if v20 then
					local v21 = nil;
					local v22 = {};
					local v23 = #v22;
					for v24, v25 in pairs(v20) do
						v23 = v23 + 1;
						v22[v23] = { v24, v25 };
					end;
					v21 = 0;
					for v26 = 1, #v22 do
						local v27 = nil;
						v27 = v21;
						local v28 = v22[v26];
						local v29 = v28[1];
						if p1.store.Bedwars.finalDeaths[v28[2].userId] then
							local v30 = v27;
						else
							v30 = v27 + 1;
						end;
						v21 = v30;
					end;
					local v31 = local v32;
					if v31 == nil then
						v31 = 0;
					end;
					v7(v31);
				end;
			end;
		end, { p1.store.Bedwars.finalDeaths });
		local u4 = v9 == v10;
		local v33 = {};
		if v4 then
			local v34 = u2.createElement(function()
				local v35 = {};
				local v36 = {
					Size = UDim2.fromScale(1, 1)
				};
				if u4 then
					local v37 = l__BedwarsImageId__3.HUD_MY_TEAM_BOX_STROKE;
				else
					v37 = l__BedwarsImageId__3.HUD_TEAM_BOX_STROKE;
				end;
				v36.Image = v37;
				if u4 then
					local v38 = l__ColorUtil__1.WHITE;
				else
					v38 = nil;
				end;
				v36.ImageColor3 = v38;
				v36.BackgroundTransparency = 1;
				v36.BorderSizePixel = 0;
				v36.ZIndex = 100;
				v35[1] = u2.createElement("UICorner", {
					CornerRadius = UDim.new(0, 3)
				});
				v35[2] = u2.createElement("ImageLabel", v36, { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) });
				v35[3] = u2.createElement("Frame", {
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
				}, v35);
			end);
		else
			v34 = u2.createElement(function()
				local v39 = { u2.createElement("UICorner", {
						CornerRadius = UDim.new(0, 3)
					}) };
				local v40 = false;
				if v6 > 0 then
					v40 = u2.createElement("TextLabel", {
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
				if v40 then
					v39[#v39 + 1] = v40;
				end;
				return u2.createElement("ImageLabel", {
					Size = UDim2.fromOffset(20, 20), 
					Image = l__BedwarsImageId__3.HUD_BED_DESTROYED, 
					ImageColor3 = v8, 
					BackgroundTransparency = 1, 
					BorderSizePixel = 0, 
					LayoutOrder = p1.layoutOrder
				}, v39);
			end);
		end;
		v33[1] = v34;
		return u2.createFragment(v33);
	end)
};
